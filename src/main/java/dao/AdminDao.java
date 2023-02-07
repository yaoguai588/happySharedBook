package dao;

import org.apache.ibatis.annotations.ResultType;
import org.apache.ibatis.annotations.Select;
import po.Admin;

import java.util.ArrayList;

public interface AdminDao {
    @Select("select * from admin")
    @ResultType(Admin.class)
    ArrayList<Admin> selectAllAdmin();
}
