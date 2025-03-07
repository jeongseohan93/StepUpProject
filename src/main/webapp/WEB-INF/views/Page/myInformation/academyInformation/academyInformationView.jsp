<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="<c:url value='/resources/css/academyInformationView.css' />"> <!-- main.css -->
</head>
<body>
    <jsp:include page="/WEB-INF/views/module/linePage/stepup_top_empty.jsp"/>
    <div class = "academy_label">
        <h1>학원 정보 수정</h1>
    </div>
    <div id="stepup_mod">
        <form action="updateStepupInfo.do" method="post">
            <input type="hidden" name="academy_idx" value="${vo.academy_idx}">
            <input type="hidden" name="academy_id" value="${vo.academy_id}">

            <label for="academy_name">학원 이름</label>
            <input type="text" id="academy_name" name="academy_name" value="${vo.academy_name}">

            <label for="academy_pwd">비밀번호</label>
            <input type="password" id="academy_pwd" name="academy_pwd" value="${vo.academy_pwd }">

            <label for="academy_phone">전화번호</label>
            <input type="text" id="academy_phone" name="academy_phone" value="${vo.academy_phone}">

            <label for="academy_content">학원 소개</label>
            <input type="text" id="academy_content" name="academy_content" value="${vo.academy_content}">

            <label for="academy_bus_num">사업자번호</label>
            <input type="text" id="academy_bus_num" name="academy_bus_num" value="${vo.academy_bus_num}">

            <label for="academy_address">주소</label>
            <input type="text" id="academy_address" name="academy_address" value="${vo.academy_address}">

            <label for="academy_category">대분류</label>
            <input type="text" id="academy_category" name="academy_category" value="${vo.academy_category}">

            <label for="academy_sub">소분류</label>
            <input type="text" id="academy_sub" name="academy_sub" value="${vo.academy_sub}">

            <label for="academy_email">e-Mail</label>
            <input type="text" id="academy_email" name="academy_email" value="${vo.academy_email}">

            <button type="submit">수정하기</button>
        </form>
    </div>

    <jsp:include page="/WEB-INF/views/module/linePage/stepup_bottom.jsp"/>
</body>
</html>
