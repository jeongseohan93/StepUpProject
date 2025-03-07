<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"%>


<html>
  <head>
    <meta charset="UTF-8">
    <title>Title</title>

    <link rel="stylesheet" href="<c:url value="/resources/css/academy_detail.css"/>">
    <script src="https://kit.fontawesome.com/86028631f0.js" crossorigin="anonymous"></script>
    <script type="text/javascript" src="https://oapi.map.naver.com/openapi/v3/maps.js?ncpClientId=2hvgemd6sm"></script>
    <script>
      document.addEventListener('DOMContentLoaded', function() {
        console.log("Latitude:", latitude);
        console.log("Longitude:", longitude);

        var academyName = "${vo.academy_name}";
        var latitude = parseFloat("${vo.academy_latitude}");
        var longitude = parseFloat("${vo.academy_longitude}");


        console.log(latitude,longitude);
        // 지도 표시할 div 가져오기
        var mapDiv = document.getElementById('map');

        // 지도 생성
        var map = new naver.maps.Map(mapDiv, {
          center: new naver.maps.LatLng( latitude, longitude ), // 학원의 중심 좌표
          zoom: 18 // 지도 확대 레벨
        });

        // 초기 마커 추가
        var marker = new naver.maps.Marker({
          position: new naver.maps.LatLng( latitude, longitude ), // 학원 위치
          map: map,
          title: academyName // 마커 제목
        });
      });// DOMContentLoaded 이벤트 닫힘
    </script>

  </head>

  <body>

    <jsp:include page="/WEB-INF/views/module/linePage/stepup_top.jsp"/>

    <div class = "title">
      <span class = "title_line">${ vo.academy_name }</span>
    </div>



      <div class = "academy_box">
        <div class = "main_img">
          <img src="<c:url value="${vo.academy_profile}"/>" class="main1" style="width: 600px; height: 600px;"/>
        </div>
        <div class = "sub_center">
          <div class = "sub_img">
            <c:forEach var = "pic" items="${pic}" begin="0" end = "1" step = "1">
              <img src="<c:url value="${pic.pic_name}"/>" class = "main1" style="width: 334px; height: 300px;" alt = "?"/>
            </c:forEach>
          </div>
          <div class = "sub_img">
            <c:forEach var = "pic" items="${pic}" begin="2" end = "3" step = "1">
              <img src="<c:url value="${pic.pic_name}"/>" class = "main1" style="width: 334px; height: 300px;" alt = "?"/>
            </c:forEach>
          </div>

        </div>
      </div>



    <div class = "c_title">
      <div class = "intro">
        <div class = "m_title">
          <h2>${ vo.academy_category }</h2><h4>(${vo.academy_sub})</h4>
        </div>
        <span>${ vo.academy_content }</span>

        <div>
          <i class="fa-solid fa-star"></i>
          <span>${ rating_num.rating }</span>
        </div>

        <hr class = "inner_border"/>
      </div>

      <div class="academy_schedule">
        <h2>모든 선생님의 스케줄</h2>
        <table border="1">
          <thead>
          <tr>
            <th class="time-column">시간대</th>
            <th class="day-column">월</th>
            <th class="day-column">화</th>
            <th class="day-column">수</th>
            <th class="day-column">목</th>
            <th class="day-column">금</th>
            <th class="day-column">토</th>
          </tr>
          </thead>
          <tbody>
          <!-- 시간대 반복 -->
          <c:forEach var="hour" items="${hours}">
            <tr>
              <td>${hour}</td>
              <!-- 요일 반복 -->
              <c:forEach var="day" items="${days}">
                <td>
                  <!-- 해당 시간대와 요일에 해당하는 선생님과 과목 출력 -->
                  <c:forEach var="schedule" items="${schedules}">
                    <c:if test="${schedule.time_slot == hour && schedule.day_of_week == day}">
                      ${schedule.instructor_name} <br>
                      - ${schedule.school_type} ${schedule.grade_level} ${schedule.subject} -<br>
                    </c:if>
                  </c:forEach>
                </td>
              </c:forEach>
            </tr>
          </c:forEach>
          </tbody>
        </table>
      </div>
    </div>

    <hr class = "border"/>

    <h2 class = "instructor_label">강사진</h2>
    <div class = "instructor_member">
      <c:forEach var="vo" items="${ insvo }">
        <div class = "instructor_box" onclick="location.href='lecture_list.do?instructor_idx=${vo.instructor_idx}'">
          <div>
            <img src="<c:url value="${vo.instructor_profile}"/>" class="instructor_img" style="width: 120px; height: 120px;">
          </div>

          <div class="instructor_intro">
            <span>${ vo.instructor_name }</span>
            <span>${ vo.instructor_nickname }</span>


          </div>
        </div>
      </c:forEach>
    </div>


    <hr class = "border"/>

    <div class = "map_title">
      <h2 class = "location">위치</h2>
      <span class = "title_line1">${ vo.academy_region }, ${ vo.academy_address }</span>
      <div class = "academy_map">
        <div id="map" style="width:100%;height:450px;"></div>
      </div>
    </div>

    <hr class = "border"/>

    <div class = "evaluation">
      <h2>후기</h2>
      <div class = "ratting">
        <i class="fa-solid fa-star fa-2xl"></i>
        <span>${rating_num.rating}</span>
      </div>


      <div class = "review_box">
        <div class = "review_box_main">
          <c:forEach var = "review" items="${review}" begin="0" end="5">
            <div class = "box23">

              <div class = "profile">
                <div class = "profile_name">
                  <span>${review.stepup_id}님의 후기</span>
                </div>
              </div>
              <div>
                <i class="fa-solid fa-star"></i>
                <span>${ review.rating } , ${review.created_at}</span>
              </div>

              <div>
                  ${review.content}
              </div>
            </div>
          </c:forEach>
        </div>
      </div>
      <input type = "button" onclick = "location.href='reviewWritePage.do?academy_idx=${vo.academy_idx}&stepup_id=${member.id}&academy_id=${vo.academy_id}'" value = "후기작성" class = "review_button">
    </div>

      <div class = "main_academy_information">
        <hr/>
        <h2>학원 정보</h2>
        <div class = "academy_information">
          <div class = "academy_person">
            <div>
              <img src="<c:url value="${vo.academy_profile}"/>" class="instructor_img" style="width: 120px; height: 120px;">
            </div>

            <div>
              ${ vo.academy_name }
            </div>

          </div>

          <div class = "sub_academy_information">
            <span>전화번호 : ${ vo.academy_phone }</span>
            <span>사업자 등록번호 : ${ vo.academy_bus_num }</span>
            <span>이메일 : ${ vo.academy_email }</span>


          </div>
        </div>
      </div>


    <jsp:include page="/WEB-INF/views/module/linePage/stepup_bottom.jsp"/>

  </body>
</html>
