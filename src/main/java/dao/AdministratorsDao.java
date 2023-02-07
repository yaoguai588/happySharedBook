package dao;

import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.StatementType;
import po.*;
import java.util.ArrayList;
import java.util.Date;

//管理员的功能
public interface AdministratorsDao {
    //添加图书
    @Insert("insert into book values(#{bid},#{bname},#{bCid},#{bclass},#{bwriter},#{bbrief},#{bprice},#{btotal},#{bmargin})")
    int insertBook(Book book);

    //删除图书
    @Delete("delete from book where bid=#{bid}")
    int DeleteBook(Book book);

    //添加借阅者
    @Insert("insert into user values(#{uid},#{uname},#{upassword},#{ugender},#{ucollage},#{umajor})")
    int insertBorrow(User user);

    //删除借阅者
    @Delete("delete from user where uid=#{uid}")
    int DeleteBorrow(User user);

    //通过时间显示图书
    @Select("call totalSearch(#{startDate,mode=IN},#{endDate,mode=IN})")
    @Options(statementType = StatementType.CALLABLE)
    ArrayList<BookInfo> SelectBook(@Param("startDate") Date startDate, @Param("endDate") Date endDate);

    //查询某人购买情况
    @Select("call userShop(#{id,mode=IN})")
    @Options(statementType = StatementType.CALLABLE)
    ArrayList<People> SelectBuy(@Param("id") int id);

    //查询某人借阅情况
    @Select("call userBorrow(#{id,mode=IN})")
    @Options(statementType = StatementType.CALLABLE)
    ArrayList<People> SelectBorrow(@Param("id") int id);

    //查询某人图书
    @Select("select * from book where bid=#{id}")
    ArrayList<Book> Select(@Param("id") int id);

    //查询某人借阅人
    @Select("select * from user where uid=#{id}")
    ArrayList<BorrowBook> SelectBorrower(@Param("id") int id);

    //查询所有图书
    @Select("select * from book")
    ArrayList<Book> Selectbook();

    //查询所有借阅者
    @Select("select * from user")
    ArrayList<User> Selectuser();
}
