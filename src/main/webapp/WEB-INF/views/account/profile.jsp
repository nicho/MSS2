<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
	<title>资料修改</title>
</head>

<body>
	 
	<div style="overflow:auto" id="area-overflow">
		<div class="main-box" id="area-right">
			<form id="inputForm" action="${ctx}/profile" method="post" class="form-horizontal">
				<fieldset>

					<div class="add_top" style="">
						&nbsp;&nbsp;&nbsp;●&nbsp;&nbsp;
						密码修改
						<div class="list_an">
							<button id="cancel_btn" class="btn btn-primary" type="button" onclick="history.back()">返回</button>
						</div>
					</div>



					<div class=" autwo mar_2">
					<div style="width:360px;height:125px;margin:0px auto;padding:0px;display:block;">
					
					    <table class="table2">
							<tr>
								<td class="text_rg title_font bzh">用户名:
								</td>
								<td class="text_lf">
									<input type="text" id="name" name="name" value="${user.name}" class="input-large required"/>
								</td>
							</tr>
							<tr>
								<td class="text_rg title_font bzh">密码:
								</td>
								<td class="text_lf"> 
									<input type="password" id="plainPassword" name="plainPassword" class="input-large" placeholder="...Leave it blank if no change"/>
								</td>
							</tr>
							<tr>
								<td class="text_rg title_font bzh">确认密码:
								</td>
								<td class="text_lf">
								<input type="password" id="confirmPassword" name="confirmPassword" class="input-large" equalTo="#plainPassword" />
								</td>
							</tr>
						</table>
					
					
					</div>
						
					</div>


					<div class=" rgcont_long">
						&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <input style="margin-left:-20%;" id="submit_btn" class="btn buttom1 " type="submit" value="修改" />
						 
					</div>
				</fieldset>
			</form>
		</div>
	</div>
	<script>
		$(document).ready(function() {
			//聚焦第一个输入框
			$("#name").focus();
			//为inputForm注册validate函数
			$("#inputForm").validate();
		});
	</script>
</body>
</html>
