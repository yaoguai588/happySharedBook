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
      height: 315px;
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
    #login {
      position: absolute;
      left: 120px;
      top: 380px;
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
      font-size: 18px;
    }
    ::-webkit-input-placeholder {
      color: rgb(199, 191, 219);
    }
    a {
      color: white;
      text-decoration: none;
      font-weight: bold;
    }
    #registerspan {
      position: absolute;
      top: 365px;
    }
    #showresult {
      color: white;
      font-weight: bold;
      position: absolute;
      top: 100px;
      left: 700px;
      font-size: 30px;
    }
  </style>
</head>
<body>
<div class="login-container">
  <div class="left-container">
    <div class="title">
      <div class="input-container">
        <form method="get" action="repassword">
          <input type="text" name="uid" placeholder="借阅证号" required>
          <input type="password" name="oldpassword" placeholder="原密码" required>
          <input type="password" name="newpassword" placeholder="新密码" required>
          <input type="submit" id="login" value="修改">
        </form>
      </div>
    </div>
  </div>
</div>
<span id="showresult"><%if (request.getAttribute("failed")!=null){
  out.print(request.getAttribute("failed"));
}%></span>
</body>
</html>