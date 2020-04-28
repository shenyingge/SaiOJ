package cn.sai.service.impl;

import cn.sai.Utils.EncryptionUtils;
import cn.sai.entity.Role;
import cn.sai.entity.User;
import cn.sai.entity.UserExample;
import cn.sai.entity.UserExample.Criteria;
import cn.sai.mapper.UserMapper;
import cn.sai.service.IRoleService;
import cn.sai.service.IUserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class UserServiceImpl implements IUserService {

    @Resource
    private UserMapper userMapper;

    @Resource
    private IRoleService roleService;

    public int saveUser(User user){
        String password = EncryptionUtils.encrypt(user);
        user.setPassword(password);
        return userMapper.insertSelective(user);
    }

    @Override
    public User selectUserByUid(Integer uid) {
        return userMapper.selectByPrimaryKey(uid);
    }

    public User selectUserByUsername(String username){
        UserExample example = new UserExample();
        if(username != null && !username.equals("")){
            Criteria criteria = example.createCriteria();
            criteria.andUsernameEqualTo(username);
            List<User> list = userMapper.selectByExample(example);
            return list.size() > 0 ? list.get(0) : null;
        }
        return null;
    }
    public User selectUserByNickname(String nickname){
        UserExample example = new UserExample();
        if(nickname != null && !nickname.equals("")){
            Criteria criteria = example.createCriteria();
            criteria.andNicknameEqualTo(nickname);
            List<User> list = userMapper.selectByExample(example);
            return list.size() > 0 ? list.get(0) : null;
        }
        return null;
    }
    public int selectUidByUsername(String username){
        return this.selectUserByUsername(username).getUid();
    }

    @Override
    public void deleteUserByUid(Integer uid) {
        userMapper.deleteByPrimaryKey(uid);
    }

    public void deleteUserByUsername(String username){
        int uid = this.selectUidByUsername(username);
        this.deleteUserByUid(uid);
    }

    @Override
    public List<Role> queryRoleByUserId(Integer uid) {
        return roleService.selectRolesByUid(uid);
    }

}
