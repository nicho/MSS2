<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
 
<span class=""> 
	
					<h2 onclick="javascript:ShowMenu(this,0)" id="menu_AprM_h2_1" class="">
						<a><b class=""></b>会员信息</a>
					</h2>
					<ul class="no">
						
							<li class="li1">
								<a id="aNode_1_0_0" onclick="showMenuPage('profile',
													'  会员管理> 资料维护 ',
							    					'menu_AM_h1','1',
							    					'menu_AprM_h2_1','0',
							    					'aNode_1_0_0')">资料维护</a>
							</li>
						
							<li class="li1">
								<a id="aNode_1_0_1" onclick="showMenuPage('profile',
													'  会员管理> 修改密码 ',
							    					'menu_AM_h1','1',
							    					'menu_AprM_h2_1','0',
							    					'aNode_1_0_1')">修改密码</a>
							</li>
						
							<li class="li1">
								<a id="aNode_1_0_2" onclick="showMenuPage('leaveQueryResultsList.do',
													'  会员管理> 推广链接/二维码 ',
							    					'menu_AM_h1','1',
							    					'menu_AprM_h2_1','0',
							    					'aNode_1_0_2')">推广链接/二维码</a>
							</li>
							 <li class="li1">
								<a id="aNode_1_0_3" onclick="showMenuPage('leaveQueryResultsList.do',
													'  会员管理> 我推荐的人 ',
							    					'menu_AM_h1','1',
							    					'menu_AprM_h2_1','0',
							    					'aNode_1_0_3')">我推荐的人</a>
							</li>
						
					</ul>
				
				
			
				
					<h2 onclick="javascript:ShowMenu(this,1)" id="menu_BusinessM_h2_2" class="">
						<a><b class=""></b>积分管理</a>
					</h2>
					<ul class="no">
						
							<li class="li1">
								<a id="aNode_1_1_0" onclick="showMenuPage('businessTripListView.do',
													'  积分管理> 我的积分明细 ',
							    					'menu_AM_h1','1',
							    					'menu_BusinessM_h2_2','1',
							    					'aNode_1_1_0')">我的积分明细</a>
							</li>
									<li class="li1">
								<a id="aNode_1_1_1" onclick="showMenuPage('businessTripListView.do',
													'  积分管理> 奖金积分转换 ',
							    					'menu_AM_h1','1',
							    					'menu_BusinessM_h2_2','1',
							    					'aNode_1_1_1')">奖金积分转换</a>
							</li>
							
									<li class="li1">
								<a id="aNode_1_1_2" onclick="showMenuPage('businessTripListView.do',
													'  积分管理> 奖金积分提现 ',
							    					'menu_AM_h1','1',
							    					'menu_BusinessM_h2_2','1',
							    					'aNode_1_1_2')">奖金积分提现</a>
							</li>
						
					</ul>
				
				
			
				
					<h2 onclick="javascript:ShowMenu(this,2)" id="menu_MeetingsM_h2_3" class="">
						<a><b></b>积分商城</a>
					</h2>
					<ul class="no">
						
							<li class="li1">
								<a id="aNode_1_2_0" onclick="showMenuPage('meetingList.do',
													'  积分商城> 自营商城 ',
							    					'menu_AM_h1','1',
							    					'menu_MeetingsM_h2_3','2',
							    					'aNode_1_2_0')">自营商城</a>
							</li>
						
							<li class="li1">
								<a id="aNode_1_2_1" onclick="showMenuPage('meetingFacilityList.do',
													'  积分商城> 联盟商城 ',
							    					'menu_AM_h1','1',
							    					'menu_MeetingsM_h2_3','2',
							    					'aNode_1_2_1')">联盟商城</a>
							</li>
							
							<li class="li1">
								<a id="aNode_1_2_2" onclick="showMenuPage('meetingFacilityList.do',
													'  积分商城> 我的订单 ',
							    					'menu_AM_h1','1',
							    					'menu_MeetingsM_h2_3','2',
							    					'aNode_1_2_2')">我的订单</a>
							</li>
							
							<li class="li1">
								<a id="aNode_1_2_3" onclick="showMenuPage('meetingFacilityList.do',
													'  积分商城> 订单审核 ',
							    					'menu_AM_h1','1',
							    					'menu_MeetingsM_h2_3','2',
							    					'aNode_1_2_3')">订单审核</a>
							</li>
						
					</ul>
					
					 
				
					<h2 onclick="javascript:ShowMenu(this,3)" id="menu_DIARYM_h2_4">
						<a><b></b>系统管理</a>
					</h2>
					<ul class="no">
						
							<li class="li1">
								<a id="aNode_1_3_0" onclick="showMenuPage('admin/user',
													' 系统管理> 用户管理 ',
							    					'menu_AM_h1','1',
							    					'menu_DIARYM_h2_4','3',
							    					'aNode_1_3_0')">用户管理</a>
							</li>
						
					</ul>
				
				
			<!-- 
				
					<h2 onclick="javascript:ShowMenu(this,4)" id="menu_DocM_h2_5">
						<a><b></b>文档管理</a>
					</h2>
					<ul class="no">
						
							<li class="li1">
								<a id="aNode_1_4_0" onclick="showMenuPage('docApplyList.do?docType=1',
													' 行政管理 > 文档管理> 通知公告 ',
							    					'menu_AM_h1','1',
							    					'menu_DocM_h2_5','4',
							    					'aNode_1_4_0')">通知公告</a>
							</li>
						
							<li class="li1">
								<a id="aNode_1_4_1" onclick="showMenuPage('approvalList.do',
													' 行政管理 > 文档管理> 规章制度 ',
							    					'menu_AM_h1','1',
							    					'menu_DocM_h2_5','4',
							    					'aNode_1_4_1')">规章制度</a>
							</li>
						
							<li class="li1">
								<a id="aNode_1_4_2" onclick="showMenuPage('certificateList.do',
													' 行政管理 > 文档管理> 公司证件 ',
							    					'menu_AM_h1','1',
							    					'menu_DocM_h2_5','4',
							    					'aNode_1_4_2')">公司证件</a>
							</li>
						
							<li class="li1">
								<a id="aNode_1_4_3" onclick="showMenuPage('myDocumentList.do',
													' 行政管理 > 文档管理> 我的文档 ',
							    					'menu_AM_h1','1',
							    					'menu_DocM_h2_5','4',
							    					'aNode_1_4_3')">我的文档</a>
							</li>
						
					</ul>
				
		  -->
 
				
			 </span>

