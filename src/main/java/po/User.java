package po;

public class User {//与用户表所对应的实体类
    int uid;
    String uname;
    String upassword;
    String ugender;
    String ucollage;
    String umajor;

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getUpassword() {
        return upassword;
    }

    public void setUpassword(String upassword) {
        this.upassword = upassword;
    }

    public String getUgender() {
        return ugender;
    }

    public void setUgender(String ugender) {
        this.ugender = ugender;
    }

    public String getUcollage() {
        return ucollage;
    }

    public void setUcollage(String ucollage) {
        this.ucollage = ucollage;
    }

    public String getUmajor() {
        return umajor;
    }

    public void setUmajor(String umajor) {
        this.umajor = umajor;
    }

    @Override
    public String toString() {
        return "User{" +
                "uid=" + uid +
                ", uname='" + uname + '\'' +
                ", upassword='" + upassword + '\'' +
                ", ugender='" + ugender + '\'' +
                ", ucollage='" + ucollage + '\'' +
                ", umajor='" + umajor + '\'' +
                '}';
    }
}
