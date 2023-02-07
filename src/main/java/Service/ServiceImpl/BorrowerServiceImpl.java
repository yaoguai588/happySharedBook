package Service.ServiceImpl;

import Service.BorrowerService;
import dao.BorrowerDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import po.*;

import java.util.ArrayList;

@Service
public class BorrowerServiceImpl implements BorrowerService {
    @Autowired
    private BorrowerDao borrowerDao;


    @Override
    public ArrayList<Book> fuzzySelect(String msg) {
        return  borrowerDao.FuzzySelect(msg);
    }

    @Override
    public int borrowBook(BorrowBook borrowBook) {

        return borrowerDao.intsertBoroow(borrowBook);
    }

    @Override
    public int buyBook(BuyBook buyBook) {
        return borrowerDao.intsertBuy(buyBook);
    }

    @Override
    public int deleteBorrow(BorrowBook borrowBook) {
        return borrowerDao.deleteBoroow(borrowBook);
    }

    @Override
    public ArrayList<Book> selectBorrow(User user) {
        return borrowerDao.selectBorrow(user);
    }


    @Override
    public ArrayList<Shop> selectBuy(User user) {
        return borrowerDao.selectBuy(user);
    }

    @Override
    public ArrayList<Integer> numberBorrow(int uid) {
        return borrowerDao.numberBorrow(uid);
    }

    @Override
    public ArrayList<BorrowBook> date(int uid) {
        return borrowerDao.date(uid);
    }

}
