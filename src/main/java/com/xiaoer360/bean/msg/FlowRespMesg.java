package com.xiaoer360.bean.msg;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.codehaus.jackson.annotate.JsonProperty;
import org.codehaus.jackson.map.annotate.JsonSerialize;

@JsonIgnoreProperties(ignoreUnknown = true)
@JsonSerialize(include=JsonSerialize.Inclusion.NON_NULL)
public class FlowRespMesg {

	@JsonProperty("HEADER")
	private FlowMesgHeader header;

	@JsonProperty("MSGBODY")
	private FlowRespMesgBody msgbody;

	public FlowRespMesg() {

	}

	public FlowRespMesg(FlowMesgHeader iheader, FlowRespMesgBody ibody) {
		header = iheader;
		msgbody = ibody;
	}

	@JsonIgnore
	public FlowMesgHeader getHeader() {
		return header;
	}

	@JsonIgnore
	public void setHeader(FlowMesgHeader header) {
		this.header = header;
	}

	@JsonIgnore
	public FlowRespMesgBody getMsgbody() {
		return msgbody;
	}

	@JsonIgnore
	public void setMsgbody(FlowRespMesgBody msgbody) {
		this.msgbody = msgbody;
	}

}