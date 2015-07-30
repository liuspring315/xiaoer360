package com.xiaoer360.bean.msg;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.codehaus.jackson.annotate.JsonProperty;
import org.codehaus.jackson.map.annotate.JsonSerialize;

@JsonIgnoreProperties(ignoreUnknown = true)
@JsonSerialize(include = JsonSerialize.Inclusion.NON_NULL)
public class FlowOrderInfoJSON {
	@JsonProperty("ORDERID")
	private String ORDERID;
	@JsonProperty("ORDERTYPE")
	private String ORDERTYPE;

	@JsonProperty("USER")
	private String USER;

	@JsonProperty("REQDATE")
	private String REQDATE;

	@JsonProperty("PACKAGEID")
	private String PACKAGEID;
	@JsonProperty("STATUS")
	private String STATUS;
	@JsonProperty("EXTORDER")
	private String EXTORDER;
	
	public FlowOrderInfoJSON(){
		
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
	public String getORDERTYPE() {
		return ORDERTYPE;
	}
	@JsonIgnore
	public void setORDERTYPE(String oRDERTYPE) {
		ORDERTYPE = oRDERTYPE;
	}
	@JsonIgnore
	public String getUSER() {
		return USER;
	}
	@JsonIgnore
	public void setUSER(String uSER) {
		USER = uSER;
	}
	@JsonIgnore
	public String getREQDATE() {
		return REQDATE;
	}
	@JsonIgnore
	public void setREQDATE(String rEQDATE) {
		REQDATE = rEQDATE;
	}
	@JsonIgnore
	public String getPACKAGEID() {
		return PACKAGEID;
	}
	@JsonIgnore
	public void setPACKAGEID(String pACKAGEID) {
		PACKAGEID = pACKAGEID;
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
	public String getEXTORDER() {
		return EXTORDER;
	}
	@JsonIgnore
	public void setEXTORDER(String eXTORDER) {
		EXTORDER = eXTORDER;
	}

}
