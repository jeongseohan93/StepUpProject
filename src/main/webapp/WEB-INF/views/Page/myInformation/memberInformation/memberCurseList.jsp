memberCurseList.jsp<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <style>
        body {
            font-family: 'Noto Sans KR', sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .content {
            margin-top: 200px;
            margin-bottom : 200px;
            width: 90%;
            max-width: 600px;
        }

        .content > div:first-child {
            text-align: center;
            font-size: 1.2em;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .card {
            background: white;
            padding: 20px;
            margin-bottom: 15px;
            border-radius: 10px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            transition: 0.3s;
        }

        .card:hover {
            transform: translateY(-3px);
            box-shadow: 0px 6px 12px rgba(0, 0, 0, 0.15);
        }

        .card span {
            display: block;
            font-size: 1em;
            margin: 5px 0;
        }

        .card span:first-child {
            font-weight: bold;
            color: #333;
        }
    </style>
</head>
<body>
<jsp:include page="/WEB-INF/views/module/linePage/stepup_top_empty.jsp"/>

<div class="content">
    <c:forEach var="vo" items="${vo}" begin="0" end="0">
        <div>
            <span>${vo.stepup_id}님이 강의</span>
        </div>
    </c:forEach>

    <c:forEach var="vo" items="${vo}">
        <div class="card">
            <span>과목명 : ${vo.subject}</span>
            <span>등급 : ${vo.school_type}</span>
            <span>금액 : ${vo.total_price}원</span>
        </div>
    </c:forEach>
</div>

<jsp:include page="/WEB-INF/views/module/linePage/stepup_bottom.jsp"/>
</body>
</html>
