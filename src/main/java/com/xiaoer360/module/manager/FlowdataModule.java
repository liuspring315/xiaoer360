package com.xiaoer360.module.manager;

import com.xiaoer360.bean.*;
import com.xiaoer360.bean.msg.FlowMakeOrderReqMesg;
import com.xiaoer360.module.BaseModule;
import com.xiaoer360.service.manager.FlowDispatchService;
import com.xiaoer360.service.manager.UserService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.nutz.dao.Cnd;
import org.nutz.dao.FieldFilter;
import org.nutz.dao.pager.Pager;
import org.nutz.dao.util.Daos;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.mvc.adaptor.JsonAdaptor;
import org.nutz.mvc.annotation.*;

import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * @功能说明：流量订单
 * @公司名称：首都信息发展股份有限公司
 * @作者：zhaochun
 * @创建时间：2015-07-29
 */
@IocBean // 声明为Ioc容器中的一个Bean
@At("/manager/flowdata") // 整个模块的路径前缀
public class FlowdataModule  extends BaseModule {


    @Inject
    protected FlowDispatchService flowDispatchService;

    @RequiresPermissions("manager:flowdata:order:list")
    @At("/orders/list")
    @Ok("jsp:views.manager.flowdata.flowdata_order_list")
    public void orderlist() {
    }

    @Ok("json")
    @RequiresPermissions("manager:flowdata:order:list")
    @At
    public Object orders(@Param("query")String query, @Param("..")Pager pager) {
        return ajaxOk(query(FlowDataOrder.class, Cnd.NEW().asc("id"), pager, null));
    }

    @POST
    @AdaptBy(type=JsonAdaptor.class)
    @RequiresPermissions("manager:flowdata:order:add")
    @At("/orders/add")
    public void add(@Attr("me")UserGeneralInfo me,@Param("..")FlowDataOrder flowDataOrder) {
        if (flowDataOrder == null)
            return;
        Date now = new Date();
        flowDataOrder.setUpdateTime(now);
        flowDataOrder.setCreateTime(now);

        flowDataOrder.setServiceProviderId(me.getId());
        flowDataOrder.setAppid("");
        flowDataOrder.setCstmrId(0);
        flowDataOrder.setOrderStat(0);
        flowDataOrder.setUuid(System.currentTimeMillis() + "");
        dao.insert(flowDataOrder);

        FlowMakeOrderReqMesg req = new FlowMakeOrderReqMesg();
        req.setEXTORDER("EXTORDER_"+flowDataOrder.getUuid());
        req.setPACKAGEID(flowDataOrder.getPackageid());
        req.setUSER(flowDataOrder.getTel());
        req.setORDERTYPE(flowDataOrder.getOrderType()+"");
        req.setNOTE(flowDataOrder.getCstmrRemarks());

        String orderId = flowDispatchService.dispatchFlow(req);
        if(orderId != null) {
            flowDataOrder.setOrderStat(1);
            flowDataOrder.setFscgOrderId(orderId);
            flowDataOrder.setUpdateTime(new Date());
            dao.update(flowDataOrder);
        }

    }


    @POST
    @AdaptBy(type=JsonAdaptor.class)
    @RequiresPermissions("manager:flowdata:order:list")
    @At("/orders/info")
    public String info(@Param("..")FlowRequestLog log) {
        String id = log.getSeqno();
        Cnd cnd = Cnd.NEW().where("seqno", "=", "SEQNO_" + id);
        List<FlowRequestLog> flowRequestLogs = dao.query(FlowRequestLog.class, cnd);
        String msg = "";
        if(flowRequestLogs != null && flowRequestLogs.size() > 0){
            msg = flowRequestLogs.get(0).getMsg()+"<br>";
        }

        Cnd cnd2 = Cnd.NEW().where("seqno", "=", "SEQNO_" + id);
        List<FlowResponseLog> flowResponseLogs = dao.query(FlowResponseLog.class, cnd2);
        if(flowResponseLogs != null && flowResponseLogs.size() > 0) {
            msg = msg + flowResponseLogs.get(0).getMsg() + "<br>";
        }


        return msg;
    }

}
