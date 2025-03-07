<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="<c:url value='/resources/css/instructorinformationAdd.css' />"> <!-- main.css -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">




</head>
<body>
<jsp:include page="/WEB-INF/views/module/linePage/stepup_top_empty.jsp"/>
<div class = "main_content">

<div id="add-schedule-section" class="section">
    <span class = "text"><a href="javascript:history.back();" class="text">계정</a> > 강의 추가</span>
    <h2>강의 추가</h2>
    <form action="addSchedule.do" method="post">
        <c:set var="prevAcademyName" value="" />
        <label for="time-slot">시간대:</label>
        <select id="time-slot" name="time_slot" required>
            <option value="">시간을 선택하세요</option>
            <c:forEach var="hour" begin="9" end="21" step="1">
                <option value="${String.format('%02d', hour)}:00">${String.format('%02d', hour)}:00</option>
            </c:forEach>
        </select><br><br>

        <label for="day-of-week">요일:</label>
        <select id="day-of-week" name="day_of_week" required>
            <option value="">요일을 선택하세요</option>
            <option value="월">월</option>
            <option value="화">화</option>
            <option value="수">수</option>
            <option value="목">목</option>
            <option value="금">금</option>
            <option value="토">토</option>
        </select><br><br>

        <label for="day-of-week">학원:</label>
        <select name="academy_idx" id="academy">
            <option value="">학원 선택</option>
            <c:forEach var="academy" items="${list}">
                <option value="${academy.academy_idx}">${academy.academy_name}</option>
            </c:forEach>
        </select>

        <label for="school-type">유형:</label>
        <input type="text" id="school-type" name="school_type" placeholder="예 : 중등, 고등, 초급, 중급 등" required><br><br>

        <label for="grade-level">학년:</label>
        <input type="text" id="grade-level" name="grade_level" placeholder="예 : 1학년,2학년 등" required><br><br>

        <label for="subject">과목:</label>
        <input type="text" id="subject" name="subject" required><br><br>

        <label for="subject">가격:</label>
        <input type="text" id="price" name="price" required><br><br>

        <button type="submit">스케줄 추가</button>
        <input type="hidden" name="instructor_idx" value="${instru.instructor_idx}">
        <input type="hidden" name="instructor_name" value="${instru.instructor_name}">
    </form>
</div>
</div>
<jsp:include page="/WEB-INF/views/module/linePage/stepup_bottom.jsp"/>

</body>
</html>
