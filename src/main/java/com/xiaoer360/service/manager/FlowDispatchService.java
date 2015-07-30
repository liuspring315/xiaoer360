package com.xiaoer360.service.manager;

import com.xiaoer360.bean.FlowRequestLog;
import com.xiaoer360.bean.FlowResponseLog;
import com.xiaoer360.bean.msg.*;
import com.xiaoer360.util.HttpClientUtil;
import com.xiaoer360.util.MD5Util;
import net.sf.json.JSONObject;
import org.codehaus.jackson.map.ObjectMapper;
import org.nutz.dao.Dao;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;


import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @功能说明：
 * @公司名称：首都信息发展股份有限公司
 * @作者：zhaochun
 * @创建时间：2015-07-30
 */
@IocBean(name="flowDispatchService")
public class FlowDispatchService {
    @Inject protected Dao dao;

    @Inject("java:$config.get('fscg.appid')")
    private String APPID = "jiubai_apiq";//需申请
    @Inject("java:$config.get('fscg.app.secret')")
    private String APP_SECRET = "jiubai&^%12";//需申请
    @Inject("java:$config.get('fscg.flow.dispatch.url')")
    private String FLOW_DISPATCH_URL = "http://test.szwisdom.cn/foss-fscg/flowservice/makeorder.ws";

    private final static SimpleDateFormat df1 = new SimpleDateFormat(
            "yyyyMMddHHmmss");

    /**
     * 发送流量至网关
     *
     * @param s
     * @return
     * @throws Exception
     */
    public String dispatchFlow(FlowMakeOrderReqMesg s) {

        try {
            FlowReqMesg reqMsg = new FlowReqMesg();

            FlowMesgHeader header = new FlowMesgHeader();
            header.setAPPID(APPID);
            header.setSEQNO(s.getEXTORDER().replaceAll("EXTORDER","SEQNO"));
            header.setTIMESTAMP(df1.format(new Date()));
            header.setVERSION("v1.0");
            String sECERTKEY = MD5Util.MD5(header.getTIMESTAMP()
                    + header.getSEQNO() + APPID + APP_SECRET);
            header.setSECERTKEY(sECERTKEY);

            String vSIGN = MD5Util.MD5(APP_SECRET + s.getUSER()
                    + s.getPACKAGEID() + s.getORDERTYPE());// MD5(APPSecret+USER+PACKEID+ORDERTYPE)
            s.setSIGN(vSIGN);
            ObjectMapper objectMapper = new ObjectMapper();
            FlowMesgBody msgbody = new FlowMesgBody();
            msgbody.setCONTENT(JSONObject.fromObject(objectMapper
                    .writeValueAsString(s)));

            reqMsg.setHeader(header);
            reqMsg.setMsgbody(msgbody);
            String requestStr = objectMapper.writeValueAsString(reqMsg);
            System.out.println("Request:" + requestStr);

            FlowRequestLog flowRequestLog = new FlowRequestLog(header.getSEQNO(),"Request:" + requestStr);
            dao.insert(flowRequestLog);
            String respJson = HttpClientUtil.sendData(requestStr, FLOW_DISPATCH_URL);
            System.out.println("Response:" + respJson);

            FlowResponseLog flowResponseLog = new FlowResponseLog(header.getSEQNO(),"Response:" + respJson);
            dao.insert(flowResponseLog);

            if (respJson != null && !respJson.equals("")) {
                FlowRespMesg respMesg = objectMapper.readValue(respJson,
                        FlowRespMesg.class);
                if ("00".equals(respMesg.getMsgbody().getRESP().getRCODE())) {
                    return (String) respMesg.getMsgbody().getCONTENT()
                            .get("ORDERID");
                }
            }

        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }

    /**
     *
     * @param args
     */
    public static void main(String[] args) {
        String[] mobiles = { "13510685121", "13360099669", "13510801207",
                "13360099581", "13417529001", "18948352499", "13510977666",
                "18938666780", "15889589850", "13504036362", "13360090179",
                "18692866025", "13428657520", "18665081799", "13760234846",
                "13686829177", "18319040629", "18922898833", "17711689402",
                "18573856725", "13802819092", "13823004045", "18938922666",
                "13360099908", "13826551891", "15915323169", "18922866855",
                "18826918618", "13360097537", "13570882908", "13709689933",
                "13825683248", "13923388277", "18617048468", "13530726531",
                "13927417705", "13302310520", "13360095885", "15622867816",
                "13760489505", "18818569797", "18688833687", "13600172755",
                "13066473089", "16922838422", "13760152055", "13360099817",
                "13380069271", "13316877933", "13316988028", "13923491005",
                "13826526641", "13903023047", "13613002510", "18925293288",
                "15920081801", "18929388628" };
        //String[] mobiles = {"18938680620"};
        int i = 0;
        for (String mobile : mobiles) {
            i++;
            try {
                FlowMakeOrderReqMesg req = new FlowMakeOrderReqMesg();
                req.setEXTORDER(System.currentTimeMillis() + "");
                req.setPACKAGEID("WY10");
                req.setUSER(mobile);
                req.setORDERTYPE("1");
                req.setNOTE("WXB");
                String orderId = new FlowDispatchService().dispatchFlow(req);
                System.out.println("完成：" + i + "," + mobile + "," + orderId);
                Thread.sleep(1*1000);
            } catch (Exception e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }

        }

    }
}
