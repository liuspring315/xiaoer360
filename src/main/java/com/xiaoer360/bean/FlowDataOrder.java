package com.xiaoer360.bean;

import org.nutz.dao.entity.annotation.Column;
import org.nutz.dao.entity.annotation.Id;
import org.nutz.dao.entity.annotation.One;
import org.nutz.dao.entity.annotation.Table;

import java.util.Date;


/**
* 流量充值 订单
*/

@Table("flow_data_order")
public class FlowDataOrder extends BasePojo{

	/**
	 * 主键
	 */
	@Id
	@Column("id")
	private Integer id;
	/**
	 * 管理员标识
	 */
	@Column("service_provider_id")
	private Integer serviceProviderId;

	/**
	 *  客户id
	 */
	@Column("cstmr_id")
	private Integer cstmrId;

    /**
     *  充值号码
     */
    @Column("tel")
    private String tel;

    /**
     *  客户流量
     */
    @Column("packageid")
    private String packageid;

    /**
     *  订单号
     */
    @Column("uuid")
    private String uuid;

    /**
     *  FSCG 订单流水号
     */
    @Column("fscg_order_id")
    private String FscgOrderId;


    /**
     *  appid
     */
    @Column("appid")
    private String appid;

    /**
     *  流量订单类型
     *  1— 直接生成流量订 单（对应的 USER 必须为有效的手 机号码） 2— 二次激活使用类 型订
     */
    @Column("order_type")
    private int orderType;

	/**
	 * 订单状态
	 */
	@Column("order_stat")
	private Integer orderStat;
	/**
	 * 客户备注
	 */
	@Column("cstmr_remarks")
	private String cstmrRemarks;

    @One(target=UserGeneralInfo.class, field="serviceProviderId", key="id")
    protected UserGeneralInfo serviceProviderInfo;




	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getServiceProviderId() {
		return serviceProviderId;
	}

	public void setServiceProviderId(Integer serviceProviderId) {
		this.serviceProviderId = serviceProviderId;
	}

	public Integer getCstmrId() {
		return cstmrId;
	}

	public void setCstmrId(Integer cstmrId) {
		this.cstmrId = cstmrId;
	}

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getPackageid() {
        return packageid;
    }

    public void setPackageid(String packageid) {
        this.packageid = packageid;
    }

    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }

    public String getFscgOrderId() {
        return FscgOrderId;
    }

    public void setFscgOrderId(String fscgOrderId) {
        FscgOrderId = fscgOrderId;
    }

    public String getAppid() {
        return appid;
    }

    public void setAppid(String appid) {
        this.appid = appid;
    }

    public int getOrderType() {
        return orderType;
    }

    public void setOrderType(int orderType) {
        this.orderType = orderType;
    }

    public Integer getOrderStat() {
        return orderStat;
    }

    public void setOrderStat(Integer orderStat) {
        this.orderStat = orderStat;
    }

    public String getCstmrRemarks() {
        return cstmrRemarks;
    }

    public void setCstmrRemarks(String cstmrRemarks) {
        this.cstmrRemarks = cstmrRemarks;
    }

    public UserGeneralInfo getServiceProviderInfo() {
        return serviceProviderInfo;
    }

    public void setServiceProviderInfo(UserGeneralInfo serviceProviderInfo) {
        this.serviceProviderInfo = serviceProviderInfo;
    }
}