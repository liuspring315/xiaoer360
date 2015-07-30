package com.xiaoer360.bean.msg;

import com.alibaba.fastjson.JSON;

/**
 * @功能说明：
 * @公司名称：首都信息发展股份有限公司
 * @作者：zhaochun
 * @创建时间：2015-07-29
 */
public class RequestMsg {

    private Header header;
    private MsgBody msgBody;


    public class Header {
        //    序号 父元素名称 元素名称 约束 类型 长度 描述 取值说明
        //    1 MSGHEAD VERSION 1 String V8 协议版本号 V1.0
        private String version = "V1.0";
        //    2 MSGHEAD TIMESTAMP 1 String F16 时间戳 按格式：yyyyMMddHHmmssSS
        private String timestamp;
        //    3 MSGHEAD SEQNO 1 String V20 流水号 请求序列号，需保持 唯一。
        private String seqno;
        //    4 MSGHEAD APPID 1 String V20 应用标识号 CP 线下向 FSCG 申 请，由 FSCG 平台统 一分配，与应用密钥 APPSecret 配对进行 鉴权
        private String appid;
        //    5 MSGHEAD SECERTKEY 1 String F32 安全校验 KEY MD5(TIMESTAMP+ SEQNO+APPID+APPSec ret)
        private String secertkey;

        public String getVersion() {
            return version;
        }

        public void setVersion(String version) {
            this.version = version;
        }

        public String getTimestamp() {
            return timestamp;
        }

        public void setTimestamp(String timestamp) {
            this.timestamp = timestamp;
        }

        public String getSeqno() {
            return seqno;
        }

        public void setSeqno(String seqno) {
            this.seqno = seqno;
        }

        public String getAppid() {
            return appid;
        }

        public void setAppid(String appid) {
            this.appid = appid;
        }

        public String getSecertkey() {
            return secertkey;
        }

        public void setSecertkey(String secertkey) {
            this.secertkey = secertkey;
        }
    }
    /////////////////////////////////////////////////////////////////
    public class MsgBody {

        private Content content;

        public Content getContent() {
            return content;
        }

        public void setContent(Content content) {
            this.content = content;
        }


        public class Content {

            //    1.1 CONTENT SIGN  1 String F32 签名值 MD5(APPSecret+USER+PAC KEID+ORDERTYPE)
            private String sign;
            //    1.2 CONTENT USER 1 String V32分发对象标识 （手机号码 /UserID） 只能有一个手机号码或者 UserID
            private String user;
            //    1.3 CONTENT PACKAGEID  1 Int  流量包 ID 流量包计量单位为 M
            private String packageid;
            //    1.4 CONTENT ORDERTYPE 1 Int  流量订单类型   1— 直接生成流量订 单（对应的 USER 必须为有效的手 机号码） 2— 二次激活使用类 型订单
            private int ordertype;
            //    1.5 CONTENT EXTORDER  0 String V32 CP本地订单号
            private String extorder;
            //    1.6 CONTENT NOTE 0 String  备用
            private String note;

            public String getSign() {
                return sign;
            }

            public void setSign(String sign) {
                this.sign = sign;
            }

            public String getUser() {
                return user;
            }

            public void setUser(String user) {
                this.user = user;
            }

            public String getPackageid() {
                return packageid;
            }

            public void setPackageid(String packageid) {
                this.packageid = packageid;
            }

            public int getOrdertype() {
                return ordertype;
            }

            public void setOrdertype(int ordertype) {
                this.ordertype = ordertype;
            }

            public String getExtorder() {
                return extorder;
            }

            public void setExtorder(String extorder) {
                this.extorder = extorder;
            }

            public String getNote() {
                return note;
            }

            public void setNote(String note) {
                this.note = note;
            }
        }

    }


    public Header getHeader() {
        return header;
    }

    public void setHeader(Header header) {
        this.header = header;
    }

    public MsgBody getMsgBody() {
        return msgBody;
    }

    public void setMsgBody(MsgBody msgBody) {
        this.msgBody = msgBody;
    }

    public static void main(String[] args) {

        RequestMsg requestMsg = new RequestMsg();
        Header header = requestMsg.new Header();
        header.setAppid("123123");;
        header.setSecertkey("sadfasdf");
        header.setSeqno("sqno321212");
        header.setTimestamp("12312312312311231");
        header.setVersion("V1.0");

        requestMsg.setHeader(header);


        System.out.println("args = [" + JSON.toJSON(requestMsg) + "]");
    }
}
