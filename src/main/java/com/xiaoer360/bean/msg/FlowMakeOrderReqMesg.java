
package com.xiaoer360.bean.msg;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.codehaus.jackson.annotate.JsonProperty;
import org.codehaus.jackson.map.annotate.JsonSerialize;
@JsonIgnoreProperties(ignoreUnknown = true)
@JsonSerialize(include=JsonSerialize.Inclusion.NON_NULL)
public class FlowMakeOrderReqMesg  {
	@JsonProperty("SIGN")
	private String SIGN;// 绛惧悕
	@JsonProperty("USER")
	private String USER; // 鐢ㄦ埛鏍囪瘑
	@JsonProperty("PACKAGEID")
	private String PACKAGEID; // 娴侀噺鍖匢D銆�
	@JsonProperty("ORDERTYPE")
	private String ORDERTYPE; //璁㈠崟绫诲瀷
	
	@JsonProperty("EXTORDER")
	private String EXTORDER; // 澶栭儴璁㈠崟鍙�
	@JsonProperty("NOTE")
	private String NOTE; // 澶囩敤
	
	@JsonIgnore
	public String getSIGN() {
		return SIGN;
	}
	@JsonIgnore
	public void setSIGN(String vSIGN) {
		SIGN = vSIGN;
	}
	@JsonIgnore
	public String getUSER() {
		return USER;
	}
	@JsonIgnore
	public void setUSER(String tUSER) {
		USER = tUSER;
	}
	@JsonIgnore
	public String getPACKAGEID() {
		return PACKAGEID;
	}
	@JsonIgnore
	public void setPACKAGEID(String sPACKAGEID) {
		PACKAGEID = sPACKAGEID;
	}
	@JsonIgnore
	public String getORDERTYPE() {
		return ORDERTYPE;
	}
	@JsonIgnore
	public String getEXTORDER() {
		return EXTORDER;
	}
	@JsonIgnore
	public void setEXTORDER(String sEXTORDER) {
		EXTORDER = sEXTORDER;
	}
	@JsonIgnore
	public String getNOTE() {
		return NOTE;
	}
	@JsonIgnore
	public void setNOTE(String sNOTE) {
		NOTE = sNOTE;
	}
	public void setORDERTYPE(String oRDERTYPE) {
		ORDERTYPE = oRDERTYPE;
	}
}
