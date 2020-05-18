package cn.sai.service;

import cn.sai.entity.Role;
import cn.sai.entity.User;

import java.util.List;

public interface IUserService {

    int saveUser(User user);

    User selectUserByUid(Integer uid);

    User selectUserWithoutPasswordByUid(Integer uid);

    User selectUserByUsername(String username);

    User selectUserByNickname(String nickname);

    int selectUidByUsername(String username);

    void deleteUserByUid(Integer uid);

    void deleteUserByUsername(String username);

    List<Role> queryRoleByUserId(Integer uid);
}
