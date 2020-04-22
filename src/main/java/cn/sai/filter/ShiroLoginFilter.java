package cn.sai.filter;

import cn.sai.entity.Msg;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.shiro.web.servlet.AdviceFilter;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ShiroLoginFilter extends AdviceFilter {
    /**
     * 在访问controller前判断是否登录，返回json，不进行重定向。
     * @param request
     * @param response
     * @return true-继续往下执行，false-该filter过滤器已经处理，不继续执行其他过滤器
     * @throws Exception
     */
    @Override
    protected boolean preHandle(ServletRequest request, ServletResponse response) throws Exception {
        HttpServletRequest httpServletRequest = (HttpServletRequest) request;
        HttpServletResponse httpServletResponse = (HttpServletResponse) response;
        if (isAjax(request)) {
            httpServletResponse.setStatus(200);
            httpServletResponse.setCharacterEncoding("UTF-8");
            httpServletResponse.setContentType("application/json");
            Msg resultData = new Msg();
            resultData.setCode(403);
            ObjectMapper json = new ObjectMapper();
            httpServletResponse.getWriter().write(json.writeValueAsString(resultData));
            System.out.println(resultData.getMsg());
            System.out.println("executelogin执行");
        } else {
            //saveRequestAndRedirectToLogin(request, response);
            /**
             * @Mark 非ajax请求重定向为登录页面
             */
            httpServletResponse.sendRedirect("/login.action");
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
