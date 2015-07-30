package com.xiaoer360.bean;

/**
 * @功能说明：为了简化将来需要更多的Pojo(Bean),做个抽象的BasePojo,把共有的属性和方法统一
 * @公司名称：首都信息发展股份有限公司
 * @作者：zhaochun
 * @创建时间：2015-06-08
 */

import org.nutz.dao.entity.annotation.Column;
import org.nutz.json.Json;
import org.nutz.json.JsonFormat;

import java.util.Date;

public abstract class BasePojo {

    @Column("ct")
    protected Date createTime;
    @Column("ut")
    protected Date updateTime;

    public String toString() {
        return String.format("/*%s*/%s", super.toString(), Json.toJson(this, JsonFormat.compact()));
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }
}