package com.xiaoer360.bean;

/**
 * Created by spring on 15-3-19.
 */
public enum RegisterCheckStateEnum {
	WAIT_APPROVE("未审核",1),
	APPROVE_YES("批准入驻",2),
	APPROVE_NO("否决入驻",3),
	LOCK("锁定",4)
	;
	//资源编码
	private Integer code;
	//资源名称
	private String name;
	private RegisterCheckStateEnum(String name, Integer code) {
		this.code = code;
		this.name = name;
	}
	public static String getName(Integer code) {
		for (RegisterCheckStateEnum c : RegisterCheckStateEnum.values()) {
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
