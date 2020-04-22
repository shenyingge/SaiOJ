package cn.sai.filter;

import cn.sai.entity.Msg;
import com.alibaba.fastjson.JSON;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.apache.shiro.web.filter.authc.UserFilter;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import java.io.IOException;

public class MyUserFilter extends UserFilter {

    public class ShiroUserFilter extends UserFilter {

        @Override
        protected void redirectToLogin(ServletRequest request, ServletResponse response) throws IOException {
//        super.redirectToLogin(request, response);
            response.setContentType("application/json; charset=utf-8");//返回json
                    response.getWriter().write(JSON.toJSONString(Msg.failure()));
        }
    }
}
