<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스텝업 라운지</title>
	<link rel="stylesheet" href="<c:url value="/resources/css/boardList.css"/>">
<script>
        window.onload = function() {
            let search = document.getElementById("search");
            let search_text = document.getElementById("search_text");

            let search_arr = ["all", 'board_subject', 'board_name', 'board_content'];

            for (let i = 0; i < search_arr.length; i++) {
                if ('${param.search}' === search_arr[i]) {
                    search[i].selected = true;
                    search_text.value = '${param.search_text}';
                    break;
                }
            }
        }

        function search() {
        	//검색할 카테고리 조회
            let search = document.getElementById("search").value;
        	
        	//검색어
            let search_text = document.getElementById("search_text").value;

        	//전체보기가 아닐때는 반드시 검색어가 포함되어 있어야 한다
            if (search !== 'all' && search_text === '') {
                alert("검색할 내용을 입력하세요");
                return;
            }

            location.href = "list.do?search=" + search +
                            "&search_text=" + encodeURIComponent(search_text) +
                            "&page=1";
        }
    </script>



</head>

<body>
	<header>
		<h1>스텝업 라운지</h1>
	</header>

	<main>
		<table>
			<tr>
				<th>작성자</th>
				<th>제목</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>

			<c:forEach var="vo" items="${list}">
				<c:if test="${vo.board_del_info ne -1}">
					<tr
						onclick="location.href='view.do?board_idx=${vo.board_idx}&page=${empty param.page ? 1 : param.page}&search=${param.search}&search_text=${param.search_text}'"
						style="cursor: pointer;">
						<td class="hidden">${vo.board_idx}</td>
						<td>${vo.board_name}<br>(${vo.board_ip})
						</td>
						<td>${vo.board_subject} 
						</td>
						<td>${vo.board_regdate}</td>
						<td>${vo.board_readhit}</td>
					</tr>
				</c:if>
			</c:forEach>

			<tr>
				<td colspan="5">
					<div class="page-menu">${pageMenu}</div>
				</td>
			</tr>
		</table>


		<div class="button-container">
			<input type="button" value="전체글"
				onclick="location.href='list.do?search=all&page=1'"> <input
				type="button" value="글쓰기" onclick="location.href='write_form.do'">
		</div>

		<div class="search-bar">
			<select id="search">
				<option value="all">전체</option>
				<option value="board_subject">제목</option>
				<option value="board_name">이름</option>
				<option value="board_content">내용</option>
			</select> <input id="search_text"> <input type="button" value="검색"
				onclick="search();">
		</div>
	</main>

	<footer>
		<a href="mainhome.do" class="footer-button">메인으로 돌아가기</a>
	</footer>

</body>
</html>
