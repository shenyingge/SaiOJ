package cn.sai.filter;

import cn.sai.entity.Msg;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.apache.shiro.web.util.WebUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class CaptchaFormAuthenticationFilter extends FormAuthenticationFilter {

    private static final Logger log = LoggerFactory
            .getLogger(CaptchaFormAuthenticationFilter.class);


    /*
     *	主要是针对登入成功的处理方法。对于请求头是AJAX的之间返回JSON字符串。
     */
    @Override
    protected boolean onLoginSuccess(AuthenticationToken token,
                                     Subject subject, ServletRequest request, ServletResponse response)
            throws Exception {
        HttpServletRequest httpServletRequest = (HttpServletRequest) request;
        HttpServletResponse httpServletResponse = (HttpServletResponse) response;

        if (!"XMLHttpRequest".equalsIgnoreCase(httpServletRequest
                .getHeader("X-Requested-With"))) {// 不是ajax请求
            issueSuccessRedirect(request, response);
        } else {
//            httpServletResponse.setCharacterEncoding("UTF-8");
//            PrintWriter out = httpServletResponse.getWriter();
//            out.println("{success:true,message:'登入成功'}");
//            out.flush();
//            out.close();
            System.out.println("onloginsuccess执行了");
            WebUtils.issueRedirect(request, response, "http://localhost:8080/SaiOJ/list.action");
        }
        return false;
    }

    /**
     * 主要是处理登入失败的方法
     */
    @Override
    protected boolean onLoginFailure(AuthenticationToken token,
                                     AuthenticationException e, ServletRequest request,
                                     ServletResponse response) {
        if (!"XMLHttpRequest".equalsIgnoreCase(((HttpServletRequest) request)
                .getHeader("X-Requested-With"))) {// 不是ajax请求
            setFailureAttribute(request, e);
            return true;
        }
        try {
            System.out.println("---------1--------");
            response.setCharacterEncoding("UTF-8");
            PrintWriter out = response.getWriter();
            String message = e.getClass().getSimpleName();
            System.out.println(message);
            switch (message) {
                case "IncorrectCredentialsException":
                    out.println("{success:false,message:'密码错误'}");
                    break;
                case "UnknownAccountException":
                    out.println("{success:false,message:'账号不存在'}");
                    break;
                case "LockedAccountException":
                    out.println("{success:false,message:'账号被锁定'}");
                    break;
                default:
                    out.println("{success:false,message:'未知错误'}");
                    break;
            }
            out.flush();
            out.close();
        } catch (IOException e1) {
            // TODO Auto-generated catch block
            e1.printStackTrace();
        }
        return false;
    }

    /**
     * 所有请求都会经过的方法。
     */
    @Override
    protected boolean onAccessDenied(ServletRequest request,
                                     ServletResponse response) throws Exception {
        System.out.println("--------2--------");

        if (isLoginRequest(request, response)) {
            if (isLoginSubmission(request, response)) {
                System.out.println("判断是否ajax执行");
                if (!"XMLHttpRequest"
                        .equalsIgnoreCase(((HttpServletRequest) request)
                        .getHeader("X-Requested-With"))) {// 不是ajax请求
                    return false;
                }
                System.out.println("executelogin执行");
                return executeLogin(request, response);
            } else {
                // allow them to see the login page ;)
                return true;
            }
        } else {
            if (!"XMLHttpRequest"
                    .equalsIgnoreCase(((HttpServletRequest) request)
                            .getHeader("X-Requested-With"))) {// 不是ajax请求
                System.out.println("saveRequestAndRedirectToLogin执行");
                saveRequestAndRedirectToLogin(request, response);
            } else {
                response.setCharacterEncoding("UTF-8");
                PrintWriter out = response.getWriter();
                out.println("{message:'login'}");
                out.flush();
                out.close();
            }
            return false;
        }
    }
}