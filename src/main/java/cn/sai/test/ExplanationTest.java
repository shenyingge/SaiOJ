package cn.sai.test;

import cn.sai.entity.ExplanationDto;
import cn.sai.service.IExplanationService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring/spring-base.xml"})
public class ExplanationTest {

    @Autowired
    IExplanationService explanationService;

    @Test
    public void selectExplanationDtosByPidTest(){
        List<ExplanationDto> explanationDtos = explanationService.selectExplanationDtosByPid(1);
        for (ExplanationDto dto:explanationDtos){
            System.out.println(dto);
        }
    }
}
