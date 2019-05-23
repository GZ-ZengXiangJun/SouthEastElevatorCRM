﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <base href="<%=basePath%>">
    <!-- jsp文件头和头部 -->
    <%@ include file="../../system/admin/top.jsp" %>
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
<!-- 选择报价页面 -->
<div id="QuoteSelectHTML" class="animated fadeIn"></div>
<!-- 合同录入界面 -->
<div id="InformationHTML" class="animated fadeIn"></div>
<!-- 合同变更 -->
<div id="ChangeIncontractHTML" class="animated fadeIn"></div>

<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-content">
                    <div id="top" ,name="top"></div>

                    <form role="form" class="form-inline" action="contractNewInstallation/contractNewInstallation.do"
                          method="post" name="ContractNewAzForm" id="ContractNewAzForm">

                        <div class="form-group ">
                            <input class="form-control" type="text" id="item_name"
                                   type="text" name="item_name" value="${pd.item_name}"
                                   placeholder="项目名称">
                        </div>
                        <div class="form-group ">
                            <input class="form-control" type="text" id="AZ_NO"
                                   name="AZ_NO" value="${pd.AZ_NO}"
                                   placeholder="合同号">
                        </div>
                        <div class="form-group ">
                            <select class="form-control" id="ACT_STATUS" name='ACT_STATUS'>
                                <option value=''>状态</option>
                                <option value='1' ${pd.ACT_STATUS=='1'?'selected':''}>新建</option>
                                <option value='2' ${pd.ACT_STATUS=='2'?'selected':''}>待审批</option>
                                <option value='3' ${pd.ACT_STATUS=='3'?'selected':''}>审批中</option>
                                <option value='4' ${pd.ACT_STATUS=='4'?'selected':''}>通过</option>
                                <option value='5' ${pd.ACT_STATUS=='5'?'selected':''}>不通过</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn  btn-primary"
                                    style="margin-left: 10px; height:32px;margin-top:3px;" title="查询">查询
                            </button>
                        </div>
                        <div class="form-group">
                            <!-- <button type="button" class="btn  btn-primary"
                                style="margin-bottom: 0px;" title="新建"
                                onclick="CNadd();">新建
                            </button> -->
                        </div>
                        <div class="form-group">
                            <a style="margin-left: 10px; height:32px;margin-top:3px;"
                               class="btn btn-warning btn-outline"
                               style="margin-left: 10px; height:32px;margin-top:3px;"
                               title="导出到Excel" type="button" target="_blank" onclick="toExcel(this);"
                               href="javascript:;">导出</a>
                        </div>

                        <button class="btn  btn-success" title="刷新" type="button"
                                style="float: right" onclick="refreshCurrentTab();">刷新
                        </button>
                    </form>

                    <div class="row">
                        </br>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered table-hover" style="table-layout:fixed">
                            <thead>
                            <tr>
                                <th style="text-align:center;overflow:hidden;white-space:nowrap;text-overflow:ellipsis;"
                                    width="10%">合同编号
                                </th>
                                <th style="text-align:center;overflow:hidden;white-space:nowrap;text-overflow:ellipsis;"
                                    width="15%">项目名称
                                </th>
                                <th style="text-align:center;overflow:hidden;white-space:nowrap;text-overflow:ellipsis;"
                                    width="6%">报价版本
                                </th>
                                <th style="text-align:center;overflow:hidden;white-space:nowrap;text-overflow:ellipsis;"
                                    width="15%">最终用户
                                </th>
                                <th style="text-align:center;overflow:hidden;white-space:nowrap;text-overflow:ellipsis;"
                                    width="7%">电梯台数
                                </th>
                                <th style="text-align:center;overflow:hidden;white-space:nowrap;text-overflow:ellipsis;"
                                    width="7%">业务员
                                </th>
                                <th style="text-align:center;overflow:hidden;white-space:nowrap;text-overflow:ellipsis;"
                                    width="10%">合同总价格
                                </th>
                                <th style="text-align:center;overflow:hidden;white-space:nowrap;text-overflow:ellipsis;"
                                    width="10%">状态
                                </th>
                                <th style="text-align:center;overflow:hidden;white-space:nowrap;text-overflow:ellipsis;"
                                    width="20%">操作
                                </th>
                            </tr>
                            </thead>
                            <tbody>
                            <!-- 开始循环 -->
                            <c:choose>
                                <c:when test="${not empty contractNewAzList}">
                                    <c:if test="${QX.cha == 1 }">
                                        <c:forEach items="${contractNewAzList}" var="con" varStatus="vs">
                                            <tr>
                                                <td title="${con.AZ_NO}"
                                                    style="text-align:center;overflow:hidden;white-space:nowrap;text-overflow:ellipsis;"
                                                    onclick="CNselect('${con.AZ_UUID}');">
                                                    <a href="javascript:;">${con.AZ_NO}</a></td>
                                                <td title="${con.item_name}" nowrap="nowrap"
                                                    style="text-align:center;overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">${con.item_name}</td>
                                                <td title="${con.offer_version}" nowrap="nowrap"
                                                    style="text-align:center;overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">${con.offer_version}</td>
                                                <td title="${con.customer_name}" nowrap="nowrap"
                                                    style="text-align:center;overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">${con.customer_name}</td>
                                                <td title="${con.DT_NUM}"
                                                    style="text-align:center;white-space: nowrap;overflow: hidden;text-overflow: ellipsis;">${con.DT_NUM}</td>
                                                <td title="${con.USER_NAME}"
                                                    style="text-align:center;white-space: nowrap;overflow: hidden;text-overflow: ellipsis;">${con.USER_NAME}</td>
                                                <td title="${con.PRICE}"
                                                    style="text-align:center;white-space: nowrap;overflow: hidden;text-overflow: ellipsis;">${con.PRICE}</td>
                                                <c:if test="${con.ACT_STATUS == '5'}">
                                                    <td style="color: red;text-align:center;white-space: nowrap;overflow: hidden;text-overflow: ellipsis;">
                                                        被驳回
                                                    </td>
                                                </c:if>
                                                <c:if test="${con.ACT_STATUS != '5'}">
                                                    <td style="text-align:center;text-align:center;white-space: nowrap;overflow: hidden;text-overflow: ellipsis;">
                                                            ${con.ACT_STATUS=="1"?"新建":""}
                                                            ${con.ACT_STATUS=="2"?"待审核":""}
                                                            ${con.ACT_STATUS=="3"?"审核中":""}
                                                            ${con.ACT_STATUS=="4"?"已通过":""}
                                                    </td>
                                                </c:if>

                                                <td style="text-align:center;text-align:center;white-space: nowrap;overflow: hidden;text-overflow: ellipsis;">
                                                    <!-- 公共 -->

                                                    <c:if test="${con.ACT_STATUS == '1' || con.ACT_STATUS == '5'}">
                                                        <button class="btn btn-sm btn-primary" title="编辑"
                                                                type="button" onclick="CNedit('${con.AZ_UUID}');">编辑
                                                        </button>
                                                        <button class="btn btn-sm btn-danger" title="删除"
                                                                type="button" onclick="CNdel('${con.AZ_UUID}');">删除
                                                        </button>
                                                    </c:if>

                                                    <c:if test="${con.ACT_STATUS == '1'}">
                                                        <c:if test="${con.INPUT_USER==userpds.USER_ID||userpds.USER_ID=='1'}">
                                                            <button class="btn  btn-warning btn-sm" title="启动流程"
                                                                    type="button"
                                                                    onclick="startLeave('${con.AZ_UUID}','${con.ACT_KEY}')">
                                                                启动
                                                            </button>
                                                        </c:if>

                                                    </c:if>

                                                    <c:if test="${con.ACT_STATUS == '5'}">
                                                        <button class="btn  btn-warning btn-sm" title="重新提交"
                                                                type="button"
                                                                onclick="restartAgent('${con.task_id }','${con.AZ_UUID}');">
                                                            重新提交
                                                        </button>
                                                    </c:if>

                                                    <c:if test="${con.ACT_STATUS != '1'}">
                                                        <button class="btn  btn-info btn-sm" title="审核记录" type="button"
                                                                onclick="viewHistory('${con.ACT_KEY}');">审核记录
                                                        </button>
                                                    </c:if>

                                                    <c:if test="${con.ACT_STATUS == '4'}">
                                                        <%-- <button class="btn btn-sm btn-warning" title="合同输出"
                                                                type="button" onclick="editShopa('${con.AZ_UUID}');">合同输出
                                                        </button> --%>
                                                        <a class="btn btn-sm btn-warning" title="合同输出" type="button"
                                                           target="_blank"
                                                           href="<%=basePath%>contractNewInstallation/toContractInstallation.do?con_id=${con.AZ_NO}&item_id=${con.AZ_ITEM_ID}">合同输出</a>
                                                    </c:if>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </c:if>
                                    <!-- 权限设置 -->
                                    <c:if test="${QX.cha == 0 }">
                                        <tr>
                                            <td colspan="100" class="center">您无权查看</td>
                                        </tr>
                                    </c:if>
                                </c:when>
                                <c:otherwise>
                                    <tr class="main_info">
                                        <td colspan="100" class="center">没有相关数据</td>
                                    </tr>
                                </c:otherwise>
                            </c:choose>
                            </tbody>
                        </table>
                        <div class="col-lg-12" style="padding-left: 0px; padding-right: 0px">
                            ${page.pageStr}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--返回顶部开始-->
<div id="back-to-top">
    <a class="btn btn-warning btn-back-to-top"
       href="javascript: setWindowScrollTop (this,document.getElementById('top').offsetTop);">
        <i class="fa fa-chevron-up"></i>
    </a>
</div>
<!--返回顶部结束-->
<!-- Fancy box -->
<script src="static/js/fancybox/jquery.fancybox.js"></script>
<!-- iCheck -->
<script src="static/js/iCheck/icheck.min.js"></script>
<!-- Sweet alert -->
<!-- 兼容IE10 11 -->
<script src="static/js/sweetalert2/es6-promise.auto.min.js"></script>
<script src="static/js/sweetalert2/sweetalert2.min.js"></script>

<script type="text/javascript">
    //---------------------------xcx-------------------------Start
    //新建
    function CNadd() {
        $("#QuoteSelectHTML").kendoWindow({
            width: "550px",
            height: "300px",
            title: "合同录入信息",
            actions: ["Close"],
            content: '<%=basePath%>contractNewInstallation/goSoContract.do',
            modal: true,
            visible: false,
            resizable: true
        }).data("kendoWindow").maximize().open();
    };

    //查看
    function CNselect(AZ_UUID) {
        $("#InformationHTML").kendoWindow({
            width: "550px",
            height: "300px",
            title: "合同录入信息",
            actions: ["Close"],
            content: '<%=basePath%>contractNewInstallation/goView.do?AZ_UUID=' + AZ_UUID,
            modal: true,
            visible: false,
            resizable: true
        }).data("kendoWindow").maximize().open();
    };

    //编辑
    function CNedit(data) {
        $("#InformationHTML").kendoWindow({
            width: "550px",
            height: "300px",
            title: "编辑合同信息",
            actions: ["Close"],
            content: '<%=basePath%>contractNewInstallation/goEdit.do?AZ_UUID=' + data,
            modal: true,
            visible: false,
            resizable: true
        }).data("kendoWindow").maximize().open();
    };

    //删除
    function CNdel(AZ_UUID) {
        swal({
                title: "您确定要删除该条信息吗？",
                text: "删除后将无法恢复，请谨慎操作！",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "删除",
                cancelButtonText: "取消",
                closeOnConfirm: false,
                closeOnCancel: false,
                showLoaderOnConfirm: true,
                preConfirm: function (){
                	return new Promise(function (resolve, reject) {
                		var url = '<%=basePath%>contractNewInstallation/goDelAzCon.do?AZ_UUID=' + AZ_UUID;
                        $.get(url, function (data) {
                            if (data.msg == 'success') {
                                swal({
                                        title: "删除成功！",
                                        text: "您已经成功删除了这条信息。",
                                        type: "success",
                                    }).then(function () {
                                        refreshCurrentTab();
                                        resolve();
                                    });
                            } else {
                                swal("删除失败", "您的删除操作失败了！", "error");
                            }
                        });
                        
                    })
                }
            }).then(function (isConfirm) {
                if (!isConfirm) {
                    swal({
                        title: "已取消",
                        text: "您取消了删除操作！",
                        type: "error",
                        showConfirmButton: false,
                        timer: 1000
                    });
                }
            });
    };

    //启动流程
    function startLeave(AZ_UUID, ACT_KEY) {
        swal({
            title: "您确定要启动流程吗？",
            text: "点击确定将会启动该流程，请谨慎操作！",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "启动",
            cancelButtonText: "取消",
            closeOnConfirm: false,
            closeOnCancel: false,
            showLoaderOnConfirm: true,
            preConfirm: function (){
            	return new Promise(function (resolve, reject) {
            		var url = "<%=basePath%>contractNewInstallation/apply.do?AZ_UUID=" + AZ_UUID + "&ACT_KEY=" + ACT_KEY;
                    $.get(url, function (data) {
                        if (data.msg == "success") {
                            swal({
                                title: "启动成功！",
                                text: "您已经成功启动该流程。\n该流程实例ID为：" + ACT_KEY + ",下一个任务为：" + data.task_name,
                                type: "success",
                            }).then(function () {
                                refreshCurrentTab();
                                resolve();
                            });

                        } else {
                            swal({
                                title: "启动失败！",
                                text: data.err,
                                type: "error",
                                showConfirmButton: true
                            });
                        }
                    });
                })
            }
        }).then(function (isConfirm) {
            if (!isConfirm) {
                swal({
                    title: "已取消",
                    text: "您已经取消启动操作了！",
                    type: "error",
                    showConfirmButton: false,
                    timer: 1000
                });
            }
        });
    }

    //审核记录
    function viewHistory(instance_id) {
        $("#InformationHTML").kendoWindow({
            width: "900px",
            height: "500px",
            title: "查看审核记录",
            actions: ["Close"],
            content: '<%=basePath%>workflow/goViewHistory.do?pid=' + instance_id,
            modal: true,
            visible: false,
            resizable: true
        }).data("kendoWindow").center().open();
    }

    //重新提交流程
    function restartAgent(task_id, AZ_UUID) {
        swal({
                title: "您确定要重新提交吗？",
                text: "重新提交流程进行审核！",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "提交",
                cancelButtonText: "取消",
                showLoaderOnConfirm: true,
                preConfirm: function (){
                	return new Promise(function (resolve, reject) {
                		var url = "<%=basePath%>contractNewInstallation/restartAgent.do?task_id=" + task_id + "&AZ_UUID=" + AZ_UUID + "&tm=" + new Date().getTime();
                        $.get(url, function (data) {
                            if (data.msg == "success") {
                                swal({
                                        title: "重新提交成功！",
                                        text: "您已经成功重新提交了该流程！",
                                        type: "success"
                                    }).then(function () {
                                        refreshCurrentTab();
                                        resolve();
                                    });
                            } else {
                                swal({
                                    title: "重新提交失败！",
                                    text: data.err,
                                    type: "error",
                                    showConfirmButton: true
                                });
                            }
                        });
                    })
                }
            }).then(function (isConfirm) {
                if (!isConfirm) {
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

    //导出到Excel
    function toExcel(ele) {
        var item_name = $("input[name='item_name']").val();
        var AZ_NO = $("input[name='AZ_NO']").val();
        var ACT_STATUS = $("select[name='ACT_STATUS']").val();
        $(ele).attr("href", "<%=basePath%>contractNewInstallation/toExcel.do?item_name="
            + item_name + "&AZ_NO="
            + AZ_NO + "&ACT_STATUS="
            + ACT_STATUS);
    }


    $(document).ready(function () {
        //loading end
        parent.layer.closeAll('loading');
    });

    //刷新iframe
    function refreshCurrentTab() {
        $("#ContractNewAzForm").submit();
    }

    //---------------------------xcx-------------------------End


    /* back to top */
    function setWindowScrollTop(win, topHeight) {
        if (win.document.documentElement) {
            win.document.documentElement.scrollTop = topHeight;
        }
        if (win.document.body) {
            win.document.body.scrollTop = topHeight;
        }
    }
</script>
</body>
</html>


