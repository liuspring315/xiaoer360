package com.xiaoer360.bean.msg;

import net.sf.json.JSONObject;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.codehaus.jackson.annotate.JsonProperty;
import org.codehaus.jackson.map.annotate.JsonSerialize;
@JsonIgnoreProperties(ignoreUnknown = true)
@JsonSerialize(include=JsonSerialize.Inclusion.NON_NULL)
public  class FlowMesgBody {
		
		
		@JsonProperty("CONTENT")
		private JSONObject CONTENT;
		
		public FlowMesgBody() {

		}

		@JsonIgnore
		public JSONObject getCONTENT() {
			return CONTENT;
		}

		@JsonIgnore
		public void setCONTENT(JSONObject cONTENT) {
			CONTENT = cONTENT;
		}
		

		

}