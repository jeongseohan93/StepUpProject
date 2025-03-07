<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
    <script src="<c:url value="/resources/js/httpRequest.js"/>"></script>

    <link rel="stylesheet" href="<c:url value="/resources/css/login_select.css"/>"> <!-- css -->

    <script>


    </script>


</head>
<body>
<div class="select_form">
    <div class="logo_img1">
        <a href="<c:url value="/mainhome.do"/>"><img src="<c:url value="/resources/img/b_logo.png"/>" class="logo_img"
                                                       style="width: 150px; height: 75px;" alt="안나옴"></a>
    </div>
    <div class=login_form_top>

        <div class=login_form_bottom>
            <div class="menu">
                <div>
                    <h2>STEPUP에서 어떤 서비스를 이용하고 싶으세요?</h2>
                </div>

                <div class = "content">
                    <span class = "select_content">회원가입 유형을 선택하세요</span>
                    <span class = "select_content">일반회원에서 강사로 전환이 가능해요</span>
                </div>

                <div class="academy_content">
                    <h3>학원으로 가입하고 싶다면</h3>
                    <input type="button" value="학원으로 가입" class = "select_button" onclick="location.href = 'academy_join.do'">
                </div>

                <div class = "instructor_content">
                    <h3>강사로 가입하고 싶다면</h3>
                    <input type="button" value="강사로 가입" class = "select_button" onclick="location.href = 'instructor_join_instructor.do'">
                </div>

                <div class = "member_content">
                    <h3>강의를 듣고 싶다면</h3>
                    <input type="button" value="회원으로 가입" class = "select_button" onclick="location.href = 'member_join_page.do'">
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
