
package com.xiaoer360.bean.msg;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.codehaus.jackson.annotate.JsonProperty;
import org.codehaus.jackson.map.annotate.JsonSerialize;
@JsonIgnoreProperties(ignoreUnknown = true)
@JsonSerialize(include=JsonSerialize.Inclusion.NON_NULL)
public class FlowQueryOrderReqMesg  {
	@JsonProperty("SIGN")
	private String SIGN;// 绛惧悕
	@JsonProperty("ORDERID")
	private String ORDERID; // 璁㈠崟鍙�
		
	@JsonIgnore
	public String getSIGN() {
		return SIGN;
	}
	@JsonIgnore
	public void setSIGN(String vSIGN) {
		SIGN = vSIGN;
	}
	@JsonIgnore
	public String getORDERID() {
		return ORDERID;
	}
	@JsonIgnore
	public void setORDERID(String tORDERID) {
		ORDERID = tORDERID;
	}
	
}
