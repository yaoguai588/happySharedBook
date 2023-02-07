<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>buyselect</title>
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
        <c:forEach items="${msgs}" var="msg" >
        var TemO=document.getElementById("add");
        TemO.innerHTML+="<tr><td>${msg.uname}</td><td>${msg.bname}</td><td>${msg.number}</td></tr>";
        </c:forEach>
    }

    function AddElement(){
        var form = document.getElementById("form");
        form.setAttribute("action","SelectBuy");
    }

</script>
<body>
<form id="form">
    购买人id：<input type="text" name="uid" required>
    <table border="1px" id="add">
        <tr>
            <th>购买人</th>
            <th>书名</th>
            <th>购买数量</th>
        </tr>
    </table>
    <input type="submit" value="查询" onclick="AddElement()">
</form>
</body>
</html>
