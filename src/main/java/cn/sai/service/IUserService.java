package cn.sai.service;

import cn.sai.entity.User;

public interface IUserService {

    int saveUser(User user);

    User selectUserByUid(Integer uid);

    User selectUserByUsername(String username);

    User selectUserByNickname(String nickname);

    int selectUidByUsername(String username);

    void deleteUserByUid(Integer uid);

    void deleteUserByUsername(String username);
}