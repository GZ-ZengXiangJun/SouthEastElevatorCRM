<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fns" uri="/WEB-INF/tlds/fns.tld"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>

<head>

    <base href="<%=basePath%>">


    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${pd.SYSNAME}</title>
    <!-- Check Box -->
    <link href="static/js/iCheck/custom.css" rel="stylesheet">
    <link href="static/css/select2/select2.min.css" rel="stylesheet">
    <style type="text/css">
        .ztree li span.button.add {
            margin-left: 2px;
            margin-right: -1px;
            background-position: -144px 0;
            vertical-align: top;
            *vertical-align: middle
        }
    </style>
    <!-- jsp文件头和头部 -->
    <%@ include file="../../system/admin/top.jsp" %>
    <!-- 日期控件-->
    <script src="static/js/layer/laydate/laydate.js"></script>
    <script src="static/js/installioncount.js?v=1.2"></script>
    <script src="static/js/select2/select2.min.js"></script>
    <script type="text/javascript">
        var basePath = "<%=basePath%>";
        var itemelecount = "${itemelecount}";
        var basisDate = {
        		'fbdj':null
        }
    </script>
</head>

<body class="gray-bg">
<div id="cbjView" class="animated fadeIn"></div>
<div id="zhjView" class="animated fadeIn"></div>
<form action="e_offer/${msg}.do" name="feiyuemrlForm" id="feiyuemrlForm" method="post">
    <input type="hidden" name="ele_type" id="ele_type" value="DT8">
    <input type="hidden" name="ICKZKSB_" id="ICKZKSB_" value="${pd.OPT_ICKZKSB}">
    <input type="hidden" name="offer_version" id="offer_version" value="${pd.offer_version}">
    <input type="hidden" name="view" id="view" value="${pd.view}">
    <input type="hidden" name="BJC_ID" id="BJC_ID" value="${pd.BJC_ID}">
    <input type="hidden" name="FEIYUEMRL_ID" id="FEIYUEMRL_ID" value="${pd.FEIYUEMRL_ID}">
    <input type="hidden" name="FLAG" id="FLAG" value="${FLAG}">
    <input type="hidden" name="rowIndex" id="rowIndex" value="${pd.rowIndex}">
    <input type="hidden" name="UNSTD" id="UNSTD" value="${pd.UNSTD}">
    <input type="hidden" name="MODELS_ID" id="MODELS_ID" value="${pd.MODELS_ID}">
    <input type="hidden" name="ITEM_ID" id="ITEM_ID" value="${pd.ITEM_ID}">
    <input type="hidden" name="ELEV_IDS" id="ELEV_IDS" value="${pd.ELEV_IDS}">
    <input type="hidden" name="ZGYJ" id="ZGYJ" value="${pd.ZGYJ}">
    <input type="hidden" name="IS_FEIBIAO" id="IS_FEIBIAO" value="false">
    <%--     <input type="hidden" name="YJSYZKL" id="YJSYZKL" value="${pd.YJSYZKL}"> --%>
    <div class="" style="z-index: -1;margin-top: -20px;">
        <div class="row">
            <div class="col-sm-12">
                <div class="">
                    <div class="">
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="panel panel-primary">
                                    <div class="panel-heading">
                                        报价信息
                                       <%--  <c:if test="${forwardMsg!='view'}">
                                            <input type="button" value="装潢价格" onclick="selZhj();"
                                                   class="btn-sm btn-success">
                                            <input type="button" value="调用参考报价" onclick="selCbj();"
                                                   class="btn-sm btn-success">
                                        </c:if> --%>
                                    </div>
                                    <div class="panel-body">
                                        <div class="form-group form-inline">
                                            <label style="width:11%;margin-bottom: 10px"><font
                                                    color="red">*</font>梯种</label>
                                            <input style="width:20%;" class="form-control" id="tz_" type="text"
                                                   name="tz_" value="${modelsPd.models_name }" placeholder="这里输入型号名称"
                                                   required="required">

                                            <!-- 新增显示 -->
                                            <c:if test="${pd.view== 'save' }">
                                            <label style="width:11%;margin-bottom: 10px"><font color="red">*</font>载重(kg):</label>
                                            <select style="width: 20%;" class="form-control" id="BZ_ZZ" name="BZ_ZZ"
                                                    onchange="editZz()" required="required">
                                                <option value="">请选择</option>
                                                <option value="450" ${regelevStandardPd.ZZ=='450'?'selected':''}>450
                                                </option>
                                                <option value="630" ${regelevStandardPd.ZZ=='630'?'selected':''}>630
                                                </option>
                                                <option value="800" ${regelevStandardPd.ZZ=='800'?'selected':''}>800
                                                </option>
                                                <option value="1000" ${regelevStandardPd.ZZ=='1000'?'selected':''}>
                                                    1000
                                                </option>
                                            </select>

                                            <label style="width:11%;margin-bottom: 10px"><font color="red">*</font>速度(m/s):</label>
                                            <select style="width: 20%;" class="form-control" id="BZ_SD" name="BZ_SD"
                                                    onchange="editSd();" required="required">
                                                <option value="">请选择</option>
                                                <option value="1.0" ${regelevStandardPd.SD=='1.0'?'selected':''}>1.0
                                                </option>
                                                <option value="1.5" ${regelevStandardPd.SD=='1.5'?'selected':''}>1.5
                                                </option>
                                                <option value="1.75" ${regelevStandardPd.SD=='1.75'?'selected':''}>
                                                    1.75
                                                </option>
                                                <option value="2.0" ${regelevStandardPd.SD=='2.0'?'selected':''}>2.0
                                                </option>
                                            </select>
                                        </div>

                                        <div class="form-group form-inline">
                                            <label style="width:11%;margin-bottom: 10px"><font color="red">*</font>开门形式</label>
                                            <select style="width: 20%;" class="form-control" id="BZ_KMXS" name="BZ_KMXS"
                                                    required="required" onchange="SetKMXS()">
                                                <option value="中分" ${regelevStandardPd.KMXS=='中分'?'selected':''}>中分
                                                </option>
                                                <option value="左旁开" ${regelevStandardPd.KMXS=='左旁开'?'selected':''}>左旁开
                                                </option>
                                                <option value="右旁开" ${regelevStandardPd.KMXS=='右旁开'?'selected':''}>右旁开
                                                </option>
                                                <option value="中分双折" ${regelevStandardPd.KMXS=='中分双折'?'selected':''}>
                                                    中分双折
                                                </option>
                                                <option value="中分三折" ${regelevStandardPd.KMXS=='中分三折'?'selected':''}>
                                                    中分三折
                                                </option>
                                                <option value="其他" ${regelevStandardPd.KMXS=='其他'?'selected':''}>其他
                                                </option>
                                            </select>

                                            <label style="width:11%;margin-bottom: 10px"><font color="red">*</font>开门宽度:</label>
                                            <select style="width: 20%;" class="form-control" id="BZ_KMKD" name="BZ_KMKD"
                                                    onchange="setMPrice();" required="required">
                                                <option value="">请选择</option>
                                                <option value="其他">其他</option>
                                                <option value="800">800</option>
                                                <option value="900">900</option>
                                            </select>
                                            <label style="width:11%;margin-bottom: 10px">层站门:</label>
                                            <select class="form-control" style="width:7%" name="BZ_C" id="BZ_C"
                                                    onchange="editC();$('#ELE_C').html(this.value);$('#BZ_Z').change();$('#BZ_M').change()">
                                                <option value="">请选择</option>
                                            </select>
                                            <select class="form-control" style="width:7%" name="BZ_Z" id="BZ_Z"
                                                    onchange="setSbj();$('#ELE_Z').html(this.value)">
                                                <option value="">请选择</option>
                                            </select>
                                            <select class="form-control" style="width:7%" name="BZ_M" id="BZ_M"
                                                    onchange="setMPrice();$('#ELE_M').html(this.value)">
                                                <option value="">请选择</option>
                                            </select>
                                            </c:if>
                                            <input type="hidden" name="BZ_M_TEMP" id="BZ_M_TEMP">
                                            <!-- 编辑显示 -->
                                            <c:if test="${pd.view== 'edit' }">
                                            <label style="width:11%;margin-bottom: 10px"><font color="red">*</font>载重(kg):</label>
                                            <select style="width: 20%;" class="form-control" id="BZ_ZZ" name="BZ_ZZ"
                                                    onchange="editZz()" required="required">
                                                <option value="">请选择</option>
                                                <option value="450" ${pd.BZ_ZZ=='450'?'selected':''}>450</option>
                                                <option value="630" ${pd.BZ_ZZ=='630'?'selected':''}>630</option>
                                                <option value="800" ${pd.BZ_ZZ=='800'?'selected':''}>800</option>
                                                <option value="1000" ${pd.BZ_ZZ=='1000'?'selected':''}>1000</option>
                                            </select>

                                            <label style="width:11%;margin-bottom: 10px"><font color="red">*</font>速度(m/s):</label>
                                            <select style="width: 20%;" class="form-control" id="BZ_SD" name="BZ_SD"
                                                    onchange="editSd();" required="required">
                                                <option value="">请选择</option>
                                                <option value="1.0" ${pd.BZ_SD=='1.0'?'selected':''}>1.0</option>
                                                <option value="1.5" ${pd.BZ_SD=='1.5'?'selected':''}>1.5</option>
                                                <option value="1.75" ${pd.BZ_SD=='1.75'?'selected':''}>1.75</option>
                                                <option value="2.0" ${pd.BZ_SD=='2.0'?'selected':''}>2.0</option>
                                            </select>
                                        </div>

                                        <div class="form-group form-inline">
                                            <label style="width:11%;margin-bottom: 10px"><font color="red">*</font>开门形式</label>
                                            <select style="width: 20%;" class="form-control" id="BZ_KMXS" name="BZ_KMXS"
                                                    required="required" onchange="SetKMXS()">
                                                <option value="中分" ${pd.BZ_KMXS=='中分'?'selected':''}>中分</option>
                                                <option value="左旁开" ${pd.BZ_KMXS=='左旁开'?'selected':''}>左旁开</option>
                                                <option value="右旁开" ${pd.BZ_KMXS=='右旁开'?'selected':''}>右旁开</option>
                                                <option value="中分双折" ${pd.BZ_KMXS=='中分双折'?'selected':''}>中分双折</option>
                                                <option value="中分三折" ${pd.BZ_KMXS=='中分三折'?'selected':''}>中分三折</option>
                                                <option value="其他" ${pd.BZ_KMXS=='其他'?'selected':''}>其他</option>
                                            </select>

                                            <label style="width:11%;margin-bottom: 10px"><font color="red">*</font>开门宽度:</label>
                                            <select style="width: 20%;" class="form-control" id="BZ_KMKD" name="BZ_KMKD"
                                                    onchange="setMPrice();" required="required">
                                                <option value="">请选择</option>
                                                <option value="其他" ${pd.BZ_KMKD=='其他'?'selected':''}>其他</option>
                                                <option value="800" ${pd.BZ_KMKD=='800'?'selected':''}>800</option>
                                                <option value="900" ${pd.BZ_KMKD=='900'?'selected':''}>900</option>
                                            </select>
                                            <label style="width:11%;margin-bottom: 10px">层站门:</label>
                                            <select class="form-control" style="width:7%" name="BZ_C" id="BZ_C"
                                                    onchange="editC();$('#ELE_C').html(this.value);$('#BZ_Z').change();$('#BZ_M').change()">
                                                <option value="">请选择</option>
                                            </select>
                                            <select class="form-control" style="width:7%" name="BZ_Z" id="BZ_Z"
                                                    onchange="setSbj();$('#ELE_Z').html(this.value)">
                                                <option value="">请选择</option>
                                            </select>
                                            <select class="form-control" style="width:7%" name="BZ_M" id="BZ_M"
                                                    onchange="setMPrice();$('#ELE_M').html(this.value)">
                                                <option value="">请选择</option>
                                            </select>
                                            </c:if>


                                        </div>
                                        <div class="form-group form-inline">
                                            <label style="width:11%;margin-bottom: 10px">数量:</label>
                                            <input type="text" class="form-control" id="FEIYUEMRL_SL"
                                                   name="FEIYUEMRL_SL" value="${pd.FEIYUEMRL_SL}" readonly="readonly"
                                                   style="width:20%;">
                                            <input type="hidden" class="form-control" id="DT_SL" name="DT_SL"
                                                   value="${pd.FEIYUEMRL_SL}" readonly="readonly" style="width:20%;">

                                            <label style="width:11%;margin-bottom: 10px"><font color="red">*</font>开门高度:</label>
                                            <input type="text" class="form-control" id="BZ_KMGD" name="BZ_KMGD"
                                                   required="required" value="${pd.view== 'edit'?pd.BZ_KMGD:'2100'}"
                                                   style="width:20%;">

                                            <label style="width:11%;margin-bottom: 10px">单价:</label>
                                            <input type="text" class="form-control" id="DANJIA" name="DANJIA"
                                                   value="${regelevStandardPd.PRICE}" readonly="readonly"
                                                   style="width:20%;">

                                            <input type="hidden" id="FEIYUEMRL_ZK" name="FEIYUEMRL_ZK"
                                                   value="${pd.FEIYUEMRL_ZK}">

                                        </div>
                                        <div class="form-group form-inline">
                                            <label style="width:11%;margin-bottom: 10px"><font color="red">*</font>土建图图号:</label>
                                            <input type="text" class="form-control" id="TJTTH" name="TJTTH"
                                                   required="required" value="${pd.TJTTH}" style="width:20%;">
                                            <label style="width:11%;margin-bottom: 10px">佣金折扣使用率:</label>
                                            <input type="text" style="20%;" class="form-control" name="YJSYZKL" id="YJSYZKL"
                                                   readonly="readonly" value="${pd.YJSYZKL}">
                                            <label class="intro" style="color: red;display: none;" id="DANJIA_Label">开门宽度非标,减门价格请非标询价</label>

                                        </div>
                                        <div class="form-group form-inline dn-fixed-to-top">
                                            <table class="table table-striped table-bordered table-hover" id="tab"
                                                   name="tab">
                                                <tr bgcolor="#CCCCCC">
                                                    <th>基价</th>
                                                    <th>选项加价</th>
                                                    <th>折前价</th>
                                                    <th>非标价</th>
                                                    <th>其他费用</th>
                                                    <th>佣金总额</th>
                                                    <!-- <th>是否超标</th> -->
                                                    <th>折扣率(%)</th>
                                                    <th>草签实际单价</th>
                                                    <th>设备实际总价</th>
                                                    <!-- <th>比例(%)</th> -->
                                                    <th>安装费</th>
                                                    <th>运输费</th>
                                                    <th>总报价</th>
                                                </tr>
                                                <tr>
                                                    <!-- 基价 -->
                                                    <td>
                                                        <%-- <input type="text" style='width:50px;border-left:0px;border-top:0px;border-right:0px;border-bottom:1px ' name="FEISHANG_SBJ" id="FEISHANG_SBJ" value="${regelevStandardPd.PRICE}"> --%>
                                                        <input type="text"
                                                               style="width:100%;border-left:0px;border-top:0px;border-right:0px;border-bottom:1px"
                                                               name="SBJ_TEMP" id="SBJ_TEMP" readonly="readonly"
                                                               value="${regelevStandardPd.PRICE*pd.FEIYUEMRL_SL}">
                                                    </td>
                                                    <!-- 选项加价 -->
                                                    <td><input type="text"
                                                               style="width:100%;border-left:0px;border-top:0px;border-right:0px;border-bottom:1px"
                                                               name="XS_XXJJ" id="XS_XXJJ" readonly="readonly"
                                                               value="${pd.XS_XXJJ}"></td>
                                                    <!-- 折前价 -->
                                                    <td><input type="text"
                                                               style="width:100%;border-left:0px;border-top:0px;border-right:0px;border-bottom:1px"
                                                               name="XS_ZQJ" id="XS_ZQJ" readonly="readonly"
                                                               value="${pd.XS_ZQJ}"></td>
                                                    <!-- 非标价 -->
                                                    <td><input type="text"
                                                               style="width:100%;border-left:0px;border-top:0px;border-right:0px;border-bottom:1px"
                                                               name="XS_FBJ" id="XS_FBJ" readonly="readonly"
                                                               value="${pd.XS_FBJ}">
                                                    </td>
                                                    <!-- 其他费用 -->
                                                    <td><input type="text"
                                                               style="width:100%;border-left:0px;border-top:0px;border-right:0px;border-bottom:1px;background-color:yellow;"
                                                               name="XS_QTFY" id="XS_QTFY" onkeyup="JS_SJBJ();"
                                                               value="${pd.XS_QTFY}">
                                                    </td>
                                                    <!-- 佣金总额 -->
                                                    <td><input type="text"
                                                               style="width:100%;border-left:0px;border-top:0px;border-right:0px;border-bottom:1px;background-color:yellow;"
                                                               name="XS_YJZE" id="XS_YJZE" onkeyup="JS_SJBJ();"
                                                               value="${pd.XS_YJZE}">
                                                    </td>
                                                    <!-- 是否超标 -->
                                                    <input type="hidden"
                                                           style="width:100%;border-left:0px;border-top:0px;border-right:0px;border-bottom:1px"
                                                           name="XS_SFCB" id="XS_SFCB" value="${pd.XS_SFCB}"
                                                           readonly="readonly">
                                                    <%--  <td><input type="text" style="width:45px;border-left:0px;border-top:0px;border-right:0px;border-bottom:1px"
                                                         name="XS_SFCB" id="XS_SFCB" value="${pd.XS_SFCB}" readonly="readonly">
                                                    </td> --%>
                                                    <!-- 折扣率 -->
                                                    <td><input type="text"
                                                               style="width:100%;border-left:0px;border-top:0px;border-right:0px;border-bottom:1px"
                                                               name="XS_ZKL" id="XS_ZKL" value="${pd.XS_ZKL}"
                                                               readonly="readonly">
                                                    </td>
                                                    <!-- 草签实际单价 -->
                                                    <td><input type="text"
                                                               style="width:100%;border-left:0px;border-top:0px;border-right:0px;border-bottom:1px;background-color:yellow;"
                                                               name="XS_CQSJDJ" id="XS_CQSJDJ" onkeyup="JS_SJBJ();"
                                                               value="${pd.XS_CQSJDJ}"></td>
                                                    <!-- 设备实际报价 -->
                                                    <td><input type="text"
                                                               style="width:100%;border-left:0px;border-top:0px;border-right:0px;border-bottom:1px"
                                                               name="XS_SBSJBJ" id="XS_SBSJBJ" readonly="readonly"
                                                               value="${pd.XS_SBSJBJ}"></td>
                                                    <!-- 比例 -->
                                                    <input type="hidden"
                                                           style="width:45px;border-left:0px;border-top:0px;border-right:0px;border-bottom:1px"
                                                           name="XS_YJBL" id="XS_YJBL" value="${pd.XS_YJBL}"
                                                           readonly="readonly">
                                                    <%-- <td><input type="text" style="width:45px;border-left:0px;border-top:0px;border-right:0px;border-bottom:1px"
                                                         name="XS_YJBL" id="XS_YJBL" value="${pd.XS_YJBL}" readonly="readonly">
                                                    </td> --%>
                                                    <!-- 安装费 -->
                                                    <td><input type="text"
                                                               style="width:100%;border-left:0px;border-top:0px;border-right:0px;border-bottom:1px"
                                                               name="XS_AZJ" id="XS_AZJ" value="${pd.XS_AZJ}"
                                                               readonly="readonly">
                                                    </td>
                                                    <!-- 运输费 -->
                                                    <td><input type="text"
                                                               style="width:100%;border-left:0px;border-top:0px;border-right:0px;border-bottom:1px"
                                                               name="XS_YSJ" id="XS_YSJ" value="${pd.XS_YSJ}"
                                                               readonly="readonly">
                                                    </td>
                                                    <!-- 总报价 -->
                                                    <td><input type="text"
                                                               style="width:100%;border-left:0px;border-top:0px;border-right:0px;border-bottom:1px"
                                                               name="XS_TATOL" id="XS_TATOL" value="${pd.XS_TATOL}"
                                                               readonly="readonly">
                                                    </td>


                                                    <input type="hidden" name="FEIYUEMRL_ZHJ" id="FEIYUEMRL_ZHJ"
                                                           value="${pd.FEIYUEMRL_ZHJ}">
                                                    <input type="hidden" name="FEIYUEMRL_SBJ" id="FEIYUEMRL_SBJ"
                                                           value="${regelevStandardPd.PRICE}">
                                                    <%-- <input type="hidden" name="SBJ_TEMP" id="SBJ_TEMP" value="${regelevStandardPd.PRICE}"> --%>
                                                    <span id="zk_">${pd.FEIYUEMRL_ZK}</span>
                                                    <input type="hidden" name="FEIYUEMRL_ZHSBJ" id="FEIYUEMRL_ZHSBJ"
                                                           value="${pd.FEIYUEMRL_ZHSBJ}">
                                                    <input type="hidden" name="FEIYUEMRL_AZF" id="FEIYUEMRL_AZF"
                                                           value="${pd.FEIYUEMRL_AZF}"/>
                                                    <input type="hidden" name="FEIYUEMRL_YSF" id="FEIYUEMRL_YSF"
                                                           value="${pd.FEIYUEMRL_YSF}">
                                                    <input type="hidden" name="FEIYUEMRL_SJBJ" id="FEIYUEMRL_SJBJ"
                                                           value="${pd.FEIYUEMRL_SJBJ}">
                                                </tr>
                                            </table>
                                        </div>

                                        <div class="form-group form-inline">
                                            <ul class="nav nav-tabs">
                                                <li class="active"><a data-toggle="tab" href="#tab-1">基本参数</a></li>
                                                <li class=""><a data-toggle="tab" href="#tab-2">标准功能</a></li>
                                                <li class=""><a data-toggle="tab" href="#tab-3">可选功能</a></li>
                                                <li class=""><a data-toggle="tab" href="#tab-4">单组监控室对讲系统</a></li>
                                                <li class=""><a data-toggle="tab" href="#tab-5">轿厢装潢</a></li>
                                                <li class=""><a data-toggle="tab" href="#tab-6">厅门门套</a></li>
                                                <li class=""><a data-toggle="tab" href="#tab-7">操纵盘</a></li>
                                                <li class=""><a data-toggle="tab" href="#tab-8">厅门信号装置</a></li>
                                                <li class=""><a data-toggle="tab" href="#tab-9">非标</a></li>
                                                <li class=""><a data-toggle="tab" href="#tab-10">常规非标</a></li>
                                            </ul>
                                            <div class="tab-content">
                                                <div id="tab-1" class="tab-pane">
                                                    <!-- 基本参数 -->
                                                    <table class="table table-striped table-bordered table-hover"
                                                           border="1" cellspacing="0">
                                                        <tr>
                                                            <td width="173">控制系统</td>
                                                            <td colspan="2">
                                                                <select name="BASE_KZXT" id="BASE_KZXT"
                                                                        class="form-control">
                                                                    <option value="交流变频调速微机控制" ${pd.BASE_KZXT=='交流变频调速微机控制'?'selected':''}>
                                                                        交流变频调速微机控制
                                                                    </option>
                                                                    <option value="非标" ${pd.BASE_KZXT=='非标'?'selected':''}>
                                                                        非标
                                                                    </option>
                                                                </select>
                                                            </td>
                                                            <td width="12">加价</td>
                                                        </tr>
                                                        <tr>
                                                            <td>控制方式</td>
                                                            <td colspan="2">
                                                                <input type="radio" name="BASE_KZFS" value="单台(G1C)"
                                                                       onclick="KZFS_TEMP('1');" ${pd.BASE_KZFS=='单台(G1C)'?'checked':''}/>
                                                                单台(G1C)
                                                                <input type="radio" name="BASE_KZFS" value="两台并联(G2C)"
                                                                       onclick="KZFS_TEMP('2');" ${pd.BASE_KZFS=='两台并联(G2C)'?'checked':''}/>
                                                                两台并联(G2C)
                                                                <input type="radio" name="BASE_KZFS" value="三台群控(G3C)"
                                                                       onclick="KZFS_TEMP('3');" ${pd.BASE_KZFS=='三台群控(G3C)'?'checked':''}/>
                                                                三台群控(G3C)
                                                                <input type="radio" name="BASE_KZFS" value="四台群控(G4C)"
                                                                       onclick="KZFS_TEMP('4');" ${pd.BASE_KZFS=='四台群控(G4C)'?'checked':''}/>
                                                                四台群控(G4C)
                                                                &nbsp;&nbsp;<label style="color: red;">四台以上请非标询价</label>
                                                            </td>
                                                            <td><input type="text" name="BASE_KZFS_TEMP"
                                                                       id="BASE_KZFS_TEMP" class="form-control"
                                                                       readonly="readonly"></td>
                                                        </tr>
                                                        <tr>
                                                            <td>号梯代码</td>
                                                            <td colspan="2">
                                                                <%-- <input type="text" name="BASE_HTDM" id="BASE_HTDM" class="form-control" value="${pd.BASE_HTDM}"> --%>
                                                                <select style="width: 20%;" class="form-control"
                                                                        id="BASE_HTDM" name="BASE_HTDM">
                                                                    <option value="" ${pd.BASE_HTDM==''?'selected':''}>
                                                                        请选择
                                                                    </option>
                                                                    <option value="A" ${pd.BASE_HTDM=='A'?'selected':''}>
                                                                        A
                                                                    </option>
                                                                    <option value="B" ${pd.BASE_HTDM=='B'?'selected':''}>
                                                                        B
                                                                    </option>
                                                                    <option value="C" ${pd.BASE_HTDM=='C'?'selected':''}>
                                                                        C
                                                                    </option>
                                                                    <option value="D" ${pd.BASE_HTDM=='D'?'selected':''}>
                                                                        D
                                                                    </option>
                                                                    <option value="非标" ${pd.BASE_HTDM=='非标'?'selected':''}>
                                                                        非标
                                                                    </option>
                                                                </select>
                                                            </td>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td>井道结构</td>
                                                            <td colspan="2">
                                                                <input type="radio" name="BASE_JDJG"
                                                                       value="全混凝土" ${pd.BASE_JDJG=='全混凝土'?'checked':''}/>
                                                                全混凝土
                                                                <input type="radio" name="BASE_JDJG"
                                                                       value="框架结构(圈梁)" ${pd.BASE_JDJG=='框架结构(圈梁)'?'checked':''}/>
                                                                框架结构(圈梁)
                                                                <input type="radio" name="BASE_JDJG"
                                                                       value="钢结构" ${pd.BASE_JDJG=='钢结构'?'checked':''}/>
                                                                钢结构
                                                            </td>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td>圈/钢梁间距</td>
                                                            <td colspan="2">
                                                                <input type="text" name="BASE_QGLJJ" id="BASE_QGLJJ"
                                                                       onkeyup="setDgzj();" class="form-control"
                                                                       value="${pd.BASE_QGLJJ}"/>mm
                                                            </td>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td><font color="red">*</font>轿厢规格CW*CD(mm)</td>
                                                            <td colspan="2">
                                                                <select name="BASE_JXGG" id="BASE_JXGG"
                                                                        class="form-control" required="required">
                                                                    <option value=''>请选择</option>
                                                                    <option value="1400×1100(630kg)" ${pd.BASE_JXGG=='1400×1100(630kg)'?'selected':''}>
                                                                        1400×1100(630kg)
                                                                    </option>
                                                                    <option value="1100×1400(630kg)" ${pd.BASE_JXGG=='1100×1400(630kg)'?'selected':''}>
                                                                        1100×1400(630kg)
                                                                    </option>
                                                                    <option value="1400×1350(800kg)" ${pd.BASE_JXGG=='1400×1350(800kg)'?'selected':''}>
                                                                        1400×1350(800kg)
                                                                    </option>
                                                                    <option value="1350×1400(800kg)" ${pd.BASE_JXGG=='1350×1400(800kg)'?'selected':''}>
                                                                        1350×1400(800kg)
                                                                    </option>
                                                                    <option value="1600×1400(1000kg)" ${pd.BASE_JXGG=='1600×1400(1000kg)'?'selected':''}>
                                                                        1600×1400(1000kg)
                                                                    </option>
                                                                    <option value="1100×2100(1000kg担架梯)" ${pd.BASE_JXGG=='1100×2100(1000kg担架梯)'?'selected':''}>
                                                                        1100×2100(1000kg担架梯)
                                                                    </option>
                                                                    <option value="1800×1500(1150kg)" ${pd.BASE_JXGG=='1800×1500(1150kg)'?'selected':''}>
                                                                        1800×1500(1150kg)
                                                                    </option>
                                                                    <option value="非标" ${pd.BASE_JXGG=='非标'?'selected':''}>
                                                                        非标
                                                                    </option>
                                                                </select>
                                                                <div style="margin-top: 5px;">
                                                                    <font color="red" id="BASE_JXGG_FBTEXT"
                                                                          style="display:none;">国标允许的轿厢面积对应的载重下轿厢尺寸的变化时非标加价，超出国标时请非标询价</font>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <input type="hidden" name=CGFB_JXCC id="CGFB_JXCC"
                                                                       value="${pd.CGFB_JXCC }">
                                                                <input type="text" name="CGFB_JXCC_TEMP"
                                                                       id="CGFB_JXCC_TEMP" class="form-control"
                                                                       readonly="readonly"></td>
                                                        </tr>
                                                        <tr>
                                                            <td>轿厢高度(非净高)</td>
                                                            <td colspan="2">
                                                                <input type="radio" name="BASE_JXGD"
                                                                       value="2300" ${pd.BASE_JXGD=='2300'?'checked':''}/>2300mm
                                                                <input type="radio" name="BASE_JXGD"
                                                                       value="2400" ${pd.BASE_JXGD=='2400'?'checked':''}/>2400mm
                                                                <input type="radio" name="BASE_JXGD"
                                                                       value="2500" ${pd.BASE_JXGD=='2500'?'checked':''}/>
                                                                2500mm
                                                                <input type="radio" name="BASE_JXGD"
                                                                       value="2600" ${pd.BASE_JXGD=='2600'?'checked':''}/>
                                                                2600mm
                                                                <!-- <select name="BASE_JXGD_SELECT">
																	<option value="2400(V=1.0m/s时,K≥4000)">2400(V=1.0m/s时,K≥4000)</option>
																	<option value="2400(V=1.5m/s时,K≥4150)">2400(V=1.5m/s时,K≥4150)</option>
																	<option value="2400(V=1.75m/s时,K≥4250)">2400(V=1.75m/s时,K≥4250)</option>
																	<option value="2400(V=1.0m/s时,K≥4100)">2400(V=1.0m/s时,K≥4100)</option>
																	<option value="2400(V=1.5m/s时,K≥4250)">2400(V=1.5m/s时,K≥4250)</option>
																	<option value="2400(V=1.75m/s时,K≥4350)">2400(V=1.75m/s时,K≥4350)</option>
																</select>
																mm(450-1000kg) -->
                                                            </td>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td>门类型/门保护</td>
                                                            <td>
                                                                <input type="radio" name="BASE_MLXMBH" value="PM门机/2D光幕"
                                                                       onclick="setMlxmbhDisable('1');" ${pd.BASE_MLXMBH=='PM门机/2D光幕'?'checked':''}/>
                                                                PM门机/2D光幕
                                                                <input type="radio" name="BASE_MLXMBH" id="BASE_MLXMBH"
                                                                       value=""
                                                                       onclick="setMlxmbhDisable('0');" ${pd.BASE_MLXMBH=='VVVF门机/2D光幕'?'checked':''}/>
                                                                <select name="BASE_MLXMBH_TEXT" id="BASE_MLXMBH_TEXT"
                                                                        class="form-control">
                                                                    <option value=''>请选择</option>
                                                                    <option value="VVVF门机/2D光幕" ${pd.BASE_MLXMBH=='VVVF门机/2D光幕'?'selected':''}>
                                                                        VVVF门机
                                                                    </option>
                                                                    <option value="非标" ${pd.BASE_MLXMBH=='非标'?'selected':''}>
                                                                        非标
                                                                    </option>
                                                                </select>
                                                                /2D光幕
                                                            </td>
                                                            <td>
                                                            </td>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td>井道承重墙厚度</td>
                                                            <td colspan="2">
                                                                <input type="radio" name="BASE_JDCZQHD" value="250"
                                                                       onclick="setJdczqhdDisable('1');"  ${pd.BASE_JDCZQHD=='250'?'checked':''}/>
                                                                WT=250mm
                                                                <input type="radio" name="BASE_JDCZQHD"
                                                                       id="BASE_JDCZQHD" value=""
                                                                       onclick="setJdczqhdDisable('0')" ${pd.BASE_JDCZQHD=='250'?'':'checked'}/>
                                                                WT=
                                                                <input name="BASE_JDCZQHD_TEXT" id="BASE_JDCZQHD_TEXT"
                                                                       type="text" class="form-control"
                                                                       value="${pd.BASE_JDCZQHD}"/>
                                                                mm
                                                            </td>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td>提升高度RISE</td>
                                                            <td colspan="2">
                                                                <font color="red">*</font><input name="BASE_TSGD"
                                                                                                 id="BASE_TSGD"
                                                                                                 onkeyup="setJdzg();"
                                                                                                 type="text"
                                                                                                 class="form-control"
                                                                                                 value="${pd.BASE_TSGD}"
                                                                                                 placeholder="必填"
                                                                                                 required="required"/>mm
                                                            </td>
                                                            <td>
                                                                超出:
                                                                <input name="BASE_CCGD" id="BASE_CCGD" type="text"
                                                                       style="width:60%" class="form-control"
                                                                       value="${pd.BASE_CCGD}" readonly="readonly"/>mm
                                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                <br><br>
                                                                加价:
                                                                <input name="BASE_CCJG" id="BASE_CCJG" type="text"
                                                                       style="width:60%" class="form-control"
                                                                       value="${pd.BASE_CCJG}" readonly="readonly"/>元
                                                                       
                                                                <label class="intro" style="color: red;display: none;" id="CGJJ_Label">请非标询价</label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>井道尺寸HW*HD</td>
                                                            <td colspan="2">
                                                                <input name="BASE_JDK" id="BASE_JDK" type="text"
                                                                       class="form-control" style="width: 15%"
                                                                       value="${pd.BASE_JDK}"/>
                                                                mm宽×
                                                                <input name="BASE_JDS" id="BASE_JDS" type="text"
                                                                       class="form-control" style="width: 15%"
                                                                       value="${pd.BASE_JDS}"/>
                                                                mm深
                                                            </td>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td>底坑S顶层K</td>
                                                            <td colspan="2">
                                                                <p>
                                                                    <font color="red">*</font>底坑深度:
                                                                    <input name="BASE_DKSD" id="BASE_DKSD" type="text"
                                                                           onkeyup="setJdzg();" class="form-control"
                                                                           value="${pd.BASE_DKSD}" placeholder="必填"
                                                                           required="required"/>mm
                                                                </p>
                                                                <p>
                                                                    <font color="red">*</font>顶层高度:
                                                                    <input name="BASE_DCGD" id="BASE_DCGD" type="text"
                                                                           onkeyup="setJdzg();" class="form-control"
                                                                           value="${pd.BASE_DCGD}" placeholder="必填"
                                                                           required="required"/>mm
                                                                </p>
                                                            </td>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td>基站驻停</td>
                                                            <td colspan="2">
                                                                在
                                                                <input name="BASE_JZZT" type="text" class="form-control"
                                                                       value="${pd.BASE_JZZT}"/>
                                                                层
                                                            </td>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td>楼层标记</td>
                                                            <td colspan="2">
                                                                <input name="BASE_LCBJ" type="text" class="form-control"
                                                                       value="${pd.BASE_LCBJ}"/>
                                                            </td>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td>井道总高</td>
                                                            <td colspan="2">
                                                                <input name="BASE_JDZG" id="BASE_JDZG" type="text"
                                                                       class="form-control" value="${pd.BASE_JDZG}"
                                                                       readonly="readonly"/>
                                                            </td>
                                                            <td>
                                                                <input type="hidden" name="BASE_JDZG_TEMP"
                                                                       id="BASE_JDZG_TEMP" class="form-control"
                                                                       readonly="readonly">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>导轨支架</td>
                                                            <td colspan="2">
                                                                <input name="BASE_DGZJ" id="BASE_DGZJ" type="text"
                                                                       onkeyup="setDgzj();" class="form-control"
                                                                       value="${pd.BASE_DGZJ}"/>
                                                            </td>
                                                            <td>
                                                                <input type="text" name="BASE_DGZJ_TEMP"
                                                                       id="BASE_DGZJ_TEMP" class="form-control"
                                                                       readonly="readonly">
                                                                <label class="intro" style="color: red;display: none;width: 50%;" id="DGZJ_Label">请非标询价</label>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <!-- 基本参数 -->
                                                </div>
                                                <div id="tab-2" class="tab-pane">
                                                    <!-- 标准功能 -->
                                                    <table class="table table-striped table-bordered table-hover"
                                                           border="1" cellspacing="0">
                                                        <tr>
                                                            <td colspan="4">标准功能及代码</td>
                                                        </tr>
                                                        <tr>
                                                            <td width="62">1</td>
                                                            <td width="224">全集选控制</td>
                                                            <td width="42">14</td>
                                                            <td width="241">故障自动检测</td>
                                                        </tr>
                                                        <tr>
                                                            <td>2</td>
                                                            <td>轿顶与机房紧急电动运行</td>
                                                            <td>15</td>
                                                            <td>关门时间保护</td>
                                                        </tr>
                                                        <tr>
                                                            <td>3</td>
                                                            <td>轿内应急照明</td>
                                                            <td>16</td>
                                                            <td>超载不启动（警示灯及蜂鸣器）</td>
                                                        </tr>
                                                        <tr>
                                                            <td>4</td>
                                                            <td>设置厅、轿门时间</td>
                                                            <td>17</td>
                                                            <td>运行次数显示</td>
                                                        </tr>
                                                        <tr>
                                                            <td>5</td>
                                                            <td>满载不停梯</td>
                                                            <td>18</td>
                                                            <td>警铃</td>
                                                        </tr>
                                                        <tr>
                                                            <td>6</td>
                                                            <td>无呼自动返基站</td>
                                                            <td>19</td>
                                                            <td>厅和轿厢数字式位置指示器</td>
                                                        </tr>
                                                        <tr>
                                                            <td>7</td>
                                                            <td>驻停</td>
                                                            <td>20</td>
                                                            <td>厅外和轿厢呼梯/登记</td>
                                                        </tr>
                                                        <tr>
                                                            <td>8</td>
                                                            <td>外呼按钮嵌入自诊断</td>
                                                            <td>21</td>
                                                            <td>厅及轿厢运行方向显示</td>
                                                        </tr>
                                                        <tr>
                                                            <td>9</td>
                                                            <td>防捣乱操作</td>
                                                            <td>22</td>
                                                            <td>轿厢防意外移动功能（UCMP)</td>
                                                        </tr>
                                                        <tr>
                                                            <td>10</td>
                                                            <td>轿内通风手动及照明自动控制</td>
                                                            <td>23</td>
                                                            <td>2D光幕门保护装置</td>
                                                        </tr>
                                                        <tr>
                                                            <td>11</td>
                                                            <td>盲文按钮</td>
                                                            <td>24</td>
                                                            <td>错误指令删除</td>
                                                        </tr>
                                                        <tr>
                                                            <td>12</td>
                                                            <td>轿门防扒门</td>
                                                            <td>25</td>
                                                            <td>开、关门按钮</td>
                                                        </tr>
                                                        <tr>
                                                            <td>13</td>
                                                            <td>监控室与机房、轿厢对讲（不含机房到监控室线）</td>
                                                            <td>26</td>
                                                            <td>开门再平层</td>
                                                        </tr>
                                                    </table>
                                                    <!-- 标准功能 -->
                                                </div>
                                                <div id="tab-3" class="tab-pane">
                                                    <!-- 可选功能 -->
                                                    <table class="table table-striped table-bordered table-hover"
                                                           border="1" cellspacing="0">
                                                        <tr>
                                                            <td>序号</td>
                                                            <td>功能</td>
                                                            <td>有</td>
                                                            <td>加价</td>
                                                        </tr>
                                                        <%-- <tr>
															<td>1</td>
															<td>两台并联</td>
															<td>
																<input name="OPT_LTBL_TEXT" id="OPT_LTBL_TEXT" type="checkbox" onclick="editOpt('OPT_LTBL');" ${pd.OPT_LTBL=='1'?'checked':''}/>
																<input type="hidden" name="OPT_LTBL" id="OPT_LTBL">
															</td>
															<td><input type="text" name="OPT_LTBL_TEMP" id="OPT_LTBL_TEMP" class="form-control" readonly="readonly"></td>
														  </tr> --%>
                                                        <%--  <tr>
															<td>2</td>
															<td>停电紧急救援</td>
															<td>
																<input name="OPT_TDJJJY_TEXT" id="OPT_TDJJJY_TEXT" type="checkbox" onclick="editOpt('OPT_TDJJJY');"  ${pd.OPT_TDJJJY=='1'?'checked':''}/>
																<input type="hidden" name="OPT_TDJJJY" id="OPT_TDJJJY">
															</td>
															<td><input type="text" name="OPT_TDJJJY_TEMP" id="OPT_TDJJJY_TEMP" class="form-control"></td>
														  </tr> --%>
                                                        <tr>
                                                            <td>1</td>
                                                            <td>轿厢到站钟</td>
                                                            <td>
                                                                <input name="OPT_JXDZZ_TEXT" id="OPT_JXDZZ_TEXT"
                                                                       type="checkbox"
                                                                       onclick="editOpt('OPT_JXDZZ');"  ${pd.OPT_JXDZZ=='1'?'checked':''}/>
                                                                <input type="hidden" name="OPT_JXDZZ" id="OPT_JXDZZ">
                                                            </td>
                                                            <td><input type="text" name="OPT_JXDZZ_TEMP"
                                                                       id="OPT_JXDZZ_TEMP" class="form-control"
                                                                       readonly="readonly"></td>
                                                        </tr>
                                                        <tr>
                                                            <td>2</td>
                                                            <td>有司机操作</td>
                                                            <td>
                                                                <input name="OPT_SJCZ_TEXT" id="OPT_SJCZ_TEXT"
                                                                       type="checkbox"
                                                                       onclick="editOpt('OPT_SJCZ');"  ${pd.OPT_SJCZ=='1'?'checked':''}/>
                                                                <input type="hidden" name="OPT_SJCZ" id="OPT_SJCZ">
                                                            </td>
                                                            <td><input type="text" name="OPT_SJCZ_TEMP"
                                                                       id="OPT_SJCZ_TEMP" class="form-control"
                                                                       readonly="readonly"></td>
                                                        </tr>
                                                        <tr>
                                                            <td>3</td>
                                                            <td>CCTV电缆(轿厢到机房)</td>
                                                            <td>
                                                                <input name="OPT_CCTVDL_TEXT" id="OPT_CCTVDL_TEXT"
                                                                       type="checkbox"
                                                                       onclick="editOpt('OPT_CCTVDL');addToRemark(this,'CCTV电缆(轿厢到机房)','checkbox');"  ${pd.OPT_CCTVDL=='1'?'checked':''}/>
                                                                <input type="hidden" name="OPT_CCTVDL" id="OPT_CCTVDL">
                                                            </td>
                                                            <td><input type="text" name="OPT_CCTVDL_TEMP"
                                                                       id="OPT_CCTVDL_TEMP" class="form-control"
                                                                       readonly="readonly"></td>
                                                        </tr>
                                                        <tr>
                                                            <td>4</td>
                                                            <td>电机过热保护</td>
                                                            <td>
                                                                <input name="OPT_DJGRBH_TEXT" id="OPT_DJGRBH_TEXT"
                                                                       type="checkbox"
                                                                       onclick="editOpt('OPT_DJGRBH');"  ${pd.OPT_DJGRBH=='1'?'checked':''}/>
                                                                <input type="hidden" name="OPT_DJGRBH" id="OPT_DJGRBH">
                                                            </td>
                                                            <td><input type="text" name="OPT_DJGRBH_TEMP"
                                                                       id="OPT_DJGRBH_TEMP" class="form-control"
                                                                       readonly="readonly"></td>
                                                        </tr>
                                                        <tr>
                                                            <td>5</td>
                                                            <td>BA接口</td>
                                                            <td>
                                                                <input name="OPT_BAJK_TEXT" id="OPT_BAJK_TEXT"
                                                                       type="checkbox"
                                                                       onclick="editOpt('OPT_BAJK');"  ${pd.OPT_BAJK=='1'?'checked':''}/>
                                                                <input type="hidden" name="OPT_BAJK" id="OPT_BAJK">
                                                            </td>
                                                            <td><input type="text" name="OPT_BAJK_TEMP"
                                                                       id="OPT_BAJK_TEMP" class="form-control"
                                                                       readonly="readonly"></td>
                                                        </tr>
                                                        <tr>
                                                            <td>6</td>
                                                            <td>门保持按钮</td>
                                                            <td>
                                                                <input name="OPT_KMBC_TEXT" id="OPT_MBCAN_TEXT"
                                                                       type="checkbox"
                                                                       onclick="editOpt('OPT_MBCAN');" ${pd.OPT_MBCAN=='1'?'checked':''} />
                                                                <input type="hidden" name="OPT_MBCAN" id="OPT_MBCAN">
                                                            </td>
                                                            <td><input type="text" name="OPT_MBCAN_TEMP"
                                                                       id="OPT_MBCAN_TEMP" class="form-control"
                                                                       readonly="readonly"></td>
                                                        </tr>
                                                        <tr>
                                                            <td>7</td>
                                                            <td>开门再平层(1.0-1.75m/s)</td>
                                                            <td>
                                                                <input name="OPT_KMZPC_TEXT" id="OPT_KMZPC_TEXT"
                                                                       type="checkbox"
                                                                       onclick="editOpt('OPT_KMZPC');" ${pd.OPT_KMZPC=='1'?'checked':''} />
                                                                <input type="hidden" name="OPT_KMZPC" id="OPT_KMZPC">
                                                            </td>
                                                            <td><input type="text" name="OPT_KMZPC_TEMP"
                                                                       id="OPT_KMZPC_TEMP" class="form-control"
                                                                       readonly="readonly"></td>
                                                        </tr>
                                                        <tr>
                                                            <td>8</td>
                                                            <td>强迫关门</td>
                                                            <td>
                                                                <input name="OPT_QPGM_TEXT" id="OPT_QPGM_TEXT"
                                                                       type="checkbox"
                                                                       onclick="editOpt('OPT_QPGM');"  ${pd.OPT_QPGM=='1'?'checked':''}/>
                                                                <input type="hidden" name="OPT_QPGM" id="OPT_QPGM">
                                                            </td>
                                                            <td><input type="text" name="OPT_QPGM_TEMP"
                                                                       id="OPT_QPGM_TEMP" class="form-control"
                                                                       readonly="readonly"></td>
                                                        </tr>
                                                        <%-- <tr>
															<td>11</td>
															<td>远程监控(物联网系统)</td>
															<td>
																<input name="OPT_YCJK_TEXT" id="OPT_YCJK_TEXT" type="checkbox" onclick="editOpt('OPT_YCJK');"  ${pd.OPT_YCJK=='1'?'checked':''}/>
																<input type="hidden" name="OPT_YCJK" id="OPT_YCJK">
															</td>
															<td><input type="text" name="OPT_YCJK_TEMP" id="OPT_YCJK_TEMP" class="form-control"></td>
														  </tr> --%>
                                                        <tr>
                                                            <td>9</td>
                                                            <td>500mm&lt;机房高台&lt;=2000mm</td>
                                                            <td>
                                                                <input name="OPT_JFGT_TEXT" id="OPT_JFGT_TEXT"
                                                                       type="checkbox"
                                                                       onclick="editOpt('OPT_JFGT');"  ${pd.OPT_JFGT=='1'?'checked':''}/>
                                                                <input type="hidden" name="OPT_JFGT" id="OPT_JFGT">
                                                            </td>
                                                            <td><input type="text" name="OPT_JFGT_TEMP"
                                                                       id="OPT_JFGT_TEMP" class="form-control"
                                                                       readonly="readonly"></td>
                                                        </tr>
                                                        <tr>
                                                            <td>10</td>
                                                            <td>IC卡(轿内控制)</td>
                                                            <td>
                                                                <select name="OPT_ICK" id="OPT_ICK"
                                                                        onchange="editOpt('OPT_ICK');addToRemark(this,'IC卡(轿内控制)', 'text');"
                                                                        class="form-control">
                                                                    <option value="">请选择</option>
                                                                    <option value="刷卡后手动选择到达楼层" ${pd.OPT_ICK=='刷卡后手动选择到达楼层'?'selected':''}>
                                                                        刷卡后手动选择到达楼层
                                                                    </option>
                                                                    <option value="刷卡后自动选择到达楼层" ${pd.OPT_ICK=='刷卡后自动选择到达楼层'?'selected':''}>
                                                                        刷卡后自动选择到达楼层
                                                                    </option>
                                                                    <option value="非标" ${pd.OPT_ICK=='非标'?'selected':''}>
                                                                        非标
                                                                    </option>
                                                                </select>
                                                            </td>
                                                            <td><input type="text" name="OPT_ICK_TEMP" id="OPT_ICK_TEMP"
                                                                       class="form-control" readonly="readonly"></td>
                                                        </tr>
                                                        <tr>
                                                            <td>11</td>
                                                            <td>IC卡制卡设备</td>
                                                            <td>
                                                                <input name="OPT_ICKZKSB_TEXT" id="OPT_ICKZKSB_TEXT"
                                                                       type="checkbox"
                                                                       onclick="editOpt('OPT_ICKZKSB');addToRemark(this,'IC卡制卡设备','checkbox');" ${pd.OPT_ICKZKSB=='1'?'checked':''} />
                                                                <input type="hidden" name="OPT_ICKZKSB"
                                                                       id="OPT_ICKZKSB">
                                                            </td>
                                                            <td><input type="text" name="OPT_ICKZKSB_TEMP"
                                                                       id="OPT_ICKZKSB_TEMP" class="form-control"
                                                                       readonly="readonly"></td>
                                                        </tr>
                                                        <tr>
                                                            <td>12</td>
                                                            <td>IC卡卡片(张)</td>
                                                            <td>
                                                                <input name="OPT_ICKKP" id="OPT_ICKKP" type="text"
                                                                       onkeyup="editOpt('OPT_ICKKP');" onblur="addToRemark(this,'IC卡卡片(张)', 'text');"
                                                                       class="form-control" value="${pd.OPT_ICKKP}"/>
                                                            </td>
                                                            <td><input type="text" name="OPT_ICKKP_TEMP"
                                                                       id="OPT_ICKKP_TEMP" class="form-control"
                                                                       readonly="readonly"></td>
                                                        </tr>
                                                        <tr>
                                                            <td>13</td>
                                                            <td>贯通门(轿厢、轿门部分)</td>
                                                            <td>
                                                                <input name="OPT_GTMJXJMBF_TEXT" id="OPT_GTMJXJMBF_TEXT"
                                                                       type="checkbox"
                                                                       onclick="editOpt('OPT_GTMJXJMBF');"  ${pd.OPT_GTMJXJMBF=='1'?'checked':''}/>
                                                                <input type="hidden" name="OPT_GTMJXJMBF"
                                                                       id="OPT_GTMJXJMBF">
                                                            </td>
                                                            <td>
                                                                <input type="text" name="OPT_GTMJXJMBF_TEMP"
                                                                       id="OPT_GTMJXJMBF_TEMP" class="form-control"
                                                                       readonly="readonly">
                                                                <label class="intro" style="color: red;display: none;" id="GTMJX_Label">请非标询价</label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>14</td>
                                                            <td>贯通门(厅门部分)</td>
                                                            <td>
                                                                <select name="OPT_GTMTMBF" id="OPT_GTMTMBF"
                                                                        onchange="editOpt('OPT_GTMTMBF');"
                                                                        class="form-control">
                                                                    <option value=''>请选择</option>
                                                                    <option value='发纹不锈钢' ${pd.OPT_GTMTMBF=='发纹不锈钢'?'selected':''}>
                                                                        发纹不锈钢
                                                                    </option>
                                                                    <option value='喷涂' ${pd.OPT_GTMTMBF=='喷涂'?'selected':''}>
                                                                        喷涂
                                                                    </option>
                                                                    <option value="非标" ${pd.OPT_GTMTMBF=='非标'?'selected':''}>
                                                                        非标
                                                                    </option>
                                                                </select>
                                                            </td>
                                                            <td><input type="text" name="OPT_GTMTMBF_TEMP"
                                                                       id="OPT_GTMTMBF_TEMP" class="form-control"
                                                                       readonly="readonly">
                                                                 <label class="intro" style="color: red;display: none;" id="GTMTM_Label">请非标询价</label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>15</td>
                                                            <td>贯通门数</td>
                                                            <td>
                                                                <input type="text" name="OPT_GTMS" id="OPT_GTMS"
                                                                       readonly="readonly" class="form-control"
                                                                       value="${pd.OPT_GTMS}">
                                                            </td>
                                                            <td>
                                                                <input type="text" name="OPT_GTMS_TEMP"
                                                                       id="OPT_GTMS_TEMP" class="form-control"
                                                                       readonly="readonly">
                                                                 <label class="intro" style="color: red;display: none;" id="GTMMS_Label">请非标询价</label>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <!-- 可选功能 -->
                                                </div>
                                                <div id="tab-4" class="tab-pane">
                                                    <!-- 单组监控室对讲系统 -->
                                                    <table class="table table-striped table-bordered table-hover"
                                                           border="1" cellspacing="0">
                                                        <tr>
                                                            <td width="197">对讲通讯方式</td>
                                                            <td width="326">
                                                                <input name="DZJKSDJXT_DJTXFS" type="radio"
                                                                       onclick="Djtxfs_XZ();"
                                                                       value="分线制" ${pd.DZJKSDJXT_DJTXFS=='分线制'?'checked':''}/>
                                                                分线制（标配）
                                                                <input name="DZJKSDJXT_DJTXFS" type="radio"
                                                                       onclick="Djtxfs_XZ();"
                                                                       value="无线制" ${pd.DZJKSDJXT_DJTXFS=='无线制'?'checked':''}/>
                                                                无线制
                                                                <input name="DZJKSDJXT_DJTXFS" type="radio"
                                                                       onclick="Djtxfs_XZ();"
                                                                       value="总线制" ${pd.DZJKSDJXT_DJTXFS=='总线制'?'checked':''}/>
                                                                总线制
                                                            </td>
                                                            <td width="326">对讲台数:
                                                                <input name="DZJKSDJXT_DJTS" id="DZJKSDJXT_DJTS"
                                                                       type="text" onkeyup="editDzjksdjxt();"
                                                                       class="form-control"
                                                                       value="${pd.DZJKSDJXT_DJTS}"/>
                                                                台
                                                            </td>
                                                        </tr>
                                                        <!-- <tr>
															<td>关联电梯合同号</td>
															<td colspan="2"><input type="text" class="form-control"/></td>
														  </tr> -->
                                                        <tr>
                                                            <td>监控室母机配置</td>
                                                            <td colspan="2">
                                                                <select name="DZJKSDJXT_JKSMJPZ" id="DZJKSDJXT_JKSMJPZ"
                                                                        class="form-control">
                                                                    <option value=""></option>
                                                                    <option value="一对一" ${pd.DZJKSDJXT_JKSMJPZ=='一对一'?'selected':''}>
                                                                        一对一
                                                                    </option>
                                                                    <option value="一对多" ${pd.DZJKSDJXT_JKSMJPZ=='一对多'?'selected':''}>
                                                                        一对多
                                                                    </option>
                                                                    <option value="非标" ${pd.DZJKSDJXT_JKSMJPZ=='非标'?'selected':''}>
                                                                        非标
                                                                    </option>
                                                                </select>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>备注</td>
                                                            <td colspan="2">
                                                                标配五方对讲:轿厢、轿顶、底坑,控制柜,监控室;选择一对多时,10台以下项目标配为分线制多局对讲;10台以上项目标配为总线制对局对讲,对局对讲系统单个监控室主机的最大控制台数为64台
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>加价</td>
                                                            <td colspan="2"><input type="text"
                                                                                   name="DZJKSDJXT_DJTS_TEMP"
                                                                                   id="DZJKSDJXT_DJTS_TEMP"
                                                                                   class="form-control"
                                                                                   readonly="readonly"/></td>
                                                        </tr>
                                                    </table>
                                                    <!-- 单组监控室对讲系统 -->
                                                </div>
                                                <div id="tab-5" class="tab-pane">
                                                    <!-- 轿厢装潢 -->
                                                    <table class="table table-striped table-bordered table-hover"
                                                           border="1" cellspacing="0">
                                                        <tr>
                                                            <td colspan="2">轿厢装潢</td>
                                                            <td>标准</td>
                                                            <td>可选&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;取消选择
                                                            	<input name="JXZH_JM" type="radio" value="" onclick="editJxzh('JXZH_JM_quxiao');"/>
                                                            </td>
                                                            <td>加价</td>
                                                        </tr>
                                                        <tr>
                                                            <td rowspan="4">轿厢</td>
                                                            <td>轿门</td>
                                                            <td colspan="2">
                                                                <select name="JXZH_JMZH" id="JXZH_JMZH"
                                                                        onclick="editJxzh('JXZH_JMZH');"
                                                                        class="form-control">
                                                                    <option value="">请选择</option>
                                                                    <option value="JF-K-C01" ${pd.JXZH_JMZH=='JF-K-C01'?'selected':''}>
                                                                        JF-K-C01
                                                                    </option>
                                                                    <option value="JF-K-C02" ${pd.JXZH_JMZH=='JF-K-C02'?'selected':''}>
                                                                        JF-K-C02
                                                                    </option>
                                                                    <option value="JF-K-C03" ${pd.JXZH_JMZH=='JF-K-C03'?'selected':''}>
                                                                        JF-K-C03
                                                                    </option>
                                                                    <option value="JF-K-C04" ${pd.JXZH_JMZH=='JF-K-C04'?'selected':''}>
                                                                        JF-K-C04
                                                                    </option>
                                                                    <option value="JF-K-C05" ${pd.JXZH_JMZH=='JF-K-C05'?'selected':''}>
                                                                        JF-K-C05
                                                                    </option>
                                                                    <option value="JF-K-C06" ${pd.JXZH_JMZH=='JF-K-C06'?'selected':''}>
                                                                        JF-K-C06
                                                                    </option>
                                                                    <option value="JF-K-C07" ${pd.JXZH_JMZH=='JF-K-C07'?'selected':''}>
                                                                        JF-K-C07
                                                                    </option>
                                                                    <option value="发纹不锈钢" ${pd.JXZH_JMZH=='发纹不锈钢'?'selected':''}>
                                                                        发纹不锈钢
                                                                    </option>
                                                                    <option value="镜面不锈钢" ${pd.JXZH_JMZH=='镜面不锈钢'?'selected':''}>
                                                                        镜面不锈钢
                                                                    </option>
                                                                    <option value="喷涂" ${pd.JXZH_JMZH=='喷涂'?'selected':''}>
                                                                        喷涂
                                                                    </option>
                                                                    <option value="非标" ${pd.JXZH_JMZH=='非标'?'selected':''}>
                                                                        非标
                                                                    </option>
                                                                </select>
                                                                色标号:
                                                                <select name="JXZH_JMSBH" id="JXZH_JMSBH"
                                                                        class="form-control">
                                                                    <option value=''>请选择</option>
                                                                    <option value="P-01" ${pd.JXZH_JMSBH=='P-01'?'selected':''}>
                                                                        P-01
                                                                    </option>
                                                                    <option value="P-02" ${pd.JXZH_JMSBH=='P-02'?'selected':''}>
                                                                        P-02
                                                                    </option>
                                                                    <option value="P-03" ${pd.JXZH_JMSBH=='P-03'?'selected':''}>
                                                                        P-03
                                                                    </option>
                                                                    <option value="P-04" ${pd.JXZH_JMSBH=='P-04'?'selected':''}>
                                                                        P-04
                                                                    </option>
                                                                    <option value="P-05" ${pd.JXZH_JMSBH=='P-05'?'selected':''}>
                                                                        P-05
                                                                    </option>
                                                                    <option value="P-06" ${pd.JXZH_JMSBH=='P-06'?'selected':''}>
                                                                        P-06
                                                                    </option>
                                                                    <option value="P-07" ${pd.JXZH_JMSBH=='P-07'?'selected':''}>
                                                                        P-07
                                                                    </option>
                                                                    <option value="非标" ${pd.JXZH_JMSBH=='非标'?'selected':''}>
                                                                        非标
                                                                    </option>
                                                                </select>
                                                                <%-- <input name="JXZH_JM" type="radio" value="SUS304发纹不锈钢" onclick="setJmsbhDisable('1');" ${pd.JXZH_JM=='SUS304发纹不锈钢'?'checked':''}/>
																发纹不锈钢 --%>
                                                            </td>
                                                                <%-- <input name="JXZH_JM" type="radio" value="镜面不锈钢" onclick="setJmsbhDisable('1');" ${pd.JXZH_JM=='镜面不锈钢'?'checked':''}/>
																镜面不锈钢
																<input name="JXZH_JM" type="radio" value="喷涂" onclick="setJmsbhDisable('0');" ${pd.JXZH_JM=='喷涂'?'checked':''}/>
																喷涂 --%>

                                                            <td><input type="text" name="JXZH_JM_TEMP" id="JXZH_JM_TEMP"
                                                                       class="form-control" readonly="readonly">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>前围壁</td>
                                                            <td colspan="2">
                                                                <input name="JXZH_QWB" id="JXZH_QWB_FW" type="radio"
                                                                       value="发纹不锈钢"
                                                                       onclick="setQwbsbhDisable('1');" ${pd.JXZH_QWB=='发纹不锈钢'?'checked':''}/>
                                                                发纹不锈钢
                                                                <input name="JXZH_QWB" id="JXZH_QWB_JM" type="radio"
                                                                       value="镜面不锈钢"
                                                                       onclick="setQwbsbhDisable('1');" ${pd.JXZH_QWB=='镜面不锈钢'?'checked':''}/>
                                                                镜面不锈钢
                                                                <input name="JXZH_QWB" id="JXZH_QWB_PT" type="radio"
                                                                       value="喷涂"
                                                                       onclick="setQwbsbhDisable('0');" ${pd.JXZH_QWB=='喷涂'?'checked':''}/>
                                                                喷涂
                                                                色标号:
                                                                <select name="JXZH_QWBSBH" id="JXZH_QWBSBH"
                                                                        class="form-control">
                                                                    <option value=''>请选择</option>
                                                                    <option value="P-01" ${pd.JXZH_QWBSBH=='P-01'?'selected':''}>
                                                                        P-01
                                                                    </option>
                                                                    <option value="P-02" ${pd.JXZH_QWBSBH=='P-02'?'selected':''}>
                                                                        P-02
                                                                    </option>
                                                                    <option value="P-03" ${pd.JXZH_QWBSBH=='P-03'?'selected':''}>
                                                                        P-03
                                                                    </option>
                                                                    <option value="P-04" ${pd.JXZH_QWBSBH=='P-04'?'selected':''}>
                                                                        P-04
                                                                    </option>
                                                                    <option value="P-05" ${pd.JXZH_QWBSBH=='P-05'?'selected':''}>
                                                                        P-05
                                                                    </option>
                                                                    <option value="P-06" ${pd.JXZH_QWBSBH=='P-06'?'selected':''}>
                                                                        P-06
                                                                    </option>
                                                                    <option value="P-07" ${pd.JXZH_QWBSBH=='P-07'?'selected':''}>
                                                                        P-07
                                                                    </option>
                                                                    <option value="非标" ${pd.JXZH_QWBSBH=='非标'?'selected':''}>
                                                                        非标
                                                                    </option>
                                                                </select>
                                                            </td>
                                                            <td rowspan="3">
                                                                <input type="text" name="JXZH_QWB_TEMP"
                                                                       id="JXZH_QWB_TEMP" class="form-control"
                                                                       readonly="readonly">
                                                                <br>
                                                                <font color="red">如果三侧配置不一致，请非标询价!</font>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>侧围壁</td>
                                                            <td colspan="2">
                                                                <input name="JXZH_CWB" id="JXZH_CWB_FW" type="radio"
                                                                       value="发纹不锈钢"
                                                                       onclick="setCwbsbhDisable('1');" ${pd.JXZH_CWB=='发纹不锈钢'?'checked':''}/>
                                                                发纹不锈钢
                                                                <input name="JXZH_CWB" id="JXZH_CWB_JM" type="radio"
                                                                       value="镜面不锈钢"
                                                                       onclick="setCwbsbhDisable('1');" ${pd.JXZH_CWB=='镜面不锈钢'?'checked':''}/>
                                                                镜面不锈钢
                                                                <input name="JXZH_CWB" id="JXZH_CWB_PT" type="radio"
                                                                       value="喷涂"
                                                                       onclick="setCwbsbhDisable('0');" ${pd.JXZH_CWB=='喷涂'?'checked':''}/>
                                                                喷涂
                                                                色标号:
                                                                <select name="JXZH_CWBSBH" id="JXZH_CWBSBH"
                                                                        class="form-control">
                                                                    <option value=''>请选择</option>
                                                                    <option value="P-01" ${pd.JXZH_CWBSBH=='P-01'?'selected':''}>
                                                                        P-01
                                                                    </option>
                                                                    <option value="P-02" ${pd.JXZH_CWBSBH=='P-02'?'selected':''}>
                                                                        P-02
                                                                    </option>
                                                                    <option value="P-03" ${pd.JXZH_CWBSBH=='P-03'?'selected':''}>
                                                                        P-03
                                                                    </option>
                                                                    <option value="P-04" ${pd.JXZH_CWBSBH=='P-04'?'selected':''}>
                                                                        P-04
                                                                    </option>
                                                                    <option value="P-05" ${pd.JXZH_CWBSBH=='P-05'?'selected':''}>
                                                                        P-05
                                                                    </option>
                                                                    <option value="P-06" ${pd.JXZH_CWBSBH=='P-06'?'selected':''}>
                                                                        P-06
                                                                    </option>
                                                                    <option value="P-07" ${pd.JXZH_CWBSBH=='P-07'?'selected':''}>
                                                                        P-07
                                                                    </option>
                                                                    <option value="非标" ${pd.JXZH_CWBSBH=='非标'?'selected':''}>
                                                                        非标
                                                                    </option>
                                                                </select>
                                                            </td>
                                                            <td>
                                                            </td>
                                                            <!-- <td><input type="text" name="JXZH_CWB_TEMP" id="JXZH_CWB_TEMP" class="form-control"></td> -->
                                                        </tr>
                                                        <tr>
                                                            <td>后围壁</td>
                                                            <td colspan="2">
                                                                <input name="JXZH_HWB" id="JXZH_HWB_FW" type="radio"
                                                                       value="发纹不锈钢"
                                                                       onclick="setHwbsbhDisable('1');" ${pd.JXZH_HWB=='发纹不锈钢'?'checked':''}/>
                                                                发纹不锈钢
                                                                <input name="JXZH_HWB" id="JXZH_HWB_JM" type="radio"
                                                                       value="镜面不锈钢"
                                                                       onclick="setHwbsbhDisable('1');" ${pd.JXZH_HWB=='镜面不锈钢'?'checked':''}/>
                                                                镜面不锈钢
                                                                <input name="JXZH_HWB" id="JXZH_HWB_PT" type="radio"
                                                                       value="喷涂"
                                                                       onclick="setHwbsbhDisable('0');" ${pd.JXZH_HWB=='喷涂'?'checked':''}/>
                                                                喷涂
                                                                色标号:
                                                                <select name="JXZH_HWBSBH" id="JXZH_HWBSBH"
                                                                        class="form-control">
                                                                    <option value=''>请选择</option>
                                                                    <option value="P-01" ${pd.JXZH_HWBSBH=='P-01'?'selected':''}>
                                                                        P-01
                                                                    </option>
                                                                    <option value="P-02" ${pd.JXZH_HWBSBH=='P-02'?'selected':''}>
                                                                        P-02
                                                                    </option>
                                                                    <option value="P-03" ${pd.JXZH_HWBSBH=='P-03'?'selected':''}>
                                                                        P-03
                                                                    </option>
                                                                    <option value="P-04" ${pd.JXZH_HWBSBH=='P-04'?'selected':''}>
                                                                        P-04
                                                                    </option>
                                                                    <option value="P-05" ${pd.JXZH_HWBSBH=='P-05'?'selected':''}>
                                                                        P-05
                                                                    </option>
                                                                    <option value="P-06" ${pd.JXZH_HWBSBH=='P-06'?'selected':''}>
                                                                        P-06
                                                                    </option>
                                                                    <option value="P-07" ${pd.JXZH_HWBSBH=='P-07'?'selected':''}>
                                                                        P-07
                                                                    </option>
                                                                    <option value="非标" ${pd.JXZH_HWBSBH=='非标'?'selected':''}>
                                                                        非标
                                                                    </option>
                                                                </select>
                                                            </td>
                                                            <td>
                                                            </td>
                                                            <!-- <td><input type="text" name="JXZH_HWB_TEMP" id="JXZH_HWB_TEMP" class="form-control"></td> -->
                                                        </tr>
                                                        <!-- <tr>
															<td colspan="2">轿门装潢</td>
															<td colspan="2">

															</td>
															<td><input type="text" name="JXZH_JMZH_TEMP" id="JXZH_JMZH_TEMP" class="form-control"></td>
														  </tr> -->
                                                        <tr>
                                                            <td colspan="2">轿厢装潢</td>
                                                            <td colspan="2">
                                                                <select name="JXZH_JXZH" id="JXZH_JXZH"
                                                                        onclick="editJxzh('JXZH_JXZH');"
                                                                        class="form-control">
                                                                    <option value="">请选择</option>
                                                                    <option value="发纹不锈钢" ${pd.JXZH_JXZH=='发纹不锈钢'?'selected':''}>
                                                                        发纹不锈钢
                                                                    </option>
                                                                    <option value="JF-K-JX-01" ${pd.JXZH_JXZH=='JF-K-JX-01'?'selected':''}>
                                                                        JF-K-JX-01
                                                                    </option>
                                                                    <option value="JF-K-JX-02" ${pd.JXZH_JXZH=='JF-K-JX-02'?'selected':''}>
                                                                        JF-K-JX-02
                                                                    </option>
                                                                    <option value="JF-K-JX-03" ${pd.JXZH_JXZH=='JF-K-JX-03'?'selected':''}>
                                                                        JF-K-JX-03
                                                                    </option>
                                                                    <option value="JF-K-JX-04" ${pd.JXZH_JXZH=='JF-K-JX-04'?'selected':''}>
                                                                        JF-K-JX-04
                                                                    </option>
                                                                    <option value="JF-K-JX-05" ${pd.JXZH_JXZH=='JF-K-JX-05'?'selected':''}>
                                                                        JF-K-JX-05
                                                                    </option>
                                                                    <option value="JF-K-JX-06" ${pd.JXZH_JXZH=='JF-K-JX-06'?'selected':''}>
                                                                        JF-K-JX-06
                                                                    </option>
                                                                    <option value="JF-K-JX-07" ${pd.JXZH_JXZH=='JF-K-JX-07'?'selected':''}>
                                                                        JF-K-JX-07
                                                                    </option>
                                                                    <option value="JF-K-JX-08" ${pd.JXZH_JXZH=='JF-K-JX-08'?'selected':''}>
                                                                        JF-K-JX-08
                                                                    </option>
                                                                    <option value="JF-K-JX-09" ${pd.JXZH_JXZH=='JF-K-JX-09'?'selected':''}>
                                                                        JF-K-JX-09
                                                                    </option>
                                                                    <option value="JF-K-JX-10" ${pd.JXZH_JXZH=='JF-K-JX-10'?'selected':''}>
                                                                        JF-K-JX-10
                                                                    </option>
                                                                    <option value="JF-K-JX-11" ${pd.JXZH_JXZH=='JF-K-JX-11'?'selected':''}>
                                                                        JF-K-JX-11
                                                                    </option>
                                                                    <option value="非标" ${pd.JXZH_JXZH=='非标'?'selected':''}>
                                                                        非标
                                                                    </option>
                                                                </select>
                                                            </td>
                                                            <td><input type="text" name="JXZH_JXZH_TEMP"
                                                                       id="JXZH_JXZH_TEMP" class="form-control"
                                                                       readonly="readonly"></td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2">轿顶装潢</td>
                                                            <td colspan="2">
                                                                <input name="JXZH_JDZH" type="checkbox" value="JF-CL22"
                                                                       onclick="setJdzhDisable('0');"  ${pd.JXZH_JDZH=='JF-CL22'?'checked':''}/>
                                                                JF-CL22
                                                            </td>
                                                            <td style="display: none;">
                                                                <input name="JXZH_JDZH" type="radio" value="集成式"
                                                                       onclick="setJdzhDisable('1');"  ${pd.JXZH_JDZH=='集成式'?'checked':''}/>
                                                                集成式:
                                                                <select name="JXZH_ZSDD"
                                                                        onchange="editJxzh('JXZH_ZSDD');" id="ZSDD_1"
                                                                        class="form-control">
                                                                    <option value=''>请选择</option>
                                                                    <option value="JF-CL-01" ${pd.JXZH_ZSDD=='JF-CL-01'?'selected':''}>
                                                                        JF-CL-01
                                                                    </option>
                                                                    <option value="JF-CL-02" ${pd.JXZH_ZSDD=='JF-CL-02'?'selected':''}>
                                                                        JF-CL-02
                                                                    </option>
                                                                    <option value="JF-CL-03" ${pd.JXZH_ZSDD=='JF-CL-03'?'selected':''}>
                                                                        JF-CL-03
                                                                    </option>
                                                                    <option value="JF-CL-04" ${pd.JXZH_ZSDD=='JF-CL-04'?'selected':''}>
                                                                        JF-CL-04
                                                                    </option>
                                                                </select>
                                                                <input name="JXZH_JDZH" type="radio" value="悬吊式"
                                                                       onclick="setJdzhDisable('2');"  ${pd.JXZH_JDZH=='悬吊式'?'checked':''}/>
                                                                悬吊式:
                                                                <select name="JXZH_ZSDD"
                                                                        onchange="editJxzh('JXZH_ZSDD');" id="ZSDD_2"
                                                                        class="form-control">
                                                                    <option value=''>请选择</option>
                                                                    <option value="JF-CL-21" ${pd.JXZH_ZSDD=='JF-CL-21'?'selected':''}>
                                                                        JF-CL-21
                                                                    </option>
                                                                </select>
                                                            </td>
                                                            <td><input type="text" name="JXZH_ZSDD_TEMP"
                                                                       id="JXZH_ZSDD_TEMP" class="form-control"
                                                                       readonly="readonly"></td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2">安全窗</td>
                                                            <td colspan="2">
                                                                <input name="JXZH_AQC" type="radio" value="无"
                                                                       onclick="editJxzh('JXZH_AQC');"  ${pd.JXZH_AQC=='无'?'checked':''}/>
                                                                无
                                                                <input name="JXZH_AQC" type="radio" value="有"
                                                                       onclick="editJxzh('JXZH_AQC');" ${pd.JXZH_AQC=='有'?'checked':''}/>
                                                                有
                                                            </td>
                                                            <td><input type="text" name="JXZH_AQC_TEMP"
                                                                       id="JXZH_AQC_TEMP" class="form-control"
                                                                       readonly="readonly"></td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2">半高镜</td>
                                                            <td colspan="2">
                                                                <input name="JXZH_BGJ" type="radio" value="无"
                                                                       onclick="editJxzh('JXZH_BGJ');" ${pd.JXZH_BGJ=='无'?'checked':''}/>
                                                                无
                                                                <input name="JXZH_BGJ" type="radio" value="有"
                                                                       onclick="editJxzh('JXZH_BGJ');" ${pd.JXZH_BGJ=='有'?'checked':''}/>
                                                                有
                                                            </td>
                                                            <td><input type="text" name="JXZH_BGJ_TEMP"
                                                                       id="JXZH_BGJ_TEMP" class="form-control"
                                                                       readonly="readonly">
                                                                 <label class="intro" style="color: red;display: none;" id="JXZH_BGJ_Label">请非标询价</label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                        	<td colspan="2">后壁镜面不锈钢</td>
                                                        	<td colspan="2">
                                                                <input name="JXZH_HBJMBXG" type="radio" value="无"
                                                                       onclick="editJxzh('JXZH_HBJMBXG');" ${pd.JXZH_HBJMBXG=='无'?'checked':''}/>
                                                                无
                                                                <input name="JXZH_HBJMBXG" type="radio" value="有"
                                                                       onclick="editJxzh('JXZH_HBJMBXG');" ${pd.JXZH_HBJMBXG=='有'?'checked':''}/>
                                                                有
                                                            </td>
                                                            <td><input type="text" name="JXZH_HBJMBXG_TEMP"
                                                                       id="JXZH_HBJMBXG_TEMP" class="form-control"
                                                                       readonly="readonly">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2">地板型号</td>
                                                            <td colspan="2">
                                                                <input type="radio" name="JXZH_DBXH" value="JD-08"
                                                                       onclick="setDbxhDisable('1');" ${pd.JXZH_DBXH=='JD-08'?'checked':''}>
                                                                JD-08
                                                                <input name="JXZH_DBXH" id="JXZH_DBXH" type="radio"
                                                                       value=""
                                                                       onclick="setDbxhDisable('0');" ${pd.JXZH_DBXH=='JD-08'?'':'checked'}/>
                                                                <select name="JXZH_DBXH_SELECT" id="JXZH_DBXH_SELECT"
                                                                        onchange="setDbzxhd();" class="form-control">
                                                                    <option value="无">请选择</option>
                                                                    <option value="JD-01" ${pd.JXZH_DBXH=='JD-01'?'selected':''}>
                                                                        JD-01
                                                                    </option>
                                                                    <option value="JD-02" ${pd.JXZH_DBXH=='JD-02'?'selected':''}>
                                                                        JD-02
                                                                    </option>
                                                                    <option value="JD-03" ${pd.JXZH_DBXH=='JD-03'?'selected':''}>
                                                                        JD-03
                                                                    </option>
                                                                    <option value="JD-04" ${pd.JXZH_DBXH=='JD-04'?'selected':''}>
                                                                        JD-04
                                                                    </option>
                                                                    <option value="JD-05" ${pd.JXZH_DBXH=='JD-05'?'selected':''}>
                                                                        JD-05
                                                                    </option>
                                                                    <option value="非标" ${pd.JXZH_DBXH=='非标'?'selected':''}>
                                                                        非标
                                                                    </option>
                                                                </select>
                                                                <input name="JXZH_DBXH" type="radio" value="大理石预留"
                                                                       onclick="setDbxhDisable('1');" ${pd.JXZH_DBXH=='大理石预留'?'checked':''}/>
                                                                大理石预留
                                                            </td>
                                                            <td><input type="text" name="JXZH_DBXH_TEMP"
                                                                       id="JXZH_DBXH_TEMP" class="form-control"
                                                                       readonly="readonly"></td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2">地板装修厚度mm</td>
                                                            <td colspan="2"><input type="text" name="JXZH_DBZXHD" id="JXZH_DBZXHD"
                                                                       class="form-control" value="${pd.JXZH_DBZXHD}">
                                                            </td>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2" rowspan="2">预留装潢重量kg</td>
                                                            <td colspan="2">
                                                                <input name="JXZH_YLZHZL" id="JXZH_YLZHZL" type="text"
                                                                       onkeyup="editJxzh('JXZH_YLZHZL');"
                                                                       class="form-control" value="${pd.JXZH_YLZHZL}"/>
                                                            </td>
                                                            <td><input type="text" name="JXZH_YLZHZL_TEMP"
                                                                       id="JXZH_YLZHZL_TEMP" class="form-control"
                                                                       readonly="readonly"></td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2">
                                                                备注:当客户自主装修或选择大理石预留时必须填写预留装潢重量,当载重为450-1000/1150-1600/2000kg时,最大允许装潢重量分别为200/300/400kg,如装潢重量超出最大允许装潢重量时,需非标处理.
                                                            </td>
                                                            <td><label class="intro" style="color: red;display: none;" id="JXZH_YLDB_Label">请非标询价</label></td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2">扶手型号</td>
                                                            <td colspan="2">
                                                                <input name="JXZH_FSXH" type="radio" value="无"
                                                                       onclick="setFsxhDisable('1');" ${pd.JXZH_FSXH=='无'?'checked':''}/>
                                                                无
                                                                <input name="JXZH_FSXH" type="radio" value=""
                                                                       onclick="setFsxhDisable('0');" ${pd.JXZH_FSXH=='无'?'':'checked'}/>
                                                                <select name="JXZH_FSXH_SELECT" id="JXZH_FSXH_SELECT"
                                                                        onchange="editJxzh('JXZH_FSXH');"
                                                                        class="form-control">
                                                                    <option value="无">请选择</option>
                                                                    <option value="JF-FS-01" ${pd.JXZH_FSXH=='JF-FS-01'?'selected':''}>
                                                                        JF-FS-01
                                                                    </option>
                                                                    <option value="JF-FS-02" ${pd.JXZH_FSXH=='JF-FS-02'?'selected':''}>
                                                                        JF-FS-02
                                                                    </option>
                                                                    <option value="JF-FS-03" ${pd.JXZH_FSXH=='JF-FS-03'?'selected':''}>
                                                                        JF-FS-03
                                                                    </option>
                                                                    <option value="JF-FS-04" ${pd.JXZH_FSXH=='JF-FS-04'?'selected':''}>
                                                                        JF-FS-04
                                                                    </option>
                                                                    <option value="JF-FS-05" ${pd.JXZH_FSXH=='JF-FS-05'?'selected':''}>
                                                                        JF-FS-05
                                                                    </option>
                                                                    <option value="非标" ${pd.JXZH_FSXH=='非标'?'selected':''}>
                                                                        非标
                                                                    </option>
                                                                </select>
                                                            </td>
                                                            <td><input type="hidden" name="JXZH_FSXH_TEMP"
                                                                       id="JXZH_FSXH_TEMP" class="form-control"
                                                                       readonly="readonly"></td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2">扶手安装位置 轿厢外向内看</td>
                                                            <td colspan="2">
                                                                <input name="JXZH_FSAZWZ" id="JXZH_FSAZWZ_HWB"
                                                                       type="checkbox" value="后围壁"
                                                                       onclick="editJxzh('JXZH_FSAZWZ');" ${pd.JXZH_FSAZWZ_H=='1'?'checked':''}/>
                                                                后围壁
                                                                <input name="JXZH_FSAZWZ" id="JXZH_FSAZWZ_ZWB"
                                                                       type="checkbox" value="左围壁"
                                                                       onclick="editJxzh('JXZH_FSAZWZ');" ${pd.JXZH_FSAZWZ_Z=='1'?'checked':''}/>
                                                                左围壁
                                                                <input name="JXZH_FSAZWZ" id="JXZH_FSAZWZ_YWB"
                                                                       type="checkbox" value="右围壁"
                                                                       onclick="editJxzh('JXZH_FSAZWZ');" ${pd.JXZH_FSAZWZ_Y=='1'?'checked':''}/>
                                                                右围壁
                                                                <input type="hidden" name="JXZH_FSAZWZ_H"
                                                                       id="JXZH_FSAZWZ_H">
                                                                <input type="hidden" name="JXZH_FSAZWZ_Z"
                                                                       id="JXZH_FSAZWZ_Z">
                                                                <input type="hidden" name="JXZH_FSAZWZ_Y"
                                                                       id="JXZH_FSAZWZ_Y">
                                                            </td>
                                                            <td><input type="text" name="JXZH_FSAZWZ_TEMP"
                                                                       id="JXZH_FSAZWZ_TEMP" class="form-control"
                                                                       readonly="readonly"></td>
                                                        </tr>
                                                        <%-- <tr>
															<td colspan="2">扶手安装位置</td>
															<td colspan="2">
																<input name="JXZH_FSAZWZ" type="checkbox" value="后围壁" onclick="editJxzh('JXZH_FSAZWZ');" ${pd.JXZH_FSAZWZ=='后围壁'?'checked':''}/>
																后围壁
																<input name="JXZH_FSAZWZ" type="checkbox" value="左围壁" onclick="editJxzh('JXZH_FSAZWZ');" ${pd.JXZH_FSAZWZ=='左围壁'?'checked':''}/>
																左围壁
																<input name="JXZH_FSAZWZ" type="checkbox" value="右围壁" onclick="editJxzh('JXZH_FSAZWZ');" ${pd.JXZH_FSAZWZ=='右围壁'?'checked':''}/>
																右围壁
															</td>
															<td><input type="text" name="JXZH_FSAZWZ_TEMP" id="JXZH_FSAZWZ_TEMP" class="form-control"></td>
														  </tr> --%>
                                                    </table>
                                                    <!-- 轿厢装潢 -->
                                                </div>
                                                <div id="tab-6" class="tab-pane">
                                                    <!-- 厅门门套 -->
                                                    <table class="table table-striped table-bordered table-hover"
                                                           border="1" cellspacing="0">
                                                        <tr>
                                                            <td>首层门框</td>
                                                            <td colspan="2">
                                                                <select name='TMMT_SCMK' id="TMMT_SCMK"
                                                                        onchange="editTmmt('TMMT_SCMK');"
                                                                        class="form-control">
                                                                    <option value="">请选择</option>
                                                                    <option value="小门框" ${pd.TMMT_SCMK=='小门框' || pd.view== 'save'?'selected':''}>
                                                                        小门框
                                                                    </option>
                                                                    <option value="大门框" ${pd.TMMT_SCMK=='大门框'?'selected':''}>
                                                                        大门框
                                                                    </option>
                                                                    <option value="非标" ${pd.TMMT_SCMK=='非标'?'selected':''}>
                                                                        非标
                                                                    </option>
                                                                </select>
                                                            </td>
                                                            <td><input type="text" name="TMMT_SCMK_TEMP"
                                                                       id="TMMT_SCMK_TEMP" class="form-control"
                                                                       readonly="readonly"></td>
                                                        </tr>
                                                         <tr>
                                                            <td>首层门框套数</td>
                                                            <td colspan="2">
                                                                <input type="text" name="TMMT_SCMKTS" id="TMMT_SCMKTS" 
                                                                	value="${pd.TMMT_SCMKTS}" class="form-control" 
                                                                	onkeyup="editTmmt('TMMT_SCMKCZ');">
                                                            </td>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td>首层门框材质</td>
                                                            <td colspan="2">
                                                                <select id="TMMT_SCMKCZ" name="TMMT_SCMKCZ"
                                                                        onchange="editTmmt('TMMT_SCMKCZ');"
                                                                        class="form-control">
                                                                    <option value="">请选择</option>
                                                                    <option value="发纹不锈钢" ${pd.TMMT_SCMKCZ=='发纹不锈钢' || pd.view== 'save'?'selected':''}>
                                                                        发纹不锈钢
                                                                    </option>
                                                                    <option value="钢板喷涂" ${pd.TMMT_SCMKCZ=='钢板喷涂'?'selected':''}>
                                                                        钢板喷涂
                                                                    </option>
                                                                    <option value="镜面不锈钢" ${pd.TMMT_SCMKCZ=='镜面不锈钢'?'selected':''}>
                                                                        镜面不锈钢
                                                                    </option>
                                                                    <option value="非标" ${pd.TMMT_SCMKCZ=='非标'?'selected':''}>
                                                                        非标
                                                                    </option>
                                                                </select>
                                                            <td>
                                                                <input type="text" name="TMMT_SCMKCZ_TEMP"
                                                                       id="TMMT_SCMKCZ_TEMP" class="form-control"
                                                                       readonly="readonly">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>首层门框钢板色标号</td>
                                                            <td colspan="2">
                                                                <select id="TMMT_SCMKGBSBH" name="TMMT_SCMKGBSBH"
                                                                        onchange="editTmmt('TMMT_SCMKGBSBH');"
                                                                        class="form-control">
                                                                    <option value="">请选择</option>
                                                                    <option value="P-01" ${pd.TMMT_SCMKGBSBH=='P-01'?'selected':''}>
                                                                        P-01
                                                                    </option>
                                                                    <option value="P-02" ${pd.TMMT_SCMKGBSBH=='P-02'?'selected':''}>
                                                                        P-02
                                                                    </option>
                                                                    <option value="P-03" ${pd.TMMT_SCMKGBSBH=='P-03'?'selected':''}>
                                                                        P-03
                                                                    </option>
                                                                    <option value="P-04" ${pd.TMMT_SCMKGBSBH=='P-04'?'selected':''}>
                                                                        P-04
                                                                    </option>
                                                                    <option value="P-05" ${pd.TMMT_SCMKGBSBH=='P-05'?'selected':''}>
                                                                        P-05
                                                                    </option>
                                                                    <option value="P-06" ${pd.TMMT_SCMKGBSBH=='P-06'?'selected':''}>
                                                                        P-06
                                                                    </option>
                                                                    <option value="P-07" ${pd.TMMT_SCMKGBSBH=='P-07'?'selected':''}>
                                                                        P-07
                                                                    </option>
                                                                    <option value="非标" ${pd.TMMT_SCMKGBSBH=='非标'?'selected':''}>
                                                                        非标
                                                                    </option>
                                                                </select>
                                                            <td><input type="text" name="TMMT_SCMKGBSBH_TEMP"
                                                                       id="TMMT_SCMKGBSBH_TEMP" class="form-control"
                                                                       readonly="readonly"></td>
                                                        </tr>
                                                        
                                                        <tr>
                                                            <td>其余层门框</td>
                                                            <td colspan="2">
                                                                <select name='TMMT_QYCMK' id="TMMT_QYCMK"
                                                                        onchange="editTmmt('TMMT_QYCMK');"
                                                                        class="form-control">
                                                                    <option value="">请选择</option>
                                                                    <option value="小门框" ${pd.TMMT_QYCMK=='小门框' || pd.view== 'save'?'selected':''}>
                                                                        小门框
                                                                    </option>
                                                                    <option value="大门框" ${pd.TMMT_QYCMK=='大门框'?'selected':''}>
                                                                        大门框
                                                                    </option>
                                                                    <option value="非标" ${pd.TMMT_QYCMK=='非标'?'selected':''}>
                                                                        非标
                                                                    </option>
                                                                </select>
                                                            </td>
                                                            <td><input type="text" name="TMMT_QYCMK_TEMP"
                                                                       id="TMMT_QYCMK_TEMP" class="form-control"
                                                                       readonly="readonly"></td>
                                                        </tr>
                                                        <tr>
                                                            <td>其余层门框材质</td>
                                                            <td colspan="2">
                                                                <select id="TMMT_QYCMKCZ" name="TMMT_QYCMKCZ"
                                                                        onchange="editTmmt('TMMT_QYCMKCZ');"
                                                                        class="form-control">
                                                                    <option value="">请选择</option>
                                                                    <option value="发纹不锈钢" ${pd.TMMT_QYCMKCZ=='发纹不锈钢'?'selected':''}>
                                                                        发纹不锈钢
                                                                    </option>
                                                                    <option value="钢板喷涂" ${pd.TMMT_QYCMKCZ=='钢板喷涂' || pd.view== 'save'?'selected':''}>
                                                                        钢板喷涂
                                                                    </option>
                                                                    <option value="镜面不锈钢" ${pd.TMMT_QYCMKCZ=='镜面不锈钢'?'selected':''}>
                                                                        镜面不锈钢
                                                                    </option>
                                                                    <option value="非标" ${pd.TMMT_QYCMKCZ=='非标'?'selected':''}>
                                                                        非标
                                                                    </option>
                                                                </select>
                                                            <td><input type="text" name="TMMT_QYCMKCZ_TEMP"
                                                                       id="TMMT_QYCMKCZ_TEMP" class="form-control"
                                                                       readonly="readonly"></td>
                                                        </tr>
                                                        <tr>
                                                            <td>其余层门框套数</td>
                                                            <td colspan="2">
                                                                <input type="text" name="TMMT_QYCTS" id="TMMT_QYCTS" value="${pd.TMMT_QYCTS}"
                                                                	onkeyup="editTmmt('TMMT_QYCMKCZ');" class="form-control">
                                                            </td>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td>其余层门框钢板色标号</td>
                                                            <td colspan="2">
                                                                <select id="TMMT_QYCMKGBSBH" name="TMMT_QYCMKGBSBH"
                                                                        onchange="editTmmt('TMMT_QYCMKGBSBH');"
                                                                        class="form-control">
                                                                    <option value="">请选择</option>
                                                                    <option value="P-01" ${pd.TMMT_QYCMKGBSBH=='P-01'?'selected':''}>
                                                                        P-01
                                                                    </option>
                                                                    <option value="P-02" ${pd.TMMT_QYCMKGBSBH=='P-02'?'selected':''}>
                                                                        P-02
                                                                    </option>
                                                                    <option value="P-03" ${pd.TMMT_QYCMKGBSBH=='P-03'?'selected':''}>
                                                                        P-03
                                                                    </option>
                                                                    <option value="P-04" ${pd.TMMT_QYCMKGBSBH=='P-04'?'selected':''}>
                                                                        P-04
                                                                    </option>
                                                                    <option value="P-05" ${pd.TMMT_QYCMKGBSBH=='P-05'?'selected':''}>
                                                                        P-05
                                                                    </option>
                                                                    <option value="P-06" ${pd.TMMT_QYCMKGBSBH=='P-06'?'selected':''}>
                                                                        P-06
                                                                    </option>
                                                                    <option value="P-07" ${pd.TMMT_QYCMKGBSBH=='P-07'?'selected':''}>
                                                                        P-07
                                                                    </option>
                                                                    <option value="非标" ${pd.TMMT_QYCMKGBSBH=='非标'?'selected':''}>
                                                                        非标
                                                                    </option>
                                                                </select>
                                                            <td><input type="text" name="TMMT_QYCMKGBSBH_TEMP"
                                                                       id="TMMT_QYCMKGBSBH_TEMP" class="form-control"
                                                                       readonly="readonly"></td>
                                                        </tr>

                                                        <tr>
                                                            <td>首层厅门材质</td>
                                                            <td colspan="2">
                                                                <select id="TMMT_SCTMCZ" name="TMMT_SCTMCZ"
                                                                        onchange="editTmmt('TMMT_SCTMCZ');"
                                                                        class="form-control">
                                                                    <option value="">请选择</option>
                                                                    <option value="发纹不锈钢" ${pd.TMMT_SCTMCZ=='发纹不锈钢'?'selected':''}>
                                                                        发纹不锈钢
                                                                    </option>
                                                                    <option value="钢板喷涂" ${pd.TMMT_SCTMCZ=='钢板喷涂'?'selected':''}>
                                                                        钢板喷涂
                                                                    </option>
                                                                    <option value="镜面不锈钢" ${pd.TMMT_SCTMCZ=='镜面不锈钢'?'selected':''}>
                                                                        镜面不锈钢
                                                                    </option>
                                                                    <option value="非标" ${pd.TMMT_SCTMCZ=='非标'?'selected':''}>
                                                                        非标
                                                                    </option>
                                                                </select>
                                                            <td><input type="text" name="TMMT_SCTMCZ_TEMP"
                                                                       id="TMMT_SCTMCZ_TEMP" class="form-control"
                                                                       readonly="readonly"></td>
                                                        </tr>
                                                        <tr>
                                                            <td>首层厅门套数</td>
                                                            <td colspan="2">
                                                                <input type="text" name="TMMT_SCTMTS" id="TMMT_SCTMTS" value="${pd.TMMT_SCTMTS}"
                                                                 onkeyup="editTmmt('TMMT_SCTMCZ');" class="form-control">
                                                            </td>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td>首层厅门钢板色标号</td>
                                                            <td colspan="2">
                                                                <select id="TMMT_SCTMGBSBH" name="TMMT_SCTMGBSBH"
                                                                        onchange="editTmmt('TMMT_SCTMGBSBH');"
                                                                        class="form-control">
                                                                    <option value="">请选择</option>
                                                                    <option value="P-01" ${pd.TMMT_SCTMGBSBH=='P-01'?'selected':''}>
                                                                        P-01
                                                                    </option>
                                                                    <option value="P-02" ${pd.TMMT_SCTMGBSBH=='P-02'?'selected':''}>
                                                                        P-02
                                                                    </option>
                                                                    <option value="P-03" ${pd.TMMT_SCTMGBSBH=='P-03'?'selected':''}>
                                                                        P-03
                                                                    </option>
                                                                    <option value="P-04" ${pd.TMMT_SCTMGBSBH=='P-04'?'selected':''}>
                                                                        P-04
                                                                    </option>
                                                                    <option value="P-05" ${pd.TMMT_SCTMGBSBH=='P-05'?'selected':''}>
                                                                        P-05
                                                                    </option>
                                                                    <option value="P-06" ${pd.TMMT_SCTMGBSBH=='P-06'?'selected':''}>
                                                                        P-06
                                                                    </option>
                                                                    <option value="P-07" ${pd.TMMT_SCTMGBSBH=='P-07'?'selected':''}>
                                                                        P-07
                                                                    </option>
                                                                    <option value="非标" ${pd.TMMT_SCTMGBSBH=='非标'?'selected':''}>
                                                                        非标
                                                                    </option>
                                                                </select>
                                                            <td><input type="text" name="TMMT_SCTMGBSBH_TEMP"
                                                                       id="TMMT_SCTMGBSBH_TEMP" class="form-control"
                                                                       readonly="readonly"></td>
                                                        </tr>
                                                        <tr>
                                                            <td>其余层厅门材质</td>
                                                            <td colspan="2">
                                                                <select id="TMMT_QYCTMCZ" name="TMMT_QYCTMCZ"
                                                                        onchange="editTmmt('TMMT_QYCTMCZ');"
                                                                        class="form-control">
                                                                    <option value="">请选择</option>
                                                                    <option value="发纹不锈钢" ${pd.TMMT_QYCTMCZ=='发纹不锈钢'?'selected':''}>
                                                                        发纹不锈钢
                                                                    </option>
                                                                    <option value="钢板喷涂" ${pd.TMMT_QYCTMCZ=='钢板喷涂'?'selected':''}>
                                                                        钢板喷涂
                                                                    </option>
                                                                    <option value="非标" ${pd.TMMT_QYCTMCZ=='非标'?'selected':''}>
                                                                        非标
                                                                    </option>
                                                                    <%-- <option value="镜面不锈钢" ${pd.TMMT_QYCTMCZ=='镜面不锈钢'?'selected':''}>镜面不锈钢</option> --%>
                                                                </select>
                                                            <td><input type="text" name="TMMT_QYCTMCZ_TEMP"
                                                                       id="TMMT_QYCTMCZ_TEMP" class="form-control"
                                                                       readonly="readonly"></td>
                                                        </tr>
                                                        <tr>
                                                            <td>其余层厅门套数</td>
                                                            <td colspan="2">
                                                                <input type="text" name="TMMT_QYCTMTS" id="TMMT_QYCTMTS" value="${pd.TMMT_QYCTMTS}"
                                                                	onkeyup="editTmmt('TMMT_QYCTMCZ');" class="form-control">
                                                            </td>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td>其余层厅门钢板色标号</td>
                                                            <td colspan="2">
                                                                <select id="TMMT_QYCTMGBSBH" name="TMMT_QYCTMGBSBH"
                                                                        onchange="editTmmt('TMMT_QYCTMGBSBH');"
                                                                        class="form-control">
                                                                    <option value="">请选择</option>
                                                                    <option value="P-01" ${pd.TMMT_QYCTMGBSBH=='P-01'?'selected':''}>
                                                                        P-01
                                                                    </option>
                                                                    <option value="P-02" ${pd.TMMT_QYCTMGBSBH=='P-02'?'selected':''}>
                                                                        P-02
                                                                    </option>
                                                                    <option value="P-03" ${pd.TMMT_QYCTMGBSBH=='P-03'?'selected':''}>
                                                                        P-03
                                                                    </option>
                                                                    <option value="P-04" ${pd.TMMT_QYCTMGBSBH=='P-04'?'selected':''}>
                                                                        P-04
                                                                    </option>
                                                                    <option value="P-05" ${pd.TMMT_QYCTMGBSBH=='P-05'?'selected':''}>
                                                                        P-05
                                                                    </option>
                                                                    <option value="P-06" ${pd.TMMT_QYCTMGBSBH=='P-06'?'selected':''}>
                                                                        P-06
                                                                    </option>
                                                                    <option value="P-07" ${pd.TMMT_QYCTMGBSBH=='P-07'?'selected':''}>
                                                                        P-07
                                                                    </option>
                                                                    <option value="非标" ${pd.TMMT_QYCTMGBSBH=='非标'?'selected':''}>
                                                                        非标
                                                                    </option>
                                                                </select>
                                                            <td><input type="text" name="TMMT_QYCTMGBSBH_TEMP"
                                                                       id="TMMT_QYCTMGBSBH_TEMP" class="form-control"
                                                                       readonly="readonly"></td>
                                                        </tr>
                                                        <tr>
                                                        	<td colspan="4" class="intro" style="color: red;display: none;" id="TMMT_Label">
                                                        		<label style="font-size: 16px;">由于开门宽度非标,厅门门套模块请非标询价</label>
                                                        	</td>
                                                        </tr>
                                                    </table>
                                                    <!-- 厅门门套 -->
                                                </div>
                                                <div id="tab-7" class="tab-pane">
                                                    <!-- 操纵盘 -->
                                                    <table class="table table-striped table-bordered table-hover"
                                                           border="1" cellspacing="0">
                                                        <%-- <tr>
															<td>操纵盘类型</td>
															<td>标准:一体式</td>
															<td>可选:嵌入式</td>
															<td>
																加价
																<input type="hidden" name="CZP_XS_TEMP" id="CZP_XS_TEMP">
																<input type="hidden" name="CZP_AN_TEMP" id="CZP_AN_TEMP">
																<input type="hidden" name="CZP_CZ_TEMP" id="CZP_CZ_TEMP">
															</td>
														  </tr>
														  <tr>
															<td>操纵盘型号</td>
															<td>
																<p>
																	<input type="radio" name="CZP_CZPXH" value="JFCOP09H-D1" onclick="setCzpxhDisable('2');" ${pd.CZP_CZPXH=='JFCOP09H-D1'?'checked':''}/>
																	JFCOP09H-D1(标配只勾选本行,下列不必选)
																</p>
																<p>
																	显示
																	<select name="CZP_XS" id="CZP_XS_1" class="form-control">
																		<option value="">请选择</option>
																		<option value="LCD(标配)" ${pd.CZP_XS=='LCD(标配)'?'selected':''}>LCD(标配)</option>
																		<option value="LED(无偿选配)" ${pd.CZP_XS=='LED(无偿选配)'?'selected':''}>LED(无偿选配)</option>
																		<option value="TFT(彩色液晶)" ${pd.CZP_XS=='TFT(彩色液晶)'?'selected':''}>TFT(彩色液晶)</option>
																	</select>
																	(选配时填写)
																	<select name="CZP_XS_SUB" id="CZP_XS_SUB" onchange="editCzp('CZP_CZPXH');" class="form-control">
																		<option value="">请选择</option>
																		<option value="真彩液晶图片显示7寸" ${pd.CZP_XS_SUB=='真彩液晶图片显示7寸'?'selected':''}>真彩液晶图片显示7寸</option>
																		<option value="真彩液晶图片显示10寸" ${pd.CZP_XS_SUB=='真彩液晶图片显示10寸'?'selected':''}>真彩液晶图片显示10寸</option>
																		<option value="真彩液晶多媒体显示10.4寸" ${pd.CZP_XS_SUB=='真彩液晶多媒体显示10.4寸'?'selected':''}>真彩液晶多媒体显示10.4寸</option>
																	</select>
																</p>
																<p>
																	按钮
																	<select name="CZP_AN" onchange="editCzp('CZP_CZPXH');" id="CZP_AN_1" class="form-control">
																		<option value="">请选择</option>
																		<option value="金属红光带字牌按钮" ${pd.CZP_AN=='金属红光带字牌按钮'?'selected':''}>金属红光带字牌按钮</option>
																		<option value="金属红光方按钮" ${pd.CZP_AN=='金属红光方按钮'?'selected':''}>金属红光方按钮</option>
																		<option value="亚克力红光白字圆按钮" ${pd.CZP_AN=='亚克力红光白字圆按钮'?'selected':''}>亚克力红光白字圆按钮</option>
																		<option value="亚克力红光白字方按钮" ${pd.CZP_AN=='亚克力红光白字方按钮'?'selected':''}>亚克力红光白字方按钮</option>
																	</select>
																	(选配时填写)
																</p>
																<p>
																	材质
																	<select name="CZP_CZ" onchange="editCzp('CZP_CZPXH');" id="CZP_CZ_1" class="form-control">
																		<option value="">请选择</option>
																		<option value='发纹不锈钢(标准)' ${pd.CZP_CZ=='发纹不锈钢(标准)'?'selected':''}>发纹不锈钢(标准)</option>
																		<option value="镜面不锈钢" ${pd.CZP_CZ=='镜面不锈钢'?'selected':''}>镜面不锈钢</option>
																	</select>
																	(选配时填写)
																</p>
															</td>
															<td>
																<p>
																	<input name="CZP_CZPXH" type="radio" value="JFCOP09H-D" onclick="setCzpxhDisable('1');"  ${pd.CZP_CZPXH=='JFCOP09H-D'?'checked':''}/>
																	JFCOP09H-D
																</p>
																<p>
																	显示
																	<select name="CZP_XS" id="CZP_XS_2" class="form-control">
																		<option value="">请选择</option>
																		<option value="LCD(标配)" ${pd.CZP_XS=='LCD(标配)'?'selected':''}>LCD(标配)</option>
																		<option value="LED(无偿选配)" ${pd.CZP_XS=='LCD(标配)'?'selected':''}>LED(无偿选配)</option>
																		<option value="TFT(有偿选配)" ${pd.CZP_XS=='LCD(标配)'?'selected':''}>TFT(有偿选配)</option>
																	</select>
																	(选配时填写)
																</p>
																<p>
																	按钮
																	<select name="CZP_AN" id="CZP_AN_2" class="form-control">
																		<option value="">请选择</option>
																		<option value="BAS241(标配)" ${pd.CZP_AN=='BAS241(标配)'?'selected':''}>BAS241(标配)</option>
																	</select>
																	(选配时填写)
																</p>
																<p>
																	材质
																	<select name="CZP_CZ" id="CZP_CZ_2" class="form-control">
																		<option value="">请选择</option>
																		<option value="发纹不锈钢" ${pd.CZP_CZ=='发纹不锈钢'?'selected':''}>发纹不锈钢</option>
																		<option value="镜面不锈钢" ${pd.CZP_CZ=='镜面不锈钢'?'selected':''}>镜面不锈钢</option>
																	</select>
																	(选配时填写)
																</p>
															</td>
															<td><input type="text" name="CZP_CZPXH_TEMP" id="CZP_CZPXH_TEMP" class="form-control" readonly="readonly"></td>
														  </tr> --%>
                                                        <tr>
                                                            <td>操纵盘型号</td>
                                                            <td>
                                                                <select name="CZP_CZPXH" id="CZP_CZPXH"
                                                                        class="form-control">
                                                                    <option value="">请选择</option>
                                                                    <option value="JFCOP14H-D1(一体式)" ${pd.CZP_CZPXH=='JFCOP14H-D1(一体式)'?'selected':''}>
                                                                        JFCOP14H-D1(一体式)
                                                                    </option>
                                                                    <option value="JFCOP14H-D(分体式)" ${pd.CZP_CZPXH=='JFCOP14H-D(分体式)'?'selected':''}>
                                                                        JFCOP14H-D(分体式)
                                                                    </option>
                                                                    <option value="非标" ${pd.CZP_CZPXH=='非标'?'selected':''}>
                                                                        非标
                                                                    </option>
                                                                </select>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>操纵盘数量</td>
                                                            <td>
                                                                <input type="text" name="CZP_CZPSL" id="CZP_CZPSL"
                                                                       class="form-control" value="${pd.CZP_CZPSL}">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>操纵盘位置</td>
                                                            <td>
                                                                <select name="CZP_CZPWZ" id="CZP_CZPWZ"
                                                                        onchange="editCzp('CZP_CZPWZ');"
                                                                        class="form-control">
                                                                    <option value="右前(站在层站面向轿厢)" ${pd.CZP_CZPWZ=='右前(站在层站面向轿厢)'?'selected':''}>
                                                                        右前(站在层站面向轿厢)
                                                                    </option>
                                                                    <option value="左前(站在层站面向轿厢)" ${pd.CZP_CZPWZ=='左前(站在层站面向轿厢)'?'selected':''}>
                                                                        左前(站在层站面向轿厢)
                                                                    </option>
                                                                    <option value="右侧围壁(站在层站面向轿厢)" ${pd.CZP_CZPWZ=='右侧围壁(站在层站面向轿厢)'?'selected':''}>
                                                                        右侧围壁(站在层站面向轿厢)
                                                                    </option>
                                                                    <option value="左侧围壁(站在层站面向轿厢)" ${pd.CZP_CZPWZ=='左侧围壁(站在层站面向轿厢)'?'selected':''}>
                                                                        左侧围壁(站在层站面向轿厢)
                                                                    </option>
                                                                    <option value="非标" ${pd.CZP_CZPWZ=='非标'?'selected':''}>
                                                                        非标
                                                                    </option>
                                                                </select>
                                                            </td>
                                                            <td></td>
                                                            <td></td>
                                                        </tr>

                                                    </table>
                                                    <!-- 操纵盘 -->
                                                </div>
                                                <div id="tab-8" class="tab-pane">
                                                    <!-- 厅门信号装置 -->
                                                    <table class="table table-striped table-bordered table-hover"
                                                           border="1" cellspacing="0">

                                                        <%-- <tr>
															<td>厅外召唤型号</td>
															<td>
																<p>
																	<input name="TMXHZZ_TWZHXH" type="radio" value="JFHB09H-D1" onclick="setTwzhxhDisable('2');"  ${pd.TMXHZZ_TWZHXH=='JFHB09H-D1'?'checked':''}/>
																	JFHB09H-D1(标配只勾选本行,下列不必选)
																</p>
																<p>
																	显示
																	<select name="TMXHZZ_XS" id="TMXHZZ_XS_1" class="form-control">
																		<option value="">请选择</option>
																		<option value="LCD(标配)" ${pd.TMXHZZ_XS=='LCD(标配)'?'selected':''}>LCD(标配)</option>
																		<option value="LED(无偿选配)" ${pd.TMXHZZ_XS=='LED(无偿选配)'?'selected':''}>LED(无偿选配)</option>
																	</select>
																	(选配时填写)
																</p>
																<p>
																	按钮
																	<select name="TMXHZZ_AN" id="TMXHZZ_AN_1" class="form-control">
																		<option value="">请选择</option>
																		<option value="BAS241(标准)" ${pd.TMXHZZ_AN=='BAS241(标准)'?'selected':''}>BAS241(标准)</option>
																	</select>
																	(选配时填写)
																</p>
																<p>
																	材质
																	<select name="TMXHZZ_CZ" onchange="editTmxhzz('TMXHZZ_CZ');" id="TMXHZZ_CZ_1" class="form-control">
																		<option value="">请选择</option>
																		<option value="镜面不锈钢" ${pd.TMXHZZ_CZ=='镜面不锈钢'?'selected':''}>镜面不锈钢</option>
																		<option value="钛金不锈钢" ${pd.TMXHZZ_CZ=='钛金不锈钢'?'selected':''}>钛金不锈钢</option>
																	</select>
																	(选配时填写)
																</p>
															</td>
															<td>
																<p>
																	<input name="TMXHZZ_TWZHXH" type="radio" value="JFHB09H-D" onclick="setTwzhxhDisable('1');" ${pd.TMXHZZ_TWZHXH=='JFHB09H-D'?'checked':''}/>
																	JFHB09H-D
																</p>
																<p>
																	显示
																	<select name="TMXHZZ_XS" id="TMXHZZ_XS_2" class="form-control">
																	  <option value="">请选择</option>
																	  <option value="LCD" ${pd.TMXHZZ_XS=='LCD'?'selected':''}>LCD</option>
																	  <option value="LED" ${pd.TMXHZZ_XS=='LED'?'selected':''}>LED</option>
																	</select>
																	(选配时填写)
																</p>
																<p>
																	按钮
																	<select name="TMXHZZ_AN" id="TMXHZZ_AN_2" class="form-control">
																	  <option value="">请选择</option>
																	  <option value="BAS241" ${pd.TMXHZZ_AN=='BAS241'?'selected':''}>BAS241</option>
																	</select>
																	(选配时填写)
																</p>
																<p>
																	材质
																	<select name="TMXHZZ_CZ" onchange="editTmxhzz('TMXHZZ_CZ_2');" id="TMXHZZ_CZ_2" class="form-control">
																		<option value="">请选择</option>
																		<option value="镜面不锈钢" ${pd.TMXHZZ_CZ=='镜面不锈钢'?'selected':''}>镜面不锈钢</option>
																		<option value="钛金不锈钢" ${pd.TMXHZZ_CZ=='钛金不锈钢'?'selected':''}>钛金不锈钢</option>
																	</select>
																	(选配时填写)
																</p>
															</td>
															<td><input type="text" name="TMXHZZ_CZ_TEMP" id="TMXHZZ_CZ_TEMP" class="form-control" readonly="readonly"></td>
														  </tr> --%>
                                                        <tr>
                                                            <td colspan="2" width="200px">厅外召唤型号</td>
                                                            <td>
                                                                <select name="TMXHZZ_TWZHXH" id="TMXHZZ_TWZHXH"
                                                                        class="form-control">
                                                                    <option value="JF-HB14H-D1" ${pd.TMXHZZ_TWZHXH=='JF-HB14H-D1'?'selected':''}>
                                                                        JF-HB14H-D1
                                                                    </option>
                                                                    <option value="非标" ${pd.TMXHZZ_TWZHXH=='非标'?'selected':''}>
                                                                        非标
                                                                    </option>
                                                                </select>
                                                            </td>
                                                            <td>加价</td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2" width="200px">数量</td>
                                                            <td>
                                                                <input type="text" name="TMXHZZ_TWZHSL"
                                                                       id="TMXHZZ_TWZHSL" class="form-control"
                                                                       value="${pd.TMXHZZ_TWZHSL}"></td>
                                                            </td>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td rowspan="2" colspan="2" width="200px">厅外召唤形式</td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <p>
                                                                    在
                                                                    <input name="TMXHZZ_ZDJC" type="text"
                                                                           id="TMXHZZ_ZDJC_1" class="form-control"
                                                                           style="width: 20%"
                                                                           value="${pd.TMXHZZ_ZDJC}"/>
                                                                    层、每层
                                                                    <input name="TMXHZZ_MCGS" type="text"
                                                                           id="TMXHZZ_MCGS_1" class="form-control"
                                                                           style="width: 20%"
                                                                           value="${pd.TMXHZZ_MCGS}"/>
                                                                    个
                                                                </p>
                                                                <p>
                                                                    附加说明:
                                                                    <input name="TMXHZZ_FJSM" type="text"
                                                                           id="TMXHZZ_FJSM_1" class="form-control"
                                                                           value="${pd.TMXHZZ_FJSM}"/>
                                                                </p>
                                                            </td>
                                                            <%-- <td>
																<p>
																	在
																	<input name="TMXHZZ_ZDJC" type="text" id="TMXHZZ_ZDJC_2" class="form-control" style="width: 20%" value="${pd.TMXHZZ_ZDJC}"/>
																	层、每层
																	<input name="TMXHZZ_MCGS" type="text" id="TMXHZZ_MCGS_2" class="form-control" style="width: 20%" value="${pd.TMXHZZ_MCGS}"/>
																	个
																</p>
																<p>
																	附加说明:
																	<input name="TMXHZZ_FJSM" type="text" id="TMXHZZ_FJSM_2" class="form-control" value="${pd.TMXHZZ_FJSM}"/>
																</p>
															</td> --%>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2" width="200px">残疾人操纵盘</td>
                                                            <td>
                                                                <select name="TMXHZZ_GBSCJRCZX" id="TMXHZZ_GBSCJRCZX"
                                                                        onclick="editTmxhzz('TMXHZZ_GBSCJRCZX');"
                                                                        class="form-control">
                                                                    <option value="">请选择</option>
                                                                    <option value="嵌入式(不加价)" ${pd.TMXHZZ_GBSCJRCZX=='嵌入式(不加价)'?'selected':''}>
                                                                        嵌入式(不加价)
                                                                    </option>
                                                                    <option value="壁挂式" ${pd.TMXHZZ_GBSCJRCZX=='壁挂式'?'selected':''}>
                                                                        壁挂式
                                                                    </option>
                                                                    <option value="非标" ${pd.TMXHZZ_GBSCJRCZX=='非标'?'selected':''}>
                                                                        非标
                                                                    </option>
                                                                </select>
                                                                <%-- <input type="checkbox" name="TMXHZZ_GBSCJRCZX_TEXT" id="TMXHZZ_GBSCJRCZX_TEXT" onclick="editTmxhzz('TMXHZZ_GBSCJRCZX');" ${pd.TMXHZZ_GBSCJRCZX=='1'?'checked':''}>
																<input type="hidden" name="TMXHZZ_GBSCJRCZX" id="TMXHZZ_GBSCJRCZX"> --%>
                                                            </td>
                                                            <td><input type="text" name="TMXHZZ_GBSCJRCZX_TEMP"
                                                                       id="TMXHZZ_GBSCJRCZX_TEMP" class="form-control"
                                                                       readonly="readonly"></td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2" width="200px">位置</td>
                                                            <td>
                                                                <select name="TMXHZZ_GBSCJRCZX_WZ"
                                                                        id="TMXHZZ_GBSCJRCZX_WZ" class="form-control">
                                                                    <option value="">请选择</option>
                                                                    <option value="左侧（站在层外向轿厢看）" ${pd.TMXHZZ_GBSCJRCZX_WZ=='左侧（站在层外向轿厢看）'?'selected':''}>
                                                                        左侧（站在层外向轿厢看）
                                                                    </option>
                                                                    <option value="右侧（站在层外向轿厢看）" ${pd.TMXHZZ_GBSCJRCZX_WZ=='右侧（站在层外向轿厢看）'?'selected':''}>
                                                                        右侧（站在层外向轿厢看）
                                                                    </option>
                                                                    <option value="非标" ${pd.TMXHZZ_GBSCJRCZX_WZ=='非标'?'selected':''}>
                                                                        非标
                                                                    </option>
                                                                </select>
                                                            </td>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2" width="200px">备注</td>
                                                            <td colspan="2">
                                                                1.填写厅外召唤所在层时,请用实际楼层标记填写;2.厅外召唤形式图例仅作示意,当楼层标记为一位数时,数字显示为一位数,在顶层只有一个向下按钮,在底层只有一个向上按钮;3.驻停楼层的厅外召唤带钥匙开关;4.厅外召唤样式(HBtype)有单个(Single)和两台合用一个(Duplex)两种
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <!-- 厅门信号装置 -->
                                                </div>
                                                <div id="tab-9" class="tab-pane">
                                                    <input type="hidden" id="OPT_FB_TEMP" class="form-control">
                                                    <!-- 非标 -->
                                                    <%@include file="nonstanard_detail.jsp" %>
                                                    <!-- 非标 -->
                                                </div>


                                                <div id="tab-10" class="tab-pane">
                                                    <!-- 常规非标 -->
                                                    <%@include file="conventional_nonstandard.jsp" %>
                                                    <!-- 常规非标 -->
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="panel panel-primary">
                                    <div class="panel-heading">
                                        备注
                                    </div>
                                    <div class="panel-body">
                                        <textarea style="width:100%" rows="3" cols="1"
                                                  name="DT_REMARK">${pd.DT_REMARK}</textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="panel panel-primary">
                                    <div class="panel-heading">
                                        安装价格
                                    </div>
                                    <div class="panel-body">
                                        <table class="table table-striped table-bordered table-hover" border="1"
                                               cellspacing="0">
                                            <!-- 基准价 -->
                                            <tr>
                                                <td>安装费（基准价）（元/台）</td>
                                                <td>
                                                    <input type="text" name="JZJ_DTJZJ" id="JZJ_DTJZJ"
                                                           class="form-control" readonly="readonly"
                                                           value="${pd.JZJ_DTJZJ }">
                                                    <input type="hidden" id="initFloor" value="${regelevStandardPd.C}">
                                                </td>
                                                <td>
                                                    是否设备安装一体合同
                                                </td>
                                                <td><input type="checkbox" id="JZJ_IS_YTHT" name="JZJ_IS_YTHT"
                                                           onclick="changeSSCount()" ${pd.JZJ_IS_YTHT=='1'?'checked':'' }>
                                                    <input type="hidden" name="JZJ_IS_YTHT_VAL" id="JZJ_IS_YTHT_VAL"
                                                           value="${pd.JZJ_IS_YTHT}">
                                                </td>
                                                <td>单台专用税收补偿（元/台）</td>
                                                <td>
                                                    <input type="text" name="JZJ_SSBC" id="JZJ_SSBC"
                                                           class="form-control" readonly="readonly"
                                                           value="${pd.JZJ_SSBC }">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>单台安装费（最终基准价）（元/台）</td>
                                                <td>
                                                    <input type="text" name="JZJ_DTZJ" id="JZJ_DTZJ"
                                                           class="form-control" readonly="readonly"
                                                           value="${pd.JZJ_DTZJ }">
                                                </td>
                                                <td>总价（元）</td>
                                                <td>
                                                    <input type="text" name="JZJ_AZF" id="JZJ_AZF" class="form-control"
                                                           readonly="readonly" value="${pd.JZJ_AZF }">
                                                </td>
                                                <td colspan="2"></td>
                                            </tr>
                                            <tr>
                                                <td colspan="6"></td>
                                            </tr>
                                            <!-- 手填价格 -->
                                            <tr>
                                                <td>安装费（元/台）</td>
                                                <td>
                                                    <input type="text" name="ELE_DTAZF" id="ELE_DTAZF"
                                                           value="${pd.ELE_DTAZF }"
                                                           onkeyup="value=value.replace(/[^\-?\d.]/g,'')"
                                                           oninput="countSDPrice();" class="form-control">
                                                </td>
                                                <td>政府验收费（元/台）</td>
                                                <td><input type="text" id="ELE_ZFYSF" NAME="ELE_ZFYSF"
                                                           value="${pd.ELE_ZFYSF }"
                                                           onkeyup="value=value.replace(/[^\-?\d.]/g,'')"
                                                           oninput="countSDPrice();" class="form-control"></td>
                                                <td>免保期超出1年计费（元/台）</td>
                                                <td>
                                                    <input type="text" name="ELE_MBJF" id="ELE_MBJF"
                                                           value="${pd.ELE_MBJF }"
                                                           onkeyup="value=value.replace(/[^\-?\d.]/g,'')"
                                                           oninput="countSDPrice();" class="form-control">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>合同约定其他费用（元/台）</td>
                                                <td><input type="text" name="ELE_QTSF" id="ELE_QTSF"
                                                           value="${pd.ELE_QTSF }"
                                                           onkeyup="value=value.replace(/[^\-?\d.]/g,'')"
                                                           oninput="countSDPrice();" class="form-control"></td>
                                                <td>安装总价（元/台）</td>
                                                <td>
                                                    <input type="text" name="ELE_DTZJ" id="ELE_DTZJ"
                                                           class="form-control" readonly="readonly"
                                                           value="${pd.ELE_DTZJ }">
                                                </td>
                                                <td>安装总价（元）</td>
                                                <td>
                                                    <input type="text" name="ELE_AZF" id="ELE_AZF" class="form-control"
                                                           readonly="readonly" value="${pd.ELE_AZF }">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>备注</td>
                                                <td colspan="3"><input type="text" name="ELE_REMARK" id="ELE_REMARK"
                                                                       value="${pd.ELE_REMARK }"
                                                                       class="form-control"></td>
                                                <td colspan="2">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="6"></td>
                                            </tr>
                                            <!-- 其它价格 -->
                                            <tr>
                                                <td>工程类型</td>
                                                <td>
                                                    <select id="OTHP_GCLX" name="OTHP_GCLX" onchange="changeCJPrice();"
                                                            class="form-control">
                                                        <option value="买断" ${pd.OTHP_GCLX=='买断'?'selected':'' }>买断
                                                        </option>
                                                        <option value="厂检" ${pd.OTHP_GCLX=='厂检'?'selected':'' }>厂检
                                                        </option>
                                                        <option value="验收" ${pd.OTHP_GCLX=='验收'?'selected':'' }>验收
                                                        </option>
                                                    </select>
                                                </td>
                                                <td>厂检费（元）</td>
                                                <td><input type="text" name="OTHP_CJF" id="OTHP_CJF"
                                                           class="form-control" readonly="readonly"
                                                           value="${pd.OTHP_CJF }"></td>
                                                <td rowspan="2">调试/厂检总价（元）</td>
                                                <td rowspan="2">
                                                    <input type="text" name="OTHP_ZJ" id="OTHP_ZJ" class="form-control"
                                                           readonly="readonly" value="${pd.OTHP_ZJ }">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>调试费</td>
                                                <td>
                                                    <input type="checkbox" id="OTHP_ISTSF" name="OTHP_ISTSF"
                                                           onclick="changeCJPrice();" ${pd.OTHP_ISTSF=='1'?'checked':'' }>
                                                    <input type="hidden" id="OTHP_ISTSF_VAL" name="OTHP_ISTSF_VAL"
                                                           value="${pd.OTHP_ISTSF }">
                                                </td>
                                                <td>调试费（元）</td>
                                                <td><input type="text" name="OTHP_TSF" id="OTHP_TSF"
                                                           class="form-control" readonly="readonly"
                                                           value="${pd.OTHP_TSF }"></td>
                                            </tr>
                                            <tr>
                                                <td colspan="6"></td>
                                            </tr>
                                            <tr>
                                                <td>总价（元）</td>
                                                <td>
                                                    <input type="text" name="FEIYUEMRL_AZF_TEMP" id="FEIYUEMRL_AZF_TEMP"
                                                           class="form-control" readonly="readonly"
                                                           value="${pd.FEIYUE_AZF }">
                                                </td>
                                                <td colspan="4"></td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="panel panel-primary">
                                    <div class="panel-heading">
                                        运输价格
                                    </div>
                                    <div class="panel-body">
                                        <div class="form-group form-inline">
                                            <label>运输方式:</label>
                                            <select id="trans_type" class="form-control m-b" name="trans_type"
                                                    onchange="hideDiv();">
                                                <option value="1" ${pd.trans_type=="1"?"selected":""}>整车</option>
                                                <option value="2" ${pd.trans_type=="2"?"selected":""}>零担</option>
                                                <option value="3" ${pd.trans_type=="3"?"selected":""}>自提</option>
                                            </select>
                                            <span id="qy">
                                            <label>请选择区域:</label>
                                            <select id="province_id" name="province_id" class="form-control m-b"
                                                    onchange="setCity();">
                                                <option value="">请选择区域</option>
                                                <c:forEach var="province" items="${provinceList}">
                                                    <option value="${province.id }"${pd.province_id==province.id?"selected":""}>${province.name }</option>
                                                </c:forEach>
                                            </select>

                                            <label>请选择目的地:</label>
                                            <select id="destin_id" name="destin_id" class="form-control m-b">
                                                <option value="">请选择目的地</option>
                                                <c:if test="${not empty cityList}">
                                                    <c:forEach var="city" items="${cityList}">
                                                        <option value="${city.id }" ${pd.destin_id==city.id?"selected":""}>${city.name }</option>
                                                    </c:forEach>
                                                </c:if>
                                            </select>
                                             <span id="ld"  ${pd.trans_type!="2"?"style='display:none;'":""}>
                                            <label>吨数:</label>
                                            <input type="text" id="less_num" name="less_num" class="form-control m-b"
                                                   value="${pd.less_num}">
                                             </span>
                                            </span>
                                        </div>
                                    </div>
                                    <div class="form-group form-inline"
                                         id="zc"  ${pd.trans_type!=null&&pd.trans_type!="1"?"style='display:none;'":""}>
                                        <input type="hidden" name="trans_more_car" id="trans_more_car">
                                        <table id="transTable">
                                            <c:if test="${not empty tmc_list}">
                                                <c:forEach var="tmc" items="${tmc_list}" varStatus="vs">
                                                    <tr>
                                                        <td>
                                                            <label>&nbsp;&nbsp;&nbsp;车型:&nbsp;</label>
                                                            <select class="form-control m-b" name="car_type">
                                                                <option value="" ${tmc.car_type==""?"selected":""}>
                                                                    请选择车型
                                                                </option>
                                                                <option value="5" ${tmc.car_type=="5"?"selected":""}>
                                                                    5T车(6.2-7.2米)
                                                                </option>
                                                                <option value="8" ${tmc.car_type=="8"?"selected":""}>
                                                                    8T车(8.2-9.6米)
                                                                </option>
                                                                <option value="10" ${tmc.car_type=="10"?"selected":""}>
                                                                    10T车(12.5米)
                                                                </option>
                                                                <option value="20" ${tmc.car_type=="20"?"selected":""}>
                                                                    20T车(17.5米)
                                                                </option>
                                                            </select>
                                                        </td>
                                                        <td>
                                                            <label>&nbsp;&nbsp;&nbsp;数量:&nbsp;</label>
                                                            <input type="text" class="form-control m-b" name="car_num"
                                                                   value="${tmc.car_num}">
                                                        </td>
                                                        <td>
                                                            <c:if test="${vs.index==0}">
                                                                <input type="button" value="添加" onclick="addRow();"
                                                                       class="btn-sm btn-success m-b">
                                                            </c:if>
                                                            <c:if test="${vs.index!=0}">
                                                                <input type="button" value="删除" onclick="delRow(this)"
                                                                       class="btn-sm btn-danger m-b">
                                                            </c:if>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </c:if>
                                            <c:if test="${empty tmc_list}">
                                                <tr>
                                                    <td>
                                                        <label>&nbsp;&nbsp;&nbsp;车型:&nbsp;</label>
                                                        <select class="form-control m-b" name="car_type">
                                                            <option value="">请选择车型</option>
                                                            <option value="5">5T车(6.2-7.2米)</option>
                                                            <option value="8">8T车(8.2-9.6米)</option>
                                                            <option value="10">10T车(12.5米)</option>
                                                            <option value="20">20T车(17.5米)</option>
                                                        </select>
                                                    </td>
                                                    <td>
                                                        <label>&nbsp;&nbsp;&nbsp;数量:&nbsp;</label>
                                                        <input type="text" class="form-control m-b" name="car_num">
                                                    </td>
                                                    <td>
                                                        <input type="button" value="添加" onclick="addRow();"
                                                               class="btn-sm btn-success m-b">
                                                    </td>
                                                </tr>
                                            </c:if>
                                        </table>
                                    </div>
                                    <div class="form-group form-inline">
                                        &nbsp;&nbsp;&nbsp;
                                        <input type="button" value="确定" id="setPriceButton" onclick="setPriceTrans();"
                                               class="btn-sm btn-warning m-b">
                                        运输价格(元):
                                        <input type="text" id="trans_price" name="trans_price" class="form-control"
                                               oninput="countTransPrice()" value="${pd.XS_YSJ}">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
    </div>
</form>

<%-- <tr>
    <td>
        <c:if test="${forwardMsg!='view'}">
            <a class="btn btn-primary" style="width: 150px; height:34px;float:left;margin:0px 10px 30px 10px;"
               onclick="save();">保存</a>
        </c:if>
    </td>
    <td><a class="btn btn-danger" style="width: 150px; height: 34px;float:right;margin:0px 10px 30px 10px;"
           onclick="javascript:CloseSUWin('ElevatorParam');">关闭</a></td>
</tr> --%>

	<div class="foot-btn">
         <c:if test="${forwardMsg!='view'}">
            <input type="button" value="装潢价格" onclick="selZhj();"
                   style="width: 120px; margin-left: 5px; height:30px" class="btn btn-sm btn-info btn-sm">
            <input type="button" value="调用参考报价" onclick="selCbj();"
                   style="width: 120px; margin-left: 5px; height:30px" class="btn btn-sm btn-info btn-sm">
        </c:if>
        <c:if test="${forwardMsg!='view'}">
            <a class="btn btn-primary" style="width: 120px; margin-left: 5px; height:30px"
               onclick="save();">保存</a>
        </c:if>
        <a class="btn btn-danger" style="width: 120px; margin-left: 5px; height:30px"
           onclick="javascript:CloseSUWin('ElevatorParam');">关闭</a>
	</div>

<script src="static/js/sweetalert/sweetalert.min.js"></script>
<script src="static/js/iCheck/icheck.min.js"></script>
<script type="text/javascript">

    $(document).ready(function () {
        $("#tab-1").addClass("active");


        //加载标准价格,初始化关联选项
        editZz("1");
        editSd();
        //setSbj();

        $("#BZ_C").val("${regelevStandardPd.C}");
        $("#BZ_Z").val("${regelevStandardPd.Z}");
        $("#BZ_M").val("${regelevStandardPd.M}");

        if ("${pd.view}" == "edit") {
            $("#BZ_C").val("${pd.BZ_C}");
            $("#BZ_Z").val("${pd.BZ_Z}");
            $("#BZ_M").val("${pd.BZ_M}");
        }


        $('#BZ_Z').change();
        $('#BZ_M').change();
        if ("${cbjFlag}" == "1") {

            $("#BZ_ZZ").val("${pd.BZ_ZZ}");

            $("#BZ_SD").val("${pd.BZ_SD}");
            $("#BZ_SD").change();
            $("#BZ_C").val("${pd.BZ_C}");
            $("#BZ_Z").val("${pd.BZ_Z}");
            $("#BZ_M").val("${pd.BZ_M}");
            $("#BZ_KMKD").val("${pd.BZ_KMKD}");
        }

        bindSelect2AndInitDate($('#BZ_C'), "${pd.BZ_C}");
        bindSelect2AndInitDate($('#BZ_Z'), "${pd.BZ_Z}");
        bindSelect2AndInitDate($('#BZ_M'), "${pd.BZ_M}");
        bindSelect2AndInitDate($('#BZ_ZZ'), "${pd.BZ_ZZ}");
        bindSelect2AndInitDate($('#BZ_SD'), "${pd.BZ_SD}");
        bindSelect2AndInitDate($('#BZ_KMKD'), "${pd.BZ_KMKD}");
        initBindSelect("${pd.BASE_JXGG}","2");

        if ("${pd.JXZH_JDZH}" == '悬吊式:JF-CL20(450-2000kg标准)') {
            setJdzhDisable('0')
        } else if ("${pd.JXZH_JDZH}" == '集成式') {
            setJdzhDisable('1')
        } else if ("${pd.JXZH_JDZH}" == '悬吊式') {
            setJdzhDisable('2')
        }

        //调用初始化贯通门
        Jsgtms();

        var FLAG = $("#FLAG").val();
        if (FLAG == "CBJ" || FLAG == "ZHJ") {
            cbjPrice();
        }
        if ("${pd.view}" == "edit") {
            cbjPrice();
        }

        var forwardMsg = "${forwardMsg}";
        if (forwardMsg == 'view') {
            //查看页面设置disable
            var inputs = document.getElementsByTagName("input");
            for (var i = 0; i < inputs.length; i++) {
                inputs[i].setAttribute("disabled", "true");
            }
            var textareas = document.getElementsByTagName("textarea");
            for (var i = 0; i < textareas.length; i++) {
                textareas[i].setAttribute("disabled", "true");
            }
            var selects = document.getElementsByTagName("select");
            for (var i = 0; i < selects.length; i++) {
                selects[i].setAttribute("disabled", "true");
            }
        }
        /*  setTimeout(function(){
            cbjPrice();
            setSbj();
        },500); */

        setSbj();
        countInstallPrice();

        //加载运输模块显示
        if ("${pd.trans_type}" != null && "${pd.trans_type}" != "") {
            $("#trans_type").val("${pd.trans_type}");
            hideDiv();
        } else {
            $("#trans_type").val(1);
        }
        
        updateFbX();
    });

    function initSelect() {

        var jxgg = [];
        var bjxgg = "${pd.BASE_JXGG}";
        var mulItdragonData = $('#BASE_JXGG').find("option");
        for (var i = 0, len = mulItdragonData.length; i < len; i++) {
            var va = mulItdragonData.eq(i).val();
            if (va != '') {
                jxgg.push(va);
            }
        }
        var BASEJXGG = $('#BASE_JXGG').select2({
            tags: true
        });

        if (bjxgg != '' && $.inArray(bjxgg, jxgg) == -1) {
            $('#CGFB_JXCC').val("1");
            BASEJXGG.append(`<option value="${pd.BASE_JXGG}" selected>${pd.BASE_JXGG}</option>`);
            $('#BASE_JXGG_FBTEXT').show();
        }
        BASEJXGG.val(bjxgg);
        BASEJXGG.on("change", function (e) {
            var _val = BASEJXGG.val();
            if (_val != '' && $.inArray(_val, jxgg) == -1) {
                $('#CGFB_JXCC').val("1");
                $('#BASE_JXGG_FBTEXT').show();
            } else {
                $('#CGFB_JXCC').val("0");
                $('#BASE_JXGG_FBTEXT').hide();
            }
            editMTBH('CGFB_JXCC');
        });

    }

    //根据门数和站数计算贯通门数
    function Jsgtms() {
        var bz_m = parseInt_DN($("#BZ_M").val());
        var bz_z = parseInt_DN($("#BZ_Z").val());
        if (bz_z > bz_m) {
            $("#OPT_GTMS").val(0);
        } else {
            var gtms = bz_m - bz_z;
            $("#OPT_GTMS").val(gtms);
        }
    }

    //关闭当前页面
    function CloseSUWin(id) {
        window.parent.$("#" + id).data("kendoWindow").close();
    }

    //修改层时修改站和门
    function editC() {
        var c_ = $("#BZ_C").val();
        $("#BZ_Z").val(c_);
        $("#BZ_M").val(c_);
        setSbj();
    }

    //添加行,录入运输
    function addRow() {
        var tr = $("#transTable tr").eq(0).clone();
        $(tr).find("td").eq(0).find("select").eq(0).val("");
        $(tr).find("td").eq(1).find("input").eq(0).val("");
        $(tr).find("td:last").html("").append("<td><input type='button' value='删除' onclick='delRow(this)'></td>");
        $("#transTable").append(tr);
    }

    //删除行
    function delRow(obj) {
        $(obj).parent().parent().parent().remove();
    }


    //调用时重新计算
    function cbjPrice() {
        //井道总高
        setJdzg();
        //导轨支架
        setDgzj();
        //可选项
        editOpt('OPT_LTBL', '1');
        editOpt('OPT_TDJJJY', '1');
        editOpt('OPT_JXDZZ', '1');
        editOpt('OPT_SJCZ', '1');
        editOpt('OPT_CCTVDL', '1');
        editOpt('OPT_DJGRBH', '1');
        editOpt('OPT_BAJK', '1');
        editOpt('OPT_MBCAN', '1');
        editOpt('OPT_KMZPC', '1');
        editOpt('OPT_QPGM', '1');
        editOpt('OPT_YCJK', '1');
        editOpt('OPT_JFGT', '1');
        editOpt('OPT_ICK', '1');
        editOpt('OPT_ICKZKSB', '1');
        editOpt('OPT_ICKKP', '1');
        editOpt('OPT_GTMJXJMBF', '1');
        editOpt('OPT_GTMTMBF', '1');
        //单组监控室对讲
        editDzjksdjxt();
        //轿厢装潢
        editJxzh('JXZH_JM', '1');
        editJxzh('JXZH_JMZH', '1');
        editJxzh('JXZH_JXZH', '1');
        editJxzh('JXZH_QWB', '1');
        editJxzh('JXZH_CWB', '1');
        editJxzh('JXZH_HWB', '1');
        editJxzh('JXZH_ZSDD', '1');
        editJxzh('JXZH_AQC', '1');
        editJxzh('JXZH_BGJ', '1');
        editJxzh('JXZH_YLZHZL', '1');
        editJxzh('JXZH_FSXH', '1');
        editJxzh('JXZH_FSAZWZ', '1');
        editJxzh('JXZH_HBJMBXG', '1');
        //厅门门套
        editTmmt('TMMT_SCMKCZ', '1');
        editTmmt('TMMT_QYCMKCZ', '1');
        editTmmt('TMMT_SCTMCZ', '1');
        editTmmt('TMMT_QYCTMCZ', '1');
        //操纵盘
        editCzp('CZP_CZPXH');
        //厅门信号装置
        editTmxhzz('TMXHZZ_CZ');
        editTmxhzz('TMXHZZ_GBSCJRCZX');


        //加载页面初始化常规非标加价
        editMTBH('CGFB_MTBH443', '1');
        editMTBH('CGFB_MTBHSUS304', '1');
        editMTBH('CGFB_MTBH15SUS304', '1');
        editMTBH('CGFB_MTBH1215', '1');
        editMTBH('CGFB_JXHL', '1');
        editMTBH('CGFB_DLSB', '1');
        editMTBH('CGFB_DZCZ', '1');
        editMTBH('CGFB_KMGD', '1');
        editMTBH('CGFB_DKIP65', '1');
        editMTBH('CGFB_PKM', '1');
        editMTBH('CGFB_ZFSZ2000', '1');
        editMTBH('CGFB_ZFSZ3000', '1');
        editMTBH('CGFB_ZFSZAQB', '1');
        editMTBH('CGFB_JXCC', '1');
        editMTBH('CGFB_TDYJ', '1');
        editMTBH('CGFB_JJFAJMK', '1');
        editMTBH('CGFB_JJFACXK', '1');

        if ("${pd.CGFB_JXCLBH}" == '由减振复合不锈钢变更为443发纹不锈钢') {
            CGFBJXCLBH('1');
        } else if ("${pd.CGFB_JXCLBH}" == '由减震复合不锈钢变更为1.5mmSUS304发纹不锈钢') {
            CGFBJXCLBH('2');
        } else if ("${pd.CGFB_JXCLBH}" == '减震复合不锈钢厚度由1.2mm增加到1.5mm') {
            CGFBJXCLBH('3');
        } else if ("${pd.CGFB_JXCLBH}" == '由减振复合不锈钢变更为SUS304发纹不锈钢') {
            CGFBJXCLBH('4')
        } else if ("${pd.CGFB_JXCLBH}" == '轿厢后壁中间一块采用镜面不锈钢，宽度约600mm') {
            CGFBJXCLBH('5');
        }

        if ("${pd.CGFB_GTJX}" == 'JFCOPO9H-C1') {
            CGFBGTJX('1');
        } else if ("${pd.CGFB_GTJX}" == 'JFCOPO5P-E') {
            CGFBGTJX('2');
        }
    }


    //调用参考报价
    function selCbj() {
        var modelsId = $("#MODELS_ID").val();
        //获取当前数量
        var sl_ = $("#FEIYUEMRL_SL").val();
        var item_id = $("#ITEM_ID").val();
        var offer_version = $("#offer_version").val();
        $("#cbjView").kendoWindow({
            width: "1000px",
            height: "600px",
            title: "调用参考报价",
            actions: ["Close"],
            content: "<%=basePath%>e_offer/selCbj.do?models=feiyuemrl&FEIYUEMRL_SL=" + sl_ +
                "&item_id=" + item_id + "&offer_version=" + offer_version,
            modal: true,
            visible: false,
            resizable: true
        }).data("kendoWindow").maximize().open();
    }

    //调用装潢价格
    function selZhj() {
        var modelsId = $("#MODELS_ID").val();
        //获取当前基础设备价格
        var zz_ = $("#BZ_ZZ").val();
        var sd_ = $("#BZ_SD").val();
        var kmxs_ = $("#BZ_KMXS").val();
        var kmkd_ = $("#BZ_KMKD").val();
        var c_ = $("#BZ_C").val();
        var z_ = $("#BZ_Z").val();
        var m_ = $("#BZ_M").val();
        var sl_ = $("#FEIYUEMRL_SL").val();
        var zk_ = $("#FEIYUEMRL_ZK").val();
        var sbj_ = $("#FEIYUEMRL_SBJ").val();
        $("#zhjView").kendoWindow({
            width: "1000px",
            height: "600px",
            title: "调用参考报价",
            actions: ["Close"],
            content: "<%=basePath%>e_offer/selZhj.do?models=feiyuemrl&BZ_ZZ=" + zz_ + "&BZ_SD=" + sd_ + "&BZ_KMXS=" + kmxs_ + "&BZ_KMKD=" + kmkd_ + "&BZ_C=" + c_ + "&BZ_Z=" + z_ + "&BZ_M=" + m_ + "&FEIYUEMRL_SL=" + sl_ + "&FEIYUEMRL_ZK=" + zk_ + "&FEIYUEMRL_SBJ=" + sbj_,
            modal: true,
            visible: false,
            resizable: true
        }).data("kendoWindow").maximize().open();
    }

    //非标,点击添加行
    function addFbRow() {
        var tr = $("#fbTable tr").eq(1).clone();
        $(tr).find("td").eq(0).find("input").eq(0).val("");
        $(tr).find("td").eq(1).find("input").eq(0).val("");
        $(tr).find("td").eq(2).find("input").eq(0).val("");
        $(tr).find("td:last").html("").append("<td><input type='button' value='删除' onclick='delFbRow(this)'></td>");
        $("#fbTable").append(tr);
    }


    //设置disable--
    //设置地板装修厚度
    function setDbzxhd() {
        var dbxh_ = $("#JXZH_DBXH").val();
        if (dbxh_ == "JD-08") {
            $("#JXZH_DBZXHD").val("3");
        } else {
            $("#JXZH_DBZXHD").val("");
        }
    }

    //井道承重墙厚度
    function setJdczqhdDisable(flag) {
        if (flag == '1') {
            $("#BASE_JDCZQHD_TEXT").val("");
            $("#BASE_JDCZQHD_TEXT").attr("disabled", "disabled");
        } else if (flag == '0') {
            $('#BASE_JDCZQHD_TEXT').removeAttr("disabled");
        }
    }

    //门类型门保护
    function setMlxmbhDisable(flag) {
        if (flag == '1') {
            $("#BASE_MLXMBH_TEXT").val("");
            $("#BASE_MLXMBH_TEXT").attr("disabled", "disabled");
        } else if (flag == '0') {
            $('#BASE_MLXMBH_TEXT').removeAttr("disabled");
        }
    }

    //轿厢装潢-轿门色标号
    function setJmsbhDisable(flag) {
        if (flag == '1') {
            $("#JXZH_JMSBH").val("");
            $("#JXZH_JMSBH").attr("disabled", "disabled");
        } else if (flag == '0') {
            $('#JXZH_JMSBH').removeAttr("disabled");
        }
        editJxzh('JXZH_JM');
    }

    //轿厢装潢-前围壁色标号
    function setQwbsbhDisable(flag) {
        if (flag == '1') {
            $("#JXZH_QWBSBH").val("");
            $("#JXZH_QWBSBH").attr("disabled", "disabled");
        } else if (flag == '0') {
            $('#JXZH_QWBSBH').removeAttr("disabled");
        }
        editJxzh('JXZH_QWB');
    }

    //轿厢装潢-侧围壁色标号
    function setCwbsbhDisable(flag) {
        if (flag == '1') {
            $("#JXZH_CWBSBH").val("");
            $("#JXZH_CWBSBH").attr("disabled", "disabled");
        } else if (flag == '0') {
            $('#JXZH_CWBSBH').removeAttr("disabled");
        }
        editJxzh('JXZH_CWB');
    }

    //轿厢装潢-后围壁色标号
    function setHwbsbhDisable(flag) {
        if (flag == '1') {
            $("#JXZH_HWBSBH").val("");
            $("#JXZH_HWBSBH").attr("disabled", "disabled");
        } else if (flag == '0') {
            $('#JXZH_HWBSBH').removeAttr("disabled");
        }
        editJxzh('JXZH_HWB');
    }

    //轿厢装潢-轿顶装潢
    function setJdzhDisable(flag) {
        if (flag == "1") {
            $("#ZSDD_2").val("");
            $("#ZSDD_2").attr("disabled", "disabled");
            $('#ZSDD_1').removeAttr("disabled");
        } else if (flag == "2") {
            $("#ZSDD_1").val("");
            $("#ZSDD_1").attr("disabled", "disabled");
            $('#ZSDD_2').removeAttr("disabled");
        } else {
            $("#ZSDD_2").val("");
            $("#ZSDD_2").attr("disabled", "disabled");
            $("#ZSDD_1").val("");
            $("#ZSDD_1").attr("disabled", "disabled");
        }
    }

    //轿厢装潢-地板型号
    function setDbxhDisable(flag) {
        if (flag == '1') {
            $("#JXZH_DBXH_SELECT").val("");
            $("#JXZH_DBXH_SELECT").attr("disabled", "disabled");
            $("#JXZH_DBZXHD").val("3");
        } else if (flag == '0') {
            $('#JXZH_DBXH_SELECT').removeAttr("disabled");
        }
    }

    //轿厢装潢-扶手型号
    function setFsxhDisable(flag) {
        if (flag == '1') {
            $("#JXZH_FSXH_SELECT").val("无");
            $("#JXZH_FSXH_SELECT").attr("disabled", "disabled");
            $("#JXZH_FSXH_TEMP").val("");
            $("#JXZH_FSAZWZ_TEMP").val("");
        } else if (flag == '0') {
            $('#JXZH_FSXH_SELECT').removeAttr("disabled");
            $("#JXZH_FSXH_TEMP").val("");
            $("#JXZH_FSAZWZ_TEMP").val("");
        }
    }

    //厅门门套-首层色标号
    function setScsbhDisable(flag) {
        if (flag == '1') {
            $("#TMMT_SCSBH").val("");
            $("#TMMT_SCSBH").attr("disabled", "disabled");
        } else if (flag == '0') {
            $('#TMMT_SCSBH').removeAttr("disabled");
        }
        editTmmt('TMMT_SCTMMT');
    }

    //厅门门套-非首层色标号
    function setFscsbhDisable(flag) {
        if (flag == '1') {
            $("#TMMT_FSCSBH").val("");
            $("#TMMT_FSCSBH").attr("disabled", "disabled");
        } else if (flag == '0') {
            $('#TMMT_FSCSBH').removeAttr("disabled");
        }
        editTmmt('TMMT_FSCTMMT');
    }

    //操纵盘-操纵盘型号
    function setCzpxhDisable(flag) {
        if (flag == '1') {
            $("#CZP_XS_1").val("");
            $("#CZP_XS_1").attr("disabled", "disabled");
            $("#CZP_AN_1").val("");
            $("#CZP_AN_1").attr("disabled", "disabled");
            $("#CZP_CZ_1").val("");
            $("#CZP_CZ_1").attr("disabled", "disabled");
            $("#CZP_XS_SUB").val("");
            $("#CZP_XS_SUB").attr("disabled", "disabled");
            $('#CZP_XS_2').removeAttr("disabled");
            $('#CZP_AN_2').removeAttr("disabled");
            $('#CZP_CZ_2').removeAttr("disabled");
        } else if (flag == '2') {
            $("#CZP_XS_2").val("");
            $("#CZP_XS_2").attr("disabled", "disabled");
            $("#CZP_AN_2").val("");
            $("#CZP_AN_2").attr("disabled", "disabled");
            $("#CZP_CZ_2").val("");
            $("#CZP_CZ_2").attr("disabled", "disabled");
            $('#CZP_XS_1').removeAttr("disabled");
            $('#CZP_AN_1').removeAttr("disabled");
            $('#CZP_CZ_1').removeAttr("disabled");
            $('#CZP_XS_SUB').removeAttr("disabled");
        }
        editCzp('CZP_CZPXH');
    }

    //厅门信号装置-厅外召唤型号
    function setTwzhxhDisable(flag) {
        if (flag == "1") {
            $("#TMXHZZ_XS_1").val("");
            $("#TMXHZZ_XS_1").attr("disabled", "disabled");
            $("#TMXHZZ_AN_1").val("");
            $("#TMXHZZ_AN_1").attr("disabled", "disabled");
            $("#TMXHZZ_CZ_1").val("");
            $("#TMXHZZ_CZ_1").attr("disabled", "disabled");
            $("#TMXHZZ_ZDJC_1").val("");
            $("#TMXHZZ_ZDJC_1").attr("disabled", "disabled");
            $("#TMXHZZ_MCGS_1").val("");
            $("#TMXHZZ_MCGS_1").attr("disabled", "disabled");
            $("#TMXHZZ_FJSM_1").val("");
            $("#TMXHZZ_FJSM_1").attr("disabled", "disabled");
            $('#TMXHZZ_XS_2').removeAttr("disabled");
            $('#TMXHZZ_AN_2').removeAttr("disabled");
            $('#TMXHZZ_CZ_2').removeAttr("disabled");
            $('#TMXHZZ_ZDJC_2').removeAttr("disabled");
            $('#TMXHZZ_MCGS_2').removeAttr("disabled");
            $('#TMXHZZ_FJSM_2').removeAttr("disabled");
        } else if (flag == "2") {
            $("#TMXHZZ_XS_2").val("");
            $("#TMXHZZ_XS_2").attr("disabled", "disabled");
            $("#TMXHZZ_AN_2").val("");
            $("#TMXHZZ_AN_2").attr("disabled", "disabled");
            $("#TMXHZZ_CZ_2").val("");
            $("#TMXHZZ_CZ_2").attr("disabled", "disabled");
            $("#TMXHZZ_ZDJC_2").val("");
            $("#TMXHZZ_ZDJC_2").attr("disabled", "disabled");
            $("#TMXHZZ_MCGS_2").val("");
            $("#TMXHZZ_MCGS_2").attr("disabled", "disabled");
            $("#TMXHZZ_FJSM_2").val("");
            $("#TMXHZZ_FJSM_2").attr("disabled", "disabled");
            $('#TMXHZZ_XS_1').removeAttr("disabled");
            $('#TMXHZZ_AN_1').removeAttr("disabled");
            $('#TMXHZZ_CZ_1').removeAttr("disabled");
            $('#TMXHZZ_ZDJC_1').removeAttr("disabled");
            $('#TMXHZZ_MCGS_1').removeAttr("disabled");
            $('#TMXHZZ_FJSM_1').removeAttr("disabled");
        }
    }


    //计算基础价
    function setSbj() {
        //调用初始化贯通门
        Jsgtms();
        var sl_ = $("#FEIYUEMRL_SL").val() == "" ? 0 : parseInt_DN($("#FEIYUEMRL_SL").val());
        var sd_ = $("#BZ_SD").val();  //速度
        if (sd_ == "1.0") {
            var sd = 1;
        }
        else if (sd_ == "2.0") {
            var sd = 2;
        }
        else {
            var sd = sd_;
        }
        var c_ = $("#BZ_C").val();     //层站
        var zz_ = $("#BZ_ZZ").val();  //载重
        var models_name = $("#tz_").val();  //型号名称
        var price = 0;
        $.post("<%=basePath%>e_offer/setBascPrice",
            {
                "SD": sd,
                "ZZ": zz_,
                "C": c_,
                "NAME": models_name
            }, function (result) {
            	if(basisDate.fbdj == null){
            		if (result.msg == "success") {
                        if (result.pd != null) {
                            $("#SBJ_TEMP").val(result.pd.PRICE * sl_);
                            $("#DANJIA").val(result.pd.PRICE);
                        } else {
                            $("#SBJ_TEMP").val(0);
                            $("#DANJIA").val(0);
                        }

                        setMPrice();

                        countZhj();
                    }
            	} else {
    				$("#SBJ_TEMP").val(basisDate.fbdj*sl_);
    	            $("#DANJIA").val(basisDate.fbdj);
                    setMPrice();
                    countZhj();
            	}
            });
        //调用计算折扣
        //JS_SJBJ();
    }


    //修改载重时
    function editZz(isnonUpdateQLJJ) {
        var zz_ = $("#BZ_ZZ").val();
        var kmkd_ = $("#BZ_KMKD").val();
        if(isnonUpdateQLJJ != '1'){
            //圈钢梁间距
            $("#BASE_QGLJJ").val("2000");
        }
        if (zz_ == "630") {
            //修改轿厢规格
            /* $("#BASE_JXGG").empty();
			$("#BASE_JXGG").append("<option value='1100×1400(630kg)'>1100×1400(630kg)</option>"); */

            //修改轿厢总高
            /*  $(":radio[name='BASE_JXGD'][value='2400']").prop("checked", "checked"); */
            
        	$("#JXZH_QWB_TEMP").show();
        	$("#BASE_DGZJ_TEMP").show();
        	$("#OPT_GTMJXJMBF_TEMP").show();
        	$("#OPT_GTMTMBF_TEMP").show();
        	$("#OPT_GTMTMBF_TEMP").show();
        	$("#JXZH_BGJ_TEMP").show();
        	$("#BASE_CCJG").show();
        	$(".intro").hide();

        } else if (zz_ == "450") {
            //修改轿厢规格
            /* $("#BASE_JXGG").empty();
			$("#BASE_JXGG").append("<option value='1350×1400(800kg)'>1350×1400(800kg)</option>"); */

            //修改轿厢总高
            /* $(":radio[name='BASE_JXGD'][value='2400']").prop("checked", "checked"); */
            
        	$("#JXZH_QWB_TEMP").show();
        	$("#BASE_DGZJ_TEMP").show();
        	$("#OPT_GTMJXJMBF_TEMP").show();
        	$("#OPT_GTMTMBF_TEMP").show();
        	$("#OPT_GTMTMBF_TEMP").show();
        	$("#JXZH_BGJ_TEMP").show();
        	$("#BASE_CCJG").show();
        	$(".intro").hide();

        }else if (zz_ == "800") {
            //修改轿厢规格
            /* $("#BASE_JXGG").empty();
			$("#BASE_JXGG").append("<option value='1350×1400(800kg)'>1350×1400(800kg)</option>"); */

            //修改轿厢总高
            /* $(":radio[name='BASE_JXGD'][value='2400']").prop("checked", "checked"); */
            
        	$("#JXZH_QWB_TEMP").show();
        	$("#BASE_DGZJ_TEMP").show();
        	$("#OPT_GTMJXJMBF_TEMP").show();
        	$("#OPT_GTMTMBF_TEMP").show();
        	$("#OPT_GTMTMBF_TEMP").show();
        	$("#JXZH_BGJ_TEMP").show();
        	$("#BASE_CCJG").show();
        	$(".intro").hide();

        }else if (zz_ == "1000") {
            //修改轿厢规格
            /* $("#BASE_JXGG").empty();
			$("#BASE_JXGG").append("<option value='1600×1400(1000kg)'>1600×1400(1000kg)</option><option value='1100×2100(1000kg担架梯)'>1100×2100(1000kg担架梯)</option>"); */

            //修改轿厢总高
            /*  $(":radio[name='BASE_JXGD'][value='2400']").prop("checked", "checked"); */
            
        	$("#JXZH_QWB_TEMP").show();
        	$("#BASE_DGZJ_TEMP").show();
        	$("#OPT_GTMJXJMBF_TEMP").show();
        	$("#OPT_GTMTMBF_TEMP").show();
        	$("#OPT_GTMTMBF_TEMP").show();
        	$("#JXZH_BGJ_TEMP").show();
        	$("#BASE_CCJG").show();
        	$(".intro").hide();
        }else if(zz_==""){
        	$("#IS_FEIBIAO").val("true");
        	$("#JXZH_QWB_TEMP").hide();
        	$("#BASE_DGZJ_TEMP").hide();
        	$("#OPT_GTMJXJMBF_TEMP").hide();
        	$("#OPT_GTMTMBF_TEMP").hide();
        	$("#OPT_GTMTMBF_TEMP").hide();
        	$("#JXZH_BGJ_TEMP").hide();
        	$("#BASE_DGZJ_TEMP").val(0);
        	$("#BASE_CCJG").val(0);
        	$("#BASE_CCJG").hide();
        	$(".intro").show();	
        }
        else{
        	$("#IS_FEIBIAO").val("true");
        	$("#JXZH_QWB_TEMP").hide();
        	$("#BASE_DGZJ_TEMP").hide();
        	$("#OPT_GTMJXJMBF_TEMP").hide();
        	$("#OPT_GTMTMBF_TEMP").hide();
        	$("#OPT_GTMTMBF_TEMP").hide();
        	$("#JXZH_BGJ_TEMP").hide();
        	$("#BASE_DGZJ_TEMP").val(0);
        	$("#BASE_CCJG").val(0);
        	$("#BASE_CCJG").hide();
        	$(".intro").show();	
        	
        }
        //支架 价格 联动
        if ($("#BASE_JDZG").val() != null && $("#BASE_JDZG").val() != "") {
            setJdzg();
        }
        //厅门门套联动
        
        setSbj();
    }

    //修改速度时
    function editSd() {
        var sd_ = $("#BZ_SD").val();
        if (sd_ == "1.0") {
            var appendStr = "<option value=''>请选择</option><option value='2'>2</option><option value='3'>3</option><option value='4'>4</option><option value='5'>5</option><option value='6'>6</option><option value='7'>7</option><option value='8'>8</option><option value='9'>9</option><option value='10'>10</option><option value='11'>11</option><option value='12'>12</option><option value='13'>13</option><option value='14'>14</option><option value='15'>15</option>";
            $("#BZ_C").empty();
            $("#BZ_Z").empty();
            $("#BZ_M").empty();
            $("#BZ_C").append(appendStr);
            $("#BZ_Z").append(appendStr);
            $("#BZ_M").append(appendStr);
        } else if (sd_ == "1.5") {
            var appendStr = "<option value=''>请选择</option><option value='4'>4</option><option value='5'>5</option><option value='6'>6</option><option value='7'>7</option><option value='8'>8</option><option value='9'>9</option><option value='10'>10</option><option value='11'>11</option><option value='12'>12</option><option value='13'>13</option><option value='14'>14</option><option value='15'>15</option><option value='16'>16</option><option value='17'>17</option><option value='18'>18</option><option value='19'>19</option><option value='20'>20</option><option value='21'>21</option><option value='22'>22</option><option value='23'>23</option><option value='24'>24</option><option value='25'>25</option>";
            $("#BZ_C").empty();
            $("#BZ_Z").empty();
            $("#BZ_M").empty();
            $("#BZ_C").append(appendStr);
            $("#BZ_Z").append(appendStr);
            $("#BZ_M").append(appendStr);
        } else if (sd_ == "1.75") {
            var appendStr = "<option value=''>请选择</option><option value='4'>4</option><option value='5'>5</option><option value='6'>6</option><option value='7'>7</option><option value='8'>8</option><option value='9'>9</option><option value='10'>10</option><option value='11'>11</option><option value='12'>12</option><option value='13'>13</option><option value='14'>14</option><option value='15'>15</option><option value='16'>16</option><option value='17'>17</option><option value='18'>18</option><option value='19'>19</option><option value='20'>20</option><option value='21'>21</option><option value='22'>22</option><option value='23'>23</option><option value='24'>24</option>";
            $("#BZ_C").empty();
            $("#BZ_Z").empty();
            $("#BZ_M").empty();
            $("#BZ_C").append(appendStr);
            $("#BZ_Z").append(appendStr);
            $("#BZ_M").append(appendStr);
        } else if (sd_ == "2.0") {
            var appendStr = "<option value=''>请选择</option><option value='4'>4</option><option value='5'>5</option><option value='6'>6</option><option value='7'>7</option><option value='8'>8</option><option value='9'>9</option><option value='10'>10</option><option value='11'>11</option><option value='12'>12</option><option value='13'>13</option><option value='14'>14</option><option value='15'>15</option><option value='16'>16</option><option value='17'>17</option><option value='18'>18</option><option value='19'>19</option><option value='20'>20</option><option value='21'>21</option><option value='22'>22</option><option value='23'>23</option><option value='24'>24</option><option value='25'>25</option><option value='26'>26</option><option value='27'>27</option><option value='28'>28</option><option value='29'>29</option><option value='30'>30</option>";
            $("#BZ_C").empty();
            $("#BZ_Z").empty();
            $("#BZ_M").empty();
            $("#BZ_C").append(appendStr);
            $("#BZ_Z").append(appendStr);
            $("#BZ_M").append(appendStr);
        } else {
            var appendStr = "<option value=''>请选择</option>";
            $("#BZ_C").empty();
            $("#BZ_Z").empty();
            $("#BZ_M").empty();
            $("#BZ_C").append(appendStr);
            $("#BZ_Z").append(appendStr);
            $("#BZ_M").append(appendStr);
        }
        setSbj();
        if ($("#BASE_JDZG").val() != null && $("#BASE_JDZG").val() != "") {
            setJdzg();
        }
        
        //修改速度后 更新再平层价格
        editOpt('OPT_KMZPC');
    }


    //修改门数量时修改标准价格
    function setMPrice() {
        //调用初始化贯通门
        Jsgtms();
        var sl_ = $("#FEIYUEMRL_SL").val() == "" ? 0 : parseInt_DN($("#FEIYUEMRL_SL").val());
        var sbj_jj = parseInt_DN($("#DANJIA").val());
        var m_ = parseInt_DN($("#BZ_M").val());
        var c_ = parseInt_DN($("#BZ_C").val());
        var z_ = parseInt_DN($("#BZ_Z").val());//站
        var price = 0;
        var kmkd_ = parseInt_DN($("#BZ_KMKD").val());
        if (!isNaN(m_) && !isNaN(c_) && !isNaN(z_)) {
            //sbj_jj = sbj_jj * sl_;
			if (kmkd_=="800"||kmkd_=="900") {
				 var _jj = 0;
		            if (kmkd_ == "800") {
		                _jj = -1890;
		            } else if (kmkd_ == "900") {
		                _jj = -2160;
		            }

		            price = subDoor(sbj_jj, c_, z_, m_, _jj);
		            $("#DANJIA").val(price);
	                $("#SBJ_TEMP").val(price * sl_);
	                $("#BZ_M_TEMP").val(0);
	                $("#TMMT_Label").hide();
	                $("#DANJIA_Label").hide();

	            } else {
	                //开门宽度非标
	                $("#DANJIA_Label").show();
	                $("#TMMT_Label").show();
	            }
           
			//厅门门套联动
			editTmmt('TMMT_SCMKCZ');
	        editTmmt('TMMT_QYCMKCZ');
	        editTmmt('TMMT_SCTMCZ');
	        editTmmt('TMMT_QYCTMCZ');

            /* var jm = c_-m_;
            if(jm>0){
                if(kmkd_=="800"){
                    price = -1680*jm*sl_;
                }else if(kmkd_=="1500"){
                    price = -1920*jm*sl_;
                }else if(kmkd_=="1100"){
                    price = -2200*jm*sl_;
                }
            }
            $("#BZ_M_TEMP").val(price); */
            countZhj();
        }
    }

    //控制方式加价
    function KZFS_TEMP(flag) {
        var sl_ = $("#FEIYUEMRL_SL").val() == "" ? 0 : parseInt_DN($("#FEIYUEMRL_SL").val());
        var price = 0;
        if (flag == '1') {
            price = 0;
        } else if (flag == '2') {
            price = 240 * sl_;
        }
        else if (flag == '3') {
            price = 2400 * sl_;
        }
        else if (flag == '4') {
            price = 2000 * sl_;
        }
        $("#BASE_KZFS_TEMP").val(price);
        //计算价格
        countZhj();
    }

    function countZhj() {
        var zhj_count = 0;
        var sbj_count = 0;

        var bz_m_temp = $("#BZ_M_TEMP").val() == "" ? 0 : parseInt_DN($("#BZ_M_TEMP").val());
        var base_kzfs_temp = $("#BASE_KZFS_TEMP").val() == "" ? 0 : parseInt_DN($("#BASE_KZFS_TEMP").val());
        var base_jdzg_temp = $("#BASE_JDZG_TEMP").val() == "" ? 0 : parseInt_DN($("#BASE_JDZG_TEMP").val());
        var base_dgzj_temp = $("#BASE_DGZJ_TEMP").val() == "" ? 0 : parseInt_DN($("#BASE_DGZJ_TEMP").val());
        /* var opt_ltbl_temp = $("#OPT_LTBL_TEMP").val()==""?0:parseInt_DN($("#OPT_LTBL_TEMP").val()); */
        /* var opt_tdjjjy_temp = $("#OPT_TDJJJY_TEMP").val()==""?0:parseInt_DN($("#OPT_TDJJJY_TEMP").val()); */
        var opt_jxdzz_temp = $("#OPT_JXDZZ_TEMP").val() == "" ? 0 : parseInt_DN($("#OPT_JXDZZ_TEMP").val());
        var opt_sjcz_temp = $("#OPT_SJCZ_TEMP").val() == "" ? 0 : parseInt_DN($("#OPT_SJCZ_TEMP").val());
        var opt_cctvdl_temp = $("#OPT_CCTVDL_TEMP").val() == "" ? 0 : parseInt_DN($("#OPT_CCTVDL_TEMP").val());
        var opt_djgrbh_temp = $("#OPT_DJGRBH_TEMP").val() == "" ? 0 : parseInt_DN($("#OPT_DJGRBH_TEMP").val());
        var opt_bajk_temp = $("#OPT_BAJK_TEMP").val() == "" ? 0 : parseInt_DN($("#OPT_BAJK_TEMP").val());
        var opt_mbcan_temp = $("#OPT_MBCAN_TEMP").val() == "" ? 0 : parseInt_DN($("#OPT_MBCAN_TEMP").val());
        var opt_kmzpc_temp = $("#OPT_KMZPC_TEMP").val() == "" ? 0 : parseInt_DN($("#OPT_KMZPC_TEMP").val());
        var opt_qpgm_temp = $("#OPT_QPGM_TEMP").val() == "" ? 0 : parseInt_DN($("#OPT_QPGM_TEMP").val());
        /* var opt_ycjk_temp = $("#OPT_YCJK_TEMP").val()==""?0:parseInt_DN($("#OPT_YCJK_TEMP").val()); */
        var opt_jfgt_temp = $("#OPT_JFGT_TEMP").val() == "" ? 0 : parseInt_DN($("#OPT_JFGT_TEMP").val());
        var opt_ick_temp = $("#OPT_ICK_TEMP").val() == "" ? 0 : parseInt_DN($("#OPT_ICK_TEMP").val());
        var opt_ickzksb_temp = $("#OPT_ICKZKSB_TEMP").val() == "" ? 0 : parseInt_DN($("#OPT_ICKZKSB_TEMP").val());
        var opt_ickkp_temp = $("#OPT_ICKKP_TEMP").val() == "" ? 0 : parseInt_DN($("#OPT_ICKKP_TEMP").val());
        var opt_gtmjxjmbf_temp = $("#OPT_GTMJXJMBF_TEMP").val() == "" ? 0 : parseInt_DN($("#OPT_GTMJXJMBF_TEMP").val());
        var opt_gtmtmbf_temp = $("#OPT_GTMTMBF_TEMP").val() == "" ? 0 : parseInt_DN($("#OPT_GTMTMBF_TEMP").val());
        var dzjksdjxt_djts_temp = $("#DZJKSDJXT_DJTS_TEMP").val() == "" ? 0 : parseInt_DN($("#DZJKSDJXT_DJTS_TEMP").val());
        var jxzh_jm_temp = $("#JXZH_JM_TEMP").val() == "" ? 0 : parseInt_DN($("#JXZH_JM_TEMP").val());
        /* var jxzh_jmzh_temp = $("#JXZH_JMZH_TEMP").val()==""?0:parseInt_DN($("#JXZH_JMZH_TEMP").val()); */
        var jxzh_jxzh_temp = $("#JXZH_JXZH_TEMP").val() == "" ? 0 : parseInt_DN($("#JXZH_JXZH_TEMP").val());
        var jxzh_qwb_temp = $("#JXZH_QWB_TEMP").val() == "" ? 0 : parseInt_DN($("#JXZH_QWB_TEMP").val());
        /* var jxzh_cwb_temp = $("#JXZH_CWB_TEMP").val()==""?0:parseInt_DN($("#JXZH_CWB_TEMP").val());
		var jxzh_hwb_temp = $("#JXZH_HWB_TEMP").val()==""?0:parseInt_DN($("#JXZH_HWB_TEMP").val()); */
        var jxzh_zsdd_temp = $("#JXZH_ZSDD_TEMP").val() == "" ? 0 : parseInt_DN($("#JXZH_JM_TEMP").val());
        var jxzh_aqc_temp = $("#JXZH_AQC_TEMP").val() == "" ? 0 : parseInt_DN($("#JXZH_AQC_TEMP").val());
        var jxzh_bgj_temp = $("#JXZH_BGJ_TEMP").val() == "" ? 0 : parseInt_DN($("#JXZH_BGJ_TEMP").val());
        var jxzh_ylzhzl_temp = $("#JXZH_YLZHZL_TEMP").val() == "" ? 0 : parseInt_DN($("#JXZH_YLZHZL_TEMP").val());
        var jxzh_fsxh_temp = $("#JXZH_FSXH_TEMP").val() == "" ? 0 : parseInt_DN($("#JXZH_FSXH_TEMP").val());
        var jxzh_fsazwz_temp = $("#JXZH_FSAZWZ_TEMP").val() == "" ? 0 : parseInt_DN($("#JXZH_FSAZWZ_TEMP").val());
        var tmmt_scmkcz_temp = $("#TMMT_SCMKCZ_TEMP").val() == "" ? 0 : parseInt_DN($("#TMMT_SCMKCZ_TEMP").val());
        var tmmt_qycmkcz_temp = $("#TMMT_QYCMKCZ_TEMP").val() == "" ? 0 : parseInt_DN($("#TMMT_QYCMKCZ_TEMP").val());
        var tmmt_sctmcz_temp = $("#TMMT_SCTMCZ_TEMP").val() == "" ? 0 : parseInt_DN($("#TMMT_SCTMCZ_TEMP").val());
        var tmmt_qyctmcz_temp = $("#TMMT_QYCTMCZ_TEMP").val() == "" ? 0 : parseInt_DN($("#TMMT_QYCTMCZ_TEMP").val());
        var JXZH_HBJMBXG_temp = $("#JXZH_HBJMBXG_TEMP").val() == "" ? 0 : parseInt_DN($("#JXZH_HBJMBXG_TEMP").val());
        /* var czp_czpxh_temp = $("#CZP_CZPXH_TEMP").val()==""?0:parseInt_DN($("#CZP_CZPXH_TEMP").val()); */
        /* var tmxhzz_cz_temp = $("#TMXHZZ_CZ_TEMP").val()==""?0:parseInt_DN($("#TMXHZZ_CZ_TEMP").val()); */
        var tmxhzz_gbscjrczx_temp = $("#TMXHZZ_GBSCJRCZX_TEMP").val() == "" ? 0 : parseInt_DN($("#TMXHZZ_GBSCJRCZX_TEMP").val());
        var base_ccjg = $("#BASE_CCJG").val() == "" ? 0 : parseInt_DN($("#BASE_CCJG").val());

        //非标选项加价
        var opt_fb_temp = $("#OPT_FB_TEMP").val() == "" ? 0 : parseInt_DN($("#OPT_FB_TEMP").val());

        zhj_count = JXZH_HBJMBXG_temp+base_ccjg + jxzh_jm_temp + jxzh_jxzh_temp + jxzh_qwb_temp + jxzh_zsdd_temp + jxzh_aqc_temp + jxzh_bgj_temp + jxzh_ylzhzl_temp + jxzh_fsazwz_temp;
        /* $("#FEIYUEMRL_ZHJ").val(zhj_count); */
        sbj_count = bz_m_temp + base_kzfs_temp + base_jdzg_temp + base_dgzj_temp + opt_jxdzz_temp + opt_sjcz_temp + opt_cctvdl_temp + opt_djgrbh_temp + opt_bajk_temp + opt_mbcan_temp + opt_kmzpc_temp + opt_qpgm_temp + opt_jfgt_temp + opt_ick_temp + opt_ickzksb_temp + opt_ickkp_temp + opt_gtmjxjmbf_temp + opt_gtmtmbf_temp + dzjksdjxt_djts_temp + tmmt_scmkcz_temp + tmmt_qycmkcz_temp + tmmt_sctmcz_temp + tmmt_qyctmcz_temp + tmxhzz_gbscjrczx_temp + opt_fb_temp;
        //设备标准价格 (选项加价)
        var sbj_temp = parseInt_DN($("#SBJ_TEMP").val());
        $("#XS_XXJJ").val(sbj_count + zhj_count);
        //折前价 =基价+选项加价
        $("#XS_ZQJ").val(sbj_count + zhj_count + sbj_temp);

        //运输费
        var feiyuemrl_ysf = $("#FEIYUEMRL_YSF").val() == "" ? 0 : parseInt_DN($("#FEIYUEMRL_YSF").val());
        $("#FEIYUEMRL_YSF").val(feiyuemrl_ysf);
        //安装费
        var feiyuemrl_azf = $("#FEIYUEMRL_AZF_TEMP").val() == "" ? 0 : parseInt_DN($("#FEIYUEMRL_AZF_TEMP").val());
        $("#FEIYUEMRL_AZF").val(feiyuemrl_azf);


        //非标加价
        setFBPrice();

        var feiyuemrl_zk = parseFloat($("#FEIYUEMRL_ZK").val()) / 100;
        if (!isNaN(feiyuemrl_zk)) {
            var feiyuemrl_sbj = parseInt_DN($("#SBJ_TEMP").val());
            var feiyuemrl_sjbj = (feiyuemrl_sbj + zhj_count + sbj_count + feiyuemrl_azf + feiyuemrl_ysf) * feiyuemrl_zk;
            var feiyuemrl_zhsbj = feiyuemrl_sbj * feiyuemrl_zk;
            $("#FEIYUEMRL_SJBJ").val(feiyuemrl_sjbj);
            $("#FEIYUEMRL_ZHSBJ").val(feiyuemrl_zhsbj);
            $("#zk_").text($("#FEIYUEMRL_ZK").val() + "%");
        }
        countInstallPrice();
        JS_SJBJ();
    }

    //计算井道总高-加价
    function setJdzg() {
        var dtsl_ = parseInt_DN($("#DT_SL").val());
        var tsgd_ = parseInt_DN($("#BASE_TSGD").val());    //提升高度
        var dksd_ = parseInt_DN($("#BASE_DKSD").val());     //底坑深度
        var dcgd_ = parseInt_DN($("#BASE_DCGD").val());    //顶层高度
        //加价
        var price = 0;
        if (!isNaN(tsgd_) && !isNaN(dksd_) && !isNaN(dcgd_)) {
            var jdzg_ = tsgd_ + dksd_ + dcgd_;  //井道总高
            $("#BASE_JDZG").val(jdzg_);

            //根据基本参数 获取提升高度 以及加价
            var sd_ = $("#BZ_SD").val();  //速度
            if (sd_ == "1.0") {
                var sd = 1;
            }
            else if (sd_ == "2.0") {
                var sd = 2;
            }
            else {
                var sd = sd_;
            }
            var c_ = $("#BZ_C").val();     //层站
            var zz_ = $("#BZ_ZZ").val();  //载重
            var models_name = $("#tz_").val();  //型号名称
            $.post("<%=basePath%>e_offer/setBascPrice",
                {
                    "SD": sd,
                    "ZZ": zz_,
                    "C": c_,
                    "NAME": models_name
                }, function (result) {
                    if (result.msg == "success") {

                        if (isNaN(tsgd_) && isNaN(dksd_) && isNaN(dcgd_)) {
                            $("#BASE_CCGD").val("");
                            $("#BASE_CCJG").val("");
                            $("#BASE_JDZG_TEMP").val("");
                            $("#BASE_JDZG").val("");
                        }
                        else {
                            if (result.pd != null) {
                                var jdzg = $("#BASE_JDZG").val();
                                var ccgd = jdzg - parseInt_DN(result.pd.BZJDG * 1000);//超出高度
                                var ccjg = (ccgd / 1000) * result.pd.JJ * dtsl_;//超出高度加价
                                $("#BASE_CCGD").val(ccgd);
                                if (parseInt_DN(ccjg) > 0) {
                                    $("#BASE_CCJG").val(parseInt_DN(ccjg));
                                } else {
                                    $("#BASE_CCJG").val(0);
                                }

                                $("#BASE_JDZG_TEMP").val("0");
                                //放入价格
                                countZhj();
                            }
                        }
                    }

                });
            setDgzj();
        } else {
            $("#BASE_CCGD").val("");
            $("#BASE_CCJG").val("");
            $("#BASE_JDZG_TEMP").val("");
            $("#BASE_JDZG").val("");
        }
    }

    //计算导轨支架-加价
    function setDgzj() {
        var sl_ = $("#FEIYUEMRL_SL").val() == "" ? 0 : parseInt_DN($("#FEIYUEMRL_SL").val());
        var sd_ = $("#BZ_SD").val();  //速度
        var c_ = $("#BZ_C").val();     //层站
        var zz_ = $("#BZ_ZZ").val();  //载重
        var models_name = $("#tz_").val();  //型号名称
        if (sd_ == "1.0") {
            var sd = 1;
        }
        else if (sd_ == "2.0") {
            var sd = 2;
        }
        else {
            var sd = sd_;
        }
        $.post("<%=basePath%>e_offer/setBascPrice",
            {
                "SD": sd,
                "ZZ": zz_,
                "C": c_,
                "NAME": models_name
            }, function (result) {
                if (result.msg == "success" && result.pd != null) {
                    //井道总高(标准)
                    //var jdzg_std=result.pd.BZJDG*1000;
                    var jdzg_std = $("#BASE_JDZG").val();

                    //计算标准导轨支架数量
                    var dgzj_std = Math.ceil((jdzg_std / 2000) + 1);
                    var price;

                    var jdzg_sj = $("#BASE_JDZG").val();  //实际井道总高
                    var qgljj_sj = $("#BASE_QGLJJ").val();//实际圈钢梁间距
                    if (jdzg_sj == "" || isNaN(jdzg_sj)) {
                        $("#BASE_DGZJ").val(0);
                        $("#BASE_DGZJ_TEMP").val(0);
                    } else {
                        //计算出实际导轨支架
                        var dgzj_sj = Math.ceil((jdzg_sj / qgljj_sj) + 1);
                        price = (dgzj_sj - dgzj_std) * 310;
                        if (dgzj_sj > dgzj_std) {
                            $("#BASE_DGZJ").val(dgzj_sj);
                            if (price > 0) {
                                $("#BASE_DGZJ_TEMP").val(price * sl_);
                            } else {
                                $("#BASE_DGZJ_TEMP").val(0);
                            }
                        } else {
                            $("#BASE_DGZJ").val(dgzj_std);
                            if (price > 0) {
                                $("#BASE_DGZJ_TEMP").val(price * sl_);
                            } else {
                                $("#BASE_DGZJ_TEMP").val(0);
                            }
                        }
                    }

                    //放入价格
                    countZhj();
                }

            });
    }

    //可选功能部分加价
    function editOpt(option, isRefresh) {
        //数量
        var sl_ = $("#FEIYUEMRL_SL").val() == "" ? 0 : parseInt_DN($("#FEIYUEMRL_SL").val());
        //价格
        var price = 0;
        if (option == "OPT_LTBL") {
            //两台并联
            if ($("#OPT_LTBL_TEXT").is(":checked")) {
                price = 240 * sl_;
            } else {
                price = 0;
            }
            $("#OPT_LTBL_TEMP").val(price);
        } else if (option == "OPT_TDJJJY") {
            //停电紧急救援
            if ($("#OPT_TDJJJY_TEXT").is(":checked")) {
                price = 7300 * sl_;
            } else {
                price = 0;
            }
            $("#OPT_TDJJJY_TEMP").val(price);
        } else if (option == "OPT_JXDZZ") {
            //轿厢到站钟
            if ($("#OPT_JXDZZ_TEXT").is(":checked")) {
                price = 200 * sl_;
            } else {
                price = 0;
            }
            $("#OPT_JXDZZ_TEMP").val(price);
        } else if (option == "OPT_SJCZ") {
            //司机操作
            if ($("#OPT_SJCZ_TEXT").is(":checked")) {
                price = 0;
            } else {
                price = 0;
            }
            $("#OPT_SJCZ_TEMP").val(price);
        } else if (option == "OPT_CCTVDL") {
            //CCTV电缆(轿厢到机房)
            if ($("#OPT_CCTVDL_TEXT").is(":checked")) {
                var tsgd_ = parseInt_DN($("#BASE_TSGD").val());
                if (!tsgd_ > 0) {
                    alert("请填写基础参数的提升高度!");
                } else {
                    price = 17 * (tsgd_ / 1000 + 15) * sl_;
                }

            } else {
                price = 0;
            }
            price = parseFloat(price.toFixed(4));
            $("#OPT_CCTVDL_TEMP").val(price);
        } else if (option == "OPT_DJGRBH") {
            //电机过热保护
            if ($("#OPT_DJGRBH_TEXT").is(":checked")) {
                price = 650 * sl_;
            } else {
                price = 0;
            }
            $("#OPT_DJGRBH_TEMP").val(price);
        } else if (option == "OPT_BAJK") {
            //BA接口
            if ($("#OPT_BAJK_TEXT").is(":checked")) {
                price = 650 * sl_;
            } else {
                price = 0;
            }
            $("#OPT_BAJK_TEMP").val(price);
        } else if (option == "OPT_MBCAN") {
            //门保持按钮
            if ($("#OPT_MBCAN_TEXT").is(":checked")) {
                price = 0;
            } else {
                price = 0;
            }
            $("#OPT_MBCAN_TEMP").val(price);
        } else if (option == "OPT_KMZPC") {
            //开门再平层
            var sd_ = $("#BZ_SD").val();
            if ($("#OPT_KMZPC_TEXT").is(":checked")) {
                if (sd_ != "2.0" && sd_ != "" && !isNaN(sd_)) {
                    price = 2300 * sl_;
                }
                else {
                    price = 0;
                }
            } else {
                price = 0;
            }
            $("#OPT_KMZPC_TEMP").val(price);
        } else if (option == "OPT_QPGM") {
            //强迫关门
            if ($("#OPT_QPGM_TEXT").is(":checked")) {
                price = 0;
            } else {
                price = 0;
            }
            $("#OPT_QPGM_TEMP").val(price);
        } else if (option == "OPT_YCJK") {
            //远程监控(物联网系统)
            if ($("#OPT_YCJK_TEXT").is(":checked")) {
                price = 2880 * sl_;
            } else {
                price = 0;
            }
            $("#OPT_YCJK_TEMP").val(price);
        } else if (option == "OPT_JFGT") {
            //机房高台
            if ($("#OPT_JFGT_TEXT").is(":checked")) {
                price = 410 * sl_;
            } else {
                price = 0;
            }
            $("#OPT_JFGT_TEMP").val(price);
        } else if (option == "OPT_ICK") {
            //IC卡(轿内控制)
            if ($("#OPT_ICK").val() == "刷卡后手动选择到达楼层") {
                price = 1920 * sl_;
            } else if ($("#OPT_ICK").val() == "刷卡后自动选择到达楼层") {
                price = 4040 * sl_;
            } else {
                price = 0;
            }
            $("#OPT_ICK_TEMP").val(price);
        } else if (option == "OPT_ICKZKSB") {
            //IC卡制卡设备
            if ($("#OPT_ICKZKSB_TEXT").is(":checked")) {
                var itemId = $("#ITEM_ID").val();
                var codId = $("#FEIYUEMRL_ID").val();
                $.post("<%=basePath%>e_offer/zksbjj",
                    {
                        "item_id": itemId,
                        "codId": codId
                    }, function (result) {
                        if (result.msg == "yes") {
                            $("#OPT_ICKZKSB_TEMP").val(1400);
                            countZhj();
                        }
                        else {
                            $("#OPT_ICKZKSB_TEMP").val(0);
                            countZhj();
                        }
                    });
            } else {
                $("#OPT_ICKZKSB_TEMP").val(0);
                countZhj();
            }
        } else if (option == "OPT_ICKKP") {
            //IC卡卡片
            if (!isNaN(parseInt_DN($("#OPT_ICKKP").val()))) {
                price = parseInt_DN($("#OPT_ICKKP").val()) * 12;
            } else {
                price = 0;
            }
            $("#OPT_ICKKP_TEMP").val(price);
        } else if (option == "OPT_GTMJXJMBF") {
            //贯通门(轿厢轿门部分)
            if ($("#OPT_GTMJXJMBF_TEXT").is(":checked")) {
                var zz_ = $("#BZ_ZZ").val();
                if (zz_ == "630" || zz_ == "800") {
                    price = 13000 * sl_;
                } else if (zz_ == "1000") {
                    price = 13900 * sl_;
                } else {
                    price = 0;
                }
            } else {
                price = 0;
            }
            $("#OPT_GTMJXJMBF_TEMP").val(price);
        } else if (option == "OPT_GTMTMBF") {
            //贯通门(厅门部分)
            var zz_ = $("#BZ_ZZ").val();
            var gtms = $("#OPT_GTMS").val();
            if ($("#OPT_GTMTMBF").val() == "发纹不锈钢") {
                if (zz_ == "630" || zz_ == "800") {
                    price = 2760 * sl_;
                } else if (zz_ == "1000") {
                    price = 3230 * sl_;
                } else {
                    price = 0;
                }
            } else if ($("#OPT_GTMTMBF").val() == "喷涂") {
                if (zz_ == "630" || zz_ == "800") {
                    price = 1785 * sl_;
                } else if (zz_ == "1000") {
                    price = 2040 * sl_;
                } else {
                    price = 0;
                }
            } else {
                price = 0;
            }
            $("#OPT_GTMTMBF_TEMP").val(price * gtms);
        }
        if (isRefresh != '1') {
            //放入价格
            countZhj();
        }
    }

    //单组监控室对讲系统-切换选中
    function Djtxfs_XZ() {
        $("#DZJKSDJXT_DJTS_TEMP").val('');
        $("#DZJKSDJXT_DJTS").val('');

    }

//     //单组监控室对讲系统-加价
//     function editDzjksdjxt() {
//         var djts = parseInt_DN($("#DZJKSDJXT_DJTS").val());
//         var price = 0;
//         if (!isNaN(djts)) {
//             if (djts >= 10) {
//                 price = 0;
//             }
//             else {
//                 if ($("input[name='DZJKSDJXT_DJTXFS']:checked").val() == "无线制") {
//                     price = 3570 + (2330 * djts);
//                 } else if ($("input[name='DZJKSDJXT_DJTXFS']:checked").val() == "总线制") {
//                     price = 4080 + (720 * djts);
//                 }
//             }
//             $("#DZJKSDJXT_DJTS_TEMP").val(price);
//             //放入价格
//             countZhj();
//         }
//         $("#DZJKSDJXT_DJTS_TEMP").val(price);
//     }
    
    //NEW 单组监控室对讲系统-加价
    function editDzjksdjxt(){
    	var djts=parseInt_DN($("#DZJKSDJXT_DJTS").val());
    	var price = 0;
    	if(!isNaN(djts))
    	{
            //if(djts>=10)
            //{
            //	price = 0;
            //}
            //else
            //{
            	if($("input[name='DZJKSDJXT_DJTXFS']:checked").val()=="无线制"){
            		price = 3570+(2330*djts);
                }else if($("input[name='DZJKSDJXT_DJTXFS']:checked").val()=="总线制"){
                	if(djts<=10){
                		price = "十台以下请非标询价";
                	} else {
                		//10台以上总线免费
                		price = 0;
// 	                	price = 4080+(720*djts);
                	}
                }
            //}
            $("#DZJKSDJXT_DJTS_TEMP").val(price);
            //放入价格
            countZhj();
    	}
    	$("#DZJKSDJXT_DJTS_TEMP").val(price);
    }



    //轿厢装潢部分-加价
    function editJxzh(option, isRefresh) {
        //数量
        var sl_ = $("#FEIYUEMRL_SL").val() == "" ? 0 : parseInt_DN($("#FEIYUEMRL_SL").val());
        //价格
        var price = 0;
        if (option == "JXZH_JMZH") {
            //轿门装潢
            var jmzh_ = $("#JXZH_JMZH").val();
            if (jmzh_ != "喷涂") {
                $("#JXZH_JMSBH").val("");
                $("#JXZH_JMSBH").attr("disabled", "disabled");
            }
            else {
                $('#JXZH_JMSBH').removeAttr("disabled");
            }

            var kmkd_ = $("#BZ_KMKD").val();  //开门宽度

            if (jmzh_ == "JF-K-C01" || jmzh_ == "发纹不锈钢") {
                price = 0;
            } else if (jmzh_ == "JF-K-C02" || jmzh_ == "JF-K-C03") {
                price = 2950 * sl_;
            } else if (jmzh_ == "JF-K-C04" || jmzh_ == "JF-K-C05" || jmzh_ == "JF-K-C06" || jmzh_ == "JF-K-C07") {
                price = 3420 * sl_;
            } else if (jmzh_ == "喷涂") {
                if (kmkd_ == "800") {
                    price = -580 * sl_;
                } else if (kmkd_ == "900") {
                    price = -680 * sl_;
                }
            } else if (jmzh_ == "镜面不锈钢") {
                if (kmkd_ == "800") {
                    price = 1340 * sl_;
                } else if (kmkd_ == "900") {
                    price = 1380 * sl_;
                }
            }
            $("#JXZH_JM_TEMP").val(price);
        } else if (option == "JXZH_JXZH") {
            //轿厢装潢
            var jxzh_ = $("#JXZH_JXZH").val();
            if (jxzh_ == "JF-K-JX-01") {
                price = 0;
            } else if (jxzh_ == "JF-K-JX-02") {
                price = 19100 * sl_;
            } else if (jxzh_ == "JF-K-JX-03") {
                price = 27500 * sl_;
            } else if (jxzh_ == "JF-K-JX-04") {
                price = 33200 * sl_;
            } else if (jxzh_ == "JF-K-JX-05") {
                price = 16000 * sl_;
            } else if (jxzh_ == "JF-K-JX-06") {
                price = 25100 * sl_;
            } else if (jxzh_ == "JF-K-JX-07") {
                price = 22700 * sl_;
            } else if (jxzh_ == "JF-K-JX-08") {
                price = 32700 * sl_;
            } else if (jxzh_ == "JF-K-JX-09") {
                price = 13200 * sl_;
            } else if (jxzh_ == "JF-K-JX-10") {
                price = 19600 * sl_;
            } else if (jxzh_ == "JF-K-JX-11") {
                price = 19600 * sl_;
            }
            $("#JXZH_JXZH_TEMP").val(price);
        }else if(option=="JXZH_JM_quxiao"){
        	$("input[name='JXZH_JM']:checked").removeAttr("checked");
        	$("input[name='JXZH_QWB']:checked").removeAttr("checked");
        	$("input[name='JXZH_CWB']:checked").removeAttr("checked");
        	$("input[name='JXZH_HWB']:checked").removeAttr("checked");
        	$("#JXZH_JM_TEMP").val(0);
        	$("#JXZH_QWB_TEMP").val(0);
        } else if (option == "JXZH_QWB") {
            //前围壁
            var qwb_ = $("input[name='JXZH_QWB']:checked").val();
            var zz_ = $("#BZ_ZZ").val();//载重
            if (qwb_ == "喷涂") {
                var cwb_pt = $("input[id='JXZH_CWB_PT']:checked").val();
                var hwb_pt = $("input[id='JXZH_HWB_PT']:checked").val();
                if (cwb_pt == "喷涂" && hwb_pt == "喷涂") {
                    if (zz_ == "630") {
                        price = -2450 * sl_;
                    } else if (zz_ == "800") {
                        price = -2700 * sl_;
                    } else if (zz_ == "1000") {
                        price = -2800 * sl_;
                    } else if (zz_ == "1150") {
                        price = -2900 * sl_;
                    }
                } else {
                    price = 0;
                }

            } else if (qwb_ == "发纹不锈钢") {
                var cwb_fw = $("input[id='JXZH_CWB_FW']:checked").val();
                var hwb_fw = $("input[id='JXZH_HWB_FW']:checked").val();
                if (cwb_fw == "发纹不锈钢" && hwb_fw == "发纹不锈钢") {
                    price = 0;
                } else {
                    price = 0;
                }
            } else if (qwb_ == "镜面不锈钢") {
                var cwb_jm = $("input[id='JXZH_CWB_JM']:checked").val();
                var hwb_jm = $("input[id='JXZH_HWB_JM']:checked").val();
                if (cwb_jm == "镜面不锈钢" && hwb_jm == "镜面不锈钢") {
                    if (zz_ == "630") {
                        price = 6840 * sl_;
                    } else if (zz_ == "800") {
                        price = 6840 * sl_;
                    } else if (zz_ == "1000") {
                        price = 6840 * sl_;
                    } else if (zz_ == "1150") {
                        price = 7080 * sl_;
                    }
                } else {
                    price = 0;
                }
            }
            $("#JXZH_QWB_TEMP").val(price);
        } else if (option == "JXZH_CWB") {
            //侧围壁
            var cwb_ = $("input[name='JXZH_CWB']:checked").val();
            var zz_ = $("#BZ_ZZ").val();//载重
            if (cwb_ == "喷涂") {
                var qwb_pt = $("input[id='JXZH_QWB_PT']:checked").val();
                var hwb_pt = $("input[id='JXZH_HWB_PT']:checked").val();
                if (qwb_pt == "喷涂" && hwb_pt == "喷涂") {
                    if (zz_ == "630") {
                        price = -2450 * sl_;
                    } else if (zz_ == "800") {
                        price = -2700 * sl_;
                    } else if (zz_ == "1000") {
                        price = -2800 * sl_;
                    } else if (zz_ == "1150") {
                        price = -2900 * sl_;
                    }
                } else {
                    price = 0;
                }
            } else if (cwb_ == "发纹不锈钢") {
                var qwb_fw = $("input[id='JXZH_QWB_FW']:checked").val();
                var hwb_fw = $("input[id='JXZH_HWB_FW']:checked").val();
                if (qwb_fw == "发纹不锈钢" && hwb_fw == "发纹不锈钢") {
                    price = 0;
                } else {
                    price = 0;
                }
            } else if (cwb_ == "镜面不锈钢") {
                var qwb_jm = $("input[id='JXZH_QWB_JM']:checked").val();
                var hwb_jm = $("input[id='JXZH_HWB_JM']:checked").val();
                if (qwb_jm == "镜面不锈钢" && hwb_jm == "镜面不锈钢") {
                    if (zz_ == "630") {
                        price = 6840 * sl_;
                    } else if (zz_ == "800") {
                        price = 6840 * sl_;
                    } else if (zz_ == "1000") {
                        price = 6840 * sl_;
                    } else if (zz_ == "1150") {
                        price = 7080 * sl_;
                    }
                } else {
                    price = 0;
                }
            }
            $("#JXZH_QWB_TEMP").val(price);
        } else if (option == "JXZH_HWB") {
            //后围壁
            var hwb_ = $("input[name='JXZH_HWB']:checked").val();
            var zz_ = $("#BZ_ZZ").val();//载重
            if (hwb_ == "喷涂") {
                var qwb_pt = $("input[id='JXZH_QWB_PT']:checked").val();
                var cwb_pt = $("input[id='JXZH_CWB_PT']:checked").val();
                if (qwb_pt == "喷涂" && cwb_pt == "喷涂") {
                    if (zz_ == "630") {
                        price = -2450 * sl_;
                    } else if (zz_ == "800") {
                        price = -2700 * sl_;
                    } else if (zz_ == "1000") {
                        price = -2800 * sl_;
                    } else if (zz_ == "1150") {
                        price = -2900 * sl_;
                    }
                } else {
                    price = 0;
                }

            } else if (hwb_ == "发纹不锈钢") {
                var qwb_fw = $("input[id='JXZH_QWB_FW']:checked").val();
                var cwb_fw = $("input[id='JXZH_CWB_FW']:checked").val();
                if (qwb_fw == "发纹不锈钢" && cwb_fw == "发纹不锈钢") {
                    price = 0;
                } else {
                    price = 0;
                }
            } else if (hwb_ == "镜面不锈钢") {
                var qwb_jm = $("input[id='JXZH_QWB_JM']:checked").val();
                var cwb_jm = $("input[id='JXZH_CWB_JM']:checked").val();
                if (qwb_jm == "镜面不锈钢" && cwb_jm == "镜面不锈钢") {
                    if (zz_ == "630") {
                        price = 6840 * sl_;
                    } else if (zz_ == "800") {
                        price = 6840 * sl_;
                    } else if (zz_ == "1000") {
                        price = 6840 * sl_;
                    } else if (zz_ == "1150") {
                        price = 7080 * sl_;
                    }
                } else {
                    price = 0;
                }
            }
            $("#JXZH_QWB_TEMP").val(price);
        } else if (option == "JXZH_ZSDD") {
            //轿顶装潢-装饰吊顶
            var zsdd_ = $("select[name='JXZH_ZSDD']").val();
            var zz_ = $("#BZ_ZZ").val();//载重
            if (zsdd_ == "JF-CL-01") {
                if (zz_ == "450") {
                    price = -380 * sl_;
                } else if (zz_ == "630") {
                    price = -540 * sl_;
                } else if (zz_ == "800") {
                    price = -620 * sl_;
                } else if (zz_ == "1000") {
                    price = -710 * sl_;
                }
            } else if (zsdd_ == "JF-CL-02") {
                if (zz_ == "450") {
                    price = -380 * sl_;
                } else if (zz_ == "630") {
                    price = -540 * sl_;
                } else if (zz_ == "800") {
                    price = -620 * sl_;
                } else if (zz_ == "1000") {
                    price = -710 * sl_;
                }
            } else if (zsdd_ == "JF-CL-03") {
                if (zz_ == "450") {
                    price = -380 * sl_;
                } else if (zz_ == "630") {
                    price = -540 * sl_;
                } else if (zz_ == "800") {
                    price = -620 * sl_;
                } else if (zz_ == "1000") {
                    price = -710 * sl_;
                }
            } else if (zsdd_ == "JF-CL-04") {
                if (zz_ == "450") {
                    price = 330 * sl_;
                } else if (zz_ == "630") {
                    price = -540 * sl_;
                } else if (zz_ == "800") {
                    price = -620 * sl_;
                } else if (zz_ == "1000") {
                    price = -710 * sl_;
                }
            } else if (zsdd_ == "JF-CL-21") {
                if (zz_ == "450") {
                    price = 240 * sl_;
                } else if (zz_ == "630") {
                    price = 240 * sl_;
                } else if (zz_ == "800") {
                    price = 240 * sl_;
                } else if (zz_ == "1000") {
                    price = 240 * sl_;
                } else if (zz_ == "1350") {
                    price = 280 * sl_;
                } else if (zz_ == "1600") {
                    price = 390 * sl_;
                } else if (zz_ == "2000") {
                    price = 510 * sl_;
                }
            }
            $("#JXZH_ZSDD_TEMP").val(price);
        } else if (option == "JXZH_AQC") {
            //安全窗
            var aqc_ = $("input[name='JXZH_AQC']:checked").val();
            if (aqc_ == "有") {
                price = 1300 * sl_;
            } else if (aqc_ == "无") {
                price = 0;
            }
            $("#JXZH_AQC_TEMP").val(price);
        } else if (option == "JXZH_BGJ") {
            //半高镜
            var bgj_ = $("input[name='JXZH_BGJ']:checked").val();
            if (bgj_ == "有") {
                var zz_ = $("#BZ_ZZ").val();  //载重
                if (zz_ == "630") {
                    price = 980 * sl_;
                } else if (zz_ == "800") {
                    price = 980 * sl_;
                } else if (zz_ == "1000") {
                    price = 1300 * sl_;
                }
            } else if (bgj_ == "无") {
                price = 0;
            }
            $("#JXZH_BGJ_TEMP").val(price);
        }  else if (option == "JXZH_HBJMBXG") {
            //后壁镜面不锈钢
            var hbjm_ = $("input[name='JXZH_HBJMBXG']:checked").val();
            if (hbjm_ == "有") {
            	price = 2000 * sl_;
            } else if (hbjm_ == "无") {
                price = 0;
            }
            $("#JXZH_HBJMBXG_TEMP").val(price);
        }else if (option == "JXZH_YLZHZL") {
            //预留装潢重量
            var ylzhzl_ = parseInt_DN($("#JXZH_YLZHZL").val());
            var zz_ = $("#BZ_ZZ").val();  //载重
            if (zz_ == "630") {
                if (ylzhzl_ <= 200) {
                    price = 730 * sl_;
                }
                else {
                    if (!isNaN(ylzhzl_)) {
                        alert("预留装潢重量超出最大允许值，请通过非标询价。");
                        $("#JXZH_YLZHZL").val("");
                    }
                }
            } else if (zz_ == "800") {
                if (ylzhzl_ <= 200) {
                    price = 900 * sl_;
                }
                else {
                    if (!isNaN(ylzhzl_)) {
                        alert("预留装潢重量超出最大允许值，请通过非标询价。");
                        $("#JXZH_YLZHZL").val("");
                    }
                }
            } else if (zz_ == "1000") {
                if (ylzhzl_ <= 200) {
                    price = 1100 * sl_;
                }
                else {
                    if (!isNaN(ylzhzl_)) {
                        alert("预留装潢重量超出最大允许值，请通过非标询价。");
                        $("#JXZH_YLZHZL").val("");
                    }
                }
            }
            if (ylzhzl_ == "" || isNaN(ylzhzl_) || ylzhzl_ == 0) {
                price = 0;
            }

            $("#JXZH_YLZHZL_TEMP").val(price);
        } else if (option == "JXZH_FSXH") {
            //扶手型号
            var fsxh_ = $("#JXZH_FSXH_SELECT").val();
            if (fsxh_ == "JF-FS-01") {
                price = 650 * sl_;
                //扶手安装位置
                var fsazwz_sl = $("input:checkbox[name='JXZH_FSAZWZ']:checked").length;
                var price2 = parseInt_DN(fsazwz_sl) * price;
                $("#JXZH_FSAZWZ_TEMP").val(price2);
            } else if (fsxh_ == "JF-FS-02") {
                price = 490 * sl_;
                //扶手安装位置
                var fsazwz_sl = $("input:checkbox[name='JXZH_FSAZWZ']:checked").length;
                var price2 = parseInt_DN(fsazwz_sl) * price;
                $("#JXZH_FSAZWZ_TEMP").val(price2);
            } else if (fsxh_ == "JF-FS-03") {
                price = 490 * sl_;
                //扶手安装位置
                var fsazwz_sl = $("input:checkbox[name='JXZH_FSAZWZ']:checked").length;
                var price2 = parseInt_DN(fsazwz_sl) * price;
                $("#JXZH_FSAZWZ_TEMP").val(price2);
            } else if (fsxh_ == "JF-FS-04") {
                price = 520 * sl_;
                //扶手安装位置
                var fsazwz_sl = $("input:checkbox[name='JXZH_FSAZWZ']:checked").length;
                var price2 = parseInt_DN(fsazwz_sl) * price;
                $("#JXZH_FSAZWZ_TEMP").val(price2);
            } else if (fsxh_ == "JF-FS-05") {
                price = 900 * sl_;
                //扶手安装位置
                var fsazwz_sl = $("input:checkbox[name='JXZH_FSAZWZ']:checked").length;
                var price2 = parseInt_DN(fsazwz_sl) * price;
                $("#JXZH_FSAZWZ_TEMP").val(price2);
            } else {
                price = 0;
            }

            $("#JXZH_FSXH_TEMP").val(price);
        } else if (option == "JXZH_FSAZWZ") {
            //扶手安装位置
            var fsazwz_sl = $("input:checkbox[name='JXZH_FSAZWZ']:checked").length;
            //单价
            var dj_ = parseInt_DN($("#JXZH_FSXH_TEMP").val());
            if (dj_ > 0) {
                price = parseInt_DN(fsazwz_sl) * dj_;
                $("#JXZH_FSAZWZ_TEMP").val(price);
            } else {
                $("#JXZH_FSAZWZ_TEMP").val(0);
            }

        }
        if (isRefresh != '1') {
            //放入价格
            countZhj();
        }
    }

    //厅门门套部分-加价
    function editTmmt(option, isRefresh) {
        //数量
        var sl_ = $("#FEIYUEMRL_SL").val() == "" ? 0 : parseInt_DN($("#FEIYUEMRL_SL").val());
        var scmk_ = $("#TMMT_SCMK").val();//首层门框
        var qycmk_ = $("#TMMT_QYCMK").val();//其余层门框
        var kmkd_ = $("#BZ_KMKD").val();//开门宽度 
        var scmkts_ = parseInt_DN($("#TMMT_SCMKTS").val());//首层门框套数
        var qycts_ = parseInt_DN($("#TMMT_QYCTS").val());//其余层套数
        var sctmts_ = parseInt_DN($("#TMMT_SCTMTS").val());//首层厅门套数
        var qyctmts = parseInt_DN($("#TMMT_QYCTMTS").val());//其余层厅门套数
        
        var c_ = parseInt_DN($("#BZ_C").val());//层
        var m_ = parseInt_DN($("#BZ_M").val());//门
        //价格
        var price = 0;
        if (option == "TMMT_SCMK") {
            $("#TMMT_SCMKCZ").val("");
            $("#TMMT_SCMKGBSBH").val("");
            $("#TMMT_SCMKCZ_TEMP").val("");
        }
        else if (option == "TMMT_SCMKCZ") {
            //首层门框材质
            var scmkcz_ = $("#TMMT_SCMKCZ").val();
            if (scmk_ == "小门框") {
                if (scmkcz_ == "钢板喷涂") {
                	//首层门框钢板喷涂，减一套价格。2018-12-13
                    if (kmkd_ == "800") {
                    	price = -200* (scmkts_ - 1) * sl_;
                    } else if (kmkd_ == "900") {
                    	price = -260* (scmkts_ - 1) * sl_;
                    }
                    $("#TMMT_SCMKCZ_TEMP").attr("style","color:black;");
                } else if (scmkcz_ == "镜面不锈钢") {
                	$("#TMMT_SCMKCZ_TEMP").attr("style","color:red;");
                	price = "请非标询价";
                } else if (scmkcz_ == "发纹不锈钢") {
                	//首层门框标配发纹不锈钢，不加价。2018-12-13
                	 /* if (kmkd_ == "800") {
                		 //价格乘套数-1*台数
                         price = 200* scmkts_ * sl_;
                     } else if (kmkd_ == "900") {
                    	 price = 260* scmkts_ * sl_;
                     } */
                	 $("#TMMT_SCMKCZ_TEMP").attr("style","color:black;");
                }
            } else if (scmk_ == "大门框") {
                if (scmkcz_ == "发纹不锈钢") {
                    if (kmkd_ == "800") {
                        price = 1700 * sl_ * scmkts_;
                    } else if (kmkd_ == "900") {
                        price = 1790 * sl_ * scmkts_;
                    }
                } else if (scmkcz_ == "镜面不锈钢") {
                    if (kmkd_ == "800") {
                        price = 2760 * sl_ * scmkts_;
                    } else if (kmkd_ == "900") {
                        price = 2990 * sl_ * scmkts_;
                    }
                } else if (scmkcz_ == "钢板喷涂") {
                    if (kmkd_ == "800") {
                        price = 1000 * sl_ * scmkts_;
                    } else if (kmkd_ == "900") {
                        price = 1090 * sl_ * scmkts_;
                    }
                }
            }
            $("#TMMT_SCMKCZ_TEMP").val(price);
        } else if (option == "TMMT_QYCMKCZ") {
            //其余层门框
            var qycmkcz_ = $("#TMMT_QYCMKCZ").val();
            if (qycmk_ == "小门框") {
                if (qycmkcz_ == "发纹不锈钢") {
                    if (kmkd_ == "800") {
                        price = 200 * qycts_ * sl_
                    } else if (kmkd_ == "900") {
                        price = 260 * qycts_ * sl_
                    }
                    $("#TMMT_QYCMKCZ_TEMP").attr("style","color:black;");
                } else if (qycmkcz_ == "钢板喷涂" && qycmkcz_!="") {
                	//喷涂不加价
                	price = 0;
                }else{
					price = "请非标询价"
					$("#TMMT_QYCMKCZ_TEMP").attr("style","color:red;");
                }
            } else if (qycmk_ == "大门框") {
            	//标配喷涂，当选择发纹不锈钢及镜面不锈钢均需加价,镜面不锈钢非标询价
                if (qycmkcz_ == "发纹不锈钢") {
                    if (kmkd_ == "800") {
                        price = 1700 * sl_ * qycts_;
                    } else if (kmkd_ == "900") {
                        price = 1790 * sl_ * qycts_;
                    }
                    $("#TMMT_QYCMKCZ_TEMP").attr("style","color:black;");
                } else if (qycmkcz_ == "镜面不锈钢") {
                   	price = "请非标询价";
					$("#TMMT_QYCMKCZ_TEMP").attr("style","color:red;");
                } else if (qycmkcz_ == "钢板喷涂") {
                    if (kmkd_ == "800") {
                        price = 1000 * sl_ * qycts_;
                    } else if (kmkd_ == "900") {
                        price = 1090 * sl_ * qycts_;
                    }
                    $("#TMMT_QYCMKCZ_TEMP").attr("style","color:black;");
                }
            }
            $("#TMMT_QYCMKCZ_TEMP").val(price);
        } else if (option == "TMMT_SCTMCZ") {
            //首层厅门材质
            var sctmcz = $("#TMMT_SCTMCZ").val();
            if (sctmcz == "发纹不锈钢") {
                //if(kmkd_ == "800" && sctmts_>0) {
                	//price = 690 * sctmts_ * sl_;
                //} else if (kmkd_ == "900" && sctmts_>0 ) {
                	//price = 830 * sctmts_ * sl_;
                //}
                $("#TMMT_SCTMCZ_TEMP").attr("style","color:black;");
				//首层标配发纹不锈钢，不加价。2018-12-05,ghj
				price=0;
            }
            else if (sctmcz == "钢板喷涂") {
            	//首层厅门钢板喷涂，减一套价格。2018-12-13
            	if (kmkd_ == "800" && sctmts_>0) {
                	price = -690 * (sctmts_ - 1) * sl_;
                } else if (kmkd_ == "900" && sctmts_>0 ) {
                	price = -830 * (sctmts_ - 1) * sl_;
                }
            	$("#TMMT_SCTMCZ_TEMP").attr("style","color:black;");
            } else {
            	price = "请非标询价"
                $("#TMMT_SCTMCZ_TEMP").attr("style","color:red;");
            }
            $("#TMMT_SCTMCZ_TEMP").val(price);
        } else if (option == "TMMT_QYCTMCZ") {
            var qytmcz = $("#TMMT_QYCTMCZ").val();
            //其余层厅门材质
            if (qytmcz != "") {
                var qyctmcz = $("#TMMT_QYCTMCZ").val();
                if (qyctmcz == "钢板喷涂") {
                    price = 0;
                    $("#TMMT_QYCTMCZ_TEMP").attr("style","color:black;");
                }
                else if(qyctmcz == "发纹不锈钢"){
                    if (kmkd_ == "800"&& qyctmts > 0) {
                        price = 690 * qyctmts * sl_;
                    } else if (kmkd_ == "900") {
                    	price = 690 * qyctmts * sl_;
                    }
                    $("#TMMT_QYCTMCZ_TEMP").attr("style","color:black;");
                }
                else{
                	price = "请非标询价";
                    $("#TMMT_QYCTMCZ_TEMP").attr("style","color:red;");
                }
            }
            $("#TMMT_QYCTMCZ_TEMP").val(price);
        }
        if (isRefresh != '1') {
            //放入价格
            countZhj();
        }
    }


    //操纵盘-加价
    function editCzp(option) {
        var sl_ = parseInt_DN($("#FEIYUEMRL_SL").val());
        var price = 0;
        if (option == "CZP_CZPXH") {
            var xh_ = $("input[name='CZP_CZPXH']:checked").val();
            if (xh_ == "JFCOP09H-D1") {
                //操纵盘显示
                var price_xs = 0;
                var xs_ = $("select[name='CZP_XS_SUB']").val();
                if (xs_ == "真彩液晶图片显示7寸") {
                    price_xs = 1300 * sl_;
                } else if (xs_ == "真彩液晶图片显示10寸") {
                    price_xs = 2000 * sl_;
                } else if (xs_ == "真彩液晶多媒体显示10.4寸") {
                    price_xs = 6580 * sl_;
                } else {
                    price_xs = 0;
                }
                $("#CZP_XS_TEMP").val(price_xs);
                //操纵盘按钮
                var price_an = 0;
                var an_ = $("select[name='CZP_AN']").val();
                if (an_ == "金属红光带字牌按钮") {
                    price_an = 31 * sl_;
                } else {
                    price_an = 0;
                }
                $("#CZP_AN_TEMP").val(price_an);
                //材质
                var price_cz = 0;
                var cz_ = $("select[name='CZP_CZ']").val();
                if (cz_ == "镜面不锈钢") {
                    price_cz = 500 * sl_;
                } else if (cz_ == "钛金不锈钢") {
                    price_cz = 700 * sl_;
                }
                price = price_xs + price_an + price_cz;
                $("#CZP_CZPXH_TEMP").val(price);
            } else if (xh_ == "JFCOP09H-D") {
                price = -500 * sl_;
                $("#CZP_CZPXH_TEMP").val(price);
            }
        }
        //放入价格
        countZhj();
    }

    //厅门信号装置-加价
    function editTmxhzz(option) {
        var sl_ = $("#FEIYUEMRL_SL").val();
        var price = 0;
        if (option == "TMXHZZ_CZ") {
            //材质
            cz_ = $("select[name='TMXHZZ_CZ']").val();
            if (cz_ == "镜面不锈钢") {
                price = 25 * sl_;
            } else if (cz_ == "钛金不锈钢") {
                price = 50 * sl_;
            }
            $("#TMXHZZ_CZ_TEMP").val(price);
        }
        else if (option == "TMXHZZ_CZ_2") {
            //材质
            cz_ = $("#TMXHZZ_CZ_2").val();
            if (cz_ == "镜面不锈钢") {
                price = 25 * sl_;
            } else if (cz_ == "钛金不锈钢") {
                price = 50 * sl_;
            }
            $("#TMXHZZ_CZ_TEMP").val(price);
        } else if (option == "TMXHZZ_GBSCJRCZX") {
            //挂壁式残疾人操纵箱
            if ($("#TMXHZZ_GBSCJRCZX").val() == "壁挂式") {
                var c_ = parseInt_DN($("#BZ_C").val());
                if (c_ <= 16) {
                    price = 2900 * sl_;
                } else if (c_ <= 30) {
                    price = 4100 * sl_;
                }
                $("#TMXHZZ_GBSCJRCZX_TEMP").attr("style","color:black;");
            } else {
                price = "请非标询价";
                $("#TMXHZZ_GBSCJRCZX_TEMP").attr("style","color:red;");
//                 alert("请非标询价");
            }
            $("#TMXHZZ_GBSCJRCZX_TEMP").val(price);
        }
        //放入价格
        countZhj();
    }


    //--
    //运输价格部分
    //隐藏DIV
    function hideDiv() {
        var trans_type = $("#trans_type").val();
        if (trans_type == "1") {
            $("#ld").hide();
            $("#zc").show();
            $("#qy").show();
            $("#trans_price").attr('disabled', false);
        } else if (trans_type == "2") {
            $("#zc").hide();
            $("#ld").show();
            $("#qy").show();
            $("#trans_price").attr('disabled', false);
        } else if (trans_type == "3") {
            $("#zc").hide();
            $("#ld").hide();
            $("#qy").hide();
            $("#trans_price").val(0);
            $("#FEIYUEMRL_YSF").val(0);
            $("#XS_YSJ").val(0);
            $("#trans_price").attr('disabled', true);
        }
    }

    //设置城市
    function setCity() {
        var province_id = $("#province_id").val();
        if (province_id == "") {

        } else {
            $.post("<%=basePath%>e_offer/setCity",
                {
                    "province_id": province_id
                },
                function (data) {
                    $("#destin_id").empty();
                    $("#destin_id").append("<option value=''>请选择城市</option>");
                    $.each(data, function (key, value) {
                        $("#destin_id").append("<option value='" + value.id + "'>" + value.name + "</option>");
                    });
                }
            );
        }
    }

    //计算运输价格
    function setPriceTrans() {
        var transType = $("#trans_type").val();
        var province_id = $("#province_id").val();
        var destin_id = $("#destin_id").val();
        if (transType == "1") {//整车
            var zcStr = "[";
            $("#transTable tr").each(function () {
                var carType = $(this).find("td").eq("0").find("select").eq("0").val();
                var num = $(this).find("td").eq("1").find("input").eq("0").val();
                zcStr += "{\'carType\':\'" + carType + "\',\'num\':\'" + num + "\'},"
            });
            zcStr = zcStr.substring(0, zcStr.length - 1) + "]";
            $.post("<%=basePath%>e_offer/setPriceTrans",
                {
                    "zcStr": zcStr,
                    "province_id": province_id,
                    "city_id": destin_id,
                    "transType": transType
                },
                function (data) {
                    $("#trans_price").val(data.countPrice);
                    var transPrice = parseFloat(data.countPrice);
                    $("#FEIYUEMRL_YSF").val(transPrice);
                    $("#XS_YSJ").val(transPrice);
                    countZhj();
                    //计算总报价
                    jsTatol();
                }
            );
        } else if (transType == "2") {//零担
            var less_num = $("#less_num").val();
            $.post("<%=basePath%>e_offer/setPriceTrans",
                {
                    "province_id": province_id,
                    "city_id": destin_id,
                    "transType": transType,
                    "less_num": less_num
                },
                function (data) {
                    $("#trans_price").val(data.countPrice);
                    var transPrice = parseFloat(data.countPrice);
                    $("#FEIYUEMRL_YSF").val(transPrice);
                    $("#XS_YSJ").val(transPrice);
                    countZhj();
                    //计算总报价
                    jsTatol();
                }
            );
        }
        else {
            countZhj();
            //计算总报价
            jsTatol();
        }

    }


    function save() {
        if (validateIsInput()) {

//         	removeAttrDisabled();
        	
        	var index = layer.load(1);
        	var saveFlag = "1";
			$.ajax({
			    type: 'POST',
			    url: '<%=basePath%>e_offerdt/saveFeiyueMRL.do',
			    data: $("#feiyuemrlForm").dn2_serialize(getSelectDis())+"&saveFlag="+saveFlag,
			    dataType: "JSON",
			    success: function(data) {
			    	layer.close(index);
			    	if(data.code == 1){
			    		buildofferButton(data);
			    		layer.msg('保存成功', {icon: 1});
			    		CloseSUWin('ElevatorParam');
			    	} else {
			    		layer.msg('保存失败', {icon: 2});
			    	}
			    },
			    error: function(data) {
			    	layer.close(index);
			    	layer.msg('操作失败', {icon: 2});
			    }
			});
            
        }
    }

    function getFBLXJSON() {
    	return ${fns:getDictListJson('fbtype')};
    }
    
    function validateIsInput(){
    	//非空验证
        if ($("#XS_QTFY").val() == "" && $("#XS_QTFY").val() == "") {
            $("#XS_QTFY").focus();
            $("#XS_QTFY").tips({
                side: 3,
                msg: "请填写其他费用!",
                bg: '#AE81FF',
                time: 3
            });
            return false;
        }

        if ($("#XS_YJZE").val() == "" && $("#XS_YJZE").val() == "") {
            $("#XS_YJZE").focus();
            $("#XS_YJZE").tips({
                side: 3,
                msg: "请填写佣金费用!",
                bg: '#AE81FF',
                time: 3
            });
            return false;
        }

        if ($("#XS_CQSJDJ").val() == "" && $("#XS_CQSJDJ").val() == "") {
            $("#XS_CQSJDJ").focus();
            $("#XS_CQSJDJ").tips({
                side: 3,
                msg: "请填写草签实际单价!",
                bg: '#AE81FF',
                time: 3
            });
            return false;
        }

        if ($("#XS_YSJ").val() == "" && $("#XS_YSJ").val() == "") {
            $("#XS_YSJ").focus();
            $("#XS_YSJ").tips({
                side: 3,
                msg: "请录入运输价!",
                bg: '#AE81FF',
                time: 3
            });
            return false;
        }

        //new 全文NaN判断
        var ss = true;
        $("input[type='text']").each(function () {
            if ($(this).val() == "NaN") {
                $(this).focus();
                $(this).tips({
                    side: 3,
                    msg: "此项为NaN!请复查!",
                    bg: '#AE81FF',
                    time: 3
                });
                ss = false;
                return false;
            }
        })
        if (!ss) {
            return false;
        }
        
        if(!validateRequired()){
        	return false;
        }
        
      	//非标json
        $("#UNSTD").val(getJsonStrfb());

        $("#trans_more_car").val(formatTransJson());
        //设置checkbox选项值
        //可选功能部分

        if ($("#OPT_LTBL_TEXT").is(":checked")) {
            $("#OPT_LTBL").val("1");
        } else {
            $("#OPT_LTBL").val("0");
        }
        if ($("#OPT_TDJJJY_TEXT").is(":checked")) {
            $("#OPT_TDJJJY").val("1");
        } else {
            $("#OPT_TDJJJY").val("0");
        }
        if ($("#OPT_JXDZZ_TEXT").is(":checked")) {
            $("#OPT_JXDZZ").val("1");
        } else {
            $("#OPT_JXDZZ").val("0");
        }
        if ($("#OPT_SJCZ_TEXT").is(":checked")) {
            $("#OPT_SJCZ").val("1");
        } else {
            $("#OPT_SJCZ").val("0");
        }
        if ($("#OPT_CCTVDL_TEXT").is(":checked")) {
            $("#OPT_CCTVDL").val("1");
        } else {
            $("#OPT_CCTVDL").val("0");
        }
        if ($("#OPT_DJGRBH_TEXT").is(":checked")) {
            $("#OPT_DJGRBH").val("1");
        } else {
            $("#OPT_DJGRBH").val("0");
        }
        if ($("#OPT_BAJK_TEXT").is(":checked")) {
            $("#OPT_BAJK").val("1");
        } else {
            $("#OPT_BAJK").val("0");
        }
        if ($("#OPT_MBCAN_TEXT").is(":checked")) {
            $("#OPT_MBCAN").val("1");
        } else {
            $("#OPT_MBCAN").val("0");
        }
        if ($("#OPT_KMZPC_TEXT").is(":checked")) {
            $("#OPT_KMZPC").val("1");
        } else {
            $("#OPT_KMZPC").val("0");
        }
        if ($("#OPT_QPGM_TEXT").is(":checked")) {
            $("#OPT_QPGM").val("1");
        } else {
            $("#OPT_QPGM").val("0");
        }
        if ($("#OPT_YCJK_TEXT").is(":checked")) {
            $("#OPT_YCJK").val("1");
        } else {
            $("#OPT_YCJK").val("0");
        }
        if ($("#OPT_JFGT_TEXT").is(":checked")) {
            $("#OPT_JFGT").val("1");
        } else {
            $("#OPT_JFGT").val("0");
        }
        if ($("#OPT_ICKZKSB_TEXT").is(":checked")) {
            $("#OPT_ICKZKSB").val("1");
        } else {
            $("#OPT_ICKZKSB").val("0");
        }
        if ($("#OPT_GTMJXJMBF_TEXT").is(":checked")) {
            $("#OPT_GTMJXJMBF").val("1");
        } else {
            $("#OPT_GTMJXJMBF").val("0");
        }
        if ($("#OTHP_ISTSF").is(":checked")) {
            $("#OTHP_ISTSF_VAL").val("1");
        } else {
            $("#OTHP_ISTSF_VAL").val("0");
        }
        
        var BASE_MLXMBH = $("#BASE_MLXMBH_TEXT").val();
        $("#BASE_MLXMBH").val(BASE_MLXMBH);

        var BASE_JDCZQHD = $("#BASE_JDCZQHD_TEXT").val();
        $("#BASE_JDCZQHD").val(BASE_JDCZQHD);

        var JXZH_DBXH = $("#JXZH_DBXH_SELECT").val();
        $("#JXZH_DBXH").val(JXZH_DBXH);


        if ($("#CGFB_JXHL_TEXT").is(":checked")) {
            $("#CGFB_JXHL").val("1");
        } else {
            $("#CGFB_JXHL").val("0");
        }
        if ($("#CGFB_DZCZ_TEXT").is(":checked")) {
            $("#CGFB_DZCZ").val("1");
        } else {
            $("#CGFB_DZCZ_TEXT").val("0");
        }
        if ($("#CGFB_KMGD_TEXT").is(":checked")) {
            $("#CGFB_KMGD").val("1");
        } else {
            $("#CGFB_KMGD").val("0");
        }

        if ($("#CGFB_DKIP65_TEXT").is(":checked")) {
            $("#CGFB_DKIP65").val("1");
        } else {
            $("#CGFB_DKIP65").val("0");
        }
        if ($("#CGFB_PKM_TEXT").is(":checked")) {
            $("#CGFB_PKM").val("1");
        } else {
            $("#CGFB_PKM").val("0");
        }
        if ($("#CGFB_ZFSZAQB_TEXT").is(":checked")) {
            $("#CGFB_ZFSZAQB").val("1");
        } else {
            $("#CGFB_ZFSZAQB").val("0");
        }

        /* if($("#CGFB_JXCC_TEXT").is(":checked")){
            $("#CGFB_JXCC").val("1");
        }else{
            $("#CGFB_JXCC").val("0");
        } */
        if ($("#CGFB_JJFAJMK_TEXT").is(":checked")) {
            $("#CGFB_JJFAJMK").val("1");
        } else {
            $("#CGFB_JJFAJMK").val("0");
        }


        //扶手型号
        if ($("input[name='JXZH_FSXH']:checked").val() == "") {
            $("input[name='JXZH_FSXH']:checked").val($("#JXZH_FSXH_SELECT").val())
        }

        if ($("#JXZH_FSAZWZ_HWB").is(":checked")) {
            $("#JXZH_FSAZWZ_H").val("1");
        } else {
            $("#JXZH_FSAZWZ_H").val("0");
        }

        if ($("#JXZH_FSAZWZ_ZWB").is(":checked")) {
            $("#JXZH_FSAZWZ_Z").val("1");
        } else {
            $("#JXZH_FSAZWZ_Z").val("0");
        }

        if ($("#JXZH_FSAZWZ_YWB").is(":checked")) {
            $("#JXZH_FSAZWZ_Y").val("1");
        } else {
            $("#JXZH_FSAZWZ_Y").val("0");
        }

		return true;        
    }
    
    function saveOfAjax() {
    	if(validateIsInput()){
           var index = layer.load(1);
			$.ajax({
			    type: 'POST',
			    url: '<%=basePath%>e_offerdt/${msg}.do',
			    data: $("#feiyuemrlForm").dn2_serialize(getSelectDis()),
			    dataType: "JSON",
			    success: function(data) {
			    	layer.close(index);
			    	if(data.code == 1){
			    		updateId(data);
			    		buildofferButton(data);
			    		buildofferInfo(data);
			    		layer.msg('保存成功', {icon: 1});
			    	} else {
			    		layer.msg('保存失败', {icon: 2});
			    	}
			    },
			    error: function(data) {
			    	layer.close(index);
			    	layer.msg('操作失败', {icon: 2});
			    }
			});
    		
    	}
	}
    
    function updateId(data) {
		if($('#view').val() == 'save' && data){
			$('#view').val('edit');
			$('#FEIYUEMRL_ID').val(data.dtCodId);
			$('#BJC_ID').val(data.bjc_id);
		}
	}
    
    /**
    * 非标添加基价时更新单价
    **/
    function updateDANJIA(dj) {
    	if(isNaN(dj)){
    		dj = 0;
    	}
        var sl_ = $("#FEIYUEMRL_SL").val() == "" ? 0 : parseInt_DN($("#FEIYUEMRL_SL").val());
    	//setTimeout(function(){
			basisDate.fbdj = dj;
			$("#SBJ_TEMP").val(dj*sl_);
	        $("#DANJIA").val(dj);
            setMPrice();
            countZhj();
	    //},500);
	}
    
   /**
    * 非标删除基价时更新单价
    **/
    function updateDANJIAOfDelete() {
    	basisDate.fbdj = null;
    	setSbj();
 	}
    

    //计算设备实际报价
    function JS_SJBJ() {
        checkForm();
        var ShuiLv;//税率
        $.post("<%=basePath%>e_offer/getShuiLv",
            {
                "id": "1"
            }, function (result) {
                if (result.msg == "success") {
                    ShuiLv = result.pd.content;

                    //草签实际单价
                    var cqsjdj = $("#XS_CQSJDJ").val();
                    //数量
                    var sl = $("#FEIYUEMRL_SL").val();
                    //赋值给设备实际报价
                    $("#XS_SBSJBJ").val(cqsjdj * sl);

                    //计算折扣并赋值
                    var zkl;
                    var qtfy = $("#XS_QTFY").val() * ShuiLv;//其他费用
                    var yjze = $("#XS_YJZE").val() * ShuiLv;//佣金总额
                    var sjbj = $("#XS_SBSJBJ").val();//设备实际报价
                    var fbj = $("#XS_FBJ").val();//非标价
                    var jj = parseInt_DN($("#SBJ_TEMP").val());//基价
                    var xxjj = parseInt_DN($("#XS_XXJJ").val());//选项加价
                    var qtfya = getValueToFloat("#XS_QTFY");
                    var a = sjbj - fbj - qtfy - yjze;
                    var b = jj + xxjj;
                    zkl = a / b;
                    $("#XS_ZKL").val((zkl * 100).toFixed(1));

                    //计算佣金比例并赋值
                    var yjbl;
                    /* var c=sjbj-fbj-qtfy;
                    	yjbl=c/b;
                    	$("#XS_YJBL").val((yjbl*100).toFixed(1)); */
                    yjbl = $("#XS_YJZE").val() / (sjbj / ShuiLv);
                    $("#XS_YJBL").val((yjbl * 100).toFixed(1));

                    //计算佣金使用折扣率和最高佣金
                    var yjsyzkl;
                    var ZGYJ;
                    var ZGYJA;
                    // (实际报价-非标费-其他费用*1.16)/(基价+选项)
                    var c = sjbj - fbj - (qtfya * ShuiLv);
                    //alert(sjbj+'-'+fbj+'-('+qtfya+'*'+ShuiLv+')'+'/'+b);
                    yjsyzkl = c / b;
                    $("#YJSYZKL").val((yjsyzkl * 100).toFixed(1));

                    var yjsyzkla = $("#YJSYZKL").val() == "" ? 0 : parseInt_DN($("#YJSYZKL").val());
                    if (yjsyzkla <= 65) {
                        ZGYJ = sjbj * 0.04 / ShuiLv;
                        $("#ZGYJ").val((ZGYJ).toFixed(1));
                    } else if (yjsyzkla > 65 && yjsyzkla <= 70) {
                        ZGYJ = sjbj * 0.05 / ShuiLv;
                        $("#ZGYJ").val((ZGYJ).toFixed(1));
                    } else if (yjsyzkla > 70 && yjsyzkla <= 75) {
                        ZGYJ = sjbj * 0.06 / ShuiLv;
                        $("#ZGYJ").val((ZGYJ).toFixed(1));
                    } else if (yjsyzkla > 75) {
                        //((实际报价*6%)/1.16 +( (实际报价-非标-其他费用*1.16-(基价+选项)*85%)*50%)/1.16
                        ZGYJ = ((sjbj * 0.06) / ShuiLv + (sjbj - fbj - (qtfya * ShuiLv) - b * 0.85) * 0.5) / ShuiLv;
                        $("#ZGYJ").val((ZGYJ).toFixed(1));
                    }

                    //判断佣金是否超标并赋值
                    if (zkl * 100 <= 65) {
                        var q = (sjbj * 0.4) / ShuiLv;
                        if (yjze > q) {
                            $("#XS_SFCB").val("Y");
                        } else {
                            $("#XS_SFCB").val("N");
                        }
                    }
                    else if (66 <= zkl * 100 <= 70) {
                        var q = (sjbj * 0.5) / ShuiLv;
                        if (yjze > q) {
                            $("#XS_SFCB").val("Y");
                        } else {
                            $("#XS_SFCB").val("N");
                        }
                    }
                    else if (71 <= zkl * 100 <= 75) {
                        var q = (sjbj * 0.6) / ShuiLv;
                        if (yjze > q) {
                            $("#XS_SFCB").val("Y");
                        } else {
                            $("#XS_SFCB").val("N");
                        }
                    }
                    else if (zkl * 100 > 75) {
                        var q = (sjbj * 0.6) / ShuiLv;
                        var w = (jj + xxjj) * 0.85;
                        var e = sjbj - fbj - qtfy;
                        var r = (q + (e - w) * 0.5) / ShuiLv;
                        if (yjze > r) {
                            $("#XS_SFCB").val("Y");
                        } else {
                            $("#XS_SFCB").val("N");
                        }
                    }
                    //计算总报价
                    jsTatol();
                }
                else {
                    alert("存在异常，请联系管理员！");
                }

            });


    }
    
    //开门形式提示
    function SetKMXS(){
    	var kmxs_= $("#BZ_KMXS").val();
    	switch(kmxs_){
	    	case "左旁开":
				alert("旁开、中分双折需非标询价");
				break;
	    	case "右旁开":
				alert("旁开、中分双折需非标询价");
				break;
	    	case "中分双折":
				alert("旁开、中分双折需非标询价");
				break;
	    	default:
	    		break;
    	}
    }

    //计算总报价
    function jsTatol() {
        //计算总报价
        var sbsjzj_ = parseInt_DN($("#XS_SBSJBJ").val());//设备实际总价
        var qtfy_ = parseInt_DN($("#XS_QTFY").val());//其他费用
        var azf_ = parseInt_DN($("#XS_AZJ").val());//安装费
        var ysf_ = parseInt_DN($("#XS_YSJ").val());//运输费
        var a;
        var b;
        var c;
        var d;
        if (isNaN(sbsjzj_)) {
            a = 0;
        } else {
            a = sbsjzj_;
        }

        if (isNaN(qtfy_)) {
            b = 0;
        } else {
            b = qtfy_;
        }

        if (isNaN(azf_)) {
            c = 0;
        } else {
            c = azf_;
        }

        if (isNaN(ysf_)) {
            d = 0;
        } else {
            d = ysf_;
        }

        $("#XS_TATOL").val(a + b + c + d);
    }

    //验证表单输入数字
    function checkForm() {
        var checkCq = parseInt_DN($("#XS_CQSJDJ").val());//草签实际单价
        var checkQtfy = parseInt_DN($("#XS_QTFY").val());//其他费用
        var checkYjze = parseInt_DN($("#XS_YJZE").val());//佣金总额
        if (isNaN(checkCq)) {
            document.getElementById('XS_CQSJDJ').value = '';
        }
        if (isNaN(checkQtfy)) {
            document.getElementById('XS_QTFY').value = '';
        }
        if (isNaN(checkYjze)) {
            document.getElementById('XS_YJZE').value = '';
        }
    }
    
    function addToRemark(ele,text, ext) {
		if(text){
			switch (ext) {
			case 'checkbox':
				var content = $('textarea[name=DT_REMARK]').val().split("\n");
				if (!$(ele).is(":checked")){
					var newContent = '';
					$.each(content, function(i,v) {
						if(v != ''){
							var _v = v + '\n' ;
							if(v.indexOf(text) != 0){
								newContent += _v ;
							}
						}
					});
					$('textarea[name=DT_REMARK]').val(newContent);
				} else {
					var _v = text+'\n'+$('textarea[name=DT_REMARK]').val();
					$('textarea[name=DT_REMARK]').val(_v);
				}
				break;
			case 'text':
				var content = $('textarea[name=DT_REMARK]').val().split("\n");
				if ($(ele).val() == ''){
					var newContent = '';
					$.each(content, function(i,v) {
						if(v != ''){
							var _v = v + '\n' ;
							if(v.indexOf(text) != 0){
								newContent += _v ;
							}
						}
					});
					$('textarea[name=DT_REMARK]').val(newContent);
				} else {
					var newContent = '';
					$.each(content, function(i,v) {
						if(v != ''){
							var _v = v + '\n' ;
							if(v.indexOf(text) != 0){
								newContent += _v ;
							}
						}
					});
					var newContent = text + ":" + $(ele).val() +'\n' + newContent;
					$('textarea[name=DT_REMARK]').val(newContent);
				}
				break;

			default:
				break;
			}
			
		}
	}
    
</script>
</body>

</html>
