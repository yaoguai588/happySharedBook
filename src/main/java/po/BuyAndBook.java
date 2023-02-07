package po;

import java.util.Date;

public class BuyAndBook {
    int sid;
    int sbookid;
    int suserid;
    Date shoptime;
    int shopnum;

    public int getSid() {
        return sid;
    }

    public void setSid(int sid) {
        this.sid = sid;
    }

    public int getSbookid() {
        return sbookid;
    }

    public void setSbookid(int sbookid) {
        this.sbookid = sbookid;
    }

    public int getSuserid() {
        return suserid;
    }

    public void setSuserid(int suserid) {
        this.suserid = suserid;
    }

    public Date getShoptime() {
        return shoptime;
    }

    public void setShoptime(Date shoptime) {
        this.shoptime = shoptime;
    }

    public int getShopnum() {
        return shopnum;
    }

    public void setShopnum(int shopnum) {
        this.shopnum = shopnum;
    }

    @Override
    public String toString() {
        return "BuyAndBook{" +
                "sid=" + sid +
                ", sbookid=" + sbookid +
                ", suserid=" + suserid +
                ", shoptime=" + shoptime +
                ", shopnum=" + shopnum +
                '}';
    }
}
