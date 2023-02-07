package Service.ServiceImpl;

import Service.AdministratorsService;
import dao.AdministratorsDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import po.*;

import java.util.ArrayList;
import java.util.Date;

@Service
public class AdministratorsServiceImpl implements AdministratorsService {
    @Autowired
    private AdministratorsDao administratorsDao;

    @Override
    public int insertBook(Book book) {
        return administratorsDao.insertBook(book);
    }

    @Override
    public int deleteBook(Book book) {
        return administratorsDao.DeleteBook(book);
    }

    @Override
    public int insertBorrow(User user) {
        return administratorsDao.insertBorrow(user);
    }

    @Override
    public int deleteBorrow(User user) {
        return administratorsDao.DeleteBorrow(user);
    }

    @Transactional
    public ArrayList<BookInfo> selectBook(Date startDate, Date endDate){
        return administratorsDao.SelectBook(startDate,endDate);
    }

    @Override
    public ArrayList<People> selectBuy(int id) {
        return administratorsDao.SelectBuy(id);
    }

    @Override
    public ArrayList<People> selectBorrow(int id) {
        return administratorsDao.SelectBorrow(id);
    }

    @Override
    public ArrayList<Book> select(int id) {
        return administratorsDao.Select(id);
    }

    @Override
    public ArrayList<BorrowBook> selectBorrower(int id) {
        return administratorsDao.SelectBorrower(id);
    }

    @Override
    public ArrayList<Book> selectBook() {
        return administratorsDao.Selectbook();
    }

    @Override
    public ArrayList<User> selectUser() {
        return administratorsDao.Selectuser();
    }


}
