<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새 글 작성하기</title>

<style>
@import url('https://fonts.googleapis.com/css2?family=Jua&display=swap')
	;

/* 초기화 스타일 적용 */
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

/* 기본 설정 */
body {
	font-family: 'JUA', sans-serif; /* JUA 폰트 적용 */
	margin: 0;
	padding: 0;
	background-color: #f3f4f6;
	color: #0B0C0D;
	line-height: 1.6;
}

header {
	background-color: #0B0C0D; /* 어두운 색상 */
	color: #fff;
	padding: 20px;
	text-align: center;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

form {
	width: 90%;
	max-width: 700px;
	margin: 20px auto;
	background-color: #fff;
	border-radius: 15px;
	box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.1);
	padding: 20px;
}

table {
	width: 100%;
	table-layout: fixed;
	border-collapse: collapse;
}

th, td {
	padding: 15px;
	font-size: 16px;
	text-align: left;
	white-space: nowrap;
}

th {
	width: 20%;
	color: #fff;
	background-color: #0B0C0D;
	border-radius: 10px 0 0 10px;
}

td {
	width: 80%;
	background-color: #f9f9f9;
	border-radius: 0 10px 10px 0;
	overflow: hidden;
	text-overflow: ellipsis;
	word-wrap: break-word;
}

input, textarea {
	width: calc(100% - 20px);
	padding: 10px;
	margin: 5px 0;
	font-size: 14px;
	font-family: 'JUA', sans-serif; /* JUA 폰트 적용 */
	border: 1px solid #ddd;
	border-radius: 10px;
	box-sizing: border-box;
	background-color: #f3f4f6;
	transition: border-color 0.3s ease, box-shadow 0.3s ease;
}

input:focus, textarea:focus {
	border-color: #0B0C0D;
	box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
	outline: none;
}

textarea {
	resize: none;
}

#editor-container {
	height: 400px;
	border-radius: 10px;
	border: 1px solid #ddd;
}

/* Quill 에디터 placeholder 폰트 적용 */
#editor-container .ql-editor::before {
	font-family: 'JUA', sans-serif;
	font-style: normal;
}

/* Quill.js에서 삽입된 이미지에 대한 스타일 */
.ql-editor img {
	max-width: 100%; /* 부모 컨테이너에 맞게 너비를 자동으로 조정 */
	height: auto; /* 비율에 맞춰 높이를 자동으로 설정 */
	display: block; /* 불필요한 여백 제거 */
	margin: 0 auto; /* 가운데 정렬 */
}

/* Quill 비디오 모달을 오른쪽으로 이동 */
.ql-tooltip {
    right: 0 !important;  /* 모달을 오른쪽 끝으로 위치 */
    left: auto !important;  /* left 속성 제거 */
}

.button-container {
	text-align: right;
	margin-top: 20px;
}

.button-container button {
	padding: 10px 20px;
	font-size: 16px;
	font-family: 'JUA', sans-serif; /* JUA 폰트 적용 */
	color: #fff;
	background-color: #0B0C0D;
	border: none;
	border-radius: 10px;
	cursor: pointer;
	margin-left: 10px;
	transition: background-color 0.3s ease, transform 0.2s ease;
}

.button-container button:hover {
	background-color: #333;
	transform: scale(1.05);
}

footer {
	text-align: center;
	margin-top: 30px;
	border-radius: 15px 15px 0 0;
	padding: 0; /* 패딩 제거 */
	background-color: transparent; /* 배경 투명 */
	box-shadow: none; /* 그림자 제거 */
}

.footer-button {
	display: inline-block;
	padding: 10px 20px;
	font-size: 16px;
	font-family: 'JUA', sans-serif;
	color: #fff;
	text-decoration: none;
	background-color: #0B0C0D;
	border-radius: 10px;
	transition: background-color 0.3s ease, transform 0.2s ease;
}

.footer-button:hover {
	background-color: #333;
	transform: scale(1.05);
}
</style>

<!-- Quill.js 1.3.7 CDN -->
<link href="https://cdn.quilljs.com/1.3.7/quill.snow.css"
	rel="stylesheet">
<script src="https://cdn.quilljs.com/1.3.7/quill.min.js"></script>

<script>
	var quill;

	function initQuill() {
		quill = new Quill('#editor-container', {
			theme : 'snow',
			modules : {
				toolbar : [ [ 'bold', 'italic', 'underline', 'strike' ], [ {
					'header' : [ 1, 2, false ]
				} ], [ {
					'list' : 'ordered'
				}, {
					'list' : 'bullet'
				} ], [ {
					'color' : []
				}, {
					'background' : []
				} ], [ 'image', 'link', 'video' ] ]
			},
			placeholder : '내용을 입력하세요'
		});
		
		
		
	}

	function send_check() {
		let f = document.f;

		// Quill 에디터의 내용을 textarea에 설정
		f.board_content.value = quill.root.innerHTML;

		if (f.board_subject.value === '') {
			alert("제목을 입력하세요");
			return;
		}

		if (f.board_content.value === '') {
			alert("내용을 입력하세요");
			return;
		}

		f.method = "post";
		f.action = "insert.do";
		f.submit();
	}

	document.addEventListener("DOMContentLoaded", function() {
		initQuill();
	});
</script>

</head>

<body>
	<header>
		<h1>스텝업 라운지</h1>
	</header>

	<form name="f">
		<table>
			<tr>
				<th>제목</th>
				<td><input type="text" name="board_subject"
					placeholder="제목을 입력하세요"></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="board_name"
					placeholder="이름을 입력하세요"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<!-- Quill 에디터 영역 -->
					<div id="editor-container"></div> <!-- 숨겨진 textarea (Quill 데이터 저장) -->
					<textarea name="board_content" style="display: none;"></textarea>
				</td>
			</tr>
		</table>

		<div class="button-container">
			<button type="button" onclick="send_check();">등록</button>
			<button type="button" onclick="history.back();">취소</button>
		</div>
	</form>

	<footer>
		<a href="mainhome.do" class="footer-button">메인으로 돌아가기</a>
	</footer>

</body>
</html>