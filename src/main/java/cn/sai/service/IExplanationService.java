package cn.sai.service;

import cn.sai.entity.Explanation;
import cn.sai.entity.ExplanationDto;

import java.util.List;

public interface IExplanationService {

    List<Explanation> selectExplanationsByPid(Integer pid);

    List<ExplanationDto> selectExplanationDtosByPid(Integer pid);

    Explanation selectExplanationByEid(Integer eid);
}
