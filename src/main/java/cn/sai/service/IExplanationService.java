package cn.sai.service;

import cn.sai.entity.Explanation;

import java.util.List;

public interface IExplanationService {

    List<Explanation> selectExplanationsByPid(Integer pid);

}
