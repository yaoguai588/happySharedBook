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
public class AdministratorsControl {
    @Autowired
    private AdministratorsService administratorsService;

    @RequestMapping("/insertBook") //成功
    public String insertBook(HttpServletRequest request, Book book){
        if(administratorsService.select(book.getBid()).size()==0){
            if (administratorsService.insertBook(book)>0){
                return "success";
            }
        }
        return "failed";
    }

    @RequestMapping("/DeleteBook") //成功
    public String DeleteBook(HttpServletRequest request){
        String msg = request.getParameter("msg");
        Book book = new Book();
        book.setBid(Integer.parseInt(msg));
        if(administratorsService.deleteBook(book)>0){
            return "success";
        }else{
            return "failed";
        }
    }

    @RequestMapping("/insertBorrow")//成功
    public String insertBorrow(HttpServletRequest request, User user){
        if (administratorsService.selectBorrower(user.getUid()).size()==0){
            if(administratorsService.insertBorrow(user)>0){
                return "success";
            }
        }
            return "failed";
    }

    @RequestMapping("/DeleteBorrow")//成功
    public String DeleteBorrow(HttpServletRequest request,Model model){
        String msg = request.getParameter("msg");
        User user = new User();
        user.setUid(Integer.parseInt(msg));
        if(administratorsService.deleteBorrow(user)>0){
            return "success";
        }else{
            return "failed";
        }
    }

    @RequestMapping("/DateBorrow")//成功
    public String SelectBook(HttpServletRequest request) throws ParseException {
        String startDate=request.getParameter("start");
        String endDate = request.getParameter("end");
        ArrayList<BookInfo> bookInfos=administratorsService.selectBook(new SimpleDateFormat("yyyy-MM-dd").parse(startDate),new SimpleDateFormat("yyyy-MM-dd").parse(endDate));
        if (bookInfos.size()==0){
            return "failed";
        }
        request.setAttribute("msgs",bookInfos);
        return "dateselect";
    }

    @RequestMapping("/SelectBuy")//成功
    public String SelectBuy(HttpServletRequest request) throws ParseException {
        String id=request.getParameter("uid");
        ArrayList<People> buyInfos=administratorsService.selectBuy(Integer.parseInt(id));
        if (buyInfos.size()==0){
            return "failed";
        }
        request.setAttribute("msgs",buyInfos);

        return "buyselect";
    }

    @RequestMapping("/SelectBorrow")//成功
    public String SelectBorrow(HttpServletRequest request) throws ParseException {
        String id=request.getParameter("uid");
        ArrayList<People> borrowInfos=administratorsService.selectBorrow(Integer.parseInt(id));
        System.out.println(borrowInfos);
        if (borrowInfos.size()==0){
            return "failed";
        }
        request.setAttribute("msgs",borrowInfos);

        return "borrowselect";
    }

    @RequestMapping("/Selectbook")
    public String Selectbook(HttpServletRequest request){
        ArrayList<Book> list=administratorsService.selectBook();
        request.setAttribute("list",list);
        return "DeleteBook";
    }

    @RequestMapping("/Selectuser")
    public String Selectuser(HttpServletRequest request){
        ArrayList<User> list=administratorsService.selectUser();
        request.setAttribute("list",list);
        return "DeleteBorrow";
    }
}
