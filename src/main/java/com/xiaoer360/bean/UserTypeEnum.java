package com.xiaoer360.bean;

/**
 * Created by spring on 15-3-19.
 */
public enum UserTypeEnum {

	ADMIN("管理员",0),

	CUSTOMER("会员",1),

			;
	//资源编码
	private Integer code;
	//资源名称
	private String name;

	private String daoClassName;

	private String loginSql;

	private UserTypeEnum(String name, Integer code) {
		this.code = code;
		this.name = name;
	}
	public static UserTypeEnum getUserTypeEnum(Integer code) {
		for (UserTypeEnum c : UserTypeEnum.values()) {
			if (c.getCode() == code) {
				return c;
			}
		}
		return CUSTOMER;
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

	public String getDaoClassName() {
		return daoClassName;
	}

	public void setDaoClassName(String daoClassName) {
		this.daoClassName = daoClassName;
	}

	public String getLoginSql() {
		return loginSql;
	}

	public void setLoginSql(String loginSql) {
		this.loginSql = loginSql;
	}
}
