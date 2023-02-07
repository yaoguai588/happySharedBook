package Service;

import org.apache.ibatis.annotations.Param;
import po.*;
import java.util.ArrayList;
import java.util.Date;

public interface AdministratorsService {
    int insertBook(Book book);
    int deleteBook(Book book);
    int insertBorrow(User user);
    int deleteBorrow(User user);
    ArrayList<BookInfo> selectBook(Date startDate, Date endDate);
    ArrayList<People> selectBuy(int id);
    ArrayList<People> selectBorrow(int id);
    ArrayList<Book> select(int id);
    ArrayList<BorrowBook> selectBorrower(@Param("id") int id);
    ArrayList<Book> selectBook();
    ArrayList<User> selectUser();
}
