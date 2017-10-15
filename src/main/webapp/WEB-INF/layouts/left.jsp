<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<div id="leftbar" style="float: left; margin-left: 20px; width: 140px;" class="visible-desktop">
	
	<h1>会员模块</h1>
	<div class="submenu"> 
		<a id="myTask" href="${ctx}/activity">会员注册</a> 
		<a id="myTask" href="${ctx}/auction">账号管理</a> 
		<a id="myTask" href="${ctx}/auction/user">我推荐的人</a> 
		<a id="myTask" href="${ctx}/auction/user">我的积分明细</a> 
		<a id="myTask" href="${ctx}/auction/user">我推荐的人</a> 
 

	</div>
	
	 
	 <h1>系统管理</h1> 
		 
	<div class="submenu">
		  
		<shiro:hasAnyRoles name="admin,Head"> 

			<a id="account-tab" href="${ctx}/admin/user">会员帐号管理</a>   
		</shiro:hasAnyRoles>
		 
		<a id="account-tab" href="${ctx}/profile">个人资料修改</a>
	 
	</div>

 

</div>