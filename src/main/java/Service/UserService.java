package Service;

import po.User;

import java.util.ArrayList;

public interface UserService {
    ArrayList<User> selectAllUser();//查询所有用户
    int insertUser(User user);//插入用户
    int updateUserPassword(String newpassword,int uid ,String upassword);//更新用户密码
    int updateAdminPassword(String newpassword,int aid ,String apassword);//更新管理员密码
}
