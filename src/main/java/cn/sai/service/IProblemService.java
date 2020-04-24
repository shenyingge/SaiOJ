package cn.sai.service;

import cn.sai.entity.Problem;
import cn.sai.entity.ProblemDto;

import java.util.List;

public interface IProblemService {

    int saveProblem(Problem problem);

    List<Problem> selectAll();

    Problem selectProblemByPid(Integer pid);

    List<Problem> selectProblemsByTitle(String title);

    List<Problem> selectProblemsByTagId(Integer tid);

    List<Problem> selectProblemsByTagName(String name);
    //联合查询问题和题解
    List<ProblemDto> selectDtoAll();
}
