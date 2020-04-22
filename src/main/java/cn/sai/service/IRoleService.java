package cn.sai.service;

import cn.sai.entity.Role;

public interface IRoleService {

    Role selectRoleBySid(Integer sid);

    Role selectRoleByRoleName(String roleName);

}
