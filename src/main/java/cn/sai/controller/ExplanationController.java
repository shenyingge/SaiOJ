package cn.sai.controller;

import cn.sai.entity.Explanation;
import cn.sai.service.IExplanationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import java.util.List;

@Controller
public class ExplanationController {

    @Resource
    IExplanationService explanationService;

    @RequestMapping("explanations.do")
    String showExplanations(@RequestParam Integer pid, Model model){
        List<Explanation> explanations = explanationService.selectExplanationsByPid(pid);
        model.addAttribute("explanations",explanations);
        return "explanations";
    }

}
