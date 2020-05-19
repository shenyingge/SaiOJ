package cn.sai.test;

import cn.sai.entity.Explanation;
import cn.sai.entity.ExplanationDto;
import cn.sai.entity.ExplanationDtoWithProblem;
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

    @Test
    public void saveExplanationTest(){
        int n = explanationService.saveExplanation(new Explanation(1,1,"code"));
        System.out.println(n);
    }

    @Test
    public void selectExplanationDtosByUidTest(){
        List<ExplanationDtoWithProblem> explanationDtoWithProblems = explanationService.selectExplanationDtosByUid(1);
        for (ExplanationDtoWithProblem e: explanationDtoWithProblems) {
            System.out.println(e);
        }
    }
}
