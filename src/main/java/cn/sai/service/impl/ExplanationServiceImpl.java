package cn.sai.service.impl;

import cn.sai.entity.Explanation;
import cn.sai.entity.ExplanationDto;
import cn.sai.entity.ExplanationDtoWithProblem;
import cn.sai.mapper.ExplanationMapper;
import cn.sai.service.IExplanationService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class ExplanationServiceImpl implements IExplanationService {

    @Resource
    ExplanationMapper explanationMapper;

    @Override
    public List<Explanation> selectExplanationsByPid(Integer pid) {
        return explanationMapper.selectByPid(pid);
    }

    @Override
    public List<ExplanationDto> selectExplanationDtosByPid(Integer pid) {
        return explanationMapper.selectExplanationDtosByPid(pid);
    }

    @Override
    public Explanation selectExplanationByEid(Integer eid) {
        return explanationMapper.selectByPrimaryKey(eid);
    }

    @Override
    public Integer saveExplanation(Explanation explanation) {
        explanationMapper.insertSelective(explanation);
        return explanation.getEid();
    }

    @Override
    public List<ExplanationDtoWithProblem> selectExplanationDtosByUid(Integer uid) {
        return explanationMapper.selectExplanationDtosByUid(uid);
    }

}
