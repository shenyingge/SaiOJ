package cn.sai.test;

import cn.sai.entity.Submission;
import cn.sai.entity.SubmissionDto;
import cn.sai.service.ISubmissionService;
import org.apache.commons.lang.StringEscapeUtils;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring/spring-base.xml"})
public class SubmissionTest {

    @Autowired
    ISubmissionService submissionService;

    @Test
    public void saveSubmission(){
        Submission submission = new Submission("c_cpp",1,1,0,true,"#include<iostream>\n" +
                "using namespace std;\n" +
                "int main(){\n" +
                "    cout<<\"hello world!\"<<endl;\n" +
                "    return 0;\n" +
                "}");
        submissionService.saveSubmission(submission);
        System.out.println(submission.getSid());
    }

    @Test
    public void selectAllWithUserTest(){
        List<SubmissionDto> submissionDtos = submissionService.selectAllWithUser();
        for(SubmissionDto dto: submissionDtos){
            System.out.println(dto);
        }
    }

    @Test
    public void selectDtoBySidTest(){
        SubmissionDto submissionDto = submissionService.selectDtoBySid(2);
        String code = submissionDto.getSubmission().getCode();
        submissionDto.getSubmission().setCode(StringEscapeUtils.escapeHtml(code));
        System.out.println(submissionDto);
    }

}
