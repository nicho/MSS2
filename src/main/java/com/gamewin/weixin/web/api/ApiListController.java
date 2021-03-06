/*******************************************************************************
 * Copyright (c) 2005, 2014 springside.github.io
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 *******************************************************************************/
package com.gamewin.weixin.web.api;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gamewin.weixin.entity.Activity;
import com.gamewin.weixin.entity.Org;
import com.gamewin.weixin.service.account.AccountService;
import com.gamewin.weixin.service.account.OrgService;
import com.gamewin.weixin.service.activity.ActivityService;
import com.gamewin.weixin.util.InputMessage;
import com.gamewin.weixin.util.MobileContants;
import com.gamewin.weixin.util.OutputMessage;
import com.gamewin.weixin.util.ReadProperties;
import com.gamewin.weixin.util.SHA1;
import com.gamewin.weixin.util.SerializeXmlUtil;
import com.thoughtworks.xstream.XStream;

@Controller
@RequestMapping(value = "/api")
public class ApiListController {
	private String Token = "DU2qERxP";
	@Autowired
	private OrgService orgService;
	
	@Autowired
	private ActivityService activityService;
	@Autowired
	private AccountService accountService; 
	@RequestMapping(method = { RequestMethod.GET, RequestMethod.POST })
	public void list(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("进入chat");
		boolean isGet = request.getMethod().toLowerCase().equals("get");
		if (isGet) {
			String signature = request.getParameter("signature");
			String timestamp = request.getParameter("timestamp");
			String nonce = request.getParameter("nonce");
			String echostr = request.getParameter("echostr");
			System.out.println(signature);
			System.out.println(timestamp);
			System.out.println(nonce);
			System.out.println(echostr);
			if (!StringUtils.isEmpty(signature) && !StringUtils.isEmpty(timestamp) && !StringUtils.isEmpty(nonce) && !StringUtils.isEmpty(echostr))
				access(request, response);
		} else {
			// 进入POST聊天处理
			System.out.println("enter post");
			try {
				// 接收消息并返回消息
				acceptMessage(request, response);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

	}

	/**
	 * 验证URL真实性
	 * 
	 * @author morning
	 * @date 2015年2月17日 上午10:53:07
	 * @param request
	 * @param response
	 * @return String
	 */
	private String access(HttpServletRequest request, HttpServletResponse response) {
		// 验证URL真实性
		System.out.println("进入验证access");
		String signature = request.getParameter("signature");// 微信加密签名
		String timestamp = request.getParameter("timestamp");// 时间戳
		String nonce = request.getParameter("nonce");// 随机数
		String echostr = request.getParameter("echostr");// 随机字符串
		List<String> params = new ArrayList<String>();
		params.add(Token);
		params.add(timestamp);
		params.add(nonce);
		// 1. 将token、timestamp、nonce三个参数进行字典序排序
		Collections.sort(params, new Comparator<String>() {
			@Override
			public int compare(String o1, String o2) {
				return o1.compareTo(o2);
			}
		});
		// 2. 将三个参数字符串拼接成一个字符串进行sha1加密
		String temp = SHA1.encode(params.get(0) + params.get(1) + params.get(2));
		if (temp.equals(signature)) {
			try {
				response.getWriter().write(echostr);
				System.out.println("成功返回 echostr：" + echostr);
				return echostr;
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		System.out.println("失败 认证");
		return null;
	}

	private void acceptMessage(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 处理接收消息
		ServletInputStream in = request.getInputStream();
		// 将POST流转换为XStream对象
		XStream xs = SerializeXmlUtil.createXstream();
		xs.processAnnotations(InputMessage.class);
		xs.processAnnotations(OutputMessage.class);
		// 将指定节点下的xml节点数据映射为对象
		xs.alias("xml", InputMessage.class);
		// 将流转换为字符串
		StringBuilder xmlMsg = new StringBuilder();
		byte[] b = new byte[4096];
		for (int n; (n = in.read(b)) != -1;) {
			xmlMsg.append(new String(b, 0, n, "UTF-8"));
		}
		// 将xml内容转换为InputMessage对象
		InputMessage inputMsg = (InputMessage) xs.fromXML(xmlMsg.toString());

		String servername = inputMsg.getToUserName();// 服务端
		String custermname = inputMsg.getFromUserName();// 客户端
		long createTime = inputMsg.getCreateTime();// 接收时间
		Long returnTime = Calendar.getInstance().getTimeInMillis() / 1000;//
		// 返回时间

		// 取得消息类型
		String msgType = inputMsg.getMsgType();

		// 文本消息
		System.out.println("开发者微信号：" + inputMsg.getToUserName());
		System.out.println("发送方帐号：" + inputMsg.getFromUserName());
		System.out.println("消息创建时间：" + inputMsg.getCreateTime() + new Date(createTime * 1000l));
		System.out.println("消息Event：" + inputMsg.getEvent());
		System.out.println("消息EventKey：" + inputMsg.getEventKey());
		System.out.println("内容：" + inputMsg.getContent());
		StringBuffer str = new StringBuffer();
		// 根据消息类型获取对应的消息内容
		if ("event".equals(msgType)) {

			if ("subscribe".equals(inputMsg.getEvent())) {

				if (!StringUtils.isEmpty(inputMsg.getEventKey())) {
					Long qrCodeId = null;
					try {
						qrCodeId = Long.parseLong(inputMsg.getEventKey().replaceAll("qrscene_", "").trim().toString());
					} catch (Exception e) {
						System.out.println("用户关注" + inputMsg.getEventKey() + "------转换失败");
						e.printStackTrace();
					}

					//前2位为机构ID
					String orgId=qrCodeId.toString().substring(0,2);
				     qrCodeId=new Long(qrCodeId.toString().substring(2));
				     
					Activity activity = activityService.getActivity(qrCodeId);
				
					Org org=orgService.getOrg(new Long(orgId));
					
					
					String url = org.getUrl()+ "/activity/registerActivity/" + activity.getId(); //
					 	 
					str.append("<xml>                                              ");
					str.append("<ToUserName><![CDATA[" + custermname + "]]></ToUserName>        ");
					str.append("<FromUserName><![CDATA[" + servername + "]]></FromUserName>  ");
					str.append("<CreateTime>" + returnTime + "</CreateTime>                  ");
					str.append("<MsgType><![CDATA[news]]></MsgType>                ");
					str.append("<ArticleCount>1</ArticleCount>                     ");
					str.append("<Articles>                                         ");
					str.append("<item>                                             ");
					str.append("<Title><![CDATA["+org.getOrgName()+" DKP活动参与通知]]></Title>                   ");
					str.append("<Description><![CDATA[您扫描的活动'"+activity.getTitle()+"',请点击阅读全文,参与活动]]></Description> ");
					str.append("<PicUrl><![CDATA[]]></PicUrl>                ");
					str.append("<Url><![CDATA[" + url + "]]></Url>                         ");
					str.append("</item>                                            ");
					str.append("</Articles>                                        ");
					str.append("</xml>                                             ");
					System.out.println(str.toString());
					response.getWriter().write(str.toString());
				}
				
			}else if("SCAN".equals(inputMsg.getEvent())) 
			{
				if (!StringUtils.isEmpty(inputMsg.getEventKey())) {
					Long qrCodeId = null;
					try {
						qrCodeId = Long.parseLong(inputMsg.getEventKey().trim().toString());
					} catch (Exception e) {
						System.out.println("用户关注" + inputMsg.getEventKey() + "------转换失败");
						e.printStackTrace();
					}
					
					//前2位为机构ID
					String orgId=qrCodeId.toString().substring(0,2);
				     qrCodeId=new Long(qrCodeId.toString().substring(2));
				     
					Activity activity = activityService.getActivity(qrCodeId);
				
					Org org=orgService.getOrg(new Long(orgId));
					
					String url = org.getUrl()+ "/activity/registerActivity/" + activity.getId(); //
					 	 
					str.append("<xml>                                              ");
					str.append("<ToUserName><![CDATA[" + custermname + "]]></ToUserName>        ");
					str.append("<FromUserName><![CDATA[" + servername + "]]></FromUserName>  ");
					str.append("<CreateTime>" + returnTime + "</CreateTime>                  ");
					str.append("<MsgType><![CDATA[news]]></MsgType>                ");
					str.append("<ArticleCount>1</ArticleCount>                     ");
					str.append("<Articles>                                         ");
					str.append("<item>                                             ");
					str.append("<Title><![CDATA["+org.getOrgName()+"DKP活动参与通知]]></Title>                   ");
					str.append("<Description><![CDATA[请扫描的活动'"+activity.getTitle()+"',请点击阅读全文,参与活动]]></Description> ");
					str.append("<PicUrl><![CDATA[]]></PicUrl>                ");
					str.append("<Url><![CDATA[" + url + "]]></Url>                         ");
					str.append("</item>                                            ");
					str.append("</Articles>                                        ");
					str.append("</xml>                                             ");
					System.out.println(str.toString());
					response.getWriter().write(str.toString());
				}
			}

		} else if ("text".equals(msgType)) {
			String YM = ReadProperties.getDomainMap().get("YM");
			String redurl = URLEncoder.encode(YM + "/weixinUser/wxbindUserOpenId", "utf-8");
			String url = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=" + MobileContants.wxappID + "&redirect_uri=" + redurl
					+ "&response_type=code&scope=snsapi_base&state=1#wechat_redirect";

			String xxxx = inputMsg.getContent().toString();
			String content = ""; 
			
				 content = " 小K暂时不明白您的意思哟。\n 敬请期待。";
				 
				 
				str.append("<xml>                                              ");
				str.append("<ToUserName><![CDATA[" + custermname + "]]></ToUserName>        ");
				str.append("<FromUserName><![CDATA[" + servername + "]]></FromUserName>  ");
				str.append("<CreateTime>" + returnTime + "</CreateTime>                  ");
				str.append("<MsgType><![CDATA[text]]></MsgType>                ");
				str.append("<Content><![CDATA[" + content + "]]></Content>                     ");
				str.append("</xml>                                             ");
				System.out.println(str.toString());
				response.getWriter().write(str.toString());
			 

		}

	}
	
}
