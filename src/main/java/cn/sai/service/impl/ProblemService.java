package cn.sai.service.impl;

import cn.sai.entity.Problem;
import cn.sai.entity.ProblemDto;
import cn.sai.entity.ProblemExample;
import cn.sai.entity.ProblemExample.Criteria;
import cn.sai.entity.Tag;
import cn.sai.mapper.ProblemMapper;
import cn.sai.service.IProblemService;
import cn.sai.service.ITagService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class ProblemService implements IProblemService {

    @Resource
    ProblemMapper problemMapper;

    @Resource
    ITagService iTagService;

    @Override
    public int saveProblem(Problem problem) {
        return problemMapper.insertSelective(problem);
    }

    @Override
    public List<Problem> selectAll() {
        return problemMapper.selectAll();
    }

    @Override
    public Problem selectProblemByPid(Integer pid) {
        return problemMapper.selectByPrimaryKey(pid);
    }

    //模糊查询题目
    @Override
    public List<Problem> selectProblemsByTitle(String title) {
        ProblemExample example = new ProblemExample();
        if(title != null && !title.equals("")){
            Criteria criteria = example.createCriteria();
            criteria.andTitleLike(title);
            return problemMapper.selectByExample(example);
        }
        return null;
    }


    @Override
    public List<Problem> selectProblemsByTagId(Integer tid) {
        List<Problem> list = problemMapper.selectByTagId(tid);
        return list;
    }

    @Override
    public List<Problem> selectProblemsByTagName(String name) {
        Tag tag = iTagService.selectTagByName(name);
        return this.selectProblemsByTagId(tag.getTid());
    }

    @Override
    public List<ProblemDto> selectDtoAll() {
        return problemMapper.selectDtoAll();
    }
}
