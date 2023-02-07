<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>InsertBorrower</title>
</head>
<body>
<center>
    <form action="insertBorrow">
        <input type="text" name="uid" placeholder="借书证号" required><br>
        <input type="text" name="uname" placeholder="姓名" required><br>
        <input type="password" name="upassword" placeholder="密码" required><br>
        <input type="checkbox" name="ugender" value="男">男
        <input type="checkbox" name="ugender" value="女">女<br>
        <input type="text" name="ucollage" placeholder="学院" required><br>
        <input type="text" name="umajor" placeholder="专业" required><br>
        <input type="submit" value="添加">
        <input type="reset" value="重置">
    </form>
</center>
</body>
</html>
