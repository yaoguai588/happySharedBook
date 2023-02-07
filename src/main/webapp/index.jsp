<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>登录首页</title>
</head>
<style>
    html{
        width: 100%;
        height: 100%;
        overflow: hidden;
    }
    body{
        width: 100%;
        height: 100%;
        font-family: 'Open Sans',sans-serif;
        margin: 0;
        background-color: #4A374A;
    }

    h1{
        position: absolute;
        left: 54%;
        top: 16%;
        color: #fff;
        text-shadow:0 0 10px;
        letter-spacing: 1px;
        text-align: center;
        font-size: 4em;
        margin: 0.67em 0;
    }
    #text1{
        position: absolute;
        left: 50%;
        top: 36%;
        width: 284px;
        height: 18px;
        margin-bottom: 10px;
        outline: none;
        padding: 10px;
        font-size: 13px;
        color: #fff;
        text-shadow:1px 1px 1px;
        border-top: 1px solid #312E3D;
        border-left: 1px solid #312E3D;
        border-right: 1px solid #312E3D;
        border-bottom: 1px solid #56536A;
        border-radius: 4px;
        background-color: #2D2D3F;
    }
    #text2{
        position: absolute;
        left: 50%;
        top: 42%;
        width: 284px;
        height: 18px;
        margin-bottom: 10px;
        outline: none;
        padding: 10px;
        font-size: 13px;
        color: #fff;
        text-shadow:1px 1px 1px;
        border-top: 1px solid #312E3D;
        border-left: 1px solid #312E3D;
        border-right: 1px solid #312E3D;
        border-bottom: 1px solid #56536A;
        border-radius: 4px;
        background-color: #2D2D3F;
    }
    #button_login{
        position: absolute;
        left: 50%;
        top: 48%;
        width: 150px;
        min-height: 20px;
        display: block;
        background-color: #4a77d4;
        border: 1px solid #3762bc;
        color: #fff;
        padding: 9px 14px;
        font-size: 15px;
        line-height: normal;
        border-radius: 5px;
        margin: 0;
    }
    #button_register{
        position: absolute;
        left: 60%;
        top: 48%;
        width: 150px;
        min-height: 20px;
        display: block;
        background-color: #4a77d4;
        border: 1px solid #3762bc;
        color: #fff;
        padding: 9px 14px;
        font-size: 15px;
        line-height: normal;
        border-radius: 5px;
        margin: 0;
    }
    #showresult {
        color: white;
        font-weight: bold;
        position: absolute;
        top: 150px;
        left: 550px;
        font-size: 30px;
    }
</style>
<script>
    function kip(){
        window.location.href="register.jsp";
    }
</script>
<h1>欢迎登录</h1>
<form action="login" method="get">
    <input type="text" name="uid" placeholder="用户账号" required="required" id="text1">
    <input type="password" name="upassword" placeholder="密码" required="required" id="text2">
    <button id="button_login" type="submit">登录</button>
    <button id="button_register" onclick="kip()" >注册</button>
</form>
<span id="showresult"><%if (request.getAttribute("loginfailed")!=null){
    out.print(request.getAttribute("loginfailed"));
}%></span>
</body>
</html>