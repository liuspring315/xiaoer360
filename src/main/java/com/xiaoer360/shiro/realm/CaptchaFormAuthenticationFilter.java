package com.xiaoer360.shiro.realm;

/**
 * @功能说明：
 * @公司名称：首都信息发展股份有限公司
 * @作者：zhaochun
 * @创建时间：2015-06-11
 */
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.apache.shiro.web.util.WebUtils;
import org.nutz.integration.shiro.CaptchaUsernamePasswordToken;
import org.nutz.integration.shiro.NutShiro;
import org.nutz.lang.util.NutMap;
import org.nutz.mvc.ActionContext;
import org.nutz.mvc.ActionFilter;
import org.nutz.mvc.View;

public class CaptchaFormAuthenticationFilter extends FormAuthenticationFilter implements ActionFilter {
    private String captchaParam = "captcha";

    public CaptchaFormAuthenticationFilter() {
    }

    public String getCaptchaParam() {
        return this.captchaParam;
    }

    protected String getCaptcha(ServletRequest request) {
        return WebUtils.getCleanParam(request, this.getCaptchaParam());
    }

    public AuthenticationToken createToken(ServletRequest request, ServletResponse response) {
        String username = this.getUsername(request);
        String password = this.getPassword(request);
        String captcha = this.getCaptcha(request);
        boolean rememberMe = this.isRememberMe(request);
        String host = this.getHost(request);
        return new CaptchaUsernamePasswordToken(username, password, rememberMe, host, captcha);
    }

    protected boolean onLoginFailure(AuthenticationToken token, AuthenticationException e, ServletRequest req, ServletResponse resp) {
        if(NutShiro.isAjax(req)) {
            String mess = e.getMessage();
            if(e instanceof IncorrectCredentialsException){
                mess = "用户名或密码错误";
            }
            NutMap re = (new NutMap()).setv("ok", Boolean.valueOf(false)).setv("msg", mess);
            NutShiro.rendAjaxResp(req, resp, re);
            return false;
        } else {
            return super.onLoginFailure(token, e, req, resp);
        }
    }

    protected boolean onLoginSuccess(AuthenticationToken token, Subject subject, ServletRequest req, ServletResponse resp) throws Exception {
        subject.getSession().setAttribute(NutShiro.SessionKey, subject.getPrincipal());
        if(NutShiro.isAjax(req)) {
            NutShiro.rendAjaxResp(req, resp, (new NutMap()).setv("ok", Boolean.valueOf(true)));
            return false;
        } else {
            return super.onLoginSuccess(token, subject, req, resp);
        }
    }

    public View match(ActionContext ac) {
        HttpServletRequest request = ac.getRequest();
        AuthenticationToken authenticationToken = this.createToken(request, ac.getResponse());
        request.setAttribute("loginToken", authenticationToken);
        return null;
    }
}
