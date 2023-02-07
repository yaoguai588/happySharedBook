package Service;

import org.apache.ibatis.annotations.Param;
import po.*;

import java.util.ArrayList;

public interface BorrowerService {
    ArrayList<Book> fuzzySelect(String msg);//模糊查询
    int borrowBook(BorrowBook borrowBook);//
    int buyBook(BuyBook buyBook);
    int deleteBorrow(BorrowBook borrowBook);
    ArrayList<Book> selectBorrow(User user);
    ArrayList<Shop> selectBuy(User user);
    ArrayList<Integer> numberBorrow(int uid);
    ArrayList<BorrowBook> date(@Param("uid") int uid);
}
