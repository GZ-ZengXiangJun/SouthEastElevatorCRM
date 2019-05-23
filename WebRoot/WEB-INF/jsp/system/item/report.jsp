<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<%@ include file="../../system/admin/top.jsp"%> 
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
    <link href="static/js/sweetalert/sweetalert.css" rel="stylesheet">
    <!-- echarts -->
    <link href="static/css/echarts/style.css" rel="stylesheet">
	<title>${pd.SYSNAME}</title>
</head>

<body class="gray-bg" >
    <form action="" name="ReportForm" id="ReportForm" method="post">
    <input type="hidden" name="type" id="type">

        <div class="col-sm-12">
        <div class="form-inline">
            <select name="itemStatus" id="itemStatus" onchange="setByType()" class="form-control m-b" style="width:15%;margin-top:5px">
                <option value="">全部状态</option>
                <option value="1" >信息</option>
                <option value="2" >报价</option>
                <option value="3" >投标</option>
                <option value="4" >洽谈</option>
                <option value="5" >合同</option>
                <option value="6" >中标</option>
                <option value="7" >失标</option>
                <option value="8" >取消</option>
                <option value="9" >生效</option>
            </select>

            <select name="yearOption" id="yearOption" style="width:15%;margin-top: 5px" class="form-control m-b">
                <option value=''>全部年份</option>
            </select>

            <button type="button" class="btn btn-primary " style="margin-bottom:10px" onclick="setByType()"><i style="font-size:18px;" class="fa fa-search"></i></button>
        </div>
        </div>
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>柱状图</h5>
                    <div class="ibox-tools">
                        <a class="collapse-link">
                            <i class="fa fa-chevron-up"></i>
                        </a>
                        <a class="dropdown-toggle" data-toggle="dropdown" href="graph_flot.html#">
                            <i class="fa fa-wrench"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-user">
                            <li><a href="javascript:void(0);" onclick="setType('year')">按年份</a>
                            </li>
                            <li><a href="javascript:void(0);" onclick="setType('month')">按月份</a>
                            </li>
                            <li><a href="javascript:void(0);" onclick="setType('quarter')">按季度</a>
                            </li>
                        </ul>
                        <a class="close-link">
                            <i class="fa fa-times"></i>
                        </a>
                    </div>
                </div>
                <div class="ibox-content">
                    <div class="echarts" id="echarts-bar-chart"></div>
                </div>
            </div>
        </div>
    </form>
	<!-- Fancy box -->
    <script src="static/js/fancybox/jquery.fancybox.js"></script>
	<!-- iCheck -->
    <script src="static/js/iCheck/icheck.min.js"></script>
    <!-- Sweet alert -->
    <script src="static/js/sweetalert/sweetalert.min.js"></script>
    <!-- ECharts -->
    <script src="static/js/plugins/echarts/echarts3/echarts.js"></script>
	<script type="text/javascript">
     var chart;
	 $(document).ready(function () {
		//loading end
		parent.layer.closeAll('loading');

        setYearOption();

        setType('year');
     });



     function setYearOption(){
        $.post("<%=basePath%>item/findReportYearList.do",
            function(data){
                var yearList = data.yearList;
                var yearStr;
                for(var i = 0;i<yearList.length;i++){
                    yearStr += "<option value='"+yearList[i]+"'>"+yearList[i]+"年</option>";
                }
                $("#yearOption").append(yearStr);
            }
        );
    }

    //set by type
    function setByType(){
        var type = $("#type").val();
        var yearOption = $("#yearOption").val();
        var itemStatus = $("#itemStatus").val();
        $.post("<%=basePath%>item/setByType.do?type="+type+"&itemStatus="+itemStatus+"&yearOption="+yearOption,
            function(data){
                chart = echarts.init(document.getElementById("echarts-bar-chart"));
                var obj = eval("("+data+")");
                chart.setOption(obj,true);
            }
        );
    }

    //set type
    function setType(type){
        $("#type").val(type);
        if(type!="year"){
            var yearOption = $("#yearOption").val();
            if(yearOption==""){
                var defaultSelect = $("#yearOption option:last").val();
                $("#yearOption").val(defaultSelect);
            }
        }
        setByType();
    }

	</script>
</body>

</html>
