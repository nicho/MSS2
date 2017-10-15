<%@ page contentType="text/html;charset=UTF-8" import="com.gamewin.weixin.util.ReadProperties"%>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<%@ page import="org.apache.shiro.authc.ExcessiveAttemptsException"%>
<%@ page import="org.apache.shiro.authc.IncorrectCredentialsException"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<title>信壹金服:</title>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<meta http-equiv="Cache-Control" content="no-store" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=2.0"/>
<link type="image/x-icon" href="${ctx}/static/images/favicon.ico" rel="shortcut icon">

<link href="${ctx}/static/styles/default_log.css" type="text/css" rel="stylesheet" />
<link href="${ctx}/static/jquery-validation/1.11.1/validate.css" type="text/css" rel="stylesheet" />

<script src="${ctx}/static/jquery/jquery-1.9.1.min.js" type="text/javascript"></script>
<script src="${ctx}/static/jquery-validation/1.11.1/jquery.validate.min.js" type="text/javascript"></script>
<script src="${ctx}/static/jquery-validation/1.11.1/messages_bs_zh.js" type="text/javascript"></script> 
<script src="http://res.wx.qq.com/connect/zh_CN/htmledition/js/wxLogin.js"></script>

<link href="${ctx}/static/bootstrap/2.3.2/css/bootstrap-responsive.min.css" rel="stylesheet">
</head>

<body> 
 <form id="loginForm" action="${ctx}/login" method="post" class="form-horizontal">
   <c:if test="${not empty message}">
	     <div class="alert alert-success controls input-large">
			<button data-dismiss="alert" class="close">×</button>${message}</div>
		</c:if>
		<%
			String error = (String) request.getAttribute(FormAuthenticationFilter.DEFAULT_ERROR_KEY_ATTRIBUTE_NAME);
			if(error != null){
		%>
				<div class="alert alert-error controls input-large">
					<button class="close" data-dismiss="alert">×</button>
		<%
				if(error.contains("DisabledAccountException")){
					out.print("用户已被屏蔽,请登录其他用户.");
				}
				else if(error.contains("ConcurrentAccessException")){
					out.print("用户正在审批,请等待.");
				} 
				else{
					out.print("登录失败，请重试.");
				}
		%>		
				</div>
		<%
			}
		%>
		<br> 
		<div class="hidden-phone">
			<div class="dl_box">
				<div class="dl_logo"></div>
				<div class="dl_pic"></div>
				<div class="dl_open">
					<div class="dl_small">
						<div class="dl_title">
							请&nbsp;登&nbsp;录
						</div>
						<!-- 登录内容 -->
						<div class="dl_cont">
							<div class="control-group">
						 
								<div class=" dl_dkj" >

									<input type="text" id="username" name="username" value="${username}" class="dl_input input-medium required" placeholder="登录名" />
								</div>
							</div>
							<div class="control-group dl_dkj" >
								<!--<label for="password" class="control-label"><spring:message code="passWord"/></label>-->
								<div class=" dl_dkj" >

									<input type="password" id="password" name="password" class="dl_input2 input-medium required" placeholder="密码" />
								</div>
							</div>

							<div class="control-group">
								<div class="">
									<div class="dl_chek">
										<label class="checkbox" for="rememberMe"><input type="checkbox" id="rememberMe" checked="checked" name="rememberMe" /> 记住我
										</label>
									</div>
									<input id="submit_btn" class="dl_buttom btn " style="width:-webkit-fill-available" type="submit" value="登录" />
									<!--  <a class="btn" href="###">  <spring:message code='registerButtonName'/></a> -->

								</div>
							</div>
						</div>
						<!-- 登录内容 -->
					</div>
				</div>
			</div>
			<div class="dl_englist">
				<a href="#" onclick="changeLang('en_US')">English</a> | <a href="#" onclick="changeLang('zh_CN')">中文版</a>				
			</div>
		</div>

		 

	</form>
 
	 
	<script>
		$(document).ready(function() {
			$("#loginForm").validate();
			 
		});
	</script>
		
 
	<script src="${ctx}/static/bootstrap/2.3.2/js/bootstrap.min.js" type="text/javascript"></script>
</body>
</html>