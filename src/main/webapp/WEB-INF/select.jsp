<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>select</title>
</head>
<body>
<table border="1px">
<tr>
    <th>学生id</th>
    <th>学生姓名</th>
    <th>学生性别</th>
    <th>学生地址</th>
</tr>

    <tr>
        <td align="center">${student.id}</td>
        <td align="center">${student.name}</td>
        <td align="center">${student.sex}</td>
        <td align="center">${student.address}</td>
    </tr>

</table>
</body>
</html>
