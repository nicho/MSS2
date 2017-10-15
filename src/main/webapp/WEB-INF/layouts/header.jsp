<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<div id="header">
	<div class="autop">
	  <div class="logo"> <a style="width:300px;height:45px;display:block;" href="${ctx}">&nbsp;</a></div>
	  <ul class="rgcont">	
	   <li class="rg_li"><div class="b_jpg"></div><a href="${ctx}/logout">注销</a></li>
	   <li class="rg_li"><div class="b2_jpg"></div><a href="#">帮助</a></li> 
	   <li class="rg_li"><div class="b4_jpg"></div><a href="${ctx}">首页</a></li>
	   <li class="rg_li"><div class="b5_jpg"></div><span id="current-time"></span></li>
	   
	   <!-- <li class="rg_li"><div class="b7_jpg"></div><a href="${ctx}/email163.do"><b ></b>&nbsp;未读邮件</a></li> 
	   
	  
	    <li class="rg_email">
	      <div class="rg_email2">99+</div>
	    </li>
	     -->
	     <li class="red_email">
	      <div class="red_email2"><a href="${ctx}/email163.do"> <font id="indexPageEmailCount">0</font></a></div>
	    </li> 
	   
	   <li class="rg_li yellow"><shiro:principal property="name"/>,欢迎您!</li>
	  </ul>
	</div>
</div>

