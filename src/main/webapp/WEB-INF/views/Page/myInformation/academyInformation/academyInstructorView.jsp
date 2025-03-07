<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="<c:url value='/resources/css/information.css' />"> <!-- main.css -->

</head>
<body>
<jsp:include page="/WEB-INF/views/module/linePage/stepup_top_empty.jsp"/>
<div class="bigMainBox">
    <div class="main_box">
        <div>
            <h1>${academy}의 강사진</h1>
        </div>

        <div class="instructorInforBox">

            <c:forEach var="vo" items="${ list }">
                <div class="inforBoxInstru" onclick="location.href='lecture_list.do?instructor_idx=${vo.instructor_idx}'">

                    <div>
                        <img src="<c:url value="${ vo.instructor_profile }"/>" class="instructor_img"
                             style="width: 120px; height: 120px;">
                    </div>

                    <div class = "instructor_name">
                        <span>${ vo.instructor_name }</span>
                        <span>${ vo.instructor_nickname }</span>
                        <span>${vo.instructor_email}</span>
                        <span>${vo.instructor_phone}</span>
                        <span>${vo.instructor_sub}</span>

                    </div>
                </div>
            </c:forEach>

        </div>
    </div>
</div>
<jsp:include page="/WEB-INF/views/module/linePage/stepup_bottom.jsp"/>
</body>
</html>
