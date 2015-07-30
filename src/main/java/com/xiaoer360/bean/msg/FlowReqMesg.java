package com.xiaoer360.bean.msg;



import org.codehaus.jackson.annotate.JsonIgnore;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.codehaus.jackson.annotate.JsonProperty;
import org.codehaus.jackson.map.annotate.JsonSerialize;


@JsonIgnoreProperties(ignoreUnknown = true)
@JsonSerialize(include=JsonSerialize.Inclusion.NON_NULL)
public class FlowReqMesg {

	@JsonProperty("HEADER")
	private FlowMesgHeader header;

	@JsonProperty("MSGBODY")
	private FlowMesgBody msgbody;

	public FlowReqMesg() {

	}

	public FlowReqMesg(FlowMesgHeader iheader, FlowMesgBody ibody) {
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
	public FlowMesgBody getMsgbody() {
		return msgbody;
	}

	@JsonIgnore
	public void setMsgbody(FlowMesgBody msgbody) {
		this.msgbody = msgbody;
	}

}
