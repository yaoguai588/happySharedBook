<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>InsertBook</title>
</head>
<body>
<center>
    <form action="insertBook">
        <input type="text" name="bid" placeholder="书号" required><br>
        <input type="text" name="bname" placeholder="书名" required><br>
        <input type="text" name="bCid" placeholder="出版社" required><br>
        <input type="text" name="bclass" placeholder="图书类别" required><br>
        <input type="text" name="bwriter" placeholder="图书作者" required><br>
        <input type="text" name="bbrief" placeholder="图书简介" required><br>
        <input type="text" name="bprice" placeholder="图书价格" required><br>
        <input type="text" name="btotal" placeholder="数量"required><br>
        <input type="text" name="bmargin" placeholder="余量" required><br>
        <input type="submit" value="添加">
        <input type="reset" value="重置">
    </form>
</center>
</body>
</html>
