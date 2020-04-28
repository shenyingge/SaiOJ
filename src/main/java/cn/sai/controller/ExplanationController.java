package cn.sai.controller;

import cn.sai.entity.Explanation;
import cn.sai.entity.ExplanationDto;
import cn.sai.entity.Msg;
import cn.sai.service.IExplanationService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

@Controller
public class ExplanationController {

    @Resource
    IExplanationService explanationService;

    //查询题解数据（分页查询）
    @ResponseBody
    @RequestMapping("/explanations.do")
    Msg getExplanations(@RequestParam(value = "pn",defaultValue = "1")Integer pn,
                        @RequestParam(value = "pid")Integer pid,
                        Model model){
        PageHelper.startPage(pn,5);
        List<ExplanationDto> explanationDtos = explanationService.selectExplanationDtosByPid(pid);
        PageInfo page = new PageInfo(explanationDtos,5);  //navigatePages：显示的页数
        return Msg.success().add("pageInfo",page);
    }

    @RequestMapping("/explanation.do")
    String showExplanations(@RequestParam Integer eid, Model model){
       Explanation explanation = explanationService.selectExplanationByEid(eid);
        model.addAttribute("explanation",explanation);
        return "explanation";
    }

}
