package Service.ServiceImpl;

import Service.UserService;
import dao.UserDao;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import po.User;

import java.util.ArrayList;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;
    @Override
    public ArrayList<User> selectAllUser() {
        return userDao.selectAllUser();
    }

    @Override
    public int insertUser(User user) {
        return userDao.insertUser(user);
    }

    public int updateAdminPassword(String newpassword, int aid ,String apassword) {
        return userDao.updateAdminPassword(newpassword,aid,apassword);
    }

    public int updateUserPassword(String newpassword, int uid ,String upassword) {
        return userDao.updateUserPassword(newpassword,uid ,upassword);
    }
}
