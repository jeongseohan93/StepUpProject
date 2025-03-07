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
            <h1>개인 회원</h1>
        </div>

        <div>
            <h3>${infor.stepup_nickname}, ${infor.stepup_id}</h3>
        </div>

        <div class="instructorInforBox">
            <div class="inforBox" onclick = "location.href='member_edit.do?stepup_id=${ member.id }'">
                <i class="fa-solid fa-shield-halved fa-2xl"></i>
                <div class="text-container">
                    <label class="title">보안 관리</label>
                    <label class="description">회원의 정보를 변경할 수 있습니다</label>
                </div>
            </div>
            <div class="inforBox" onclick = "location.href='curseView.do?stepup_id=${ member.id }'">
                <i class="fa-regular fa-credit-card fa-2xl"></i>
                <div class="text-container">
                    <label class="title">수강 내역</label>
                    <label class="description">수강 내역을 볼 수 있습니다</label>
                </div>
            </div>

            <div class="inforBox" onclick = "location.href='reviewSelect.do?stepup_id=${ member.id }'">
                <i class="fa-solid fa-chalkboard-user fa-2xl"></i>
                <div class="text-container">
                    <label class="title">내 후기</label>
                    <label class="description">내가 작성한 후기를 볼 수 있습니다</label>
                </div>
            </div>
        </div>
        <div class="inforBox2" onclick = "location.href='logout.do'">로그아웃</div>
    </div>
</div>
<jsp:include page="/WEB-INF/views/module/linePage/stepup_bottom.jsp"/>

</body>
</html>
