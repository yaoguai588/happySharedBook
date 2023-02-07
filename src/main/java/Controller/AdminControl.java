package Controller;

import Service.AdministratorsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import po.Book;
import po.BookInfo;
import po.People;
import po.User;


import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

@Controller
public class AdminControl {
    @Autowired
    private AdministratorsService administratorsService;

    @RequestMapping("/insertBook") //插入图书
    public String insertBook(HttpServletRequest request, Book book){
        if(administratorsService.select(book.getBid()).size()==0){//判断图书是否已存在
            if (administratorsService.insertBook(book)>0){//判断是否插入成功
                return "success";
            }
        }
        return "failed";
    }

    @RequestMapping("/DeleteBook") //删除图书
    public String DeleteBook(HttpServletRequest request){
        String msg = request.getParameter("msg");//接受传过来的图书id
        Book book = new Book();
        book.setBid(Integer.parseInt(msg));
        if(administratorsService.deleteBook(book)>0){//判断是否删除成功
            return "success";
        }else{
            return "failed";
        }
    }

    @RequestMapping("/insertBorrow")//添加读者
    public String insertBorrow(HttpServletRequest request, User user){
        if (administratorsService.selectBorrower(user.getUid()).size()==0){//判断读者是否已经存在
            if(administratorsService.insertBorrow(user)>0){//判断是否添加成功
                return "success";
            }
        }
            return "failed";
    }

    @RequestMapping("/DeleteBorrow")//删除读者
    public String DeleteBorrow(HttpServletRequest request,Model model){
        String msg = request.getParameter("msg");//接受传过来的用户id
        User user = new User();
        user.setUid(Integer.parseInt(msg));
        if(administratorsService.deleteBorrow(user)>0){//判断是否删除成功
            return "success";
        }else{
            return "failed";
        }
    }

    @RequestMapping("/DateBorrow")//查询指定时段图书借阅购买情况
    public String SelectBook(HttpServletRequest request) throws ParseException {
        String startDate=request.getParameter("start");//接收传过来的开始日期和结束日期
        String endDate = request.getParameter("end");
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");//string——>date
        ArrayList<BookInfo> bookInfos=administratorsService.selectBook(simpleDateFormat.parse(startDate),simpleDateFormat.parse(endDate));
        if (bookInfos.size()==0){//查询数据为空
            return "insertFailed";
        }
        request.setAttribute("msgs",bookInfos);//查询数据集返回
        return "dateselect";
    }

    @RequestMapping("/SelectBuy")//查询用户购买情况
    public String SelectBuy(HttpServletRequest request) throws ParseException {
        String id=request.getParameter("uid");//获得传入的用户id
        ArrayList<People> buyInfos=administratorsService.selectBuy(Integer.parseInt(id));
        if (buyInfos.size()==0){//查询数据为空
            return "insertFailed";
        }
        request.setAttribute("msgs",buyInfos);//查询数据集返回
        return "buyselect";
    }

    @RequestMapping("/SelectBorrow")//查询用户借阅情况
    public String SelectBorrow(HttpServletRequest request) throws ParseException {
        String id=request.getParameter("uid");//获得传入的用户id
        ArrayList<People> borrowInfos=administratorsService.selectBorrow(Integer.parseInt(id));
        if (borrowInfos.size()==0){//查询数据为空
            return "insertFailed";
        }
        request.setAttribute("msgs",borrowInfos);//查询数据集返回
        return "borrowselect";
    }

    @RequestMapping("/Selectbook")//查询图书,用于在删除图书页显示所有图书
    public String Selectbook(HttpServletRequest request){
        ArrayList<Book> list=administratorsService.selectBook();
        request.setAttribute("list",list);
        return "DeleteBook";
    }

    @RequestMapping("/Selectuser")//查询用户,用于在删除用户页显示所有用户
    public String Selectuser(HttpServletRequest request){
        ArrayList<User> list=administratorsService.selectUser();
        request.setAttribute("list",list);
        return "DeleteBorrow";
    }
}
