<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<div id="header">
	<div class="autop">
	  <div class="logo"> <a style="width:300px;height:45px;display:block;" href="${ctx}">&nbsp;</a></div>
	  <ul class="rgcont">	
	   <li class="rg_li"><div class=""></div><a href="${ctx}/logout">注销</a></li>
	   <li class="rg_li"><div class=""></div><a href="#">帮助</a></li> 
	   <li class="rg_li"><div class=""></div><a href="${ctx}">首页</a></li>
	   <li class="rg_li"><div class=""></div><span id="current-time"></span></li>
 
	 
	   <li class="rg_li yellow"><shiro:principal property="name"/>,欢迎您!</li>
	  </ul>
	</div>
</div>

