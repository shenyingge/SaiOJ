package cn.sai.controller;

import cn.sai.entity.*;
import cn.sai.service.IExplanationService;
import cn.sai.service.IProblemService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.commons.lang.StringEscapeUtils;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

@Controller
public class ExplanationController {

    @Resource
    IExplanationService explanationService;

    @Resource
    IProblemService problemService;

    //查询题解数据（分页查询）
    @ResponseBody
    @RequestMapping("/explanations.do")
    Msg getExplanations(@RequestParam(value = "pn",defaultValue = "1")Integer pn,
                        @RequestParam(value = "pid")Integer pid,
                        Model model){
        PageHelper.startPage(pn,10);
        List<ExplanationDto> explanationDtos = explanationService.selectExplanationDtosByPid(pid);
        PageInfo page = new PageInfo(explanationDtos,5);  //navigatePages：显示的页数
        return Msg.success().add("pageInfo",page);
    }

    //查询我的题解数据（分页查询）
    @ResponseBody
    @RequestMapping("/myExplanations.do")
    Msg getMyExplanations(@RequestParam(value = "uid")Integer uid,
                          @RequestParam(value = "pn",defaultValue = "1")Integer pn,
                        Model model){
        PageHelper.startPage(pn,10);
        List<ExplanationDtoWithProblem> explanationDtos = explanationService.selectExplanationDtosByUid(uid);
        PageInfo page = new PageInfo(explanationDtos,5);  //navigatePages：显示的页数
        return Msg.success().add("pageInfo",page);
    }

    //查看对应题解
    @RequiresRoles("普通用户")
    @RequestMapping("/explanation.do")
    String showExplanations(@RequestParam Integer eid, Model model){
       Explanation explanation = explanationService.selectExplanationByEid(eid);
       explanation.setContent(StringEscapeUtils.escapeHtml(explanation.getContent()));
        model.addAttribute("explanation",explanation);
        return "explanation";
    }

    @RequiresRoles("普通用户")
    @RequestMapping("/editExplanation")
    String editExplanation(@RequestParam(value = "pid") Integer pid, Model model){
        Problem problem = problemService.selectProblemByPid(pid);
        model.addAttribute("problem",problem);
        return "editExplanation";
    }

    @RequiresRoles("普通用户")
    @ResponseBody
    @RequestMapping(value = "/saveExplanation", method = RequestMethod.POST)
    Msg saveExplanation(@RequestParam(value = "uid")Integer uid,
                        @RequestParam(value = "pid")Integer pid,
                        @RequestParam(value = "content")String content){
        System.out.println(content);
        Explanation explanation = new Explanation(uid,pid,content);
        int eid = explanationService.saveExplanation(explanation);
        return Msg.success().add("eid",eid);
    }

}
