<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="<c:url value="/resources/css/search.css"/>"> <!-- css -->

    <script type="text/javascript"
            src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=2hvgemd6sm"></script>
    <script id="code">
        document.addEventListener('DOMContentLoaded', function () {
            // 지도 표시할 div 가져오기
            var mapDiv = document.getElementById('map');

            // 지도 생성
            var map = new naver.maps.Map(mapDiv, {
                center: new naver.maps.LatLng(37.498095, 127.027610), // 기본 중심 좌표
                zoom: 7 // 지도 확대 레벨
            });

            // 마커 데이터 배열 생성
            var markers = [
                <c:forEach var="region" items="${search_name}">
                {
                    lat: "${region.academy_latitude}",
                    lng: "${region.academy_longitude}",
                    title: "${region.academy_name}"
                },
                </c:forEach>
            ];

            // 모든 마커 생성 및 정보창 띄우기
            markers.forEach(function (markerData) {
                var marker = new naver.maps.Marker({
                    map: map,
                    position: new naver.maps.LatLng(markerData.lat, markerData.lng),
                    title: markerData.title
                });

                // 정보창 내용 설정
                var contentString = [
                    '<div class="iw_inner">',
                    '   <h3>' + markerData.title + '</h3>',
                    '   <p>위도: ' + markerData.lat + '<br>경도: ' + markerData.lng + '</p>',
                    '</div>'
                ].join('');

                var infowindow = new naver.maps.InfoWindow({
                    content: contentString
                });

                naver.maps.Event.addListener(marker, 'click', function () {
                    if (infowindow.getMap()) { // 정보창이 이미 열려 있다면 닫음
                        infowindow.close();
                    } else { // 정보창이 닫혀 있다면 열기
                        infowindow.open(map, marker);
                    }
                });
            });
        });
    </script>

</head>
<body>

        <jsp:include page="/WEB-INF/views/module/linePage/stepup_top.jsp"/>

        <div class = "searchResult">
            <div class = "searchResultAcademy">
                <c:forEach var="vo" items="${ search_name }">
                    <div class="academyContent" onclick="location.href='academy_detail.do?academy_idx=${vo.academy_idx}'">
                        <div class="imgTag">
                            <input type="hidden" value="${ vo.academy_idx }">
                            <img src="<c:url value="${vo.academy_profile}"/>" class="academyImg"
                                 style="width: 265px; height: 260px;" alt="?">
                        </div>
                        <span class="content2">${ vo.academy_category }</span>
                        <span class="content">${ vo.academy_name }</span>
                        <span class="content2">${ vo.academy_region }</span>
                        <div class="star">
                            <i class="fa-solid fa-star"></i><span id="star_score">${vo.academy_rating}</span>
                        </div>
                    </div>
                </c:forEach>
            </div>

            <div class = "sideBar">

                <div id="map" style="width: 850px; height: 850px;"></div>

            </div>


        </div>

        <jsp:include page="/WEB-INF/views/module/linePage/stepup_bottom.jsp"/>

</body>
</html>
