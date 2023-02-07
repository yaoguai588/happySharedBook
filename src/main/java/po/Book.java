package po;

public class Book {//图书
    int bid;
    String Bname;
    int bCid;
    String bclass;
    String bwriter;
    String bbrief;
    Double bprice;
    int btotal;
    int bmargin;

    public int getBid() {
        return bid;
    }

    public void setBid(int bid) {
        this.bid = bid;
    }

    public String getBname() {
        return Bname;
    }

    public void setBname(String bname) {
        Bname = bname;
    }

    public int getbCid() {
        return bCid;
    }

    public void setbCid(int bCid) {
        this.bCid = bCid;
    }

    public String getBclass() {
        return bclass;
    }

    public void setBclass(String bclass) {
        this.bclass = bclass;
    }

    public String getBwriter() {
        return bwriter;
    }

    public void setBwriter(String bwriter) {
        this.bwriter = bwriter;
    }

    public String getBbrief() {
        return bbrief;
    }

    public void setBbrief(String bbrief) {
        this.bbrief = bbrief;
    }

    public Double getBprice() {
        return bprice;
    }

    public void setBprice(Double bprice) {
        this.bprice = bprice;
    }

    public int getBtotal() {
        return btotal;
    }

    public void setBtotal(int btotal) {
        this.btotal = btotal;
    }

    public int getBmargin() {
        return bmargin;
    }

    public void setBmargin(int bmargin) {
        this.bmargin = bmargin;
    }

    @Override
    public String toString() {
        return "Book{" +
                "bid=" + bid +
                ", Bname='" + Bname + '\'' +
                ", bCid=" + bCid +
                ", bclass='" + bclass + '\'' +
                ", bwriter='" + bwriter + '\'' +
                ", bbrief='" + bbrief + '\'' +
                ", bprice=" + bprice +
                ", btotal=" + btotal +
                ", bmargin=" + bmargin +
                '}';
    }
}
