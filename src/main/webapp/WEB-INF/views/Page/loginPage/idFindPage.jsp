<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>

    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
            crossorigin="anonymous">
    <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous">
    </script>

    <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
            charset="utf-8"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
    <script src="/a/resources/js/httpRequest.js"></script>


    <script>
        // 입력 내용에 따라 x 버튼 표시/숨김
        function toggleClearButton(input) {
            const clearButton = input.nextElementSibling; // input 옆의 clear-button
            if (input.value.length > 0) {
                clearButton.style.display = 'block';
            } else {
                clearButton.style.display = 'none';
            }
        }

        // 입력 필드 초기화
        function clearInput(button) {
            const input = button.previousElementSibling; // 버튼 앞의 input 태그
            input.value = ""; // 입력 값 초기화
            input.focus(); // 포커스 유지
            button.style.display = 'none'; // x 버튼 숨김
        }

    </script>

    <link rel="stylesheet" href="<c:url value="/resources/css/login_main.css"/>">
</head>
<body>


<div class="main_logo">
    <a href="/a/mainhome.do"><img src="/a/resources/img/b_logo.png" class="logo_img"
                                  style="width: 200px; height: 100px;"></a>
</div>


<div class="input">
    <form action="idFind.do" method="post">
        <div class = "login_input">
            <div class="input-container">
                <!-- 아이디 입력 -->
                <input type="text" name="name" class="id" placeholder="이름" oninput="toggleClearButton(this)"/>
                <span class="clear-button" onclick="clearInput(this)">
            <svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" fill="currentColor"
                 class="bi bi-x-circle-fill" viewBox="0 0 16 16">
                <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0M5.354 4.646a.5.5 0 1 0-.708.708L7.293 8l-2.647 2.646a.5.5 0 0 0 .708.708L8 8.707l2.646 2.647a.5.5 0 0 0 .708-.708L8.707 8l2.647-2.646a.5.5 0 0 0-.708-.708L8 7.293z"/>
            </svg>
        </span>
            </div>

            <div class="input-container">
                <!-- 비밀번호 입력 -->
                <input name="email" class="pwd" placeholder="이메일" oninput="toggleClearButton(this)"/>
                <span class="clear-button" onclick="clearInput(this)">
            <svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" fill="currentColor"
                 class="bi bi-x-circle-fill" viewBox="0 0 16 16">
                <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0M5.354 4.646a.5.5 0 1 0-.708.708L7.293 8l-2.647 2.646a.5.5 0 0 0 .708.708L8 8.707l2.646 2.647a.5.5 0 0 0 .708-.708L8.707 8l2.647-2.646a.5.5 0 0 0-.708-.708L8 7.293z"/>
            </svg>
        </span>
            </div>

            <input type="submit" value="아이디 찾기" class="login_button">
        </div>
    </form>
</div>

</body>
</html>