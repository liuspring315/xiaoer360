
package com.xiaoer360.bean.msg;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.codehaus.jackson.annotate.JsonProperty;
import org.codehaus.jackson.map.annotate.JsonSerialize;
@JsonIgnoreProperties(ignoreUnknown = true)
@JsonSerialize(include=JsonSerialize.Inclusion.NON_NULL)
public class FlowQueryHistoryOrderReqMesg  {
	@JsonProperty("SIGN")
	private String SIGN;// 绛惧悕
	@JsonProperty("USER")
	private String USER; // 鐢ㄦ埛鏍囪瘑
	@JsonProperty("START")
	private String START; // 寮�鏃ユ湡銆�
	@JsonProperty("END")
	private String END; //缁撴潫鏃ユ湡
	@JsonProperty("PAGESIZE")
	private String PAGESIZE; // 椤甸潰澶у皬
	@JsonProperty("PAGENO")
	private String PAGENO; // 褰撳墠椤电爜
	@JsonProperty("DTYPE")
	private String DTYPE;
	
	@JsonProperty("APPID")
	private String APPID; // 褰撳墠椤电爜
	@JsonProperty("ENTERPRISEID")
	private String ENTERPRISEID; // 褰撳墠椤电爜
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
	public String getSTART() {
		return START;
	}
	@JsonIgnore
	public void setPACKAGEID(String sSTART) {
		START = sSTART;
	}
	@JsonIgnore
	public String getEND() {
		return END;
	}
	@JsonIgnore
	public void setAPPID(String oEND) {
		END = oEND;
	}
	@JsonIgnore
	public String getPAGESIZE() {
		return PAGESIZE;
	}
	@JsonIgnore
	public void setPAGESIZE(String sPAGESIZE) {
		PAGESIZE = sPAGESIZE;
	}
	@JsonIgnore
	public String getPAGENO() {
		return PAGENO;
	}
	@JsonIgnore
	public void setPAGENO(String sPAGENO) {
		PAGENO = sPAGENO;
	}
	public String getENTERPRISEID() {
		return ENTERPRISEID;
	}
	public void setENTERPRISEID(String eNTERPRISEID) {
		ENTERPRISEID = eNTERPRISEID;
	}
	public String getAPPID() {
		return APPID;
	}
	public void setSTART(String sTART) {
		START = sTART;
	}
	public void setEND(String eND) {
		END = eND;
	}
	public String getDTYPE() {
		return DTYPE;
	}
	public void setDTYPE(String dTYPE) {
		DTYPE = dTYPE;
	}
	
	
}
