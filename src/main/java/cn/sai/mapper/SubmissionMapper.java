package cn.sai.mapper;

import cn.sai.entity.Submission;
import cn.sai.entity.SubmissionDto;
import cn.sai.entity.SubmissionExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SubmissionMapper {
    int countByExample(SubmissionExample example);

    int deleteByExample(SubmissionExample example);

    int deleteByPrimaryKey(Integer sid);

    int insert(Submission record);

    int insertSelective(Submission record);

    List<Submission> selectByExampleWithBLOBs(SubmissionExample example);

    List<Submission> selectByExample(SubmissionExample example);

    Submission selectByPrimaryKey(Integer sid);

    int updateByExampleSelective(@Param("record") Submission record, @Param("example") SubmissionExample example);

    int updateByExampleWithBLOBs(@Param("record") Submission record, @Param("example") SubmissionExample example);

    int updateByExample(@Param("record") Submission record, @Param("example") SubmissionExample example);

    int updateByPrimaryKeySelective(Submission record);

    int updateByPrimaryKeyWithBLOBs(Submission record);

    int updateByPrimaryKey(Submission record);

    List<SubmissionDto> selectAllWithUser();

    SubmissionDto selectDtoBySid(Integer sid);
}