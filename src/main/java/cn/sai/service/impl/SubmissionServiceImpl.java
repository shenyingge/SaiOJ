package cn.sai.service.impl;

import cn.sai.entity.Submission;
import cn.sai.entity.SubmissionDto;
import cn.sai.mapper.SubmissionMapper;
import cn.sai.service.ISubmissionService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class SubmissionServiceImpl implements ISubmissionService {

    @Resource
    SubmissionMapper submissionMapper;

    @Override
    public int saveSubmission(Submission submission) {
        return submissionMapper.insertSelective(submission);
    }

    @Override
    public List<SubmissionDto> selectAllWithUser() {
        return submissionMapper.selectAllWithUser();
    }

    @Override
    public List<SubmissionDto> selectByUid(Integer uid) {
        return submissionMapper.selectByUid(uid);
    }

    @Override
    public SubmissionDto selectDtoBySid(Integer sid) {
        return submissionMapper.selectDtoBySid(sid);
    }

}
