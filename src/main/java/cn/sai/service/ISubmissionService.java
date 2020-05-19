package cn.sai.service;

import cn.sai.entity.Submission;
import cn.sai.entity.SubmissionDto;

import java.util.List;

public interface ISubmissionService {
    int saveSubmission(Submission submission);

    List<SubmissionDto> selectAllWithUser();

    List<SubmissionDto> selectByUid(Integer uid);

    SubmissionDto selectDtoBySid(Integer sid);
}
