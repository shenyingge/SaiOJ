package cn.sai.service.impl;

import cn.sai.entity.Explanation;
import cn.sai.mapper.ExplanationMapper;
import cn.sai.service.IExplanationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ExplanationServiceImpl implements IExplanationService {

    @Autowired
    ExplanationMapper explanationMapper;

    @Override
    public List<Explanation> selectExplanationsByPid(Integer pid) {
        return explanationMapper.selectByPid(pid);
    }
}
