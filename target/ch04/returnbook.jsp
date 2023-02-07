<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="po.Book" %>
<%@ page import="java.util.List" %>
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
        <c:forEach items='${requestScope.get("books")}' var="book" >
        var trObj = document.createElement("tr");
        trObj.innerHTML = "<td><input type=checkbox name='books' value='${book.bid}'/></td><td>${book.bid}</td><td>${book.bname}</td><td>${book.bCid}</td><td>${book.bwriter}</td><td>${book.bbrief}</td><td>${book.bprice}</td>";
        document.getElementById("add").appendChild(trObj);
        </c:forEach>

    }


</script>
<body>
<form action="deleteBorrow" method="get" name="frm">
    <div>
        <table border="1" id="add">
            <tr>
                <th>归还</th>
                <th>图书ID</th>
                <th>书名</th>
                <th>出版社</th>
                <th>作者</th>
                <th>图书简介</th>
                <th>图书价格</th>
            </tr>

        </table>
    </div><br>
    <input type="submit" value="归还">
</form>


</body>
</html>
