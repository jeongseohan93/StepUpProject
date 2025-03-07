<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="<c:url value='/resources/css/instructorinformationDel.css' />"> <!-- main.css -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
</head>
<body>
<jsp:include page="/WEB-INF/views/module/linePage/stepup_top_empty.jsp"/>
<div class ="bigMainBox">

    <div class = "content_box">

        <div>
            <c:forEach var = "instr" items = "${instr}" begin="0" end = "0">
                <h1>${instr.instructor_name} 님의 강의 관리</h1>
            </c:forEach>
        </div>
    </div>
    <div class="main_box">
        <form action="delete_sche.do" method="post">
            <div class="instructorInforBox">
                <c:forEach var="instr" items="${instr}">
                    <div class="inforBox">
                        <div class="info-text">
                            <div>강의명 : ${instr.subject}</div>
                            <div>요일 및 시간: ${instr.day_of_week} (${instr.time_slot})</div>
                            <div>가격 : ${instr.price}</div>
                        </div>
                        <input type="checkbox" name="schedule_idx" value="${instr.schedule_idx}" class="check">
                        <input type = "hidden" name = "instructor_idx" value = "${instr.instructor_idx}"/>
                        <input type = "hidden" name = "stepup_id" value = "${member.id}"/>
                    </div>
                </c:forEach>
                <div><input type = "submit" value = "삭제" class="inforBox2"/></div>
            </div>
        </form>
    </div>
</div>
<jsp:include page="/WEB-INF/views/module/linePage/stepup_bottom.jsp"/>

</body>
</html>
