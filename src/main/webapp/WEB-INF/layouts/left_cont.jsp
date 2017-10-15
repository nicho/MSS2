<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
 
<span class=""> 
				
					<h2 onclick="javascript:ShowMenu(this,0)" id="menu_AprM_h2_1" class="">
						<a><b class=""></b>考勤管理</a>
					</h2>
					<ul class="no">
						
							<li class="li1">
								<a id="aNode_1_0_0" onclick="showMenuPage('/ess/askForLeaveList.do',
													' 行政管理 > 考勤管理> 请假 ',
							    					'menu_AM_h1','1',
							    					'menu_AprM_h2_1','0',
							    					'aNode_1_0_0')">请假</a>
							</li>
						
							<li class="li1">
								<a id="aNode_1_0_1" onclick="showMenuPage('/ess/workOvertimeList.do',
													' 行政管理 > 考勤管理> 加班 ',
							    					'menu_AM_h1','1',
							    					'menu_AprM_h2_1','0',
							    					'aNode_1_0_1')">加班</a>
							</li>
						
							<li class="li1">
								<a id="aNode_1_0_2" onclick="showMenuPage('/ess/leaveQueryResultsList.do',
													' 行政管理 > 考勤管理> 员工年假查询 ',
							    					'menu_AM_h1','1',
							    					'menu_AprM_h2_1','0',
							    					'aNode_1_0_2')">员工年假查询</a>
							</li>
						
					</ul>
				
				
			
				
					<h2 onclick="javascript:ShowMenu(this,1)" id="menu_BusinessM_h2_2" class="">
						<a><b class=""></b>出差管理</a>
					</h2>
					<ul class="no">
						
							<li class="li1">
								<a id="aNode_1_1_0" onclick="showMenuPage('/ess/businessTripListView.do',
													' 行政管理 > 出差管理> 个人出差申请 ',
							    					'menu_AM_h1','1',
							    					'menu_BusinessM_h2_2','1',
							    					'aNode_1_1_0')">个人出差申请</a>
							</li>
						
					</ul>
				
				
			
				
					<h2 onclick="javascript:ShowMenu(this,2)" id="menu_MeetingsM_h2_3" class="">
						<a><b></b>会议管理</a>
					</h2>
					<ul class="no">
						
							<li class="li1">
								<a id="aNode_1_2_0" onclick="showMenuPage('/ess/meetingList.do',
													' 行政管理 > 会议管理> 会议管理 ',
							    					'menu_AM_h1','1',
							    					'menu_MeetingsM_h2_3','2',
							    					'aNode_1_2_0')">会议管理</a>
							</li>
						
							<li class="li1">
								<a id="aNode_1_2_1" onclick="showMenuPage('/ess/meetingFacilityList.do',
													' 行政管理 > 会议管理> 会议设施管理 ',
							    					'menu_AM_h1','1',
							    					'menu_MeetingsM_h2_3','2',
							    					'aNode_1_2_1')">会议设施管理</a>
							</li>
						
					</ul>
				
				
			
				
					<h2 onclick="javascript:ShowMenu(this,3)" id="menu_DIARYM_h2_4" class="">
						<a><b></b>日志管理</a>
					</h2>
					<ul class="no">
						
							<li class="li1">
								<a id="aNode_1_3_0" onclick="showMenuPage('/ess/diaryList.do',
													' 行政管理 > 日志管理> 日志 ',
							    					'menu_AM_h1','1',
							    					'menu_DIARYM_h2_4','3',
							    					'aNode_1_3_0')">日志</a>
							</li>
						
					</ul>
				
				
			
				
					<h2 onclick="javascript:ShowMenu(this,4)" id="menu_DocM_h2_5" class="">
						<a><b></b>文档管理</a>
					</h2>
					<ul class="no">
						
							<li class="li1">
								<a id="aNode_1_4_0" onclick="showMenuPage('/ess/docApplyList.do?docType=1',
													' 行政管理 > 文档管理> 通知公告 ',
							    					'menu_AM_h1','1',
							    					'menu_DocM_h2_5','4',
							    					'aNode_1_4_0')">通知公告</a>
							</li>
						
							<li class="li1">
								<a id="aNode_1_4_1" onclick="showMenuPage('/ess/approvalList.do',
													' 行政管理 > 文档管理> 规章制度 ',
							    					'menu_AM_h1','1',
							    					'menu_DocM_h2_5','4',
							    					'aNode_1_4_1')">规章制度</a>
							</li>
						
							<li class="li1">
								<a id="aNode_1_4_2" onclick="showMenuPage('/ess/certificateList.do',
													' 行政管理 > 文档管理> 公司证件 ',
							    					'menu_AM_h1','1',
							    					'menu_DocM_h2_5','4',
							    					'aNode_1_4_2')">公司证件</a>
							</li>
						
							<li class="li1">
								<a id="aNode_1_4_3" onclick="showMenuPage('/ess/myDocumentList.do',
													' 行政管理 > 文档管理> 我的文档 ',
							    					'menu_AM_h1','1',
							    					'menu_DocM_h2_5','4',
							    					'aNode_1_4_3')">我的文档</a>
							</li>
						
					</ul>
				
				
			 </span>

