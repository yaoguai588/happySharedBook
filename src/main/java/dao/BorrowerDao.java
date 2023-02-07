package dao;

import org.apache.ibatis.annotations.*;
import po.*;
import java.util.ArrayList;

//借阅者的功能
public interface BorrowerDao {
    //根据模糊查询图书
    @Select("select * from book where bname like #{msg}")
    @ResultType(Book.class)
    ArrayList<Book> FuzzySelect(String msg);

    //借阅图书
    @Insert("insert into br values(null,#{borrowdate},null,#{bookid},#{userid},#{number})")
    int intsertBoroow(BorrowBook borrowBook);

    //购买图书
    @Insert("insert into shop values(null,#{sbookid},#{suserid},#{shoptime},#{shopnum})")
    int intsertBuy(BuyBook buyBook);

    //归还图书
    @Update("update br set returndate = #{returndate} where bookid=#{bookid}")
    int deleteBoroow(BorrowBook borrowBook);

    //查看借阅信息
    @Select("select bid,bname,bCid,bwriter,bbrief,bprice from br,book where br.bookid=book.bid and br.userid=#{uid} and br.returndate is null")
    @ResultType(Book.class)
    ArrayList<Book> selectBorrow(User user);

    //查看购书信息
    @Select("select book.bid,bname,bprice,shop.shopnum from shop,book where shop.sbookid=book.bid and shop.suserid=#{uid}")
    @ResultType(Shop.class)
    ArrayList<Shop> selectBuy(User user);

    //查看某人的借阅量
    @Select("select SUM(br.number) from br WHERE userid=#{uid} and returndate is null  GROUP BY userid ")
    ArrayList<Integer> numberBorrow(@Param("uid") int uid);

    //查询某人的借阅时间
    @Select("SELECT br.borrowdate,br.returndate from br WHERE userid=#{uid} ")
    ArrayList<BorrowBook> date(@Param("uid") int uid);
}
