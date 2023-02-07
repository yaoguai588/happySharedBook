<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>图书管理 - 首页</title>
    <link rel="stylesheet" href="server-list.css">
    <link rel="stylesheet" href="index.css">
</head>
<style type="text/css">
    .wrapper .content p{
        text-align: center;
    }


    .table-left th{
        background-color: #009;
    }

    .table-middle th{
        background-color: #009;
    }

    .table-right th{
        background-color: #060;
    }

    *{
        margin: 0;
        padding:0;
    }

    a{
        text-decoration: none;
        color: #fff;
    }

    li{
        list-style-type: none;
    }

    button:hover{
        cursor: pointer
    }

    .nav{
        width: 100%;
        height: 48px;
        background: linear-gradient(to left, rgb(114, 135, 254), rgb(130, 88, 186));
    }

    .nav-left{
        font-size: 16px;
        color: #fff;
        width: 180px;
        line-height: 48px;
        text-align: center;
        float: left;
    }

    .nav-right-name{
        font-size: 14px;
        color: #fff;
        width: 120px;
        line-height: 48px;
        text-align: center;
        float: right;
    }

    .nav-right-signout{
        display: none;
        width: 100px;
        height: 80px;
        background: rgba(57, 61, 73, 0.9);
        position: absolute;
        right: 10px;
        top: 48px;
        line-height: 40px;
        text-align: center;
        border-radius: 10px;
        border: 1px solid rgb(114,135,254);
        z-index: 10;
    }

    .nav-right-signout dd:hover{
        background:  #1e9fff;
    }

    .nav-right-signout a{
        color: #fff;
    }

    .nav-right-name:hover .nav-right-signout{
        display: block;
    }

    .sidebar{
        font-size: 14px;
        float: left;
        background: rgba(57, 61, 73, 0.9);
        width: 180px;
        position: absolute;
        top: 48px;
        bottom: 0;
        left: 0;
    }

    .sidebar ul li{
        padding-left: 30px;
        line-height: 40px;
    }

    .sidebar ul li a{
        color: #fff;
    }

    .sidebar .active-li, .sidebar ul li:hover{
        background: #1e9fff;
    }

    .sidebar ul li span{
        padding: 10px;
    }

    .wrapper{
        position: absolute;
        top: 48px;
        left: 180px;
        overflow: auto;
    }

    .content p{
        float: left;
        font-size: 16px;
        height: 30px;
        line-height: 30px;
    }


    table, td, th {
        border: 1px solid blue;
        border-collapse: collapse;
        line-height: 32px;
        font-size: 14px;
    }

    th{
        background-color:blue;
        color:white;
    }

    td{
        padding-left: 10px;
    }

    td a{
        color: blue;
    }



    .pagination li{
        display: inline-block;
        background: #fff;
        padding: 5px;
        min-width: 15px;
        border: 1px solid #E2E2E2;
    }

    .pagination li a{
        color: blue;
    }

    #myiframe {
        width: 1080px;
        height: 510px;
        border: medium  none;
    }
</style>

<body>
<div class="nav">
    <div class="nav-left">图书管理系统</div>
    <div class="nav-right">
        <div class="nav-right-name">${uid}&nbsp;&nbsp;<i class="fa fa-caret-down" aria-hidden="true"></i>
            <dl class="nav-right-signout">
                <dd><a href="updatepassword.jsp">修改密码</a></dd>
                <dd><a href="index.jsp">退&nbsp;&nbsp;&nbsp;&nbsp;出</a></dd>
            </dl>
        </div>
    </div>
</div>
<div class="sidebar">
    <ul>
        <li class="active-li"><a href="borrowbook.jsp" target="box"><i class="fa fa-tachometer" aria-hidden="true"></i><span class="">借阅管理</span></a></li>
        <li><a href="selectBorrow" target="box"><i class="fa fa-table" aria-hidden="true"></i><span>归还管理</span></a></li>
        <li><a href="selectBuy" target="box"><i class="fa fa-table" aria-hidden="true"></i><span>购买记录</span></a></li>
    </ul>
</div>
<div class="wrapper">
        <iframe src="borrowbook.jsp" name="box" id="myiframe"></iframe>
</div>
</body>
</html>