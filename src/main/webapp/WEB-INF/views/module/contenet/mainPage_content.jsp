<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
  <head>
      <title>Title</title>
      <link rel="stylesheet" href="<c:url value="/resources/css/main.css"/>"> <!-- css -->
      <script src="<c:url value="/resources/js/httpRequest.js"/>"></script>

    <script>
      let page = 2;
      let isLoading = false;

      window.addEventListener("scroll", function () {
        if (window.innerHeight + window.scrollY >= document.body.offsetHeight - 200) {
          loadMoreAcademies();
        }
      });

      function loadMoreAcademies() {

          if(isLoading) return;

          isLoading = true;

          let url ="academyList.do";
          let param = "page=" + encodeURIComponent(page);

          sendRequest(url, param, loadAcademyList, "POST");
      }

      function loadAcademyList() {
        if (xhr.readyState == 4 && xhr.status == 200) {
          let data = xhr.responseText;

          let mainDiv = document.getElementById("main");
          mainDiv.innerHTML += data;

          page++; // 페이지 증가
          isLoading = false;
        }
      }
    </script>

  </head>
<body>
  <div class="main" id = "main"> <!-- 콘텐츠 영역 -->

    <c:forEach var="vo" items="${ list }"> <!-- for문으로 조회된 학원 출력 -->

      <div class="academy_content" onclick="location.href='academy_detail.do?academy_idx=${vo.academy_idx}'">

        <div class="img_tag">
          <input type="hidden" id = "academy_idx" value="${ vo.academy_idx }"> <!-- 파라미터 보내기 위해서 히든 -->



          <img src="<c:url value="${vo.academy_profile}"/>"  class="academy_img"
               style="width: 265px; height: 260px;" alt="?">

        </div>

        <span class="content2">${ vo.academy_category }</span>
        <span class="content">${ vo.academy_name }</span> <span class="content2">${ vo.academy_region }</span>

        <div class="star">
          <i class="fa-solid fa-star"></i>

          <span id="star_score">${vo.academy_rating}</span>

        </div>

      </div>

    </c:forEach>

  </div>
</body>
</html>
