<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>DeleteBopok</title>
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

        <c:forEach items="${list}" var="l" >
        var TemO=document.getElementById("form");
        TemO.innerHTML += "<tr><td>${l.bid}</td><td>${l.bname}</td><td>${l.bCid}</td><td>${l.bclass}</td><td>${l.bwriter}</td><td>${l.bbrief}</td><td>${l.bprice}</td><td>${l.bmargin}</td><tr>";
        </c:forEach>

    }
</script>

<body>
    <center>
        <form action="DeleteBook">
            <input type="text" name="msg" placeholder="删除的书id" required><br>
            <input type="submit" value="删除">
        </form>
    </center>

        <div>
            <table border="1" id="form">
                <tr>
                    <th>图书ID</th>
                    <th>书名</th>
                    <th>出版社</th>
                    <th>图书类别</th>
                    <th>作者</th>
                    <th>图书简介</th>
                    <th>图书价格</th>
                    <th>图书数量</th>
                </tr>
            </table>
        </div><br>
</body>
</html>
