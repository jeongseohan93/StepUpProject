
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            text-align: center;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 300px;
        }

        .main_logo {
            margin-bottom: 20px;
        }

        .logo_img {
            width: 200px;
            height: 100px;
            transition: transform 0.3s;
        }

        .logo_img:hover {
            transform: scale(1.1);
        }

        .message {
            margin-bottom: 20px;
            font-size: 16px;
            color: #333;
        }

        input[type="button"] {
            background: #007bff;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            transition: background 0.3s;
            font-size: 14px;
        }

        input[type="button"]:hover {
            background: #0056b3;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="main_logo">
        <a href="/a/mainhome.do">
            <img src="/a/resources/img/b_logo.png" class="logo_img">
        </a>
    </div>
    <div class="message">
        <h3>${name}</h3>님의 아이디는 <h3>${vo.id}</h3> 입니다.
    </div>
    <input type="button" onclick="location.href='login_page.do'" value="로그인 화면으로">
</div>

</body>
</html>
