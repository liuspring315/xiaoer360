<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="/WEB-INF/views/include/manager/meta.jsp" %>

    <script src="${resourceUrl}/manager/js/pager.js"></script>
</head>
<body class="skin-blue">
<div class="wrapper">

    <%@ include file="/WEB-INF/views/include/manager/menu.jsp" %>
    <!-- Right side column. Contains the navbar and content of the page -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                流量充值订单列表</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                <li class="active">流量充值订单列表</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">
            <form action="#" id="flowdataorders_query_form">
                <!-- Small boxes (Stat box) -->
                <div class="row">
                    <div class="col-xs-12">
                        <div class="box">
                            <div class="box-header">
                                <h3 class="box-title">流量充值订单一览</h3>

                                <div class="box-tools">
                                    <div class="input-group">

                                        <input type="text" name="tel" id="tel"
                                               class="form-control input-sm pull-right" style="width: 150px;"
                                               placeholder="按手机号码搜索">

                                        <div class="input-group-btn">
                                            <button class="btn btn-sm btn-default" id="flowdataorders_query_btn"><i
                                                    class="fa fa-search"></i></button>
                                            <button type="button" onclick="flowdataorder_add();" class="btn btn-default">新增</button>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <!-- /.box-header -->
                            <div class="box-body table-responsive no-padding">
                                <table class="table table-hover">
                                    <tr>
                                        <th>#</th>
                                        <th>充值号码</th>
                                        <th>流量</th>
                                        <th>订单类型</th>
                                        <th>订单状态</th>
                                        <th>uuid</th>
                                        <th>操作</th>
                                    </tr>
                                    <tbody id="flowdataorder_list">

                                    </tbody>
                                </table>

                            </div>
                            <!-- /.box-body -->
                            <div id="div_pager"></div>
                        </div>
                        <!-- /.box -->
                    </div>
                </div>
            </form>
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
    <jsp:include flush="true" page="/WEB-INF/views/include/manager/footer.jsp"/>

</div>
<!-- ./wrapper -->
<div id="flowdataorder_info_modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalInfoLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="role_flowdataorder_infoLabel">订单的JSON数据</h4>
            </div>
            <div class="modal-body">
                <div id="flowdataorder_info">
                    <div >
                        <span id="span_info"></span>
                    </div>
                    <div>
                        <button class="md-button raised-button is-primary" type="submit" onclick="$('#flowdataorder_modify_modal').modal('hide');">
                            <span class="md-button-label">取消</span>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- ./wrapper -->
<div id="flowdataorder_modify_modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="role_flowdataorder_modifyLabel">订单的一般属性</h4>
            </div>
            <div class="modal-body">
                <!-- 修改订单的一般属性 -->
                <div id="flowdataorder_modify">
                    <div style="display: none;">
                        <input name="flowdataorder_modify_id" id="flowdataorder_modify_id">
                    </div>
                    <div>
                        <div class="md-text-field has-float-label">
                            <label>充值号码</label>
                            <input type="text" id="flowdataorder_modify_tel" name="tel" nm="充值号码" value="">
                        </div>
                    </div>
                    <div>
                        <div class="md-text-field has-float-label">
                            <label>流量</label>
                            <input type="text" id="flowdataorder_modify_packageid" name="packageid" nm="订单类型" value="">

                        </div>
                    </div>
                    <div>
                        <div class="md-text-field has-float-label">
                            <label>订单类型</label>
                            <select id="flowdataorder_modify_orderType">
                                <option value="1">直接生成流量订单</option>
                                <option value="2">二次激活使用</option>
                            </select>
                        </div>
                    </div>
                    <div>
                        <div class="md-text-field has-float-label">
                            <label>运营商</label>
                            <select id="flowdataorder_modify_operator">
                                <option value="YD">YD</option>
                                <option value="LT">LT</option>
                                <option value="DX">DX</option>
                            </select>
                        </div>
                    </div>
                    <div>
                        <div class="md-text-field has-float-label">
                            <label>备注</label>
                            <input type="text" id="flowdataorder_modify_cstmrRemarks" name="cstmrRemarks" nm="备注" value="">

                        </div>
                    </div>
                    <div>
                        <div class="md-text-field has-float-label" id="div_message" style="display: none;">
                            <label style="color: red">正在提交，请稍候。。。</label>

                        </div>
                    </div>
                    <div>
                        <button class="md-button raised-button is-primary" type="submit" id="btn_flowdataorder_update_submit" onclick="flowdataorder_update_submit();">
                            <span class="md-button-label">提交</span>
                        </button>
                        <button class="md-button raised-button is-primary" type="submit" onclick="$('#flowdataorder_modify_modal').modal('hide');">
                            <span class="md-button-label">取消</span>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    var _r = {};
    var base = ctx + "/manager";
    /*载入流量订单列表*/
    function loadflowdataorders(pageNumber,pageSize) {
        var postdata = $("#flowdataorders_query_form").serializeArray ();
        if(pageNumber){
            postdata.push({name: 'pageNumber', value: pageNumber});
            postdata.push({name: 'pageSize', value: pageSize});
        }
        console.debug(postdata);
        $.ajax({
            url : base + "/flowdata/orders",
            data : postdata,
            dataType : "json",
            type : "POST",
            success : function(re) {
                if (!re.ok) {
                    alert(re.msg);
                    return;
                }
                data = re.data;
                //console.log(data);
                var list_html = "";
                //console.log(data.list);
                for (var i=0;i<data.list.length;i++) {
                    var flowdataorder = data.list[i];
                    var tmp = "\n<tr>"
                            +"<td>" + flowdataorder.id + "</td>"
                            +"<td>" + flowdataorder.tel + "</td>"
                            +"<td>" + flowdataorder.packageid + "</td>"
                            +"<td>" + (flowdataorder.orderType ==1 ? "直接生成流量订单" : "二次激活使用" ) + "</td>"
                            +"<td>" + (flowdataorder.orderStat == 1 ? "成功" : "失败") + "</td>"
                            +"<td>" + (flowdataorder.uuid) + "</td>"
                            +"<td> "
                            +"<button type=\"button\" onclick=\"flowdataorder_info('" + flowdataorder.uuid +"');\" class='btn btn-default'>查看</button> "
                            +"<button type=\"button\" onclick=\"flowdataorder_delete('" + flowdataorder.id +"');\" class='btn btn-default'>删除</button> "
                            +"</td>"
                            + "</tr>";
                    list_html += tmp;
                }
                $("#flowdataorder_list").html(list_html);
                _r._flowdataorders = data;
                $("#div_pager").html(PagerTag.showPagerTag("loadflowdataorders","flowdataorder_query",data.pager));
                //console.log(window._user_roles);
            }
        });
    };
    /*把流量订单的一般信息的修改提交到服务器*/
    function flowdataorder_update_submit() {
        var p = {};
        p["tel"] = $("#flowdataorder_modify_tel").val();
        p["packageid"] = $("#flowdataorder_modify_operator").val()+$("#flowdataorder_modify_packageid").val();
        p["orderType"] = $("#flowdataorder_modify_orderType").val();
        p["cstmrRemarks"] = $("#flowdataorder_modify_cstmrRemarks").val();
        console.log(p);
        $("#div_message").show();
        $.ajax({
            url : base + "/flowdata/orders/add",
            type : "POST",
            data : JSON.stringify(p),
            success : function() {
                loadflowdataorders();
                $("#flowdataorder_modify_modal").modal('hide');
            }
        });
    };

    /*删除一个流量订单*/
    function flowdataorder_delete(flowdataorder_id) {
        $.ajax({
            url : base + "/flowdata/order/delete",
            type : "POST",
            data : JSON.stringify({id:flowdataorder_id}),
            success : function() {
                loadflowdataorders();
                $("#flowdataorder_modify").hide();
            }
        });
        loadflowdataorders();
    };
    function flowdataorder_info(uuid) {
        $.ajax({
            url : base + "/flowdata/orders/info",
            type : "POST",
            data : JSON.stringify({seqno:uuid}),
            success : function(data) {
                $("#span_info").html(data);
                $("#flowdataorder_info_modal").modal('show');
            }
        });
    };
    /*新增一个流量订单*/
    function flowdataorder_add() {
        $("#flowdataorder_modify_modal").modal('show');
    };
    $(function () {
        loadflowdataorders();
        $("#flowdataorders_query_btn").click(function () {
            loadflowdataorders();
        });

    });

</script>
</html>