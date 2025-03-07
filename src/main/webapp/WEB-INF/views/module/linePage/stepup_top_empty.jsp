<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="<c:url value='/resources/css/main.css' />">
    <script src = "<c:url value="/resources/js/academy_main_top.js"/>"></script>
</head>
<body>
    <div class="head_line">
      <div class="head">
        <a href="/a/mainhome.do"><img src="<c:url value="/resources/img/b_logo.png"/>"
                                      class="logo_img" style="width: 150px; height: 75px;"></a>

          <div>
          </div>

          <div class="sub_nav">
              <i class="fa-solid fa-ticket-simple fa-2xl" class="board_icon" onclick="location.href='list.do'"></i>
              <i class="fa-solid fa-cart-shopping fa-2xl" class="cart_icon" onclick = "location.href='cart_page.do?stepup_id=${ member.id }'"></i>

              <c:if test = "${member eq null}"> <!-- 로그인이 되어 있지 않은 경우(세션에 존재x) -->
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
                      <a href="member_info.do?id=${ member.id }&userType=${ member.userType }&idx=${ member.idx}" class="member_ship">내정보</a>
                      <a href="logout.do" class="member_ship">로그아웃</a>
                  </div>
              </c:if>
          </div>
      </div>

        <hr class = border2/>
    </div>



</body>
</html>
