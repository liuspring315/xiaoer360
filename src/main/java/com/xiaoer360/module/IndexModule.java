package com.xiaoer360.module;

import com.xiaoer360.bean.UserGeneralInfo;
import com.xiaoer360.bean.UserTypeEnum;
import org.apache.shiro.authz.annotation.RequiresUser;
import org.nutz.dao.Cnd;
import org.nutz.dao.Condition;
import org.nutz.dao.FieldFilter;
import org.nutz.dao.QueryResult;
import org.nutz.dao.pager.Pager;
import org.nutz.dao.util.Daos;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.mvc.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.sql.SQLException;

/**
 * @功能说明：
 * @公司名称：首都信息发展股份有限公司
 * @作者：zhaochun
 * @创建时间：2015-06-09
 */

@IocBean // 声明为Ioc容器中的一个Bean
public class IndexModule extends BaseModule {
    @At({"/", "/main"})
    @GET
    @Ok("jsp:views.user.login")
    public void index() {
    }

    @GET
    @At({"/login", "/user/login"})
    @Ok("jsp:views.user.login")
    public void loginPage() {}

    @At
    @Ok("redirect:/${obj}")
    @RequiresUser
    public String index(@Attr("me") UserGeneralInfo user){
        return "manager/main";

    }




     @Ok("raw:jpg")
     @At("/web/avatar")
     @GET
     public Object readAvatar(@Param("id") int id, HttpServletRequest req) throws SQLException {
        UserGeneralInfo profile = Daos.ext(dao, FieldFilter.create(UserGeneralInfo.class, "^headThumb$")).fetch(UserGeneralInfo.class,id);
        if (profile == null || profile.getHeadThumb() == null) {
            return new File(req.getSession().getServletContext().getRealPath("/rs/user_avatar/none.jpg"));
        }
        return profile.getHeadThumb();
    }


}
