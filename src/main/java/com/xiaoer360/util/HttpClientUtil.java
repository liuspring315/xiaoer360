package com.xiaoer360.util;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.methods.RequestEntity;
import org.apache.commons.httpclient.methods.StringRequestEntity;
import org.apache.commons.httpclient.protocol.Protocol;

public class HttpClientUtil {

	private static final String APPLICATION_JSON = "application/json";

	private static final String CONTENT_TYPE_TEXT_JSON = "text/json";

	private static final String UTF_8 = "UTF-8";

	/**
	 * 寰�寚瀹氱殑URL鍙戦�鏁版嵁銆傦紙JSON锛�	 * 
	 * @param data
	 * @param url
	 * @return
	 */
	public final static String sendData(String data, String url) {
		HttpClient httpClient = new HttpClient();

		PostMethod httpPost = new PostMethod(url);
		httpPost.setRequestHeader("content-type", APPLICATION_JSON);
		RequestEntity se = new StringRequestEntity(data);
		httpPost.setRequestEntity(se);
		try {

			int responseCode = httpClient.executeMethod(httpPost);
			if (responseCode == 200) {
				byte[] resBody = httpPost.getResponseBody();

				String responseString = "";
				if (null == resBody || 0 == resBody.length) {
					responseString = httpPost.getResponseBodyAsString();
				} else {
					responseString = new String(resBody, UTF_8);
				}
				return responseString;
			}

		} catch (Exception e) {
			e.printStackTrace();
			// Assert.fail(e.getLocalizedMessage());

		}
		return "";
	}

	/**
	 * 寰�寚瀹氱殑URL鍙戦�鏁版嵁銆傦紙JSON+HTTPS锛�	 * 
	 * @param data
	 * @param url
	 * @return
	 */
	public final static String sendDataHttps(String data, String url) {
		HttpClient httpClient = new HttpClient();

		try {
			Protocol myhttps = new Protocol("https",
					new MySSLProtocolSocketFactory(), 443);

			Protocol.registerProtocol("https", myhttps);

			PostMethod httpPost = new PostMethod(url);
			// GetMethod httpGet = new GetMethod(url);
			httpPost.setRequestHeader("content-type", "application/json");
			RequestEntity se = new StringRequestEntity(data);
			httpPost.setRequestEntity(se);

			// httpPost.setRequestHeader("content-type", APPLICATION_JSON);
			// RequestEntity se = new StringRequestEntity(data);
			// httpPost.setRequestEntity(se);

			int responseCode = httpClient.executeMethod(httpPost);
			byte[] resBody = httpPost.getResponseBody();

			String responseString = "";
			if (null == resBody || 0 == resBody.length) {
				responseString = httpPost.getResponseBodyAsString();
			} else {
				responseString = new String(resBody, UTF_8);
			}
			return responseString;

		} catch (Exception e) {
			e.printStackTrace();
			// Assert.fail(e.getLocalizedMessage());

		}
		return "";
	}

	public final static String sendDataHttpsViaGet(String url) {
		HttpClient httpClient = new HttpClient();

		try {
			Protocol myhttps = new Protocol("https",
					new MySSLProtocolSocketFactory(), 443);

			Protocol.registerProtocol("https", myhttps);

			GetMethod httpGet = new GetMethod(url);
			httpGet.setRequestHeader("content-type", "application/json");

			int responseCode = httpClient.executeMethod(httpGet);
			byte[] resBody = httpGet.getResponseBody();

			String responseString = "";
			if (null == resBody || 0 == resBody.length) {
				responseString = httpGet.getResponseBodyAsString();
			} else {
				responseString = new String(resBody, "UTF-8");
			}
			System.out.println("Https url=" + url);
			System.out.println("Https get ret=" + responseString);
			return responseString;

		} catch (Exception e) {
			e.printStackTrace();
			// Assert.fail(e.getLocalizedMessage());

		}
		return "";
	}

	public final static String sendDataHttpViaGet(String url) {
		HttpClient httpClient = new HttpClient();

		try {
			

			GetMethod httpGet = new GetMethod(url);
			httpGet.setRequestHeader("content-type", "application/json");
			

			int responseCode = httpClient.executeMethod(httpGet);
			byte[] resBody = httpGet.getResponseBody();

			String responseString = "";
			if (null == resBody || 0 == resBody.length) {
				responseString = httpGet.getResponseBodyAsString();
			} else {
				responseString = new String(resBody, "UTF-8");
			}
			System.out.println("Http url="+url);
			System.out.println("Http get ret="+responseString);
			return responseString;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}

	public static void main(String[] args) throws Exception {
		HttpClientUtil hrp = new HttpClientUtil();

	}

}
