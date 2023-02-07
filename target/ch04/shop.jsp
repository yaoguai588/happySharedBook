<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="po.Book" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Shop</title>
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
        <c:forEach items="${books}" var="book" >
        var trObj = document.createElement("tr");
        trObj.innerHTML = "</td><td>${book.bid}</td><td>${book.bname}</td><td>${book.bprice}</td><td>${book.shopnum}</td>";
        document.getElementById("add").appendChild(trObj);
        </c:forEach>
    }
</script>
<body>
<form action="deleteBuy" method="get" name="frm">
    <div>
        <table border="1" id="add">
            <tr>
                <th>图书ID</th>
                <th>书名</th>
                <th>图书价格</th>
                <th>图书数量</th>
            </tr>
        </table>
    </div>
</form>
</body>
</html>
