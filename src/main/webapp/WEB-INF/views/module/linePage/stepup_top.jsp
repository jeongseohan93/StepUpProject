<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="<c:url value='/resources/css/main.css' />"> <!-- main.css -->
    <script src="https://kit.fontawesome.com/86028631f0.js" crossorigin="anonymous"></script> <!-- 폰트 어썸  -->
    <script src="<c:url value="/resources/js/academy_main_top.js"/>"></script>

    <script>
        document.addEventListener("DOMContentLoaded", function() {
            // 검색 버튼 클릭 이벤트
            document.querySelector(".icon_button").addEventListener("click", function() {
                search_name();
            });

            // 엔터 키 입력 시 검색 실행 (input 필드가 있는 경우)
            document.addEventListener("keydown", function(event) {
                if (event.key === "Enter") {
                    event.preventDefault(); // 기본 엔터 동작 방지
                    search_name(); // 검색 함수 호출
                }
            });
        });
    </script>
</head>
<body>
<div class="head_line">
    <div class="head">
        <a href="/a/mainhome.do"><img src="<c:url value="/resources/img/b_logo.png"/>"
                                      class="logo_img" style="width: 150px; height: 75px;"></a>
        <div class="search_bar">
            <div class="button_search" id="category_button">
                <span class="label">과목</span>
                <input type="text" placeholder="과목 검색" class="search_input" id="category_btn">
            </div>

            <div class="button_search" id="region_button">
                <span class="label">지역</span>
                <input type="text" placeholder="지역 검색" class="search_input" id="region_btn">
            </div>

            <div id="academy_button">
                <div class="academy_tag">
                    <div class="button_search">
                        <span class="label">학원</span>
                        <input type="text" placeholder="학원 검색" class="search_input" id="academy_btn">
                    </div>
                </div>

                <div id="icon">
                    <div class="icon_button" tabindex="0">
                        <i class="fa-solid fa-magnifying-glass" id="glass_icon"></i> <span
                            class="label1" onclick="search_name();">검색</span>
                    </div>
                </div>
            </div>

        </div>

        <div class="category_box">
            <div class="subject">
                <c:forEach var="s" items="${category}" varStatus="status">
                    <input
                            type="button"
                            value="${s.academy_category}"
                            class="button_design"
                            id="category_search_${status.index}"
                            onclick="search_subject('${s.academy_category}');">
                </c:forEach>
            </div>
        </div>

        <div class="region_box">
            <div class="subject">
                <c:forEach var="region1" items="${region}" varStatus="status">
                    <input
                            type="button"
                            value="${region1.academy_region}"
                            class="button_design"
                            id="region_search_${status.index}"
                            onclick="search_region('${region1.academy_region}');">
                </c:forEach>
            </div>
        </div>

        <div class="sub_nav">
            <i class="fa-solid fa-ticket-simple fa-2xl" class="board_icon" onclick="location.href='list.do?${member.userType}_id=${member.id}'"></i>


            <c:if test="${member eq null}"> <!-- 로그인이 되어 있지 않은 경우(세션에 존재x) -->
                <i class="fa-solid fa-cart-shopping fa-2xl" class="cart_icon"
                   onclick="location.href='login_page.do'"></i>
            </c:if>

            <c:if test="${member ne null}"> <!-- 로그인이 되어 있는 경우(세션에 존재) -->
                <i class="fa-solid fa-cart-shopping fa-2xl" class="cart_icon"
                   onclick="location.href='cart_page.do?stepup_id=${ member.id }'"></i>
            </c:if>

            <c:if test="${member eq null}"> <!-- 로그인이 되어 있지 않은 경우(세션에 존재x) -->
                <input type="button" value="로그인" class="button_design2" onclick="location.href='login_page.do'">
            </c:if>

            <c:if test="${member ne null}">

                <button onclick="member_drop();" class="button_design2">
                    <div class = "member_login">
                        <i class="fa-solid fa-bars fa-xl"></i>
                        <img src="<c:url value="${member.profile}"/>" alt="Profile Image" width="40" height="40" class = "profile_img">
                    </div>
                </button>


                <div class="member_info">
                    <a href="member_info.do?id=${ member.id }&userType=${ member.userType }&idx=${ member.idx }" class="member_ship">내정보</a>
                    <a href="logout.do" class="member_ship">로그아웃</a>
                </div>
            </c:if>
        </div>
    </div>

    <div class="category_icon"> <!-- 카테고리 아이콘 -->
        <i class="fa-solid fa-person-swimming fa-2xl" id="수영" onclick="click_icon(this.id);"></i>
        <i class="fa-solid fa-futbol fa-2xl" id="축구" onclick="click_icon(this.id);"></i>
        <i class="fa-solid fa-baseball fa-2xl" id="야구" onclick="click_icon(this.id);"></i>
        <i class="fa-solid fa-square-root-variable fa-2xl" id="수학" onclick="click_icon(this.id);"></i>
        <i class="fa-solid fa-e fa-2xl" id="영어" onclick="click_icon(this.id);"></i>
        <i class="fa-solid fa-book-bookmark fa-2xl" id="국어" onclick="click_icon(this.id);"></i>
        <i class="fa-solid fa-eye fa-2xl" id="탐구" onclick="click_icon(this.id);"></i>
        <i class="fa-solid fa-school-flag fa-2xl" id="종합" onclick="click_icon(this.id);"></i>
        <i class="fa-solid fa-utensils fa-2xl" id="조리" onclick="click_icon(this.id);"></i>
        <i class="fa-solid fa-briefcase fa-2xl" id="공무원" onclick="click_icon(this.id);"></i>
    </div>
</div>
</body>
</html>
