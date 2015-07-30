package com.xiaoer360.bean;

/**
 * @功能说明：认证状态
 * @公司名称：首都信息发展股份有限公司
 * @作者：zhaochun
 * @创建时间：2015-06-11
 */
public enum AuthenticationStatEnum {

    WAIT_APPROVE("待审核",1),
    APPROVE_YES("审核通过",2),
    APPROVE_NO("不通过",3),
    LOCK("未申请",0)
    ;


    //资源编码
    private Integer code;
    //资源名称
    private String name;
    private AuthenticationStatEnum(String name, Integer code) {
        this.code = code;
        this.name = name;
    }
    public static String getName(Integer code) {
        for (AuthenticationStatEnum c : AuthenticationStatEnum.values()) {
            if (c.getCode() == code) {
                return c.name;
            }
        }
        return null;
    }


    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
