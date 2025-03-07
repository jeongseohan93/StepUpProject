<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="<c:url value='/resources/css/information.css' />"> <!-- main.css -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
</head>
<body>

<jsp:include page="/WEB-INF/views/module/linePage/stepup_top_empty.jsp"/>
<div class="bigMainBox">
    <div class="main_box">
        <div>
            <h1>강사 계정</h1>
        </div>

        <div>
            <h3>${infor.instructor_nickname}, ${infor.instructor_id}</h3>
        </div>

        <div class="instructorInforBox">
            <div class="inforBox" onclick = "location.href = 'lecture_list.do?instructor_idx=${infor.instructor_idx}'">
                <i class="fa-solid fa-user fa-2xl"></i>
                <div class="text-container">
                    <label class="title">강사 정보</label>
                    <label class="description">강사의 정보를 볼 수 있습니다</label>
                </div>
            </div>

            <div class="inforBox" onclick = "location.href = 'instructorInformationChangePage.do?instructor_idx=${infor.instructor_idx}'">
                <i class="fa-solid fa-shield-halved fa-2xl"></i>
                <div class="text-container">
                    <label class="title">보안 관리</label>
                    <label class="description">강사의 정보를 변경할 수 있습니다</label>
                </div>
            </div>

            <div class="inforBox" onclick="location.href = 'lectureAdd.do?instructor_idx=${infor.instructor_idx}'">
                <i class="fa-solid fa-landmark fa-2xl"></i>
                <div class="text-container">
                    <label class="title">강의 추가</label>
                    <label class="description">강의를 추가할 수 있습니다</label>
                </div>
            </div>
            <div class="inforBox" onclick="location.href = 'lectureViewDelete.do?instructor_idx=${infor.instructor_idx}'">
                <i class="fa-solid fa-delete-left fa-2xl"></i>
                <div class="text-container">
                    <label class="title">강의 관리</label>
                    <label class="description">강의를 관리할 수 있습니다</label>
                </div>
            </div>
            <div class="inforBox" onclick = "location.href = 'resume.do?instructor_idx=${infor.instructor_idx}'">
                <i class="fa-solid fa-file fa-2xl"></i>
                <div class="text-container">
                    <label class="title">이력서 제출</label>
                    <label class="description">이력서를 학원에 제출할 수 있습니다</label>
                </div>
            </div>

            <div class="inforBox" onclick = "location.href = 'resume_list.do?instructor_idx=${infor.instructor_idx}'">
                <i class="fa-regular fa-bell fa-2xl"></i>
                <div class="text-container">
                    <label class="title">알림</label>
                    <label class="description">제출한 이력서의 승인을 알 수 있습니다</label>
                </div>
            </div>
        </div>
        <div class="inforBox2" onclick="location.href='logout.do'">로그아웃</div>
    </div>
</div>
<jsp:include page="/WEB-INF/views/module/linePage/stepup_bottom.jsp"/>

</body>
</html>
