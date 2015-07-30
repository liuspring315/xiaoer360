package com.xiaoer360.bean.msg;

import java.util.List;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.codehaus.jackson.annotate.JsonProperty;
import org.codehaus.jackson.map.annotate.JsonSerialize;
@JsonIgnoreProperties(ignoreUnknown = true)
@JsonSerialize(include=JsonSerialize.Inclusion.NON_NULL)
public class FlowQueryHistoryOrderRespMesg {
	@JsonProperty("ORDERLIST")
	private List<FlowOrderInfoJSON> ORDERLIST;
	@JsonIgnore
	public List<FlowOrderInfoJSON> getORDERLIST() {
		return ORDERLIST;
	}
	@JsonIgnore
	public void setORDERLIST(List<FlowOrderInfoJSON> oRDERLIST) {
		ORDERLIST = oRDERLIST;
	}
	
	public FlowQueryHistoryOrderRespMesg(){
		
	}
	
}
