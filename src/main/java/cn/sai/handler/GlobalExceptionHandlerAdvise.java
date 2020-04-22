package cn.sai.handler;

import cn.sai.entity.Msg;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;

//@RestControllerAdvice
public class GlobalExceptionHandlerAdvise {

//    @ExceptionHandler(value = {UnknownAccountException.class})
//    @ResponseStatus(HttpStatus.UNAUTHORIZED)
//    public Msg unknown(){
//        return Msg.UNKNOWN;
//    }
//
//    @ExceptionHandler(value = {IncorrectCredentialsException.class})
//    @ResponseStatus(HttpStatus.UNAUTHORIZED)
//    public Msg incorrect(){
//        return Msg.INCORRECT;
//    }
//
//    @ExceptionHandler(value = {AuthenticationException.class})
//    @ResponseStatus(HttpStatus.UNAUTHORIZED)
//    public Msg other(){
//        return Msg.OTHER;
//    }

}
