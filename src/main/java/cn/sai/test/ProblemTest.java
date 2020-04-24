package cn.sai.test;

import cn.sai.entity.ProblemDto;
import cn.sai.mapper.ProblemMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring/spring-base.xml"})
public class ProblemTest {

    @Autowired
    ProblemMapper problemMapper;

    @Test
    public void selectDtoAllTest(){
        List<ProblemDto> list = problemMapper.selectDtoAll();
        for (ProblemDto p : list) {
            System.out.println(p);
        }
    }

}
