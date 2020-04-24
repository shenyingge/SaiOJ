package cn.sai.service;

import cn.sai.entity.Tag;


public interface ITagService {

    int saveTag(Tag tag);

    Tag selectTagByTid(Integer tid);

    Tag selectTagByName(String name);

}
