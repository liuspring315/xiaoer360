package com.xiaoer360.service;

/**
 * @功能说明：
 * @公司名称：首都信息发展股份有限公司
 * @作者：zhaochun
 * @创建时间：2015-06-08
 */
public interface EmailService {

    boolean send(String to, String subject, String html);

}