package com.xiaoer360.service.manager;
import com.xiaoer360.bean.AuthenticationStatEnum;
import com.xiaoer360.bean.RegisterCheckStateEnum;
import com.xiaoer360.bean.UserGeneralInfo;
import com.xiaoer360.bean.UserTypeEnum;
import org.apache.shiro.crypto.hash.Sha256Hash;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.lang.random.R;
import org.nutz.service.IdNameEntityService;

import java.util.Date;

/**
 * @功能说明：
 * @公司名称：首都信息发展股份有限公司
 * @作者：zhaochun
 * @创建时间：2015-06-08
 */
@IocBean(name="userService",fields="dao")
public class UserServiceImpl extends IdNameEntityService<UserGeneralInfo> implements UserService {

    public UserGeneralInfo add(String name, String password,UserTypeEnum userType) {
        UserGeneralInfo user = new UserGeneralInfo();
        user.setUserName(name.trim());
        user.setBirthday(new Date());
        user.setEmail(name + "@163.com");
        user.setFamilyName(name);
        user.setLastName(name);
        user.setMobile("13412341234");
        user.setRegisterCheckState(RegisterCheckStateEnum.WAIT_APPROVE.getCode());
        user.setAuthenticationStat(AuthenticationStatEnum.WAIT_APPROVE.getCode());
        user.setSalt(R.UU16());
        user.setPassword(new Sha256Hash(password, user.getSalt()).toHex());
        user.setUserType(userType.getCode());
        Date now = new Date();
        user.setBeginTime(now);
        user.setUpdateTime(now);
        user.setCreateTime(now);
        return dao().insert(user);
    }

    public UserGeneralInfo add(UserGeneralInfo user){
        user.setUserName(user.getUserName().trim());
        user.setSalt(R.UU16());
        user.setPassword(new Sha256Hash(user.getPassword(), user.getSalt()).toHex());
        Date now = new Date();
        user.setBeginTime(now);
        user.setUpdateTime(now);
        user.setCreateTime(now);

        user.setRegisterCheckState(RegisterCheckStateEnum.WAIT_APPROVE.getCode());
        user.setAuthenticationStat(AuthenticationStatEnum.WAIT_APPROVE.getCode());

        return dao().insert(user);
    }

    public int fetch(String username, String password) {
        UserGeneralInfo user = fetch(username);
        if (user == null) {
            return -1;
        }
        String _pass = new Sha256Hash(password, user.getSalt()).toHex();
        if(_pass.equalsIgnoreCase(user.getPassword())) {
            return user.getId();
        }
        return -1;
    }

    public void updatePassword(int userId, String password) {
        UserGeneralInfo user = fetch(userId);
        if (user == null) {
            return;
        }
        user.setSalt(R.UU16());
        user.setPassword(new Sha256Hash(password, user.getSalt()).toHex());
        user.setUpdateTime(new Date());
        dao().update(user, "^(password|salt|updateTime)$");
    }

    public boolean updateRegisterCheckState(int userId, int rc) {
        UserGeneralInfo user = fetch(userId);
        if (user == null) {
            return false;
        }
        if(user.getUserType().intValue() > 1) {
            user.setRegisterCheckState(rc);
            user.setUpdateTime(new Date());
            dao().update(user, "^(registerCheckState|updateTime)$");
            return true;
        }else{
            return false;
        }
    }
}