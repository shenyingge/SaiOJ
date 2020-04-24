package cn.sai.mapper;

import cn.sai.entity.Explanation;
import cn.sai.entity.ExplanationExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ExplanationMapper {
    int countByExample(ExplanationExample example);

    int deleteByExample(ExplanationExample example);

    int deleteByPrimaryKey(Integer eid);

    int insert(Explanation record);

    int insertSelective(Explanation record);

    List<Explanation> selectByExampleWithBLOBs(ExplanationExample example);

    List<Explanation> selectByExample(ExplanationExample example);

    Explanation selectByPrimaryKey(Integer eid);

    Explanation selectByPid(Integer pid);

    int updateByExampleSelective(@Param("record") Explanation record, @Param("example") ExplanationExample example);

    int updateByExampleWithBLOBs(@Param("record") Explanation record, @Param("example") ExplanationExample example);

    int updateByExample(@Param("record") Explanation record, @Param("example") ExplanationExample example);

    int updateByPrimaryKeySelective(Explanation record);

    int updateByPrimaryKeyWithBLOBs(Explanation record);

    int updateByPrimaryKey(Explanation record);
}