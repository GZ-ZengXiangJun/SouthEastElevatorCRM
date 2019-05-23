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
	<%@ include file="../../system/admin/top.jsp"%>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>${pd.SYSNAME}</title>
</head>

<body class="gray-bg">

<form action="city/${msg }.do" name="countyForm" id="countyForm" method="post">
	
	<!-- province id -->
	<input type="hidden" name="county_id" id="county_id" value="${pd.id}" />
	<div class="wrapper wrapper-content">
		<div class="row">
			<div class="col-sm-12">
				<div class="ibox float-e-margins">
					<div class="ibox-content">
						<div class="row">
							<div class="col-lg-12">
								
								
								<div class="form-group">
									<label>父菜单</label>
									<select id="city_id" name="city_id" class="form-control">
										<c:forEach items="${cityList }" var="city">
											<option value="${city.id }" <c:if test="${city.id eq pd.city_id }">selected</c:if>  > ${city.name }</option>
										</c:forEach>
									</select>
								
									<label >区域名称:</label>
                                    <input  type="text"  placeholder="区域名称"  id="name" name="name" value="${pd.name }"  class="form-control">
								</div>
							</div>
						</div>
					</div>
					<div style="height: 20px;"></div>
					<tr>
						<td><button type="submit" class="btn btn-primary"style="width: 150px; height:34px;float:left;"  onclick="return funcsave();">保存</button></td>
						<c:if test="${msg eq 'addCounty'}">
							<td><a class="btn btn-danger" style="width: 150px; height: 34px;float:right;" onclick="javascript:CloseSUWin('AddCounty');">关闭</a></td>
						</c:if>
						<c:if test="${msg eq 'editCounty'}">
						<td><a class="btn btn-danger" style="width: 150px; height: 34px;float:right;" onclick="javascript:CloseSUWin('EditCounty');">关闭</a></td>
						</c:if>
					</tr>
				</div>
			</div>

		</div>
	</div>
</form>
<!-- 日期框 -->
<!-- layerDate plugin javascript -->
<script src="static/js/layer/laydate/laydate.js"></script>
<script type="text/javascript">
	//保存
	function funcsave() {

		if ($("#name").val() == "" && $("#name").val() == "") {
			$("#name").tips({
				side: 3,
				msg: "请输入区县名称",
				bg: '#AE81FF',
				time: 2
			});
			$("#name").focus();
			return false;
		}

		
	}
	

	//关闭页面
	function CloseSUWin(id) {
		window.parent.$("#" + id).data("kendoWindow").close();

	}
</script>
</body>

</html>
