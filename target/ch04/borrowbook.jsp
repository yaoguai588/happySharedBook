<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="po.Book" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Test</title>
</head>
<style type="text/css">
    /*表格样式*/
    table {
        width: 90%;
        background: #ccc;
        margin: 10px auto;
        border-collapse: collapse;/*border-collapse:collapse合并内外边距(去除表格单元格默认的2个像素内外边距*/
    }
    th,td {
        height: 25px;
        line-height: 25px;
        text-align: center;
        border: 1px solid #ccc;
    }
    th {
        background: #eee;
        font-weight: normal;
    }
    tr {
        background: #fff;
    }
    tr:hover {
        background: #cc0;
    }
    td a {
        color: #06f;
        text-decoration: none;
    }
    td a:hover {
        color: #06f;
        text-decoration: underline;
    }
</style>
<script language="javascript">
    window.onload=function (){

        <c:forEach items="${bookss}" var="book" >
        var trObj = document.createElement("tr");
        trObj.innerHTML = "<td><input type=checkbox name='books' value='${book.bid}'/></td><td><input type=text name='number'/></td><td>${book.bid}</td><td>${book.bname}</td><td>${book.bCid}</td><td>${book.bwriter}</td><td>${book.bbrief}</td><td>${book.bprice}</td><td>${book.bmargin}</td><td>${book.bclass}</td>";

        </c:forEach>
        document.getElementById("select").click();

    }

</script>
<body>
<div>
    <form action="FuzzySelect">
        <input type="text" name="msg" >
        <input type="submit" value="查询" id="select"/>
    </form>
</div>

<form name="frm" id="form">
    <div id="add">
        <table border="1">
            <th>
                <th>借阅</th>
                <th>借阅数量</th>
                <th>图书ID</th>
                <th>书名</th>
                <th>出版社</th>
                <th>作者</th>
                <th>图书简介</th>
                <th>图书价格</th>
                <th>图书数量</th>
                <th>图书类别</th>
            </tr>

        </table>
    </div><br>
    <input type="submit" value="借阅" onclick="Borrow()">
    <input type="submit" value="购买" onclick="Buy()">
</form>

</body>
</html>
