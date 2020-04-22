package cn.sai.filter;

import cn.sai.entity.Msg;
import com.alibaba.fastjson.JSONObject;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.apache.shiro.web.util.WebUtils;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

public class MyFormFilter2 extends FormAuthenticationFilter {

    //继承的实际就是authc代表的过滤器，可以查阅源码重写父类的方法实现需求


    @Override
    protected void issueSuccessRedirect(ServletRequest request, ServletResponse response)
            throws Exception {
        WebUtils.issueRedirect(request, response,getSuccessUrl(), null, true);
    }
        //顾名思义，这是判断时候允许通过的方法，在这个方法里处理了options请求，
       /* 然后接下来直接调用父类的方法实现着个方法真正需要做的事-----总结起来就是我们重写filter时
        ，如果你能力够那么你彻底覆写也没问题，
        相反，你可以先添加代码实现自己的需求，
        再调用父类同名的方法实现这个方法在shiro真正做到的功能
        */
        @Override
        protected boolean isAccessAllowed(ServletRequest request, ServletResponse response, Object mappedValue) {
            //处理options请求
            if (request instanceof HttpServletRequest) {
                if (((HttpServletRequest) request).getMethod().toUpperCase().equals("OPTIONS")) {
                    return true;
                }
            }
            //如果不是option请求则调用父类方法处理
            return super.isAccessAllowed(request, response, mappedValue);
        }



        //请求未通过，肯定是没有通过shiro的认证
        //重写这个方法防止跳转到Login
        //自己看源码
        @Override
        protected boolean onAccessDenied(ServletRequest request, ServletResponse response)
                throws Exception {
            System.out.println("onAccessDenied");
            //防止乱码，适用于传输JSON数据
            ((HttpServletResponse) response).setHeader("Content-Type","application/json;charset=UTF-8");

            PrintWriter out = response.getWriter();
            out.println(JSONObject.toJSON(Msg.OTHER));
            out.flush();
            out.close();
            //不跳转到Login
            return false;
        }
}
