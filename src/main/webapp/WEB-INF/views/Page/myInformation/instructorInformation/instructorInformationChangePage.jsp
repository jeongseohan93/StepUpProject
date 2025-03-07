<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="<c:url value='/resources/css/instructorChange.css' />"/>
    <script>
        function region_search() {

            var pop = window.open("/a/resources/popup/jusoPopup.jsp", "pop", "width=570,height=420, scrollbars=yes, resizable=yes");
        }

        function jusoCallBack(roadFullAddr) {
            // 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
            document.getElementById('roadFullAddr').value = roadFullAddr;

        }
    </script>


</head>
<body>
<jsp:include page="/WEB-INF/views/module/linePage/stepup_top_empty.jsp"/>
    <div class="instructorTopic">
        개인정보
    </div>
<div class="instructorPage">

    <form action="ins-modify.do" method="get">
        <div class="instructorPageDetail">




            <div class="instructorSmallTopic">
                실명
                <div class="inputBox">
                    <input name="instructor_name" value="${instructorVO.instructor_name}">

                </div>
            </div>

            <div class="instructorSmallTopic">
                아이디
                <div class="inputBox">
                    <input name="instructor_id" value="${instructorVO.instructor_id}">

                </div>
            </div>

            <div class="instructorSmallTopic">
                비밀번호
                <div class="inputBox">
                    <input type="password" name="instructor_pwd" value="${instructorVO.instructor_pwd}">

                </div>

            </div>

            <div class="instructorSmallTopic">
                이메일
                <div class="inputBox">
                    <input name="instructor_email" value="${instructorVO.instructor_email}">

                </div>

            </div>

            <div class="instructorSmallTopic">
                주소
                <div class="inputBox">
                    <input type="text" id="roadFullAddr" name="instructor_address"
                           value="${instructorVO.instructor_address}"/>

                </div>

            </div>

            <div class="instructorSmallTopic">
                생년월일
                <div class="inputBox">
                    <input name="instructor_birthday" value="${instructorVO.instructor_birthday}">

                </div>

            </div>

            <div class="instructorSmallTopic">
                닉네임
                <div class="inputBox">
                    <input name="instructor_nickname" value="${instructorVO.instructor_nickname}">

                </div>

            </div>

            <div class="instructorSmallTopic">
                핸드폰번호
                <div class="inputBox">
                    <input name="instructor_phone" value="${instructorVO.instructor_phone}">

                </div>

            </div>

            <div class="instructorSmallTopic">
                과목
                <div class="inputBox">
                    <input name="instructor_sub" value="${instructorVO.instructor_sub}">

                </div>

            </div>

            <div class="instructorSmallTopic">
                카테고리
                <div class="inputBox">
                    <input name="instructor_category" value="${instructorVO.instructor_category}">

                </div>

            </div>

            <input type="submit" class="editButton" value="수정"/>
        </div>

        <input type="hidden" name="instructor_idx" value="${instructorVO.instructor_idx}">
        <input type="hidden" name="academy_idx" value="${instructorVO.academy_idx}">
        <input type="hidden" name="instructor_id" value="${instructorVO.instructor_id}">
        <input type="hidden" name="instructor_name" value="${instructorVO.instructor_name}">
        <input type="hidden" name="instructor_gender" value="${instructorVO.instructor_gender}">
        <input type="hidden" name="instructor_birthday" value="${instructorVO.instructor_birthday}">
        <input type="hidden" name="instructor_profile" value="${instructorVO.instructor_profile}">
        <input type="hidden" name="approval_status" value="${instructorVO.approval_status}">


    </form>

</div>

<jsp:include page="/WEB-INF/views/module/linePage/stepup_bottom.jsp"/>
</body>
</html>
