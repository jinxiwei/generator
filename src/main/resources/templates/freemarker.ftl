<!DOCTYPE html>
<html>

<head>
<#include "/common/meta.ftl">
    <title>流氓兔后台管理中心</title>
<#include "/common/link.ftl">
    <link href="/css/plugins/iCheck/custom.css" rel="stylesheet">
    <!-- Mainly scripts -->
<#include "/common/javascript.ftl">
    <script src="/js/plugins/iCheck/icheck.min.js"></script>
</head>

<body>

<div id="wrapper">
<#assign nav="nav">
<#include "/common/nav.ftl">
    <div id="page-wrapper" class="gray-bg dashbard-1">
    <#include "/common/top.ftl">

        <div class="row wrapper border-bottom white-bg page-heading">
            <div class="col-lg-9">
                <h2>标题</h2>
                <ol class="breadcrumb">
                    <li>
                        <a href="/welcome">主页</a>
                    </li>
                    <li>
                        <a href="">标题</a>
                    </li>
                    <li class="active">
                        <strong>标题</strong>
                    </li>
                </ol>
            </div>
        </div>
        <div class="wrapper wrapper-content animated fadeInRight">
            <div class="row">
                <div class="col-lg-12">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <h5>标题</h5>
                            <div class="ibox-tools">
                                <a class="collapse-link">
                                    <i class="fa fa-chevron-up"></i>
                                </a>
                            </div>
                        </div>
                        <div class="ibox-content">
                            <div class="m-b-sm">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="tool-btns">
                                            <button type="button" class="btn btn-success" onclick="resetForm();">
                                                添加标题
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <form id="listForm" action="/jiaoyi/dynamic/list" method="post">

                                <div id="DataTables_Table_0_wrapper" class="dataTables_wrapper form-inline dataTables">
                                    总记录数：${data.total}
                                    <table class="table table-striped table-bordered table-hover">
                                        <thead>
                                        <tr>
                                            <th><label> <input type="checkbox" name="checkAll" id="checkAll"
                                                               class="i-checks"></label></th>
                                            <th>编号</th>
                                            <th>用户名称</th>
                                            <th>采购信息</th>
                                            <th>交易状态</th>
                                            <th>时间</th>
                                            <th>操作</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <#list data.list as value>
                                        <tr>
                                            <td><label><input type="checkbox" name="ids" data-id="${value.id}"
                                                              class="i-checks check"></label></td>
                                            <td>${(value.id)!}</td>
                                            <td>${(value.name)!}</td>
                                            <td>${(value.purchase)!}</td>
                                            <td>${(value.tradingState)!}</td>
                                            <td>${(value.createTime?string("yyyy-MM-dd HH:mm:ss"))!}</td>
                                            <td>
                                                <a href="/jiaoyi/dynamic/toEdit/${value.id}" title="修改">[修改]</a>

                                                <a id="del" onclick="fuDel(${value.id})" title="删除">[删除]</a>
                                            </td>

                                        </tr>
                                        </#list>
                                        </tbody>
                                    </table>
                                <#if (data?? && data.list?size > 0)>
                                    <#include "/common/pager.ftl" />
                                <#else>
                                    <div class="row text-center">
                                        <img src="/img/no_data.png" width="3%">&nbsp;&nbsp;<strong
                                            style="color: #999c9e;">没有找到相关记录!</strong>
                                    </div>
                                </#if>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <script>

        //删除
        function fuDel(id) {
            swal({
                title: "您确定删除吗？",
                text: "",
                type: "warning",
                showCancelButton: true,
                closeOnConfirm: false,
                cancelButtonText: "取消",
                confirmButtonText: "确定",
                confirmButtonColor: "#ec6c62"
            }, function () {

                $.ajax({
                    url: "/jiaoyi/dynamic/del/" + id,
                    type: "POST",
                    async: false,
                    cache: false,
                    contentType: false,
                    processData: false,

                }).done(function (data) {
                    if (data.code == 200) {
                        swal({title: "删除成功!", text: "", type: "success"}, function () {
                            window.location.href = "/jiaoyi/dynamic/list";
                        });
                    } else {
                        swal({title: "操作失败!", text: data.message, type: "error"}, function () {

                        });
                    }
                }).error(function (data) {
                    swal("OMG", "操作失败了!", "error");
                });
            });


        };


        //全选/反选
        var checkAll = $('#checkAll');
        var checkboxes = $('input.check');

        checkAll.on('ifChecked ifUnchecked', function (event) {
            if (event.type == 'ifChecked') {
                checkboxes.iCheck('check');
            } else {
                checkboxes.iCheck('uncheck');
            }
        });

        checkboxes.on('ifChecked ifUnchecked', function (event) {
            if (checkboxes.filter(':checked').length == checkboxes.length) {
                checkAll.prop('checked', true);
            } else {
                checkAll.prop('checked', false);
            }
            checkAll.iCheck('update');
        });

        function queryListForm() {
            $("#pageNum").val(1);
            $("#listForm").submit();
        }

        //重置表单
        function resetForm() {
            location.href = "/jiaoyi/dynamic/toSave";
        }

        //设置时间控件
        $(document).ready(function () {

            $('.i-checks').iCheck({
                checkboxClass: 'icheckbox_square-green',
                radioClass: 'iradio_square-green',
            });

            $('.datepicker').datepicker({
                autoclose: true,
                beforeShowDay: $.noop,
                calendarWeeks: false,
                clearBtn: true,
                daysOfWeekDisabled: [],
                endDate: Infinity,
                forceParse: true,
                format: 'yyyy-mm-dd',
                keyboardNavigation: true,
                language: 'cn',
                minViewMode: 0,
                orientation: "auto",
                rtl: false,
                startDate: -Infinity,
                startView: 0,
                todayBtn: false,
                todayHighlight: false,
                weekStart: 0
            });

        });
    </script>
</body>
</html>
