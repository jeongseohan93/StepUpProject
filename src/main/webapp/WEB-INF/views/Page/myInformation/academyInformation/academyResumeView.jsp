<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="<c:url value='/resources/css/academyResumeView.css' />">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
</head>
<body>

<jsp:include page="/WEB-INF/views/module/linePage/stepup_top_empty.jsp"/>
<div class = "big_container">
    <c:forEach var="item" items="${list}">
        <div id = "resume-list">

            <div class="instructor-info">
                <h3>${item.instructor_name}</h3>
                <p>이메일: ${item.instructor_email}</p>
                <p>전화: ${item.instructor_phone}</p>
                <p>전문분야: ${item.instructor_category}</p>
                <P>전송시간: ${ item.created_at }</P>
            </div>

            <div class="resume-info">
                <h4>자기소개</h4>
                <p>${item.self_introduction}</p>
            </div>

            <!-- 승인 버튼 추가 -->
            <form action="approve_instructor.do" method="post">
                <input type="hidden" name="instructor_idx" value="${item.instructor_idx}">

                <!-- academy_idx가 NULL이면 hidden 필드를 추가하지 않음 -->
                <c:if test="${not empty item.academy_idx}">
                    <input type="hidden" name="academy_idx" value="${item.academy_idx}">
                </c:if>

                <input type ="submit" value = "승인" class="button1"/>
            </form>

            <form action="resume_reject.do" method="post">
                <input type="hidden" name="resume_idx" value="${item.resume_idx}">
                <input type="submit" value="거절" class="button1"/>
            </form>

        </div>
    </c:forEach>
</div>
<jsp:include page="/WEB-INF/views/module/linePage/stepup_bottom.jsp"/>

</body>
</html>
