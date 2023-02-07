<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>FuzzySelect</title>
    <style>
        * {
            padding: 0;
            margin: 0;
        }
        html {
            height: 100%;
        }
        body {
            background-image: linear-gradient(to bottom right, rgb(114, 135, 254), rgb(130, 88, 186));
        }
        .login-container {
            width: 480px;
            height: 480px;
            margin: 0 auto;
            margin-top: 10%;
            border-radius: 15px;
            box-shadow: 0 10px 50px 0px rgb(95, 76, 194);
            background-color: rgb(95, 76, 194);
        }
        .left-container {
            display: inline-block;
            width: 330px;
            border-top-left-radius: 15px;
            border-bottom-left-radius: 15px;
            padding: 60px;
            background-image: linear-gradient(to bottom right, rgb(95, 76, 194), rgb(95, 76, 194));
        }
        .title {
            color: #fff;
            font-size: 18px;
            font-weight: 200;
        }
        .title span {
            color: white;
        }
        .input-container {
            padding: 20px 0;
        }
        input {
            border: 0;
            background: none;
            outline: none;
            color: #fff;
            margin: 20px 0;
            display: block;
            width: 100%;
            padding: 5px 0;
            transition: .2s;
            border-bottom: 1px solid rgb(199, 191, 219);
        }
        input:hover {
            border-bottom-color: #fff;
        }
        #register {
            position: absolute;
            left: 110px;
            top: 520px;
            font-size: 18px;
            border: 0;
            background: none;
            outline: none;
            color: #fff;
            margin: 20px 0;
            display: block;
            width: 100%;
            padding: 5px 0;
            transition: .2s;
            font-weight: bold;
        }
        ::-webkit-input-placeholder {
            color: rgb(199, 191, 219);
        }
        a {
            color: white;
            text-decoration: none;
            font-weight: bold;
        }
        #loginspan {
            position: absolute;
            top: 545px;
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
</head>
<body>
<div class="login-container">
    <div class="left-container">
        <div class="title">
            <div class="input-container">
                <form method="get" action="register">
                    <input type="text" name="uid" placeholder="借书证号" required>
                    <input type="text" name="uname" placeholder="姓名" required>
                    <input type="password" name="upassword" placeholder="密码" required>
                    <input type="text" name="ugender" placeholder="性别" required>
                    <input type="text" name="ucollage" placeholder="学院" required>
                    <input type="text" name="umajor" placeholder="专业" required>
                    <input type="submit" id="register" value="注册">
                </form>
                <span id="loginspan"><a href="index.jsp">去登录</a></span>
            </div>
        </div>
    </div>
</div>
<span id="showresult"><%if (request.getAttribute("registerfailed")!=null){
    out.print(request.getAttribute("registerfailed"));
}%></span>
</body>
</html>
