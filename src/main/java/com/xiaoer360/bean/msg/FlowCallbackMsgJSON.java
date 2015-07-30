package com.xiaoer360.bean.msg;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.codehaus.jackson.annotate.JsonProperty;
import org.codehaus.jackson.map.annotate.JsonSerialize;

@JsonIgnoreProperties(ignoreUnknown = true)
@JsonSerialize(include = JsonSerialize.Inclusion.NON_NULL)
public class FlowCallbackMsgJSON {
	@JsonProperty("ORDERID")
	private String ORDERID;
	@JsonProperty("EXTORDER")
	private String EXTORDER;
	@JsonProperty("STATUS")
	private String STATUS;
	@JsonProperty("CODE")
	private String CODE;

	public FlowCallbackMsgJSON() {

	}

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

	@JsonIgnore
	public String getSTATUS() {
		return STATUS;
	}

	@JsonIgnore
	public void setSTATUS(String sTATUS) {
		STATUS = sTATUS;
	}

	@JsonIgnore
	public String getCODE() {
		return CODE;
	}

	@JsonIgnore
	public void setCODE(String cODE) {
		CODE = cODE;
	}

}
