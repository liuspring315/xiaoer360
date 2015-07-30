package com.xiaoer360.bean.msg;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.codehaus.jackson.annotate.JsonProperty;
import org.codehaus.jackson.map.annotate.JsonSerialize;

@JsonIgnoreProperties(ignoreUnknown = true)
@JsonSerialize(include=JsonSerialize.Inclusion.NON_NULL)
public class FlowMesgHeader  {
	@JsonProperty("VERSION")
	private String VERSION;// 娑堟伅鐗堟湰鍙�
	@JsonProperty("TIMESTAMP")
	private String TIMESTAMP; // 鏃堕棿鎴�鎸夋牸寮忥細yyyMMHHmmssSS
	@JsonProperty("SEQNO")
	private String SEQNO; // 璇锋眰搴忓垪鍙凤紝闇�繚鎸佸敮涓��
	@JsonProperty("APPID")
	private String APPID;
	@JsonProperty("SECERTKEY")
	private String SECERTKEY; // 瀹夊叏鏍￠獙KEY MD5(TIMESTAMP+ SEQNO+ UserID)
	
	@JsonIgnore
	public String getVERSION() {
		return VERSION;
	}
	@JsonIgnore
	public void setVERSION(String vERSION) {
		VERSION = vERSION;
	}
	@JsonIgnore
	public String getTIMESTAMP() {
		return TIMESTAMP;
	}
	@JsonIgnore
	public void setTIMESTAMP(String tIMESTAMP) {
		TIMESTAMP = tIMESTAMP;
	}
	@JsonIgnore
	public String getSEQNO() {
		return SEQNO;
	}
	@JsonIgnore
	public void setSEQNO(String sEQNO) {
		SEQNO = sEQNO;
	}
	@JsonIgnore
	public String getAPPID() {
		return APPID;
	}
	@JsonIgnore
	public void setAPPID(String mSISDN) {
		APPID = mSISDN;
	}
	@JsonIgnore
	public String getSECERTKEY() {
		return SECERTKEY;
	}
	@JsonIgnore
	public void setSECERTKEY(String sECERTKEY) {
		SECERTKEY = sECERTKEY;
	}
	
	
	/**
	 * 鏍￠獙Secertkey
	 * @return
	 */
	public boolean checkValidate() {
		// TODO Auto-generated method stub
		return false;
	}
	
	public FlowMesgHeader(){
		VERSION="V1.0";
	}
	
	
	

}