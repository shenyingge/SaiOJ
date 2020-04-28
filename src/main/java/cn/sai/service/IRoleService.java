package cn.sai.service;

import cn.sai.entity.Role;

import java.util.List;

public interface IRoleService {

    Role selectRoleByRid(Integer rid);

    Role selectRoleByRoleName(String roleName);

    List<Role> selectRolesByUid(Integer uid);
}
