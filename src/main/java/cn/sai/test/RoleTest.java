package cn.sai.test;

import cn.sai.entity.Role;
import cn.sai.service.IRoleService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring/spring-base.xml"})
public class RoleTest {

    @Resource
    IRoleService roleService;

    @Test
    public void selectByTagIdTest(){
        List<Role> roles = roleService.selectRolesByUid(1);
        for(Role role:roles){
            System.out.println(role);
        }
    }

}
