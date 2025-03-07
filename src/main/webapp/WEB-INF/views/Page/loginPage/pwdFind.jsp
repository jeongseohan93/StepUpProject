<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            text-align: center;
            padding-top: 50px;
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

        form {
            background: white;
            display: inline-block;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            text-align: left;
        }

        form input[type="text"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        form input[type="submit"] {
            background: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            transition: background 0.3s;
        }

        form input[type="submit"]:hover {
            background: #45a049;
        }

    </style>
</head>
<body>
<div class="main_logo">
    <a href="/a/mainhome.do"><img src="/a/resources/img/b_logo.png" class="logo_img"
                                  style="width: 200px; height: 100px;"></a>
</div>
<div>
    <form action = "pwdChaneg.do" method = "post">
        <input type = "text" name = "password"/>
        <input type = "hidden" name = "id" value = "${vo.id}">
        <input type = "hidden" name = "userType" value = "${vo.userType}">
        <input type = "submit" value = "제출">
    </form>


</div>

</body>
</html>
