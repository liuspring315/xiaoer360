package com.xiaoer360.bean.msg;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.codehaus.jackson.annotate.JsonProperty;
import org.codehaus.jackson.map.annotate.JsonSerialize;

import net.sf.json.JSONObject;
@JsonIgnoreProperties(ignoreUnknown = true)
@JsonSerialize(include=JsonSerialize.Inclusion.NON_NULL)
public class RespMsgBody
{

	@JsonProperty("RCODE")
	private String RCODE;
	@JsonProperty("RMSG")
	private String RMSG;

	public RespMsgBody()
	{
		RCODE = "-1";
		RMSG = "null";
	}

	public RespMsgBody(String jsonStr)
	{
		JSONObject rtnjb = JSONObject.fromObject(jsonStr);
		RCODE = rtnjb.getString("RCODE");
		RMSG = rtnjb.getString("RMSG");
	}

	public RespMsgBody(String retCode, String retMsg)
	{
		RCODE = retCode;
		RMSG = retMsg;
	}

	@JsonIgnore
	public String getRCODE()
	{
		return RCODE;
	}

	@JsonIgnore
	public void setRCODE(String rCODE)
	{
		RCODE = rCODE;
	}

	@JsonIgnore
	public String getRMSG()
	{
		return RMSG;
	}

	@JsonIgnore
	public void setRMSG(String rMSG)
	{
		RMSG = rMSG;
	}
}