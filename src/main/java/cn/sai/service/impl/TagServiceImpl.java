package cn.sai.service.impl;

import cn.sai.entity.Tag;
import cn.sai.entity.TagExample;
import cn.sai.mapper.TagMapper;
import cn.sai.service.ITagService;
import cn.sai.entity.TagExample.Criteria;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class TagServiceImpl implements ITagService {

    @Resource
    TagMapper tagMapper;

    @Override
    public int saveTag(Tag tag) {
        return tagMapper.insertSelective(tag);
    }

    @Override
    public Tag selectTagByTid(Integer tid) {
        return tagMapper.selectByPrimaryKey(tid);
    }

    @Override
    public Tag selectTagByName(String name) {
        TagExample example = new TagExample();
        if(name != null && !name.equals("")){
            Criteria criteria = example.createCriteria();
            criteria.andNameEqualTo(name);
            List<Tag> list = tagMapper.selectByExample(example);
            return list.size() > 0 ? list.get(0) : null;
        }
        return null;
    }
}
