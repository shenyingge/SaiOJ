package cn.sai.test;

import cn.sai.entity.User;
import cn.sai.service.IUserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring/spring-base.xml"})
public class UserTest {

    @Autowired
    IUserService userService;

    @Test
    public void selectUserWithoutPasswordByUidTest(){
        User user = userService.selectUserWithoutPasswordByUid(1);
        System.out.println(user);
    }

    @Test
    public void saveUser(){
        User user = new User("shen","123456","shen");
        userService.saveUser(user);
        System.out.println(user);
    }

}
