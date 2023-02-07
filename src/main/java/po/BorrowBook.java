package po;

import java.util.Date;

public class BorrowBook {//借还表所需要的实体类
    int brid;
    Date borrowdate;
    Date returndate;
    int bookid;
    int userid;
    int number;

    public int getBrid() {
        return brid;
    }

    public void setBrid(int brid) {
        this.brid = brid;
    }

    public Date getBorrowdate() {
        return borrowdate;
    }

    public void setBorrowdate(Date borrowdate) {
        this.borrowdate = borrowdate;
    }

    public Date getReturndate() {
        return returndate;
    }

    public void setReturndate(Date returndate) {
        this.returndate = returndate;
    }

    public int getBookid() {
        return bookid;
    }

    public void setBookid(int bookid) {
        this.bookid = bookid;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    @Override
    public String toString() {
        return "BorrowerAndBook{" +
                "brid=" + brid +
                ", borrowdate=" + borrowdate +
                ", returndate=" + returndate +
                ", bookid=" + bookid +
                ", userid=" + userid +
                ", number=" + number +
                '}';
    }
}
