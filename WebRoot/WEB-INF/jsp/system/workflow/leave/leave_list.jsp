﻿<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
	<base href="<%=basePath%>">
	<!-- jsp文件头和头部 -->
	<%@ include file="../../../system/admin/top.jsp"%> 
 <!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 图片插件 -->
    <link href="static/js/fancybox/jquery.fancybox.css" rel="stylesheet">
    <!-- Check Box -->
    <link href="static/js/iCheck/custom.css" rel="stylesheet">
    <!-- Sweet Alert -->
	<link href="static/js/sweetalert2/sweetalert2.css" rel="stylesheet">
	<title>${pd.SYSNAME}</title>
</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div id="EditLeaves" class="animated fadeIn"></div>
        <div id="AddLeaves" class="animated fadeIn"></div>
		<div id="viewDiagram" class="animated fadeIn"></div>
		<div id="handleLeave" class="animated fadeIn"></div>
		<div id="viewHistory" class="animated fadeIn"></div>
	        <div class="row">
				<div class="panel blank-panel">
					<div class="panel-heading">
						<div class="panel-options">
							<ul class="nav nav-tabs">
								<li id="nav-tab-1" >
									<a data-toggle="tab" href="#tab-1" onclick="tabChange(1)">
										<i class="fa fa-hourglass-o"></i>
										我的申请
									</a>
								</li>
								<li id="nav-tab-2">
									<a class="count-info-sm" data-toggle="tab" href="#tab-2" onclick="tabChange(2)">
										<i class="fa fa-hourglass-2"></i>
										待我处理
										<c:if test="${pd.count>0}">
											<span class="label label-warning">${pd.count}</span>
										</c:if>
									</a>
								</li>
								<li id="nav-tab-3">
									<a data-toggle="tab" href="#tab-3" onclick="tabChange(3)">
										<i class="fa fa-hourglass"></i>
										我已处理
									</a>
								</li>
							</ul>
						</div>
					</div>
					<div class="panel-body">
						<div class="tab-content">
							<div id="tab-1" class="tab-pane">
								<div class="ibox float-e-margins">
									<div class="ibox-content">
										<div id="top1" name="top1"></div>
										<form role="form" class="form-inline" action="workflow/leave/listLeaves.do" method="post" name="leaveForm1" id="leaveForm1">
											<button class="btn  btn-success" title="刷新" type="button" style="float:right" onclick="refreshCurrentTab(1);">刷新</button>

										</form>
										<div class="row">
											</br>
										</div>
										<div class="table-responsive">
											<table class="table table-striped table-bordered table-hover">
												<thead>
												<tr>
													<th style="width:2%;"><input type="checkbox" name="zcheckbox" id="zcheckbox" class="i-checks" ></th>
													<th style="width:5%;">序号</th>
													<th style="width:25%;">请假原因</th>
													<th>开始时间</th>
													<th>结束时间</th>
													<th>创建时间</th>
													<th>类型</th>
													<th>状态</th>
													<th>当前流程</th>
													<th >操作</th>
												</tr>
												</thead>
												<tbody>
												<!-- 开始循环 -->
												<c:choose>
													<c:when test="${not empty leaves}">
														<c:if test="${QX.cha == 1 }">
															<c:forEach items="${leaves}" var="leave" varStatus="vs1">
																<tr>
																	<td class='center' style="width: 30px;">
																		<label><input class="i-checks"  type='checkbox' name='ids' value="${leave.id }" id="${leave.id }" alt="${leave.id }"/><span class="lbl"></span></label>
																	</td>
																	<td class='center' style="width: 30px;">${vs1.index+1}</td>
																	<td>${leave.reason }</td>
																	<td>${leave.start_time}</td>
																	<td>${leave.end_time}</td>
																	<td>${leave.create_time}</td>
																	<td>
																		<c:if test="${leave.leave_type eq 0}">病假</c:if>
																		<c:if test="${leave.leave_type eq 1}">事假</c:if>
																		<c:if test="${leave.leave_type eq 2}">婚假</c:if>
																		<c:if test="${leave.leave_type eq 3}">产假</c:if>
																	</td>
																	<td>
																		<c:if test="${leave.status eq 0}">待申请</c:if>
																		<c:if test="${leave.status eq 1}">待审批</c:if>
																		<c:if test="${leave.status eq 2}">已完成</c:if>
																		<c:if test="${leave.status eq 3}">已取消</c:if>
																		<c:if test="${leave.status eq 4}">被驳回</c:if>
																	</td>
																	<td><a onclick="viewDiagram('${leave.process_instance_id}');">${leave.task_name }</a></td>
																	<td>
																		<c:if test="${leave.status eq 0}">
																			<button class="btn  btn-primary btn-sm" title="编辑" type="button" onclick="editLeave('${leave.id }');">编辑</button>
																			<button class="btn  btn-warning btn-sm" title="提交" type="button" onclick="startLeave('${leave.id }','${leave.process_instance_id}');">提交</button>
																			<button class="btn  btn-danger btn-sm" title="删除" type="button" onclick="delLeave('${leave.id }');">删除</button>
																		</c:if>
																		<c:if test="${leave.status eq 1}">
																			<button class="btn  btn-info btn-sm" title="历史记录" type="button" onclick="viewHistory('${leave.process_instance_id}');">记录</button>
																		</c:if>
																		<c:if test="${leave.status eq 2}">
																			<button class="btn  btn-info btn-sm" title="历史记录" type="button" onclick="viewHistory('${leave.process_instance_id}');">记录</button>
																		</c:if>
																		<c:if test="${leave.status eq 3}">
																			<button class="btn  btn-info btn-sm" title="历史记录" type="button" onclick="viewHistory('${leave.process_instance_id}');">记录</button>
																		</c:if>
																		<c:if test="${leave.status eq 4}">
																			<button class="btn  btn-primary btn-sm" title="编辑" type="button" onclick="editLeave('${leave.id }');">编辑</button>
																			<button class="btn  btn-warning btn-sm" title="重新申请" type="button" onclick="restartLeave('${leave.task_id }','${leave.id }');">重新申请</button>
																			<button class="btn  btn-info btn-sm" title="历史记录" type="button" onclick="viewHistory('${leave.process_instance_id}');">记录</button>
																		</c:if>
																	</td>

																</tr>
															</c:forEach>

														</c:if>
														<c:if test="${QX.cha == 0 }">
															<tr>
																<td colspan="100" class="center">您无权查看</td>
															</tr>
														</c:if>
													</c:when>
													<c:otherwise>
														<tr class="main_info">
															<td colspan="100" class="center" >没有相关数据</td>
														</tr>
													</c:otherwise>
												</c:choose>
												</tbody>
											</table>
										</div>
										</br>
										<div class="col-lg-12" style="padding-left:0px;padding-right:0px;margin:10px -10px 10px -10px">
											<c:if test="${QX.add == 1 }">
												<button class="btn  btn-primary" title="新增" type="button" onclick="add();">新增</button>
											</c:if>
											<%--<c:if test="${QX.del == 1 }">--%>
												<%--<button class="btn  btn-danger" title="批量删除" type="button" onclick="makeAll();">批量删除</button>--%>
											<%--</c:if>--%>
											${page.pageStrForActiviti}
										</div>
									</div>
								</div>
							</div>
							<!-- 待处理 -->
							<div id="tab-2" class="tab-pane">
								<div class="ibox float-e-margins">
									<div class="ibox-content">
										<div id="top2"name="top2"></div>
										<form role="form" class="form-inline" action="workflow/leave/listPendingLeaves.do" method="post" name="leaveForm2" id="leaveForm2">
											<button class="btn  btn-success" title="刷新" type="button" style="float:right" onclick="refreshCurrentTab(2);">刷新</button>

										</form>
										<div class="row">
											</br>
										</div>
										<div class="table-responsive">
											<table class="table table-striped table-bordered table-hover">
												<thead>
												<tr>
													<th style="width:5%;">序号</th>
													<th style="width:25%;">请假原因</th>
													<th>开始时间</th>
													<th>结束时间</th>
													<th>创建时间</th>
													<th>类型</th>
													<th>状态</th>
													<th>当前流程</th>
													<th >操作</th>
												</tr>
												</thead>
												<tbody>
												<!-- 开始循环 -->
												<c:choose>
													<c:when test="${not empty pleaves}">
														<c:if test="${QX.cha == 1 }">
															<c:forEach items="${pleaves}" var="pleave" varStatus="vs2">
																<tr>
																	<td class='center' style="width: 30px;">${vs2.index+1}</td>
																	<td>${pleave.reason }</td>
																	<td>${pleave.start_time}</td>
																	<td>${pleave.end_time}</td>
																	<td>${pleave.create_time}</td>
																	<td>
																		<c:if test="${pleave.leave_type eq 0}">病假</c:if>
																		<c:if test="${pleave.leave_type eq 1}">事假</c:if>
																		<c:if test="${pleave.leave_type eq 2}">婚假</c:if>
																		<c:if test="${pleave.leave_type eq 3}">产假</c:if>
																	</td>
																	<td>
																		<c:if test="${pleave.status eq 0}">待申请</c:if>
																		<c:if test="${pleave.status eq 1}">待审批</c:if>
																		<c:if test="${pleave.status eq 2}">已完成</c:if>
																		<c:if test="${pleave.status eq 3}">已取消</c:if>
																		<c:if test="${pleave.status eq 4}">被驳回</c:if>
																	</td>
																	<td><a onclick="viewDiagram('${pleave.process_instance_id}');">${pleave.task_name }</a></td>
																	<td>
																		<c:if test="${pleave.type == '0'}">
																			<button class="btn  btn-primary btn-sm" title="签收" type="button" onclick="claimLeave('${pleave.task_id}');">签收</button>
																		</c:if>
																		<c:if test="${pleave.type == '1'}">
																			<button class="btn  btn-warning btn-sm" title="办理" type="button" onclick="goHandleLeave('${pleave.task_id}','${pleave.id }');">办理</button>
																		</c:if>
																	</td>

																</tr>
															</c:forEach>
														</c:if>
														<c:if test="${QX.cha == 0 }">
															<tr>
																<td colspan="100" class="center">您无权查看</td>
															</tr>
														</c:if>
													</c:when>
													<c:otherwise>
														<tr class="main_info">
															<td colspan="100" class="center" >没有相关数据</td>
														</tr>
													</c:otherwise>
												</c:choose>
												</tbody>
											</table>
										</div>
										</br>
										<div class="col-lg-12" style="padding-left:0px;padding-right:0px;margin:10px -10px 10px -10px">
											${page.pageStrForActiviti}
										</div>
									</div>
								</div>
							</div>
							<%--已处理--%>
							<div id="tab-3" class="tab-pane">
								<div class="ibox float-e-margins">
									<div class="ibox-content">
										<div id="top3" name="top3"></div>
										<form role="form" class="form-inline" action="workflow/leave/listDoneLeaves.do" method="post" name="leaveForm3" id="leaveForm3">
											<button class="btn  btn-success" title="刷新" type="button" style="float:right" onclick="refreshCurrentTab(3);">刷新</button>

										</form>
										<div class="row">
											</br>
										</div>
										<div class="table-responsive">
											<table class="table table-striped table-bordered table-hover">
												<thead>
												<tr>
													<th style="width:5%;">序号</th>
													<th style="width:25%;">请假原因</th>
													<th>开始时间</th>
													<th>结束时间</th>
													<th>创建时间</th>
													<th>类型</th>
													<th>状态</th>
													<th>当前流程</th>
													<th >操作</th>
												</tr>
												</thead>
												<tbody>
												<!-- 开始循环 -->
												<c:choose>
													<c:when test="${not empty dleaves}">
														<c:if test="${QX.cha == 1 }">
															<c:forEach items="${dleaves}" var="dleave" varStatus="vs3">
																<tr>
																	<td class='center' style="width: 30px;">${vs3.index+1}</td>
																	<td>${dleave.reason }</td>
																	<td>${dleave.start_time}</td>
																	<td>${dleave.end_time}</td>
																	<td>${dleave.create_time}</td>
																	<td>
																		<c:if test="${dleave.leave_type eq 0}">病假</c:if>
																		<c:if test="${dleave.leave_type eq 1}">事假</c:if>
																		<c:if test="${dleave.leave_type eq 2}">婚假</c:if>
																		<c:if test="${dleave.leave_type eq 3}">产假</c:if>
																	</td>
																	<td>
																		<c:if test="${dleave.status eq 0}">待申请</c:if>
																		<c:if test="${dleave.status eq 1}">待审批</c:if>
																		<c:if test="${dleave.status eq 2}">已完成</c:if>
																		<c:if test="${dleave.status eq 3}">已取消</c:if>
																		<c:if test="${dleave.status eq 4}">被驳回</c:if>
																	</td>
																	<td>
																		<c:if test="${dleave.isRuning == 1}">
																		<a onclick="viewDiagram('${dleave.process_instance_id}');">${dleave.task_name }</a>
																		</c:if>
																		<c:if test="${dleave.isRuning != 1}">
																			已完成
																		</c:if>
																	</td>
																	<td>
																		<button class="btn  btn-info btn-sm" title="历史记录" type="button" onclick="viewHistory('${dleave.process_instance_id}');">记录</button>
																	</td>

																</tr>
															</c:forEach>
														</c:if>
														<c:if test="${QX.cha == 0 }">
															<tr>
																<td colspan="100" class="center">您无权查看</td>
															</tr>
														</c:if>
													</c:when>
													<c:otherwise>
														<tr class="main_info">
															<td colspan="100" class="center" >没有相关数据</td>
														</tr>
													</c:otherwise>
												</c:choose>
												</tbody>
											</table>
										</div>
										</br>
										<div class="col-lg-12" style="padding-left:0px;padding-right:0px;margin:10px -10px 10px -10px">
											${page.pageStrForActiviti}
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
	            <div class="col-sm-12">
	                <div class="ibox float-e-margins">

	                </div>
	            </div>
	        </div>
	    </div>
	    <!--返回顶部开始-->
        <div id="back-to-top">
            <a class="btn btn-warning btn-back-to-top" href="javascript: setWindowScrollTop (this,document.getElementById('top').offsetTop);">
                <i class="fa fa-chevron-up"></i>
            </a>
        </div>
        <!--返回顶部结束-->
	<!-- Fancy box -->
    <script src="static/js/fancybox/jquery.fancybox.js"></script>
	<!-- iCheck -->
    <script src="static/js/iCheck/icheck.min.js"></script>
    <!-- Sweet alert -->
	<script src="static/js/sweetalert2/sweetalert2.js"></script>
    <!-- 日期控件-->
    <script src="static/js/layer/laydate/laydate.js"></script>
    
	<script type="text/javascript">
	 $(document).ready(function () {
		 //loading end
		 parent.layer.closeAll('loading');
		 //本页面点击
		 layer.closeAll('loading');
     	/* checkbox */
         $('.i-checks').iCheck({
             checkboxClass: 'icheckbox_square-green',
             radioClass: 'iradio_square-green',
         });
     });

	 //设置tab显示
	 var isActive1 = "${pd.isActive1}";
	 var isActive2 = "${pd.isActive2}";
	 var isActive3 = "${pd.isActive3}";
	 if(isActive1=="1"){
		 $("#nav-tab-1").addClass("active");
		 $("#tab-1").addClass("active");
	 }else if(isActive2=="1"){
		 $("#nav-tab-2").addClass("active");
		 $("#tab-2").addClass("active");
	 }else if(isActive3=="1"){
		 $("#nav-tab-3").addClass("active");
		 $("#tab-3").addClass("active");
	 }
	 //tab切换
	 function tabChange(id){
		 //loading
		 layer.load(1);
		$("#leaveForm"+id).submit();

	 }
     /* checkbox全选 */
     $("#zcheckbox").on('ifChecked', function(event){
     	$('input').iCheck('check');
   	});
     /* checkbox取消全选 */
     $("#zcheckbox").on('ifUnchecked', function(event){
     	
     	$('input').iCheck('uncheck');
   	});
    
    	//刷新iframe
        function refreshCurrentTab(id) {
			//loading
			layer.load(1);
        	$("#leaveForm"+id).submit();
        }
		//检索
		function search(id){
			//loading
			layer.load(1);
			$("#leaveForm"+id).submit();
		}
		
		//新增
		function add(){
			$("#AddLeaves").kendoWindow({
		        width: "500px",
		        height: "600px",
		        title: "新增",
		        actions: ["Close"],
		        content: '<%=basePath%>workflow/leave/goAddLeave.do',
		        modal : true,
				visible : false,
				resizable : true
		    }).data("kendoWindow").center().open();
		}
		 //编辑
		 function editLeave(id){
			 $("#EditLeaves").kendoWindow({
				 width: "500px",
				 height: "600px",
				 title: "编辑",
				 actions: ["Close"],
				 content: '<%=basePath%>workflow/leave/goEditLeave.do?leaveId='+id+"&tm="+new Date().getTime(),
				 modal : true,
				 visible : false,
				 resizable : true
			 }).data("kendoWindow").center().open();
		 }
		//启动流程
		function startLeave(id,process_instance_id){

			swal({
				title: "您确定要启动流程吗？",
				text: "点击确定将会启动该流程，请谨慎操作！",
				type: "warning",
				showCancelButton: true,
				confirmButtonColor: "#DD6B55",
				confirmButtonText: "启动",
				cancelButtonText: "取消"
			}).then(function (isConfirm) {
				if (isConfirm === true) {
					var url = "<%=basePath%>workflow/leave/apply.do?id="+id+'&process_instance_id='+process_instance_id;
					$.get(url, function (data) {
						console.log(data.msg);
						if (data.msg == "success") {
							swal({
							title: "申请成功！",
							text: "您已经成功启动该流程。\n该流程实例ID为："+process_instance_id+",下一个任务为："+data.task_name,
							type: "success",
								}).then(function(){
									refreshCurrentTab(1);
								});

						} else {
							swal({
								title: "启动失败！",
								text:  data.err,
								type: "error",
								showConfirmButton: false,
								timer: 1000
							});
						}
					});

				} else if (isConfirm === false) {
					swal({
						title: "取消启动！",
						text: "您已经取消启动操作了！",
						type: "error",
						showConfirmButton: false,
						timer: 1000
					});
				}
			});
		}
		//删除
		function delLeave(leaveId){
            swal({
                    title: "您确定要删除这条记录吗？",
                    text: "删除后将无法恢复，请谨慎操作！",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#DD6B55",
                    confirmButtonText: "删除",
                    cancelButtonText: "取消",
                    closeOnConfirm: false,
                    closeOnCancel: false
                }).then(function (isConfirm) {
				if (isConfirm===true) {
					var url = "<%=basePath%>workflow/leave/delLeave.do?id="+leaveId+"&tm="+new Date().getTime();
					$.get(url,function(data){
						if(data.msg=='success'){
							swal({
										title: "删除成功！",
										text: "您已经成功删除了这条数据。",
										type: "success",
									}).then(function(){
								refreshCurrentTab(1);
							});
						}else{
							swal("删除失败", data.err, "error");
						}
					});
				}  else if (isConfirm === false) {
					swal("已取消", "您取消了删除操作！", "error");
				}
			});
		}
		//批量操作
		function makeAll(){
			var str = '';
			var emstr = '';
			var phones = '';
			for(var i=0;i < document.getElementsByName('ids').length;i++)
			{
				  if(document.getElementsByName('ids')[i].checked){
				  	if(str=='') str += document.getElementsByName('ids')[i].value;
				  	else str += ',' + document.getElementsByName('ids')[i].value;
				  }
			}
			if(str==''){
				swal({
	                title: "您未选择任何数据",
	                text: "请选择你需要操作的数据！",
	                type: "error",
	                showCancelButton: false,
	                confirmButtonColor: "#DD6B55",
	                confirmButtonText: "OK",
	                closeOnConfirm: true,
	                timer:1500
	            });
			}else{
				swal({
	                title: "您确定要删除选中的数据吗？",
	                text: "删除后将无法恢复，请谨慎操作！",
	                type: "warning",
	                showCancelButton: true,
	                confirmButtonColor: "#DD6B55",
	                confirmButtonText: "删除",
	                cancelButtonText: "取消",
	                closeOnConfirm: false,
	                closeOnCancel: false
	            },
	            function (isConfirm) {
	                if (isConfirm) {
	                	$.ajax({
							type: "POST",
							url: '<%=basePath%>workflow/leave/delAllLeaves.do',
					    	data: {leave_ids:str},
							dataType:'json',
							cache: false,
							success: function(data){
								if(data.msg=='success'){
									swal({   
	        				        	title: "删除成功！",
	        				        	text: "您已经成功删除了这些数据。",
	        				        	type: "success",  
	        				        	 }, 
	        				        	function(){   
	        				        		 refreshCurrentTab(); 
	        				        	 });
		    					}else{
		    						swal("删除失败", data.err, "error");
		    					}
								
							}
						});
	                } else {
	                    swal("已取消", "您取消了删除操作！", "error");
	                }
	            });
			}
		}
	 //签收任务
	 function claimLeave(task_id){

		 swal({
			 title: "您确定要签收这条任务吗？",
			 text: "签收后将请对该任务进行处理！",
			 type: "warning",
			 showCancelButton: true,
			 confirmButtonColor: "#DD6B55",
			 confirmButtonText: "签收",
			 cancelButtonText: "取消"
		 }).then(function (isConfirm) {
			 if (isConfirm === true) {
				 var url = "<%=basePath%>workflow/leave/claim.do?task_id="+task_id+"&tm="+new Date().getTime();
				 $.get(url, function (data) {
					 console.log(data.msg);
					 if (data.msg == "success") {
						 swal({
							 title: "签收成功！",
							 text: "您已经成功签收了这个任务,请对该任务进行处理。",
							 type: "success",
						 }).then(function(){
							 refreshCurrentTab(2);
						 });

					 } else {
						 swal({
							 title: "签收失败！",
							 text:  data.err,
							 type: "error",
							 showConfirmButton: false,
							 timer: 1000
						 });
					 }
				 });

			 } else if (isConfirm === false) {
				 swal({
					 title: "取消签收！",
					 text: "您已经取消签收操作了！",
					 type: "error",
					 showConfirmButton: false,
					 timer: 1000
				 });
			 }
		 });
	 }
	 //重新申请
	 function restartLeave(task_id,leaveId){

		 swal({
			 title: "您确定要重新提交吗？",
			 text: "重新提交将会把数据提交到下一层任务处理者！",
			 type: "warning",
			 showCancelButton: true,
			 confirmButtonColor: "#DD6B55",
			 confirmButtonText: "重新提交",
			 cancelButtonText: "取消"
		 }).then(function (isConfirm) {
			 if (isConfirm === true) {
				 var url = "<%=basePath%>workflow/leave/restartLeave.do?task_id="+task_id+"&id="+leaveId+"&tm="+new Date().getTime();
				 $.get(url, function (data) {
					 console.log(data.msg);
					 if (data.msg == "success") {
						 swal({
							 title: "重新提交成功！",
							 text: "您已经成功重新提交了该请假申请。",
							 type: "success",
						 }).then(function(){
							 refreshCurrentTab(1);
						 });

					 } else {
						 swal({
							 title: "重新提交失败！",
							 text:  data.err,
							 type: "error",
							 showConfirmButton: false,
							 timer: 1000
						 });
					 }
				 });

			 } else if (isConfirm === false) {
				 swal({
					 title: "取消重新提交！",
					 text: "您已经取消重新提交操作了！",
					 type: "error",
					 showConfirmButton: false,
					 timer: 1000
				 });
			 }
		 });
	 }


	 //办理任务
	 function goHandleLeave(task_id,id){
		 $("#handleLeave").kendoWindow({
			 width: "600px",
			 height: "300px",
			 title: "办理任务",
			 actions: ["Close"],
			 content: '<%=basePath%>workflow/leave/goHandleLeave?task_id='+task_id+'&id='+id,
			 modal : true,
			 visible : false,
			 resizable : true
		 }).data("kendoWindow").center().open();
	 }

	 //查看流程定义图片
	 function viewDiagram(processInstanceId){
		 $("#viewDiagram").kendoWindow({
			 width: "1000px",
			 height: "600px",
			 title: "查看流程图",
			 actions: ["Close"],
			 content: '<%=basePath%>workflow/goViewDiagramWithPid?pid='+processInstanceId+'&type=image',
			 modal : true,
			 visible : false,
			 resizable : true
		 }).data("kendoWindow").center().open();
	 }
	 //查看历史
	 function viewHistory(processInstanceId){
		 $("#viewHistory").kendoWindow({
			 width: "900px",
			 height: "500px",
			 title: "查看历史记录",
			 actions: ["Close"],
			 content: '<%=basePath%>workflow/goViewHistory?pid='+processInstanceId,
			 modal : true,
			 visible : false,
			 resizable : true
		 }).data("kendoWindow").center().open();
	 }
		/* back to top */
		function setWindowScrollTop(win, topHeight){
		    if(win.document.documentElement){
		        win.document.documentElement.scrollTop = topHeight;
		    }
		    if(win.document.body){
		        win.document.body.scrollTop = topHeight;
		    }
		}
	</script>
</body>
</html>


