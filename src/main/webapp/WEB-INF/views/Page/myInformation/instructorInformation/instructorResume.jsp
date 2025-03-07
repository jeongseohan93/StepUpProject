<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="<c:url value='/resources/css/instructorResume.css' />"> <!-- main.css -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
</head>
<body>
<jsp:include page="/WEB-INF/views/module/linePage/stepup_top_empty.jsp"/>
<div class = "main_content">

<div id="resume_page" class="section">
    <h2>이력서 제출</h2>
    <form action="resume_send.do" method="post">
        <label for="academy">학원 이름:</label>
        <select name="academy_idx" id="academy">
            <option value="">학원 선택</option>
            <c:forEach var="academy" items="${list}">
                <option value="${academy.academy_idx}">${academy.academy_name}</option>
            </c:forEach>
        </select><br><br>

        <label for="intro">자기소개:</label><br>
        <textarea name="self_introduction" id="intro" rows="5" cols="40"></textarea><br><br>
        <input type="hidden" name="instructor_idx" value="${instru.instructor_idx}">
        <button type="submit">제출</button>
    </form>
</div>
</div>
<jsp:include page="/WEB-INF/views/module/linePage/stepup_bottom.jsp"/>
</body>
</html>
