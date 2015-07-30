package com.xiaoer360.shiro.realm;
import com.xiaoer360.bean.Permission;
import com.xiaoer360.bean.Role;
import com.xiaoer360.bean.UserGeneralInfo;
import com.xiaoer360.bean.UserTypeEnum;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authc.credential.CredentialsMatcher;
import org.apache.shiro.authz.AuthorizationException;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.cache.CacheManager;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.nutz.dao.Cnd;
import org.nutz.dao.Dao;
import org.nutz.integration.shiro.CaptchaUsernamePasswordToken;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.lang.Lang;
import org.nutz.mvc.Mvcs;

import java.util.Date;

/**
 * 用NutDao来实现Shiro的Realm
 * <p/> 在Web环境中通过Ioc来获取NutDao
 * @功能说明：
 * @公司名称：首都信息发展股份有限公司
 * @作者：zhaochun
 * @创建时间：2015-06-08
 */
@IocBean
public class NutDaoRealm extends AuthorizingRealm {

    @Inject protected Dao dao;

    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        //null usernames are invalid
        if (principals == null) {
            throw new AuthorizationException("PrincipalCollection method argument cannot be null.");
        }
        UserGeneralInfo user = (UserGeneralInfo)principals.getPrimaryPrincipal();
//        UserGeneralInfo user = dao().fetch(UserGeneralInfo.class, userId);
        if (user == null)
            return null;
        if (user.getBeginTime().getTime()> new Date().getTime())
            throw new LockedAccountException("Account [" + user.getUserName() + "] is locked.");

        SimpleAuthorizationInfo auth = new SimpleAuthorizationInfo();
        user = dao().fetchLinks(user, null);
        if (user.getRoles() != null) {
            dao().fetchLinks(user.getRoles(), null);
            for (Role role : user.getRoles()) {
                auth.addRole(role.getName());
                if (role.getPermissions() != null) {
                    for (Permission p : role.getPermissions()) {
                        auth.addStringPermission(p.getName());
                    }
                }
            }
        }
        if (user.getPermissions() != null) {
            for (Permission p : user.getPermissions()) {
                auth.addStringPermission(p.getName());
            }
        }
        return auth;
    }

    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        CaptchaUsernamePasswordToken upToken = (CaptchaUsernamePasswordToken) token;

//        if (Strings.isBlank(upToken.getCaptcha()))
//            throw new AuthenticationException("验证码不能为空");
//        String _captcha = Strings.sBlank(SecurityUtils.getSubject().getSession(true).getAttribute(Toolkit.captcha_attr));
//        if (!upToken.getCaptcha().equalsIgnoreCase(_captcha))
//            throw new AuthenticationException("验证码错误");
        if (StringUtils.isBlank(upToken.getUsername())) {
            throw Lang.makeThrow(AuthenticationException.class, "用户不存在");
        }
        UserGeneralInfo user = dao().fetch(UserGeneralInfo.class, Cnd.where("userName", "=", upToken.getUsername()));
        if (Lang.isEmpty(user)) {
            throw Lang.makeThrow(UnknownAccountException.class, "用户 [ %s ] 不存在", upToken.getUsername());
        }
        if (user.getBeginTime().getTime()> new Date().getTime())
            throw new LockedAccountException("Account [" + upToken.getUsername() + "] 已锁定.");
        if(user.getUserType().intValue() > 1){
//            if (user.getRegisterCheckState() == RegisterCheckStateEnum.LOCK.getCode()) {
//                throw Lang.makeThrow(LockedAccountException.class, "用户 [ %s ] 已锁定.", upToken.getUsername());
//            }
//            if (user.getRegisterCheckState() == RegisterCheckStateEnum.APPROVE_NO.getCode()) {
//                throw Lang.makeThrow(DisabledAccountException.class, "用户 [ %s ] 审核不通过", upToken.getUsername());
//            }
//            if (user.getRegisterCheckState() == RegisterCheckStateEnum.WAIT_APPROVE.getCode()) {
//                throw Lang.makeThrow(DisabledAccountException.class, "用户 [ %s ] 待审核", upToken.getUsername());
//            }
        }

        dao.fetchLinks(user, "roles");
        dao.fetchLinks(user.getRoles(), "permissions");

        dao.fetchLinks(user, "permissions");

        dao.fetchLinks(user, "dicPlace");



        user.setUserTypeName(UserTypeEnum.getUserTypeEnum(user.getUserType()).getName());
        SimpleAccount account = new SimpleAccount(user, user.getPassword(), getName());
        account.setCredentialsSalt(ByteSource.Util.bytes(user.getSalt()));
        return account;
    }

    public NutDaoRealm() {
        this(null, null);
    }

    public NutDaoRealm(CacheManager cacheManager, CredentialsMatcher matcher) {
        super(cacheManager, matcher);
        setAuthenticationTokenClass(CaptchaUsernamePasswordToken.class);
    }

    public NutDaoRealm(CacheManager cacheManager) {
        this(cacheManager, null);
    }

    public NutDaoRealm(CredentialsMatcher matcher) {
        this(null, matcher);
    }

    public Dao dao() {
        if (dao == null) {
            dao = Mvcs.ctx().getDefaultIoc().get(Dao.class, "dao");
            return dao;
        }
        return dao;
    }

    public void setDao(Dao dao) {
        this.dao = dao;
    }
}
