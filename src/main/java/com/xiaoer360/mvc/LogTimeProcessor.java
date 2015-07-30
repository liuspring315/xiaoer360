package com.xiaoer360.mvc;

/**
 * @功能说明：
 * @公司名称：首都信息发展股份有限公司
 * @作者：zhaochun
 * @创建时间：2015-06-08
 */
import org.nutz.lang.Stopwatch;
import org.nutz.log.Log;
import org.nutz.log.Logs;
import org.nutz.mvc.ActionContext;
import org.nutz.mvc.impl.processor.AbstractProcessor;

import javax.servlet.http.HttpServletRequest;

public class LogTimeProcessor extends AbstractProcessor {

    private static final Log log = Logs.get();

    public LogTimeProcessor() {
    }

    @Override
    public void process(ActionContext ac) throws Throwable {
        Stopwatch sw = Stopwatch.begin();
        try {
            doNext(ac);
        } finally {
            sw.stop();
            if (log.isDebugEnabled()) {
                HttpServletRequest req = ac.getRequest();
                log.debugf("[%4s]URI=%s %sms", req.getMethod(), req.getRequestURI(), sw.getDuration());
            }
        }
    }

}