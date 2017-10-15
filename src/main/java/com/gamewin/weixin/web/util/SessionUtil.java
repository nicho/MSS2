package com.gamewin.weixin.web.util;

import java.util.Iterator;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;

import com.gamewin.weixin.util.ReadProperties;

public class SessionUtil {

	public static void initDomainCSSSession(HttpServletRequest request) {
		// 获取域名
		StringBuffer url = request.getRequestURL();
		String tempContextUrl = url.delete(url.length() - request.getRequestURI().length(), url.length()).append("/").toString();
		// 获取带部署环境上下文的域名
		// String tempContextUrl = url.delete(url.length() -
		// request.getRequestURI().length(),
		// url.length()).append(request.getServletContext().getContextPath()).append("/").toString();

		String initDomainCSS = Constant.INIT_DOMAINCSS_DEFAULT;
		Iterator<Entry<String, String>> it = ReadProperties.getDomainMap().entrySet().iterator();
		while (it.hasNext()) {
			Entry<String, String> entry = (Entry<String, String>) it.next();
			if (tempContextUrl.equals(entry.getValue())) {
				initDomainCSS = entry.getKey() + ".css";
			}
		}

		request.getSession().setAttribute("initDomainCSS", initDomainCSS);
	}

	public static void cleanNavigationSession(HttpServletRequest request) {
		request.getSession().setAttribute("menuName", "");
		request.getSession().setAttribute("h1_id", "");
		request.getSession().setAttribute("h1_index", "");
		request.getSession().setAttribute("h2_id", "");
		request.getSession().setAttribute("h2_index", "");
	}

}
