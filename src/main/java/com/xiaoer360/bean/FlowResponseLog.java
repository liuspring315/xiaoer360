package com.xiaoer360.bean;

import org.nutz.dao.entity.annotation.*;

import java.util.Date;

/**
 * @功能说明：
 * @公司名称：首都信息发展股份有限公司
 * @作者：zhaochun
 * @创建时间：2015-07-30
 */
@Table("flow_response_log")
public class FlowResponseLog  extends BasePojo{

    /**
     * 主键
     */
    @Id
    @Column("id")
    private Integer id;

    @Column("seqno")
    @ColDefine(width = 100)
    private String seqno;


    /**
     *  log
     */
    @Column("msg")
    @ColDefine(type= ColType.TEXT)
    private String msg;


    public FlowResponseLog() {
    }


    public FlowResponseLog(String msg) {
        this.id = id;
        this.msg = msg;
        super.createTime = new Date();
    }

    public FlowResponseLog(String seqno, String msg) {
        this.seqno = seqno;
        this.msg = msg;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public String getSeqno() {
        return seqno;
    }

    public void setSeqno(String seqno) {
        this.seqno = seqno;
    }
}
