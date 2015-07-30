package com.xiaoer360.module;

/**
 * @功能说明：Module类的一些属性总是雷同的,所以,新建一个BaseModule类
 * @公司名称：首都信息发展股份有限公司
 * @作者：zhaochun
 * @创建时间：2015-06-08
 */
import com.xiaoer360.service.EmailService;
import net.sf.ehcache.CacheManager;
import org.nutz.dao.Condition;
import org.nutz.dao.Dao;
import org.nutz.dao.QueryResult;
import org.nutz.dao.pager.Pager;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.lang.random.R;
import org.nutz.lang.util.NutMap;

import java.util.List;

public abstract class BaseModule {

    /** 注入同名的一个ioc对象 */
    @Inject protected Dao dao;

    @Inject protected EmailService emailService;

    @Inject protected CacheManager cacheManager;

    protected byte[] emailKEY = R.sg(24).next().getBytes();
    protected QueryResult query(Class<?> klass, Condition cnd, Pager pager, String regex) {
        if (pager != null && pager.getPageNumber() < 1) {
            pager.setPageNumber(1);
        }
        List<?> roles = dao.query(klass, cnd, pager);
        dao.fetchLinks(roles, null);
        pager.setRecordCount(dao.count(klass, cnd));
        return new QueryResult(roles, pager);
    }

    protected NutMap ajaxOk(Object data) {
        return new NutMap().setv("ok", true).setv("data", data);
    }

    protected NutMap ajaxFail(String msg) {
        return new NutMap().setv("ok", true).setv("msg", msg);
    }
}