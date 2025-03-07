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
<div class ="bigMainBox">
    <div class="main_box">
        <div>
            <h1>학원 계정</h1>
        </div>

        <div>
            <h3>${infor.academy_name}, ${infor.academy_id}</h3>
        </div>

        <div class="instructorInforBox">
            <div class="inforBox" onclick="location.href='academy_detail.do?academy_idx=${infor.academy_idx}'">
                <i class="fa-solid fa-house fa-2xl"></i>
                <div class="text-container">
                    <label class="title">학원정보</label>
                    <label class="description">학원 페이지로 이동할 수 있습니다</label>
                </div>
            </div>
            <div class="inforBox" onclick = "location.href='academyInstructorView.do?academy_idx=${infor.academy_idx}&academy_name=${infor.academy_name}'">
                <i class="fa-solid fa-user-pen fa-2xl"></i>
                <div class="text-container">
                    <label class="title">강사정보</label>
                    <label class="description">재직 중인 강사들의 정보를 볼 수 있습니다</label>
                </div>
            </div>


            <c:if test = "${count > 0}">
                <div class="inforBox" onclick = "location.href='resumeView.do?academy_idx=${infor.academy_idx}'">
                    <i class="fa-solid fa-file fa-2xl"></i>
                    <div class="text-container">
                        <label class="title">이력서 조회(${count})</label>
                        <label class="description">이력서 신청 현황을 볼 수 있습니다</label>
                    </div>
                </div>
            </c:if>

            <c:if test = "${count <= 0}">
                <div class="inforBox">
                    <i class="fa-solid fa-file fa-2xl"></i>
                    <div class="text-container">
                        <label class="title">이력서 조회</label>
                        <label class="description">이력서 신청 현황을 볼 수 있습니다</label>
                    </div>
                </div>
            </c:if>

            <div class="inforBox" onclick = "location.href='academyView.do?academy_idx=${infor.academy_idx}'">
                    <i class="fa-solid fa-building-columns fa-2xl"></i>
                    <div class="text-container">
                        <label class="title">학원 정보 변경</label>
                        <label class="description">학원 정보를 변경 할 수 있습니다</label>
                    </div>
            </div>


            <div class = "inforBox" onclick = "location.href='academyImgAddPage.do?academy_idx=${infor.academy_idx}'">
                <i class="fa-solid fa-image fa-2xl"></i>
                <div class="text-container">
                    <label class="title">이미지 관리</label>
                    <label class="description">학원 이미지를 추가 할 수 있습니다</label>
                </div>
            </div>
        </div>

            <div class="inforBox2" onclick = "location.href='logout.do'">
                로그아웃
            </div>

    </div>
</div>
<jsp:include page="/WEB-INF/views/module/linePage/stepup_bottom.jsp"/>

</body>
</html>
