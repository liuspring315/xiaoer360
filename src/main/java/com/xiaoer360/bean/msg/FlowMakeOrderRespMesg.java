package com.xiaoer360.bean.msg;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.codehaus.jackson.annotate.JsonProperty;
import org.codehaus.jackson.map.annotate.JsonSerialize;

@JsonIgnoreProperties(ignoreUnknown = true)
@JsonSerialize(include = JsonSerialize.Inclusion.NON_NULL)
public class FlowMakeOrderRespMesg {
	@JsonProperty("ORDERID")
	private String ORDERID;// 绛惧悕
	@JsonProperty("EXTORDER")
	private String EXTORDER;// 绛惧悕

	@JsonIgnore
	public String getORDERID() {
		return ORDERID;
	}

	@JsonIgnore
	public void setORDERID(String oRDERID) {
		ORDERID = oRDERID;
	}

	@JsonIgnore
	public String getEXTORDER() {
		return EXTORDER;
	}

	@JsonIgnore
	public void setEXTORDER(String eXTORDER) {
		EXTORDER = eXTORDER;
	}

	public FlowMakeOrderRespMesg() {
		super();
	}

}
