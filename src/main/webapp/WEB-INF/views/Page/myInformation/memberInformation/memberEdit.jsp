<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>회원 정보 수정</title>
    <style>
        body {
            font-family: 'Noto Sans KR', sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .info_mid {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 100%;
            margin-top: 200px;
            margin-bottom : 100px;
        }

        .container {
            width: 90%;
            max-width: 500px;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }

        label {
            font-weight: bold;
            display: block;
            margin-top: 15px;
        }

        input, button {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 1em;
        }

        input:focus {
            border-color: #007bff;
            outline: none;
            box-shadow: 0px 0px 5px rgba(0, 123, 255, 0.5);
        }

        button {
            background-color: #007bff;
            color: white;
            font-weight: bold;
            cursor: pointer;
            border: none;
            transition: background 0.3s ease-in-out;
        }

        button:hover {
            background-color: #0056b3;
        }

        /* 주소 검색 버튼 스타일 */
        .address-btn {
            width: auto;
            background-color: #28a745;
        }

        .address-btn:hover {
            background-color: #218838;
        }

    </style>
</head>
<body>
<jsp:include page="/WEB-INF/views/module/linePage/stepup_top_empty.jsp"/>

<div class="info_mid">
    <div class="container">
        <h2 style="text-align: center;">회원 정보 수정</h2>

        <form action = "member_update.do" method="post">
            <label>ID:</label>
            <input type="text" name="stepup_id" value = "${memberInfo.stepup_id}">

            <label>Password:</label>
            <input type = "password" name = "stepup_pwd"value="${memberInfo.stepup_pwd}" placeholder="비밀번호를 입력해주세요"/>

            <label>Email:</label>
            <input type = "text" name = "stepup_email" value = "${memberInfo.stepup_email}"/>

            <label>주소:</label>
            <input type = "text" name = "stepup_address" value = "${memberInfo.stepup_address}"/>
            <button type="button" class="address-btn" onclick="region_search()">주소 검색</button>

            <label>생년월일:</label>
            <input type = "text" name = "stepup_birthday" value = "${memberInfo.stepup_birthday}"/>


            <label>닉네임:</label>
            <input type = "text" name = "stepup_nickname" value = "${memberInfo.stepup_nickname}"/>

            <label>전화번호:</label>
            <input type = "text" name = "stepup_phone" value = "${memberInfo.stepup_phone}"/>

            <input type = "submit" value = "수정">
        </form>

    </div>
</div>

<jsp:include page="/WEB-INF/views/module/linePage/stepup_bottom.jsp"/>
</body>
</html>
