package cn.sai.service.impl;

import cn.sai.entity.Role;
import cn.sai.entity.RoleExample;
import cn.sai.entity.RoleExample.Criteria;
import cn.sai.mapper.RoleMapper;
import cn.sai.service.IRoleService;

import javax.annotation.Resource;
import java.util.List;

public class RoleServiceImpl implements IRoleService {

    @Resource
    RoleMapper roleMapper;

    @Override
    public Role selectRoleBySid(Integer sid) {
        return roleMapper.selectByPrimaryKey(sid);
    }

    @Override
    public Role selectRoleByRoleName(String roleName) {
        RoleExample example = new RoleExample();
        if(roleName != null && roleName.equals("")){
            Criteria criteria = example.createCriteria();
            criteria.andRoleNameEqualTo(roleName);
            List<Role> list = roleMapper.selectByExample(example);
            return list.size() == 1 ? list.get(0) : null;
        }
        return null;
    }
}