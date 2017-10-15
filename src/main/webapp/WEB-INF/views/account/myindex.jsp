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
 
	<title>我的首页</title>
	
	<script>
		$(document).ready(function() {
			 
		});
	</script>
 
</head>

<body>
   <c:if test="${not empty message}">
	     <div class="alert alert-success controls input-large">
			<button data-dismiss="alert" class="close">×</button>${message}</div>
		</c:if>
<table cellspacing="0" cellpadding="0" class="table table-striped table-bordered table-condensed" >
  <col width="98" />
  <col width="72" span="3" />
 
  <tr>
    <td colspan="2" style="width: 40%">
    昵称:<shiro:principal property="name" /><br>
     <br>
    权限：<shiro:principal property="rolesName" /><br>
    </td>
    <td colspan="2"> <a id="myTask" href="${ctx}/activity"></a></td>
  </tr>
 
   
</table>
	<script src="${ctx}/static/bootstrap/2.3.2/js/bootstrap.min.js" type="text/javascript"></script>
</body>
</html>