package Controller;


import Service.BorrowerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import po.*;
import util.Preload;

import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

@Controller
public class BorrowControl {

    @Autowired
    private BorrowerService borrowerService;

    @RequestMapping("/FuzzySelect")//模糊查询图书
    public String FuzzySelect(HttpServletRequest request,Model model){
       String msg = request.getParameter("msg");//获得传入字符
       msg = "%"+msg+"%";//模糊查询处理
       ArrayList<Book> list=borrowerService.fuzzySelect(msg);
       model.addAttribute("bookss",list);
        return "bookInfo";//展示查询结果
    }

    @RequestMapping("/borrowBook")//借阅图书
    public String InsertBorrow(HttpServletRequest request,Model model) throws ParseException {
        ArrayList<Integer> num = borrowerService.numberBorrow(Preload.myid);//获得当前用户id
        ArrayList<BorrowBook> dates=borrowerService.date(Preload.myid);//查询某人的借阅时间
        for (BorrowBook borrowBook : dates) {
            if (borrowBook.getReturndate()==null){//还书日期为NULL
                String time=new SimpleDateFormat("yyyy-MM-dd").format(new Date());//获得当前时间
                if ((new SimpleDateFormat("yyyy-MM-dd").parse(time).getTime()- borrowBook.getBorrowdate().getTime())/(24*60*60*100)>7)
                    //时间格式转换
                    return "failed";//当前时间-结束日期大于7天无法再借
            }else {
                if ((borrowBook.getReturndate().getTime() - borrowBook.getBorrowdate().getTime()) / (24 * 60 * 60 * 100) > 7) {
                    return "failed";//还书日期-结束日期大于7天无法再借
                }
            }
        }

        int all = 0;
        if(num.size()==0 ||num.get(0) <10){//用户还没借或者已经借的数量小于10
            String[] checkbox = request.getParameterValues("books");
            String[] allnum = request.getParameterValues("number");
            for (int i = 0;i<allnum.length;i++){//借书不能超过十本
                if(allnum[i] !=null && !allnum[i].equals("")){
                    all+=Integer.parseInt(allnum[i]);
                }
            }
            if(all>10){
                return "failed";
            }
            int j=0;
            for(int i = 0;i<allnum.length;i++){//将一类书一类书的借阅插入到借阅记录表
                BorrowBook borrowBook =new BorrowBook();
                borrowBook.setBookid(Integer.parseInt(checkbox[j]));
                borrowBook.setUserid(Preload.myid);
                if(allnum[i] !=null && !allnum[i].equals("")){
                    if(j+1!=checkbox.length){
                        j++;
                    }
                    borrowBook.setNumber(Integer.parseInt(allnum[i]));
                    String time=new SimpleDateFormat("yyyy-MM-dd").format(new Date());
                    borrowBook.setBorrowdate(new SimpleDateFormat("yyyy-MM-dd").parse(time));//结束日期
                    borrowerService.borrowBook(borrowBook);
                }
            }
            return "success";
        }
        return "failed";
    }

    @RequestMapping("/buyBook")//购买图书
    public String InsertBuy(HttpServletRequest request,Model model) throws ParseException {
        BuyBook buyBook = new BuyBook();
        String[] checkbox = request.getParameterValues("books");
        String[] allnum = request.getParameterValues("number");
        int j = 0;
        for (int i = 0; i < allnum.length; i++) {//将一类书一类书的购买插入到购买记录表
            buyBook.setSbookid(Integer.parseInt(checkbox[j]));
            buyBook.setSuserid(Preload.myid);
            if (allnum[i] != null && !allnum[i].equals("")) {
                if (j + 1 != checkbox.length) {
                    j++;
                }
                    buyBook.setShopnum(Integer.parseInt(allnum[i]));
                    String time = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(new Date());
                    buyBook.setShoptime(new SimpleDateFormat("yyyy-MM-dd").parse(time));//插入购买时间
                    if (borrowerService.buyBook(buyBook) <= 0) {
                        return "failed";
                }
            }
        }
        return "success";
    }

    @RequestMapping("/deleteBorrow")//归还图书
    public String deleteBorrow(HttpServletRequest request,Model model) throws ParseException {
        BorrowBook borrowBook =new BorrowBook();
        String[] checkbox = request.getParameterValues("books");//获得要归还的书的信息
        for(String i :checkbox){
            borrowBook.setBookid(Integer.parseInt(i));
            borrowBook.setUserid(Preload.myid);
            String time=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(new Date());
            borrowBook.setReturndate(new SimpleDateFormat("yyyy-MM-dd").parse(time));//添加归还日期
            if(borrowerService.deleteBorrow(borrowBook)<=0) {
                return "failed";
            }
        }
        return "success";
    }

    @RequestMapping("/selectBorrow")//查询借阅
    public String selectBorrow(HttpServletRequest request,Model model){
        User user = new User();
        user.setUid(Preload.myid);
        ArrayList<Book> list = borrowerService.selectBorrow(user);
        request.setAttribute("books",list);
        return "returnbook";
    }

    @RequestMapping("selectBuy")//查询购买
    public String selectBuy(HttpServletRequest request,Model model){
        User user=new User();
        user.setUid(Preload.myid);
        ArrayList<Shop> list = borrowerService.selectBuy(user);
        request.setAttribute("books",list);
        System.out.println(list);
        return "shop";
    }

}
