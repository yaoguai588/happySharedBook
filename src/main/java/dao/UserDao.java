package dao;

import org.apache.ibatis.annotations.*;
import po.User;

import java.util.ArrayList;

public interface UserDao {
    @Select("select * from user")
    @ResultType(User.class)
    ArrayList<User> selectAllUser();//查出读者所有信息

    @Insert("insert into user values(#{uid},#{uname},#{upassword},#{ugender},#{ucollage},#{umajor})")
    int insertUser(User user);//插入读者

    @Update("update user set upassword = #{newpassword} where uid = #{uid} AND upassword = #{upassword}")
    int updateUserPassword(@Param("newpassword")String newpassword,@Param("uid") int uid,@Param("upassword") String upassword);
    //更新读者密码

    @Update("update admin set apassword = #{newpassword} where aid = #{aid} AND apassword = #{apassword}")
    int updateAdminPassword(@Param("newpassword")String newpassword,@Param("aid") int aid,@Param("apassword") String apassword);
    //更新管理员密码
}
