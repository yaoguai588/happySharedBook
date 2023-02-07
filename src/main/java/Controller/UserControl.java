package Controller;


import Service.AdminService;
import Service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import po.Admin;
import po.User;
import util.Preload;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

@Controller
public class UserControl {
    @Autowired
    private UserService userService;
    @Autowired
    private AdminService adminService;

    @RequestMapping("/login")//判断登录
    public String userLogin(HttpServletRequest request, HttpServletResponse response, User user, Model model){
        //管理员登录
        ArrayList<Admin> admins = adminService.selectAllAdmin();
        for (Admin admin :admins) {
            //登录成功跳转
            if (admin.getAid()==user.getUid()&&admin.getApassword().equals(user.getUpassword())){
                Preload.myid=user.getUid();
                model.addAttribute("uid","用户: "+Preload.myid);
                return "adminindex";
            }
        }
        //用户登录
        ArrayList<User> users = userService.selectAllUser();
        for (User userList :users) {
            //登录成功跳转
            if (userList.getUid()==user.getUid()&&userList.getUpassword().equals(user.getUpassword())){
                Preload.myid=user.getUid();
                model.addAttribute("uid","用户: "+Preload.myid);
                return "userindex";
            }
        }
        request.setAttribute("loginfailed","用户不存在!");
        //登录失败跳转
        return "index";
    }

    @RequestMapping("/register")//用户注册
    public String userRegister(HttpServletRequest request, User user){
        ArrayList<User> users = userService.selectAllUser();
        //判断id是否重复
        for (User userList :users) {
            if (userList.getUid()==user.getUid()){
                request.setAttribute("registerfailed","用户已存在!");
                return "register";
            }
        }
        //注册成功，返回登录
        userService.insertUser(user);
        return "index";
    }

    @RequestMapping("/repassword")//修改密码
    public String updatePassword(HttpServletRequest request) {
        int uid = Integer.parseInt(request.getParameter("uid"));
        String oldPassword = request.getParameter("oldpassword");
        String newPassword = request.getParameter("newpassword");
        int userStatus = userService.updateUserPassword(newPassword,uid,oldPassword);//用户密码是否修改成功
        int adminStatus = userService.updateAdminPassword(newPassword,uid,oldPassword);//管理员密码是否修改成功
        if(userStatus==0&&adminStatus==0){
            request.setAttribute("failed","密码错误");
            return "failed";
        }
        return "index";
    }
}
