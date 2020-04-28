package cn.sai.controller;

import cn.sai.entity.Msg;
import cn.sai.entity.Submission;
import cn.sai.entity.SubmissionDto;
import cn.sai.service.impl.SubmissionServiceImpl;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.commons.lang.StringEscapeUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

@Controller
public class SubmissionController {

    @Resource
    SubmissionServiceImpl submissionService;

    //查询提交数据（分页查询）
    @ResponseBody
    @RequestMapping("/submissions.do")
    Msg getExplanations(@RequestParam(value = "pn",defaultValue = "1")Integer pn, Model model){
        PageHelper.startPage(pn,10);
        List<SubmissionDto> submissionDtos = submissionService.selectAllWithUser();
        PageInfo page = new PageInfo(submissionDtos,5);  //navigatePages：显示的页数
        return Msg.success().add("pageInfo",page);
    }

    @ResponseBody
    @RequestMapping(value = "/submission",method = RequestMethod.POST)
    public Msg pushSubmission(@RequestParam(value = "lan")String lan,
                              @RequestParam(value = "uid")Integer uid,
                              @RequestParam(value = "pid")Integer pid,
                              @RequestParam(value = "code")String code
                              ){
        if(lan == null || lan.equals("") || uid == null || pid == null || code == null)
            return Msg.failure();
        Submission submission = new Submission(lan,uid,pid,0,true,code);
        submissionService.saveSubmission(submission);
        return Msg.success().add("sid",submission.getSid());
    }

    @RequestMapping("/submission.do")
    public String getSubmission(@RequestParam(value = "sid")Integer sid, Model model){
        SubmissionDto submissionDto = submissionService.selectDtoBySid(sid);
        String code = submissionDto.getSubmission().getCode();
        submissionDto.getSubmission().setCode(StringEscapeUtils.escapeHtml(code));
        model.addAttribute("dto",submissionDto);
        return "submission";
    }
}
