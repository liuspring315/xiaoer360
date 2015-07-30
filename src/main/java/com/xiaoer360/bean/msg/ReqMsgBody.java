package com.xiaoer360.bean.msg;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.codehaus.jackson.annotate.JsonProperty;
import org.codehaus.jackson.map.annotate.JsonSerialize;
@JsonIgnoreProperties(ignoreUnknown = true)
@JsonSerialize(include=JsonSerialize.Inclusion.NON_NULL)
public class ReqMsgBody {

	@JsonProperty("FUNCID")
	private String FUNCID;

	@JsonIgnore
	public String getFUNCID() {
		return FUNCID;
	}

	@JsonIgnore
	public void setFUNCID(String fUNCID) {
		FUNCID = fUNCID;
	}

	public ReqMsgBody() {
		super();
	}

}