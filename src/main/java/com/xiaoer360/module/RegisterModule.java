package com.xiaoer360.module;

import com.xiaoer360.bean.UserGeneralInfo;
import com.xiaoer360.bean.UserTypeEnum;
import com.xiaoer360.service.manager.UserService;
import org.nutz.dao.Cnd;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.lang.Strings;
import org.nutz.lang.util.NutMap;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;

/**
 * @功能说明：
 * @公司名称：首都信息发展股份有限公司
 * @作者：zhaochun
 * @创建时间：2015-06-10
 */
@IocBean // 声明为Ioc容器中的一个Bean
@At("/web")
public class RegisterModule  extends BaseModule{
    @Inject
    protected UserService userService;
    @At("/register")
    @Ok("jsp:views.user.user_register")
    public void user_register() {
    }

    @At("/user_register_submit")
    public Object user_register_submit(@Param("..")UserGeneralInfo user) {

        NutMap re = new NutMap();
        String msg = checkUser(user, true);
        if (msg != null){
            return re.setv("ok", false).setv("msg", msg);
        }
        user.setUserType(UserTypeEnum.CUSTOMER.getCode());
        user = userService.add(user);
        return re.setv("ok", true).setv("data", user);
    }

    protected String checkUser(UserGeneralInfo user, boolean create) {
        if (user == null) {
            return "空对象";
        }
        if (create) {
            if (Strings.isBlank(user.getUserName()) || Strings.isBlank(user.getPassword()))
                return "用户名/密码不能为空";
        } else {
            if (Strings.isBlank(user.getPassword()))
                return "密码不能为空";
        }
        String passwd = user.getPassword().trim();
        if (6 > passwd.length() || passwd.length() > 12) {
            return "密码长度错误";
        }
        user.setPassword(passwd);
        if (create) {
            int count = dao.count(UserGeneralInfo.class, Cnd.where("userName", "=", user.getUserName()));
            if (count != 0) {
                return "用户名已经存在";
            }
            count = dao.count(UserGeneralInfo.class, Cnd.where("email", "=", user.getEmail()));
            if (count != 0) {
                return "email已经存在";
            }

        } else {
            if (user.getId() < 1) {
                return "用户Id非法";
            }
        }
        if (user.getUserName() != null)
            user.setUserName(user.getUserName().trim());
        return null;
    }

}
