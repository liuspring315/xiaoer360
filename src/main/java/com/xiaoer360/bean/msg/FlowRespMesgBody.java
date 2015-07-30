
package com.xiaoer360.bean.msg;

import net.sf.json.JSONObject;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.codehaus.jackson.annotate.JsonProperty;
import org.codehaus.jackson.map.annotate.JsonSerialize;

@JsonIgnoreProperties(ignoreUnknown = true)
@JsonSerialize(include=JsonSerialize.Inclusion.NON_NULL)
public class FlowRespMesgBody {

	@JsonProperty("CONTENT")
	private JSONObject CONTENT;
	
	@JsonProperty("RESP")
	private RespMsgBody RESP;
	
	
	public FlowRespMesgBody() {

	}

	@JsonIgnore
	public JSONObject getCONTENT() {
		return CONTENT;
	}

	@JsonIgnore
	public void setCONTENT(JSONObject cONTENT) {
		CONTENT = cONTENT;
	}
	
	@JsonIgnore
	public RespMsgBody getRESP() {
		return RESP;
	}
	@JsonIgnore
	public void setRESP(RespMsgBody rESP) {
		RESP = rESP;
	}

}