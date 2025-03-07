<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>강사 정보</title>
    <link rel="stylesheet" href="<c:url value='/resources/css/lecture.css' />">
</head>
<body>
<jsp:include page="/WEB-INF/views/module/linePage/stepup_top_empty.jsp"/>

<div class="content-container">

    <!-- 강사 정보 -->
    <div class="instructor-container">
        <div class="instructor-description">
           <img src="<c:url value='/resources/img/bannerex.png' />" class = "bannerBigImg">
        </div>
    </div>


    <div class="review-section">
        <div class="instructor-profile" onclick="location.href='lecture_list.do?instructor_idx=${insvo.instructor_idx}'">
            <img src="<c:url value='${insvo.instructor_profile}' />" class="instructor-img">
        </div>

        <div class = "instructor-review">
            <h1 class="nickname">${ insvo.instructor_nickname }</h1>
            <div class = "instructor-review2">
                <div>
                    <h3 class="name">${ insvo.instructor_name }</h3>
                </div>
                <div>
                    이메일: ${ insvo.instructor_email }
                </div>
                <div>
                    전화번호: ${ insvo.instructor_phone }
                </div>
                <div>
                    과목: ${ insvo.instructor_sub }
                </div>
            </div>



        </div>

    </div>

    <div class="lecture-list">
        <h2>${ insvo.instructor_nickname } 학원 강사님 강의</h2>


            <div class="lecture-container">
                <c:forEach var="instr" items="${schedules}">

                    <div class="lecture-card">cart
                        <form action="cartAdd.do" method="get">
                            <input type="hidden" name="instructor_idx" value="${insvo.instructor_idx}">
                            <input type="hidden" name="stepup_id" value="${ member.id }">
                            <input type="hidden" name="schedule_idx" value="${instr.schedule_idx}">
                        <div class="lecture-info">

                            <p><strong>강의명:</strong> ${instr.subject}</p>
                            <p><strong>요일 및 시간:</strong> ${instr.day_of_week} (${instr.time_slot})</p>
                            <p><strong>가격:</strong> <span class="price">${instr.price}</span></p>
                        </div>

                        <!-- 네모난 박스 추가 -->
                        <div class="button-container">
                            <div class="lecture-buttons">
                                <input type="submit" value="장바구니 담기" class="btn">
                            </div>
                        </div>
                        </form>
                    </div>

                </c:forEach>
            </div>
    </div>



</div>

<jsp:include page="/WEB-INF/views/module/linePage/stepup_bottom.jsp"/>
</body>
</html>
