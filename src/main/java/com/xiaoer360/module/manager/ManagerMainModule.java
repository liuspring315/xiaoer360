package com.xiaoer360.module.manager;

import com.xiaoer360.bean.UserGeneralInfo;
import com.xiaoer360.module.BaseModule;
import org.apache.shiro.authz.annotation.RequiresUser;
import org.nutz.dao.FieldFilter;
import org.nutz.dao.util.Daos;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Attr;
import org.nutz.mvc.annotation.GET;
import org.nutz.mvc.annotation.Ok;

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
@At("/manager") // 整个模块的路径前缀
public class ManagerMainModule extends BaseModule {

    @At
    @GET
    @Ok("jsp:views.manager.main")
    public void main() {
    }

    @RequiresUser
    @Ok("raw:jpg")
    @At("/avatar")
    @GET
    public Object readAvatar(@Attr("me")UserGeneralInfo me, HttpServletRequest req) throws SQLException {
        UserGeneralInfo profile = Daos.ext(dao, FieldFilter.create(UserGeneralInfo.class, "^headThumb$")).fetch(UserGeneralInfo.class, me.getId());
        if (profile == null || profile.getHeadThumb() == null) {
            return new File(req.getSession().getServletContext().getRealPath("/rs/user_avatar/none.jpg"));
        }
        return profile.getHeadThumb();
    }


}
