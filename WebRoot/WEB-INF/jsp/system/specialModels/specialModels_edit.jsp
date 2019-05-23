<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>

<head>

<base href="<%=basePath%>">


    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>${pd.SYSNAME}</title>
    <link type="text/css" rel="stylesheet" href="plugins/zTree/3.5.24/css/zTreeStyle/zTreeStyle.css"/>
	<!-- jsp文件头和头部 -->
	<%@ include file="../../system/admin/top.jsp"%> 
	
	
</head>

<body class="gray-bg">
<form action="models/${msg}.do" name="modelsForm" id="modelsForm" method="post">
	<div id="ViewElevatorBase" class="animated fadeIn"></div>
	<input type="hidden" name="models_id" id="models_id" value="${pd.models_id}" />
	<%--用户ID--%>
	<input type="hidden" name="requester_id" id="requester_id" value="${userpds.USER_ID}"/>
	
    <div class="wrapper wrapper-content">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-content">
                        <div class="row">
                            <div class="col-sm-12">
                            
                               <div class="ibox float-e-margins" id="menuContent" class="menuContent" style="display:none; position: absolute;z-index: 99;border: solid 1px #18a689;max-height:300px;overflow-y:scroll;overflow-x:auto">
									<div class="ibox-content">
										
									</div>
							  </div>
							  
							  <div class="panel panel-primary">
                                    <div class="panel-heading">
                                        	型号详情
                                    </div>
                                    <div class="panel-body" >
                                        
                                        <div class="form-group form-inline">
	                                    	
											
											<span style="color: red">*</span>
											<label style="width: 6%">楼梯类型:</label>
											<select style="width: 25%" class="form-control" id="elevator_id" name="elevator_id" onchange="elevatorOptionalListByElevatorId();">
												<option value="3">特种梯</option>
												<%-- <c:forEach items="${elevatorList }" var="elevator">
													<option value="${elevator.elevator_id }" ${elevator.elevator_id eq pd.elevator_id ? 'selected':'' } >${elevator.elevator_name }</option>
												</c:forEach> --%>
											</select>
											
											<span style="color: red">*</span>
											<label style="width: 6%">产品线:</label>
											<select style="width: 25%" class="form-control" id="product_id" name="product_id" >
												<option value="">请选择</option>
												<c:forEach items="${productList }" var="product">
													<option value="${product.product_id }" ${product.product_id eq pd.product_id ? 'selected':'' } >${product.product_name }</option>
												</c:forEach>
											</select>
											
											<span style="color: red">*</span>
											<label style="width:6%" >型号名称:</label>
                                    		<input style="width:25%"  type="text"  placeholder="型号名称"  id="models_name" name="models_name" value="${pd.models_name }"  class="form-control">
                                    			
                                    		
                                        		 	
                                    	</div>
                                        
                                        
                                   		
                                   		<div class="form-group">
                                   			<span>&nbsp;&nbsp;</span>
                                        	<label style="width:6%">型号描述:</label>
                                        	<textarea class="form-control" rows="10" cols="20" name="models_description" id="models_description" placeholder="这里输入备注" maxlength="250" title="备注" >${pd.models_description}</textarea>
                                   	   </div>
                                   	   
                                   </div>
                                </div>
							  
							  	<%-- <div class="panel panel-primary">
                                    <div class="panel-heading">
                                        	电梯标准信息
                                    </div>
                                    <div class="panel-body" >
                                        
                                        <div class="form-group form-inline">
	                                    	
											
											<span style="color: red">*</span>
											<label style="width: 6%">电梯速度:</label>
											<select style="width: 25%" class="form-control" id="elevator_speed_id" name="elevator_speed_id" onchange="findStoreyBySpeedId();">
												<option value="">请选择</option>
												<c:forEach items="${elevatorSpeedList }" var="elevatorSpeed">
													<option value="${elevatorSpeed.elevator_speed_id }" ${elevatorSpeed.elevator_speed_id eq pd.elevator_speed_id ? 'selected':'' } >${elevatorSpeed.elevator_speed_name }</option>
												</c:forEach>
												
											</select>
											
											<span style="color: red">*</span>
											<label style="width: 6%">电梯重量:</label>
											<select style="width: 25%" class="form-control" id="elevator_weight_id" name="elevator_weight_id">
												<option value="">请选择</option>
												<c:forEach items="${elevatorWeightList }" var="elevatorWeight">
													<option value="${elevatorWeight.elevator_weight_id }" ${elevatorWeight.elevator_weight_id eq pd.elevator_weight_id ? 'selected':'' } >${elevatorWeight.elevator_weight_name }</option>
												</c:forEach>
												
											</select>
                                    			
                                    		
                                        	<span style="color: red">*</span>
											<label style="width: 6%">电梯楼层:</label>
											<select style="width: 25%" class="form-control" id="elevator_storey_id" name="elevator_storey_id">
												
												
											</select>	 	
                                    	</div>
                                        
                                        <div class="form-group form-inline">
                                        	<span style="color: red">*</span>
											<label style="width:6%" >价格:</label>
                                    		<input style="width:25%"  type="text"  placeholder="价格"  id="elevator_standard_price" name="elevator_standard_price" readonly="readonly" value="${pd.elevator_standard_price }"  class="form-control">
                                    		<button class="btn  btn-primary btn-sm" title="计算价格" type="button"onclick="countStandardPrice()">计算价格</button>
                                    		
                                        </div>
                                   		
                                   		
                                   	   
                                   </div>
                                </div> --%>
                                
                                <div class="panel panel-primary">
                                    <div class="panel-heading">
                                        	特种梯标准信息
                                    </div>
                                    <div class="panel-body" >
                                        
                                        <div class="form-group form-inline">
	                                    	
											
											<span style="color: red">*</span>
											<label style="width: 6%">电梯速度:</label>
											<select style="width: 25%" class="form-control" id="elevator_speed_id" name="elevator_speed_id" onchange="findStoreyBySpeedId();">
												<option value="">请选择</option>
												<c:forEach items="${elevatorSpeedList }" var="elevatorSpeed">
													<option value="${elevatorSpeed.elevator_speed_id }" ${elevatorSpeed.elevator_speed_id eq pd.elevator_speed_id ? 'selected':'' } >${elevatorSpeed.elevator_speed_name }</option>
												</c:forEach>
												
											</select>
											
											<span style="color: red">*</span>
											<label style="width: 6%">电梯重量:</label>
											<select style="width: 25%" class="form-control" id="elevator_weight_id" name="elevator_weight_id" onchange="findStoreyBySpeedId()">
												<option value="">请选择</option>
												<c:forEach items="${elevatorWeightList }" var="elevatorWeight">
													<option value="${elevatorWeight.elevator_weight_id }" ${elevatorWeight.elevator_weight_id eq pd.elevator_weight_id ? 'selected':'' } >${elevatorWeight.elevator_weight_name }</option>
												</c:forEach>
												
											</select>
                                    			
                                    		
                                        	<span style="color: red">*</span>
											<label style="width: 6%">电梯楼层:</label>
											<select style="width: 25%" class="form-control" id="elevator_storey_id" name="elevator_storey_id" onchange="findStoreyById()">
											</select>
											
											
                                    	</div>
                                        
                                        
                                        <div class="form-group form-inline">
                                        	<span style="color: red">&nbsp;</span>
											<label style="width: 6%">标准高度:</label>
											<label style="width: 25%" id="elevator_height_name"></label>
                                        	
                                        	<span style="color: red">*</span>
											<label style="width: 8%">井道提升(米):</label>
											<select style="width: 23%" class="form-control" id="elevator_height_add" name="elevator_height_add" onchange="findHeightMoney()">
												<option value="">请选择</option>
												<option value="0" ${pd.elevator_height_add eq 0 ? "selected":""} >0米</option>
												<option value="1" ${pd.elevator_height_add eq 1 ? "selected":""}>1米</option>
												<option value="2" ${pd.elevator_height_add eq 2 ? "selected":""}>2米</option>
												<option value="3" ${pd.elevator_height_add eq 3 ? "selected":""}>3米</option>
											</select>	 	
                                        
                                        	<span style="color: red">*</span>
											<label style="width:6%" >提升价格:</label>
                                    		<input style="width:25%"  type="text"  placeholder="提升价格"  id="elevator_height_money" name="elevator_height_money" readonly="readonly" value="${pd.elevator_height_money }"  class="form-control">
                                    		
                                    		
                                        </div>
                                   		
                                   		<div class="form-group form-inline">
                                        	 	
                                        
                                        	<span style="color: red">*</span>
											<label style="width:6%" >标准价格:</label>
                                    		<input style="width:25%"  type="text"  placeholder="价格"  id="elevator_standard_price" name="elevator_standard_price" readonly="readonly" value="${pd.elevator_standard_price }"  class="form-control">
                                    		
                                    		
                                        </div>
                                   	   
                                   </div>
                                </div>
                                
                                <%-- <div class="panel panel-primary">
                                    <div class="panel-heading">
                                        	基础项配置
                                    </div>
                                    <div class="panel-body" >
                                        
                                        <div class="form-group form-inline">
	                                    	<c:forEach items="${elevatorBaseList }" var="elevatorBase">
                                    			
                                    			<span>&nbsp;&nbsp;&nbsp;</span>
                                    			<label>${elevatorBase.elevator_base_name }</label>
                                    			<span>&nbsp;</span>
                                    			<input type="checkbox"   value="${elevatorBase.elevator_base_id }"
                                    			<c:forEach items="${elevatorBaseCheckedId }" var="elevatorBaseCheckedId">
                                    				${elevatorBaseCheckedId.elevator_base_id eq elevatorBase.elevator_base_id ? 'checked':'' }
                                    			</c:forEach> 
                                    			onclick="countPrice()"> 
                                    		</c:forEach>
											
                                         	
                                    	</div>
                                        
                                        <div class="form-group form-inline">
                                        	<input type="hidden" id="elevator_base_id" name="elevator_base_id" value="${pd.elevator_base_id }">
                                        	<span style="color: red">*</span>
											<label style="width:6%" >价格:</label>
                                    		<input style="width:25%"  type="text"  placeholder="价格"  id="elevator_base_price" name="elevator_base_price" readonly="readonly" value="${pd.elevator_base_price }"  class="form-control">
                                    		
                                    		
                                        </div>
                                   		
                                   		
                                   	   
                                   </div>
                                </div> --%>
                                
                                 <div class="panel panel-primary">
                                    <div class="panel-heading">
                                        	基础项配置
                                        	<button style="margin-left: 80%" class="btn  btn-info btn-sm" title="删除" type="button" onclick="viewElevatorBase()" >查看</button>
                                        	
                                    </div>
                                   <%--  <div class="panel-body" >
                                        
                                        
                                        
                                        <div class="form-group form-inline">
                                        	<input type="hidden" id="elevator_base_id" name="elevator_base_id" value="${pd.elevator_base_id }">
											<label style="width:6%" >价格:</label>
                                    		<input style="width:25%"  type="text"  placeholder="价格"  id="elevator_base_price" name="elevator_base_price" readonly="readonly" value="${pd.elevator_base_price }"  class="form-control">
                                    		
                                    		
                                        </div>
                                   		
                                   		
                                   	   
                                   </div> --%>
                                </div>
                                
                                
                                 <div class="panel panel-primary">
                                    <div class="panel-heading">
                                        	选配项配置
                                    </div>
                                    <div class="panel-body" >
                                        
                                        <div class="form-group form-inline">
                                        
                                        	<table class="table table-striped table-bordered table-hover" id="elevatorOptionalTable">

	                                    			<tr>
				                                   		<!-- <th style="width:2%;"><input type="checkbox" name="zcheckbox" id="zcheckbox" class="i-checks" ></th> -->
				                                        <th style="width:10%;">父菜单</th>
				                                        <th style="width:10%;">二级菜单</th>
				                                        <th style="width:10%;">三级菜单</th>
				                                        <th style="width:10%;">四级菜单</th>
				                                        <th style="width:10%;">单位</th>
				                                        <th style="width:10%;">交货期</th>
				                                        <th style="width:10%;">价格</th>
				                                        <th style="width:20%;">操作</th>
	                                    			</tr>
	                                    			
	                                    			<tr>
	                                    				<td>
	                                    					<select  onchange="addElevatorOptional(this)">
																<option value="">请选择</option>
																<c:forEach items="${elevatorCascadeList }" var="elevatorCascade">
																	<option value="${elevatorCascade.id }" ${elevatorCascade.id eq pd.id ? 'selected':'' } >${elevatorCascade.name }</option>
																</c:forEach>
																
															</select>
														</td>
														<td>
															<select disabled="disabled"  onchange="addElevatorOptional(this)">
																<option value="">请选择</option>
																
															</select>
														</td>
														<td>
															<select disabled="disabled" onchange="addElevatorOptional(this)">
																<option value="">请选择</option>
																
															</select>
														</td>
														<td>
															<select disabled="disabled" onchange="addElevatorOptional(this)">
																<option value="">请选择</option>
																
															</select>
														</td>
	                                    				<td></td>
	                                    				<td></td>
	                                    				<td></td>
	                                    				<td><button class="btn  btn-primary btn-sm" title="新增" type="button"onclick="addOptionalRows();">新增</button></td>
	                                    			</tr>
                                        	</table>
                                        	
                                        
                                        	
                                    		
                                        </div>
                                   		
                                   		<div class="form-group form-inline">
                                        	<input type="hidden" id="elevator_optional_json" name="elevator_optional_json" value="${pd.elevator_optional_json }">
                                        	<span style="color: red">*</span>
											<label style="width:6%" >价格:</label>
                                    		<input style="width:25%"  type="text"  readonly="readonly" placeholder="价格"  id="elevator_optional_price" name="elevator_optional_price" value="${pd.elevator_optional_price }"  class="form-control">
                                    		
                                    		
                                        </div>
                                   	   
                                   </div>
                                </div>
                                
                                
                                
                                
                                
                               <%--  <div class="panel panel-primary">
                                    <div class="panel-heading">
                                        	非标项配置
                                    </div>
                                    <div class="panel-body" >
                                        
                                        <div class="form-group form-inline">
                                        
                                        	<table class="table table-striped table-bordered table-hover" id="elevatorNonstandardTable">

	                                    			<tr>
				                                   		<!-- <th style="width:2%;"><input type="checkbox" name="zcheckbox" id="zcheckbox" class="i-checks" ></th> -->
				                                        <th style="width:10%;">父菜单</th>
				                                        <th style="width:10%;">二级菜单</th>
				                                        <th style="width:10%;">三级菜单</th>
				                                        <th style="width:10%;">四级菜单</th>
				                                        <th style="width:10%;">单位</th>
				                                        <th style="width:10%;">交货期</th>
				                                        <th style="width:10%;">价格</th>
				                                        <th style="width:20%;">操作</th>
	                                    			</tr>
	                                    			
	                                    			<tr>
	                                    				<td>
	                                    					<select  onchange="addElevatorNonstandard(this)">
																<option value="">请选择</option>
																<c:forEach items="${elevatorCascadeList }" var="elevatorCascade">
																	<option value="${elevatorCascade.id }" ${elevatorCascade.id eq pd.id ? 'selected':'' } >${elevatorCascade.name }</option>
																</c:forEach>
																
															</select>
														</td>
														<td>
															<select disabled="disabled"  onchange="addElevatorNonstandard(this)">
																<option value="">请选择</option>
																
															</select>
														</td>
														<td>
															<select disabled="disabled" onchange="addElevatorNonstandard(this)">
																<option value="">请选择</option>
																
															</select>
														</td>
														<td>
															<select disabled="disabled" onchange="addElevatorNonstandard(this)">
																<option value="">请选择</option>
																
															</select>
														</td>
	                                    				<td></td>
	                                    				<td></td>
	                                    				<td></td>
	                                    				<td><button class="btn  btn-primary btn-sm" title="新增" type="button"onclick="addNonstandardRows();">新增</button></td>
	                                    			</tr>
                                        	</table>
                                        	
                                        
                                        	
                                    		
                                        </div>
                                   		
                                   		<div class="form-group form-inline">
                                        	<input type="hidden" id="elevator_nonstandard_json" name="elevator_nonstandard_json" value="${pd.elevator_nonstandard_json }">
                                        	<span style="color: red">*</span>
											<label style="width:6%" >价格:</label>
                                    		<input style="width:25%"  type="text"  placeholder="价格"  id="elevator_nonstandard_price" name="elevator_nonstandard_price" value="${pd.elevator_nonstandard_price }"  class="form-control">
                                    		
                                    		
                                        </div>
                                   	   
                                   </div>
                                </div> --%>
								
                            	
                            	
                                    
                                    
                               
                            
                            </div>
                            
                        </div>
                        
                    </div>
						<div style="height: 20px;"></div>
						<tr>
						<td><a class="btn btn-primary"style="width: 150px; height:34px;float:left;"  onclick="save();">保存</a></td>
                        <c:if test="${msg eq 'modelsAdd'}">
                            <td><a class="btn btn-danger" style="width: 150px; height: 34px;float:right;" onclick="javascript:CloseSUWin('AddModels');">关闭</a></td>
                        </c:if>
                        <c:if test="${msg eq 'modelsEdit'}">
                            <td><a class="btn btn-danger" style="width: 150px; height: 34px;float:right;" onclick="javascript:CloseSUWin('EditModels');">关闭</a></td>
                        </c:if>
						</tr>
					</div>
            </div>
            
        </div>
 </div>
 </form> 
 
</body>

 
 	<%--zTree--%>
<script type="text/javascript"
		src="plugins/zTree/3.5.24/js/jquery.ztree.all.js"></script>
	<script type="text/javascript">
	
	$(document).ready(function(){
		//非标JSON
		var elevatorNonstandardJson = $("#elevator_nonstandard_json").val();
		var nonstandardJsonArrays = ${nonstandardJsonArrays};
		//选配JSON		
		var jsonStr = $("#elevator_optional_json").val();
		var mapJsonArray = ${mapJsonArray};
		//不为空时读取选配数据
		if(jsonStr != "" && mapJsonArray != ""){
			loadJsonStr(jsonStr,mapJsonArray);
		}
		//不为空时读取非标数据
		if(elevatorNonstandardJson != "" && nonstandardJsonArrays != ""){
			loadJsonStrs(elevatorNonstandardJson,nonstandardJsonArrays);
		}
	
		
		findStoreyBySpeedId();
		
		countsPrice();
		
		
		
	});
	
	
	
		//保存
		function save(){
			if($("#elevator_speed_id").val()==""){
				$("#elevator_speed_id").focus();
				$("#elevator_speed_id").tips({
					side:3,
		            msg:'请选择电梯速度',
		            bg:'#AE81FF',
		            time:2
		        });
				return false;
			}
			if($("#elevator_storey_id").val()==""){
				$("#elevator_storey_id").focus();
				$("#elevator_storey_id").tips({
					side:3,
		            msg:'请选择电梯楼层',
		            bg:'#AE81FF',
		            time:2
		        });
				return false;
			}
			
			if($("#elevator_standard_price").val()==""){
				$("#elevator_standard_price").focus();
				$("#elevator_standard_price").tips({
					side:3,
		            msg:'请先计算价格',
		            bg:'#AE81FF',
		            time:2
		        });
				return false;
			}
			
			
			
			if($("#elevator_id").val()==""){
				$("#elevator_id").focus();
				$("#elevator_id").tips({
					side:3,
		            msg:'请选择型号类型',
		            bg:'#AE81FF',
		            time:2
		        });
				return false;
			}
			
			if($("#models_name").val()==""){
				$("#models_name").focus();
				$("#models_name").tips({
					side:3,
		            msg:'请填写型号名称',
		            bg:'#AE81FF',
		            time:2
		        });
				
				return false;
			}
			
			//可选项配置json
			var jsonStr = "["
			$("#elevatorOptionalTable tr:not(:first)").each(function(){
				//主菜单    
				var parentMenu =  $(this).find("td").eq(0).find("select").eq(0).val();
				//二级菜单
				var twoMenu =  $(this).find("td").eq(1).find("select").eq(0).val();
				if(typeof(twoMenu) == "undefined" ){
					twoMenu = $(this).find("td").eq(1).html();
				}
				//三级菜单
				var threeMenu =  $(this).find("td").eq(2).find("select").eq(0).val();
				if(typeof(threeMenu) == "undefined"){
					threeMenu = $(this).find("td").eq(2).html();
				}
				//四级菜单
				var fourMenu =  $(this).find("td").eq(3).find("select").eq(0).val();
				if(typeof(fourMenu) == "undefined"){
					fourMenu = $(this).find("td").eq(3).html();
				}
				
				var elevator_unit_name =  $(this).find("td").eq(4).html();
				var elevator_optional_delivery =  $(this).find("td").eq(5).html();
				var elevator_optional_price =  $(this).find("td").eq(6).html();
				jsonStr += "{";
				jsonStr += "'parentMenu':'" + parentMenu + "',"
				jsonStr += "'twoMenu':'" + twoMenu + "',"
				jsonStr += "'threeMenu':'" + threeMenu + "',"
				jsonStr += "'fourMenu':'" + fourMenu + "',"
				jsonStr += "'elevator_unit_name':'" + elevator_unit_name + "',"
				jsonStr += "'elevator_optional_delivery':'" + elevator_optional_delivery + "',"
				jsonStr += "'elevator_optional_price':'" + elevator_optional_price + "'},"
				
				
			});
			jsonStr = jsonStr.substring(0,jsonStr.length-1);
			jsonStr += "]";
			$("#elevator_optional_json").val(jsonStr);
			
			
			//非标项配置json
			
			var jsonStrs = "["
			$("#elevatorNonstandardTable tr:not(:first)").each(function(){
				//主菜单    
				var parentMenu =  $(this).find("td").eq(0).find("select").eq(0).val();
				//二级菜单
				var twoMenu =  $(this).find("td").eq(1).find("select").eq(0).val();
				if(typeof(twoMenu) == "undefined" ){
					twoMenu = $(this).find("td").eq(1).html();
				}
				//三级菜单
				var threeMenu =  $(this).find("td").eq(2).find("select").eq(0).val();
				if(typeof(threeMenu) == "undefined"){
					threeMenu = $(this).find("td").eq(2).html();
				}
				//四级菜单
				var fourMenu =  $(this).find("td").eq(3).find("select").eq(0).val();
				if(typeof(fourMenu) == "undefined"){
					fourMenu = $(this).find("td").eq(3).html();
				}
				
				var elevator_unit_name =  $(this).find("td").eq(4).html();
				var elevator_optional_delivery =  $(this).find("td").eq(5).html();
				var elevator_optional_price =  $(this).find("td").eq(6).html();
				jsonStrs += "{";
				jsonStrs += "'parentMenu':'" + parentMenu + "',"
				jsonStrs += "'twoMenu':'" + twoMenu + "',"
				jsonStrs += "'threeMenu':'" + threeMenu + "',"
				jsonStrs += "'fourMenu':'" + fourMenu + "',"
				jsonStrs += "'elevator_unit_name':'" + elevator_unit_name + "',"
				jsonStrs += "'elevator_nonstandard_delivery':'" + elevator_optional_delivery + "',"
				jsonStrs += "'elevator_nonstandard_price':'" + elevator_optional_price + "'},"
				
				
			});
			jsonStrs = jsonStrs.substring(0,jsonStrs.length-1);
			jsonStrs += "]";
			$("#elevator_nonstandard_json").val(jsonStrs);
			
			
			
			$("#modelsForm").submit(); 
		}
		
		
		function CloseSUWin(id) {
			window.parent.$("#" + id).data("kendoWindow").close();
		}
		
		//计算电梯标准价格
		function countStandardPrice(){
			var elevator_speed_id = $("#elevator_speed_id").val();
			var elevator_weight_id = $("#elevator_weight_id").val();
			var elevator_storey_id = $("#elevator_storey_id").val();
			
			/* if($("#elevator_speed_id").val()==""){
				$("#elevator_speed_id").focus();
				$("#elevator_speed_id").tips({
					side:3,
		            msg:'请填选择电梯速度参数',
		            bg:'#AE81FF',
		            time:2
		        });
				
				return false;
			}
			if($("#elevator_weight_id").val()==""){
				$("#elevator_weight_id").focus();
				$("#elevator_weight_id").tips({
					side:3,
		            msg:'请填选择电梯重量参数',
		            bg:'#AE81FF',
		            time:2
		        });
				
				return false;
			}
			if($("#elevator_storey_id").val()==""){
				$("#elevator_storey_id").focus();
				$("#elevator_storey_id").tips({
					side:3,
		            msg:'请填选择电梯楼层参数',
		            bg:'#AE81FF',
		            time:2
		        });
				
				return false;
			} */
			
			$.post("models/countStandardPrice.do",{elevator_speed_id:elevator_speed_id,elevator_weight_id:elevator_weight_id,elevator_storey_id:elevator_storey_id},function(result){
				if(result.success){
					$("#elevator_standard_price").val(result.elevator_standard_price);
					countsPrice();
				}else{
					$("#elevator_standard_price").val("");
				}
			});
		}
		
		 
		
		
	
		
		//根据电梯速度参数查询楼层
		function findStoreyBySpeedId(){
			var elevator_speed_id = $("#elevator_speed_id").val();
			var models_id = $("#models_id").val();
			var flag = $("#flag").val();
			$("#elevator_storey_id").html("");
			$("#elevator_standard_price").val("");
			if(elevator_speed_id !=null && elevator_speed_id !=""){
				
				$.post("models/findStoreyBySpeedId.do",{elevator_speed_id:elevator_speed_id,models_id:models_id,flag:flag},function(result){
					var elevatorStoreyList = eval(result.elevatorStoreyList);
					var modelsList = eval(result.modelsList);
					
					$("#elevator_storey_id").append('<option value="">请选择</option>');
					for(var i=0;i<elevatorStoreyList.length;i++){
						$("#elevator_storey_id").append('<option value="'+elevatorStoreyList[i].elevator_storey_id+'">'+elevatorStoreyList[i].elevator_storey_name+'</option>');
						for(var j=0;j<modelsList.length;j++){
							
							
							if(elevatorStoreyList[i].elevator_storey_id == modelsList[j].elevator_storey_id){
								$("#elevator_storey_id").find("option[value='"+elevatorStoreyList[i].elevator_storey_id+"']").attr("selected",true);
								break;
							}
						}
					}
					countStandardPrice();
					findStoreyById();
				});
			}else{
				$("#elevator_storey_id").append('<option value="">请先选择电梯速度参数</option>');
			}
			
		}
		
		//根据电梯速度参数查询楼层
		/* function findStoreyBySpeedId(){
			var elevator_speed_id = $("#elevator_speed_id").val();
			var models_id = $("#models_id").val();
			$("#elevator_storey_id").html("");
			$("#elevator_standard_price").val("");
			if(elevator_speed_id !=null && elevator_speed_id !=""){
				
				$.post("models/findStoreyBySpeedId.do",{elevator_speed_id:elevator_speed_id,models_id:models_id},function(result){
					var elevatorStoreyList = eval(result.elevatorStoreyList);
					var modelsList = eval(result.modelsList);
					
					$("#elevator_storey_id").append('<option value="">请选择</option>');
					for(var i=0;i<elevatorStoreyList.length;i++){
						$("#elevator_storey_id").append('<option value="'+elevatorStoreyList[i].elevator_storey_id+'">'+elevatorStoreyList[i].elevator_storey_name+'</option>');
						for(var j=0;j<modelsList.length;j++){
							
							
							if(elevatorStoreyList[i].elevator_storey_id == modelsList[j].elevator_storey_id){
								$("#elevator_storey_id").find("option[value='"+elevatorStoreyList[i].elevator_storey_id+"']").attr("selected",true);
								break;
							}
						}
					}
					
				});
			}else{
				$("#elevator_storey_id").append('<option value="">请先选择电梯速度参数</option>');
			}
		} */
		
		//点击功能计算电梯价钱
		function countPrice(){
			
			var str="";
			var elevator_base_id = $("#elevator_base_id").val();
			str = $("input:checkbox:checked").map(function(index,elem){
				return $(elem).val();
			}).get().join(',');
			
			
			
			if(str!=null && str!=''){
				$("#elevator_base_id").val(str);
				 $.post("models/baseCountTotalPrice",{str:str,elevator_base_id:elevator_base_id},function(result){
					if(result.success){
						$("#elevator_base_price").val(result.countPrice);
						
					}
				});
			}else{
				$("#elevator_base_price").val("");
				$("#elevator_base_id").val("");
			}
		}
		
		// 根据选择楼梯类型加载可选配置信息列表
		function elevatorOptionalListByElevatorId(){
			var elevator_id = $("#elevator_id").val();
			if(elevator_id != null && elevator_id != ""){
				$.post("models/elevatorOptionalListByElevatorId.do",{elevator_id:elevator_id},function(result){
					var elevatorCascadeList = eval(result);
					
					$("#elevatorOptionalTable").find("tr").eq(1).find("td").eq(0).find("select").eq(0).html("");
					
					//切换电梯类型时删除多余td
					$("#elevatorOptionalTable").find("tr:not(:first)").each(function(key,value){
						if(key>0){
							var delObj = $(this).find("td").eq(key).find("select");
							delRows(delObj);
						}
					});
					
					$("#elevatorOptionalTable").find("tr").eq(1).find("td").eq(0).find("select").append('<option value="">请选择</option>')
					for(var i=0; i<elevatorCascadeList.length; i++){
						
						$("#elevatorOptionalTable").find("tr").eq(1).find("td").eq(0).find("select").append('<option value="'+elevatorCascadeList[i].id+'">'+elevatorCascadeList[i].name+'</option>')
					}
					var obj = $("#elevatorOptionalTable").find("tr").eq(1).find("td").eq(0).find("select");
					
					addElevatorOptional(obj);
					countsPrice();
				});
			}
		}
		
		//级联选配项配置
		function addElevatorOptional(obj){
			var parentId = $(obj).val();
			//列索引
			var columnIndex = $(obj).parent().index();
			//行索引
			var rowIndex = $(obj).parent().parent().index();
			
			/* //判断列索引不为空时 
			if(columnIndex != "" ){
				//判断动态追加tr,td 索引
				if(indexNum>0){
					// j 等于当前选择的列    判断当前列是否少于当前追加 tr td
					for(var j=columnIndex;j<indexNum;indexNum--){
						//删除table 追加的tr td
						$("#elevatorCascadeTable").find("tr").eq(rowIndex+1).find("td").eq(indexNum).remove();
						$("#elevatorCascadeTable").find("tr").eq(rowIndex).find("th").eq(indexNum).remove();
					}
				
				}
			} */
			//清空追加tr,td
			if(columnIndex != -1){
				
				for(var i=columnIndex+1;i<4;i++){
					$("#elevatorOptionalTable").find("tr").eq(rowIndex).find("td").eq(i).find("select").eq(0).attr("disabled",true);
					$("#elevatorOptionalTable").find("tr").eq(rowIndex).find("td").eq(i).find("select").eq(0).html("");
					
				}
				 
				$("#elevatorOptionalTable").find("tr").eq(rowIndex).find("td").eq(4).html("");
				$("#elevatorOptionalTable").find("tr").eq(rowIndex).find("td").eq(5).html("");
				$("#elevatorOptionalTable").find("tr").eq(rowIndex).find("td").eq(6).html("");
			}
			
			
			
				
			
			//判断ID不为空
			if(parentId != null && parentId !=""){
				$.post("models/addElevatorOptional.do",{parentId:parentId},function(result){
					countsPrice();
					var elevatorCascadeList = eval(result.elevatorCascadeList);
					var elevatorUnitList = eval(result.elevatorUnitList);
					if(elevatorCascadeList != null){
						//如有子类  去除禁用
						for(var j=columnIndex;j<4;j++){
							if(parentId != ""){
								$("#elevatorOptionalTable").find("tr").eq(rowIndex).find("td").eq(columnIndex+1).find("select").eq(0).attr("disabled",false);
							}
						} 
						
						$(obj).parent().parent().find("td").eq(columnIndex+1).find("select").append("<option value=''>请选择</option>");
						for(var i=0;i<elevatorCascadeList.length>0;i++){
							$(obj).parent().parent().find("td").eq(columnIndex+1).find("select").append('<option value="'+elevatorCascadeList[i].id+'">'+elevatorCascadeList[i].name+'</option>');
						}
					}else{
						var elevator_unit_name = "";
						for(var i=0;i<elevatorUnitList.length;i++){
							if(elevatorUnitList[i].elevator_unit_id == result.elevator_unit_id){
								elevator_unit_name = elevatorUnitList[i].elevator_unit_name;
								break;
							}
						}
						$(obj).parent().parent().find("td").eq(4).append(elevator_unit_name);
						$(obj).parent().parent().find("td").eq(5).append(result.elevator_optional_delivery);
						$(obj).parent().parent().find("td").eq(6).append(result.elevator_optional_price);
						countsPrice();
					} 
					
				});
			}
			
		}
		
		//级联非标项配置
		function addElevatorNonstandard(obj){
			var parentId = $(obj).val();
			//列索引
			var columnIndex = $(obj).parent().index();
			//行索引
			var rowIndex = $(obj).parent().parent().index();
			
			
			//清空追加tr,td
			if(columnIndex != -1){
				
				for(var i=columnIndex+1;i<4;i++){
					$("#elevatorNonstandardTable").find("tr").eq(rowIndex).find("td").eq(i).find("select").eq(0).attr("disabled",true);
					$("#elevatorNonstandardTable").find("tr").eq(rowIndex).find("td").eq(i).find("select").eq(0).html("");
					
				}
				 for(var j=columnIndex;j<4;j++){
					if(parentId != ""){
						$("#elevatorNonstandardTable").find("tr").eq(rowIndex).find("td").eq(columnIndex+1).find("select").eq(0).attr("disabled",false);
					}
				} 
				$("#elevatorNonstandardTable").find("tr").eq(rowIndex).find("td").eq(4).html("");
				$("#elevatorNonstandardTable").find("tr").eq(rowIndex).find("td").eq(5).html("");
				$("#elevatorNonstandardTable").find("tr").eq(rowIndex).find("td").eq(6).html("");
			}
			
			
			
				
			
			//判断ID不为空
			if(parentId != null && parentId !=""){
				$.post("models/addElevatorNonstandard.do",{parentId:parentId},function(result){
					var elevatorCascadeList = eval(result.elevatorCascadeList);
					var elevatorUnitList = eval(result.elevatorUnitList);
					if(elevatorCascadeList != null){
						
						
						$(obj).parent().parent().find("td").eq(columnIndex+1).find("select").append('<option value="">请选择</option>');
						for(var i=0;i<elevatorCascadeList.length>0;i++){
							$(obj).parent().parent().find("td").eq(columnIndex+1).find("select").append('<option value="'+elevatorCascadeList[i].id+'">'+elevatorCascadeList[i].name+'</option>');
						}
					}else{
						var elevator_unit_name = "";
						for(var i=0;i<elevatorUnitList.length;i++){
							if(elevatorUnitList[i].elevator_unit_id == result.elevator_unit_id){
								elevator_unit_name = elevatorUnitList[i].elevator_unit_name;
								break;
							}
						}
						$(obj).parent().parent().find("td").eq(4).append(elevator_unit_name);
						$(obj).parent().parent().find("td").eq(5).append(result.elevator_nonstandard_delivery);
						$(obj).parent().parent().find("td").eq(6).append(result.elevator_nonstandard_price);
					} 
					
				});
			}
			
		}
		
		
		
		//table 非标项配置  添加行
		function addNonstandardRows(){
			var tr = $("#elevatorNonstandardTable").find("tr").eq(1).clone();
			$(tr).find("td").eq(1).find("select").empty();
			$(tr).find("td").eq(2).find("select").empty();
			$(tr).find("td").eq(3).find("select").empty();
			$(tr).find("td").eq(4).empty();
			$(tr).find("td").eq(5).empty();
			$(tr).find("td").eq(6).empty();
			$(tr).find("td:last").html("").append(
													'<button class="btn  btn-danger btn-sm" title="删除" type="button" onclick="delRows(this);">删除</button>'
													);
				$("#elevatorNonstandardTable").append(tr);
			countsPrice();	
		}
		
		//计算选配价格
		function countsPrice(){
			var count = 0;
			
			$("#elevatorOptionalTable").find("tr:not(:first)").each(function(){
				count += parseInt($(this).find("td").eq(6).html()==''?0:$(this).find("td").eq(6).html());
				
			});	
			$("#elevator_optional_price").val(count);
			totalPrice();
		}
		
		function totalPrice(){
			var elevator_optional_price =  parseInt($("#elevator_optional_price").val()==''?0:$("#elevator_optional_price").val());
			/* var elevator_base_price =  parseInt($("#elevator_base_price").val() ==''?0:$("#elevator_base_price").val()); */
			var elevator_standard_price = parseInt($("#elevator_standard_price").val() ==''?0:$("#elevator_standard_price").val());
			var total= elevator_optional_price + elevator_standard_price;
			$("#models_price").val(total);
		}
		
		//table 选配项配置  添加行
		function addOptionalRows(){
			
			var tr = $("#elevatorOptionalTable").find("tr").eq(1).clone();
			
			
			/* $(tr).find("td").eq(0).find("select").eq(0).find("option").each(function(){
				var obj = $(this).val();
				for(var i =0;i<rowArr.length;i++){
					var checkObj = rowArr[i];
					if(obj == checkObj){
						//将已选中 ,在新增时去除
						$(tr).find("td").eq(0).find("select").eq(0).find("option[value='"+checkObj+"']").remove();
					}
				}
			}); */
			
			
			$(tr).find("td").eq(1).find("select").empty();
			$(tr).find("td").eq(2).find("select").empty();
			$(tr).find("td").eq(3).find("select").empty();
			$(tr).find("td").eq(4).empty();
			$(tr).find("td").eq(5).empty();
			$(tr).find("td").eq(6).empty();
			$(tr).find("td:last").html("").append(
													'<button class="btn  btn-danger btn-sm" title="删除" type="button" onclick="delRows(this);">删除</button>'
													);
				$("#elevatorOptionalTable").append(tr);
			
			//选中的下拉框数组
			var rowArr = new Array();
			//遍历选配TABLE获取现有的下拉框
			$("#elevatorOptionalTable tr:not(:first)").each(function(){
				if($(this).find("td").eq(0).find("select").val() != null && $(this).find("td").eq(0).find("select").val() != ""){
					//放入已选中到数组
					rowArr.push($(this).find("td").eq(0).find("select").val());
				}
			});
			
			$("#elevatorOptionalTable tr:not(:first)").each(function(i){
				
				var obj = $(this).find("td").find("select").eq(0).find("option:selected").val();
					
					for(var i =0;i<rowArr.length;i++){
						var checkObj = rowArr[i];
						if(obj != "" && obj == checkObj){
							//将已选中 ,在新增时去除
							$(tr).find("td").eq(0).find("select").eq(0).find("option[value='"+checkObj+"']").remove();
						}
					}
				
			});
		}
		
		
		
		//table 删除行
		function delRows(obj){
			$(obj).parent().parent().remove();
			countsPrice();
		}
		
		//加载可选项json数据
		function loadJsonStr(jsonStr,mapJsonArray){
			var jsonStrList = eval('('+jsonStr+')');
			//封装总菜单
			var totalList = eval(mapJsonArray);
			
			
			//添加行
			for(var i=0;i<jsonStrList.length-1;i++){
				addOptionalRows();
			}
			
			//读取已添加选项配置
			for(var i=0;i<mapJsonArray.length;i++){
				//父菜单
				var parentMenuList = totalList[i].parentMenuList;
				//二级菜单 
				var twoMenuList = totalList[i].twoMenuList;
				//三级菜单
				var threeMenuList = totalList[i].threeMenuList;
				//四级菜单
				var fourMenuList = totalList[i].fourMenuList;
				//循环拼接父菜单
				for(var j=0;j<parentMenuList.length;j++){
					$("#elevatorOptionalTable").find("tr:not(:first)").eq(i).each(function(){
						$(this).find("td").eq(0).find("select").eq(0).append('<option value="'+parentMenuList[j].id+'">'+parentMenuList[j].name+'</option>'); 
					})
				}
				//循环拼接二级菜单
				for(var j=0;j<twoMenuList.length;j++){
					$("#elevatorOptionalTable").find("tr:not(:first)").eq(i).each(function(){
						$(this).find("td").eq(1).find("select").eq(0).append('<option value="'+twoMenuList[j].id+'">'+twoMenuList[j].name+'</option>'); 
					})
				}
				//循环拼接三级菜单
				for(var k=0;k<threeMenuList.length;k++){
					$("#elevatorOptionalTable").find("tr:not(:first)").eq(i).each(function(){
						$(this).find("td").eq(2).find("select").eq(0).append('<option value="'+threeMenuList[k].id+'">'+threeMenuList[k].name+'</option>'); 
					})
				}
				//循环拼接四级菜单
				for(var f=0;f<fourMenuList.length;f++){
					$("#elevatorOptionalTable").find("tr:not(:first)").eq(i).each(function(){
						$(this).find("td").eq(3).find("select").eq(0).append('<option value="'+fourMenuList[f].id+'">'+fourMenuList[f].name+'</option>'); 
					})
				}
				
			}
			
			//读取菜单数据
			for(var i=0;i<jsonStrList.length;i++){
				$("#elevatorOptionalTable").find("tr:not(:first)").eq(i).each(function(){
					$(this).find("td").eq(0).find("select").eq(0).val(jsonStrList[i].parentMenu);
					
					//二级菜单 
					var twoMenu = jsonStrList[i].twoMenu;
					//三级菜单 
					var threeMenu = jsonStrList[i].threeMenu;
					//四级菜单 
					var fourMenu = jsonStrList[i].fourMenu;
					
					if(twoMenu != "null"){
						$(this).find("td").eq(1).find("select").eq(0).attr("disabled",false);
					}else{
						$(this).find("td").eq(1).find("select").eq(0).attr("disabled",true);
					}
					if(threeMenu  != "null"){
						$(this).find("td").eq(2).find("select").eq(0).attr("disabled",false);
					}else{
						$(this).find("td").eq(2).find("select").eq(0).attr("disabled",true);
					}
					if(fourMenu  != "null" ){
						$(this).find("td").eq(3).find("select").eq(0).attr("disabled",false);
					}else{
						$(this).find("td").eq(3).find("select").eq(0).attr("disabled",true);
					}
					$(this).find("td").eq(1).find("select").eq(0).val(jsonStrList[i].twoMenu);
					$(this).find("td").eq(2).find("select").eq(0).val(jsonStrList[i].threeMenu);
					$(this).find("td").eq(3).find("select").eq(0).val(jsonStrList[i].fourMenu);
					$(this).find("td").eq(4).html(jsonStrList[i].elevator_unit_name);
					$(this).find("td").eq(5).html(jsonStrList[i].elevator_optional_delivery);
					$(this).find("td").eq(6).html(jsonStrList[i].elevator_optional_price);
				});
				
			}
		}
		
		
		//加载非标项json数据
		function loadJsonStrs(elevatorNonstandardJson,nonstandardJsonArrays){
			var jsonStrList = eval('('+elevatorNonstandardJson+')');
			//封装总菜单
			var totalList = eval(nonstandardJsonArrays);
			
			
			//添加行
			for(var i=0;i<jsonStrList.length-1;i++){
				addNonstandardRows();
			}
			
			//读取已添加选项配置
			for(var i=0;i<nonstandardJsonArrays.length;i++){
				//二级菜单 
				var twoMenuList = totalList[i].twoMenuList;
				//三级菜单
				var threeMenuList = totalList[i].threeMenuList;
				//四级菜单
				var fourMenuList = totalList[i].fourMenuList;
				
				//循环拼接二级菜单
				for(var j=0;j<twoMenuList.length;j++){
					$("#elevatorNonstandardTable").find("tr:not(:first)").eq(i).each(function(){
						$(this).find("td").eq(1).find("select").eq(0).append('<option value="'+twoMenuList[j].id+'">'+twoMenuList[j].name+'</option>'); 
					})
				}
				//循环拼接三级菜单
				for(var k=0;k<threeMenuList.length;k++){
					$("#elevatorNonstandardTable").find("tr:not(:first)").eq(i).each(function(){
						$(this).find("td").eq(2).find("select").eq(0).append('<option value="'+threeMenuList[k].id+'">'+threeMenuList[k].name+'</option>'); 
					})
				}
				//循环拼接三级菜单
				for(var f=0;f<fourMenuList.length;f++){
					$("#elevatorNonstandardTable").find("tr:not(:first)").eq(i).each(function(){
						$(this).find("td").eq(3).find("select").eq(0).append('<option value="'+fourMenuList[f].id+'">'+fourMenuList[f].name+'</option>'); 
					})
				}
				
			}
			
			//读取菜单数据
			for(var i=0;i<jsonStrList.length;i++){
				$("#elevatorNonstandardTable").find("tr:not(:first)").eq(i).each(function(){
					$(this).find("td").eq(0).find("select").eq(0).val(jsonStrList[i].parentMenu);
					//二级菜单 
					var twoMenu = jsonStrList[i].twoMenu;
					//三级菜单 
					var threeMenu = jsonStrList[i].threeMenu;
					//四级菜单 
					var fourMenu = jsonStrList[i].fourMenu;
					
					if(twoMenu != ""){
						$(this).find("td").eq(1).find("select").eq(0).attr("disabled",false);
					}
					
					if(threeMenu != ""){
						$(this).find("td").eq(2).find("select").eq(0).attr("disabled",false);
					}
					if(fourMenu != "" ){
						$(this).find("td").eq(3).find("select").eq(0).attr("disabled",false);
					} 
					
					$(this).find("td").eq(1).find("select").eq(0).val(jsonStrList[i].twoMenu);
					$(this).find("td").eq(2).find("select").eq(0).val(jsonStrList[i].threeMenu);
					$(this).find("td").eq(3).find("select").eq(0).val(jsonStrList[i].fourMenu);
					$(this).find("td").eq(4).html(jsonStrList[i].elevator_unit_name);
					$(this).find("td").eq(5).html(jsonStrList[i].elevator_nonstandard_delivery);
					$(this).find("td").eq(6).html(jsonStrList[i].elevator_nonstandard_price);
				});
				
			}
		}
		
		
		//根据电梯楼层参数查询标准高度
		function findStoreyById(){
			
			var elevator_storey_id = $("#elevator_storey_id").val();
			if(elevator_storey_id != null && elevator_storey_id != ""){
				$.post("models/findStoreyById.do",{elevator_storey_id:elevator_storey_id},function(result){
					if(result != null){
						$("#elevator_height_name").html(result);
						countStandardPrice();
					}
				});
			}
		}
		
		//根据井道提高获取金额
		function findHeightMoney(){
			var elevator_speed_id = $("#elevator_speed_id").val();
			var elevator_weight_id = $("#elevator_weight_id").val();
			var elevator_height_add = $("#elevator_height_add").val();
			if(elevator_speed_id != "" &&  elevator_weight_id != "" && elevator_height_add != "" ){
				$.post("models/findHeightMoney.do",{elevator_speed_id:elevator_speed_id,elevator_weight_id:elevator_weight_id,elevator_height_add:elevator_height_add},function(result){
					if(elevator_height_name != 0){
						$("#elevator_height_money").val(result);
					}else{
						$("#elevator_height_money").val(0);
					}
				});
			}else{
				$("#elevator_height_money").val("");
			}
		}
		
		
		//查看 
		function viewElevatorBase(){
			var elevator_id = $("#elevator_id").val();
			
			$("#ViewElevatorBase").kendoWindow({
		        width: "1200px",
		        height: "700px",
		        title: "查看标准配置信息",
		        actions: ["Close"],
		        content: '<%=basePath%>offer/toElevatorBaseView.do?elevator_id='+elevator_id,
		        modal : true,
				visible : false,
				resizable : true
		    }).data("kendoWindow").center().open();
		}
		
		//计算CCTV电缆价格 A*(H+15M),A为选项加价,H为提升高度 选项加价:17
		function countCableHeight(){
			var cableHeight = $("#cable_height").val();
			if(cableHeight != null && cableHeight != ""){
				var cable_height = parseInt($("#cable_height").val()) + parseInt("15");
				var price = parseInt("17");
				var totalPrice = cable_height * price;
				$("#cable_price").val(totalPrice);
			}else{
				$("#cable_price").val("");
			}
			
			
		}
		
		//计算导轨支架价格
		function countRailBracketPrice(){
			var rise = $("#rise").val();
			var top_height = $("#top_height").val();
			var pit_depth = $("#pit_depth").val();
			var crbsp = $("#crbsp").val();
			
			$("#rail_bracket_price").val("");
			if(rise != null && rise != ""){
				rise = parseInt(rise)
			}else{
				return false;
			}
			
			if(top_height != null && top_height != ""){
				top_height = parseInt(top_height)
			}else{
				return false;
			}
			
			if(pit_depth != null && pit_depth != ""){
				pit_depth = parseInt(pit_depth)
			}else{
				return false;
			}
			
			if(crbsp != null && crbsp != ""){
				crbsp = parseInt(crbsp)
			}else{
				return false;
			}
			
			var totalPrice = parseFloat((rise * parseInt("1000") + top_height + pit_depth)/crbsp).toFixed(0);
			if(totalPrice != null && totalPrice != ""){
				$("#rail_bracket_price").val(totalPrice);
			}
		}
		
		
	</script>
</html>
