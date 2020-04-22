package cn.sai.filter;

import cn.sai.entity.Msg;
import com.alibaba.fastjson.JSON;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.apache.shiro.web.util.WebUtils;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class MyFormFilter1 extends FormAuthenticationFilter {

    @Override
    protected void issueSuccessRedirect(ServletRequest request, ServletResponse response)
            throws Exception {
        WebUtils.issueRedirect(request, response,getSuccessUrl(), null, true);
    }
    @Override
    protected boolean onAccessDenied(ServletRequest request, ServletResponse response) throws IOException {
        System.out.println("-------------111-------------");
        HttpServletResponse httpServletResponse = (HttpServletResponse) response;
        if (isAjax(request)) {
            httpServletResponse.setStatus(200);
            httpServletResponse.setCharacterEncoding("UTF-8");
            httpServletResponse.setContentType("application/json");
            Msg resultData = new Msg();
            resultData.setCode(403);
            resultData.setMsg("登录认证失效，请重新登录!");
            ObjectMapper json = new ObjectMapper();
            httpServletResponse.getWriter().write(json.writeValueAsString(resultData));
            System.out.println(resultData.getMsg());
        } else {
            //saveRequestAndRedirectToLogin(request, response);
            /**
             * @Mark 非ajax请求重定向为登录页面
             */
            httpServletResponse.sendRedirect("/SaiOJ/login.html");
        }
        return false;
    }

    private boolean isAjax(ServletRequest request){
        String header = ((HttpServletRequest) request).getHeader("X-Requested-With");
        if("XMLHttpRequest".equalsIgnoreCase(header)){
            return Boolean.TRUE;
        }
        System.out.println("-------------1-------------");
        return Boolean.FALSE;
    }

}
