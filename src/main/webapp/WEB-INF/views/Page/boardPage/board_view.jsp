<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시판 상세 보기</title>
    
    <script src="/a/resources/js/httpRequest.js"></script>

		<script>
		
			/* 보고있는 댓글의 페이지 번호를 저장할 변수 */
			let comm_page = 1;
		
			/* 상세보기 페이지로 오면, 원래 등록되어 있던 댓글을 보여준다 */
			window.onload = function(){
				comment_list( comm_page );
			}
		
			/* 댓글등록 메서드 */
function send(f){
    let name = f.comment_name.value.trim();  // trim() 추가
    let content = f.comment_content.value.trim();
    
    if(name === ''){
        alert("이름을 입력하세요");
        f.comment_name.focus();  // focus 추가
        return;
    }
    
    if(content === ''){
        alert("내용을 입력하세요");
        f.comment_content.focus();  // focus 추가
        return;
    }
    
    let url = "comment_insert.do";
    let param = "board_idx=${vo.board_idx}&comment_name="+encodeURIComponent(name)+
                "&comment_content="+encodeURIComponent(content);
    
    sendRequest(url, param, comm_result, "post");
}

function comm_result(){
    if(xhr.readyState == 4 && xhr.status == 200){
        let data = xhr.responseText;
        let json = (new Function('return '+data))();
        
        if(json[0].result === 'yes'){
            // 입력 폼 초기화 추가
            let f = document.querySelector(".comment-container form");
            f.comment_name.value = '';
            f.comment_content.value = '';
            
            // 댓글목록 새로고침
            comment_list(comm_page);
        }else{
            alert("등록실패");
        }
    }
}
		
			function comment_list( page ){
				
				comm_page = page;
				
				let url = "comment_list.do";
				let param = "board_idx=${vo.board_idx}&page="+page;
				sendRequest(url, param, comm_list_fn, 'post');
			}	
			
			function comm_list_fn(){
			    if(xhr.readyState == 4 && xhr.status == 200){
			        let data = xhr.responseText;
			        let disp = document.getElementById("comment_disp");
			        disp.innerHTML = data;
			    }
			}
			
			function del(){
				
				if( !confirm('삭제 하시겠습니까?') ){
					return;
				}
				
				let url = "del.do";
				let param = "board_idx=${vo.board_idx}";
				sendRequest( url, param, resultFn, "post" );
				
			}
			
			function resultFn(){
				
				if( xhr.readyState == 4 && xhr.status == 200 ){
					
					let data = xhr.responseText;
					let json = ( new Function('return '+data) )();
					
					if( json[0].result === 'succ' ){
						alert("삭제성공");
					}else{
						alert("삭제실패");
					}
					
					location.href="list.do?page=${param.page}&search=${param.search}&search_text=${param.search_text}";					
					
				}
				
			}
			
			/* 댓글삭제 함수 */
			function del_comment(f){
				
				let comment_idx = f.comment_idx.value;
				
				if( !confirm("삭제하시겠습니까?") ){
					return;
				}
				
				let url = "comment_del.do";
				let param = "comment_idx="+comment_idx;
				sendRequest(url, param, comm_list_del, "post");
				
			}
			
			function comm_list_del(){
				if( xhr.readyState == 4 && xhr.status == 200 ){
					
					let data = xhr.responseText;
					let json = ( new Function('return ' + data) )();
					
					if( json[0].result === 'yes' ){
						comment_list( comm_page );
					}else{
						alert("삭제실패");
					}
					
				}
			}
			
			function modify() {
				location.href='modify_form.do?board_idx=${vo.board_idx}&page=${param.page}&search=${param.search}&search_text=${param.search_text}';
			}
			
		</script>
    
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        @font-face {
            font-family: 'JUA';
            src: url("/a/resources/font/JUA.ttf") format('truetype');
        }

        body {
            font-family: 'JUA', sans-serif;
            background-color: #f3f4f6;
            color: #333;
            line-height: 1.8;
        }

       header {
            background-color: #0B0C0D; /* 어두운 색상 */
            color: #fff;
            padding: 20px;
            text-align: center;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .container, .comment-container, .comlist-container {
            width: 90%;
            max-width: 800px;
            margin: 20px auto;
            background: #fff;
            border-radius: 15px;
            padding: 20px;
            box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.1);
        }

        table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
        }

        th, td {
            padding: 15px;
            font-size: 16px;
            text-align: left;
        }

        th {
            background-color: #0B0C0D;
            color: white;
            border-radius: 10px 0 0 10px;
        }

        td {
            background-color: #f9f9f9;
            border-radius: 0 10px 10px 0;
        }

        pre {
            font-family: inherit;
            font-size: 14px;
            white-space: pre-wrap;
            word-wrap: break-word;
        }

        .button-container {
            text-align: right;
            margin-top: 10px;
        }

        .button-container button {
            background-color: #0B0C0D;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            font-family: 'JUA';
            font-size: 16px;
            margin-left: 10px;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        .button-container button:hover {
            background-color: #333;
            transform: scale(1.05);
        }

        textarea {
            width: calc(100% - 20px);
            padding: 10px;
            font-size: 14px;
            border: 1px solid #ddd;
            border-radius: 10px;
            resize: none;
            background-color: #f9f9f9;
        }

/* 입력 필드와 placeholder */
input[type="text"], textarea {
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

input::placeholder, textarea::placeholder {
    font-family: 'JUA', sans-serif; /* JUA 폰트 적용 */
    font-size: 14px;
    color: #999;
}

input[type="text"]:focus, textarea:focus {
    border-color: #0B0C0D;
    box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
    outline: none;
}

/* 버튼 스타일 */
input[type="button"] {
    font-family: Arial, sans-serif; /* 버튼 폰트 고정 */
    font-size: 14px; /* 텍스트 크기 고정 */
    padding: 10px 20px; /* 버튼 크기 고정 */
    background-color: #0B0C0D;
    color: white;
    border: none;
    border-radius: 10px;
    cursor: pointer;
    transition: background-color 0.3s ease, transform 0.2s ease;
}

input[type="button"]:hover {
    background-color: #333;
    transform: scale(1.05);
}


        .comlist-item {
            margin-bottom: 15px;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 10px;
            background-color: #f9f9f9;
        }

        .comlist-item-header {
            font-weight: bold;
            margin-bottom: 5px;
            font-size: 14px;
            color: #555;
        }

        footer {
    background-color: #0B0C0D;
    color: white;
    text-align: center;
    padding: 15px;
    margin-top: 30px;
    font-size: 16px;
    border-radius: 15px 15px 0 0;
    box-shadow: 0px -4px 10px rgba(0, 0, 0, 0.1);
    cursor: pointer;
    transition: background-color 0.3s ease, color 0.3s ease, transform 0.2s ease;
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

.hidden {
	display: none;
}

.page-menu {
    text-align: center;
    margin: 30px 0;
    font-family: 'JUA', sans-serif;
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 8px;
}

.page-menu a {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    min-width: 36px;
    height: 36px;
    padding: 0 8px;
    border: none;
    border-radius: 8px;
    text-decoration: none;
    color: #555;
    background-color: #f3f4f6;
    transition: all 0.3s ease;
    font-size: 15px;
    font-weight: 500;
}

.page-menu a:hover {
    background-color: #e2e4e9;
    color: #2c3e50;
    transform: translateY(-2px);
    box-shadow: 0 2px 8px rgba(44, 62, 80, 0.1);
}

.page-menu .now {
    background-color: #0B0C0D;
    color: white !important;
    font-weight: bold;
    box-shadow: 0 2px 8px rgba(44, 62, 80, 0.2);
}

/* 화살표 스타일 */
.page-menu .arrow {
    position: relative;
    background-color: white;
    border: 2px solid #e2e4e9;
    width: 40px;
    height: 40px;
    padding: 0;
    color: transparent;
    border-radius: 10px;
    transition: all 0.3s ease;
}

.page-menu .arrow:before {
    content: '';
    position: absolute;
    top: 50%;
    width: 8px;
    height: 8px;
    border-top: 2px solid #2c3e50;
    border-right: 2px solid #2c3e50;
    transition: all 0.3s ease;
}

.page-menu .prev:before {
    left: 55%;
    transform: translateY(-50%) rotate(-135deg);
}

.page-menu .next:before {
    right: 55%;
    transform: translateY(-50%) rotate(45deg);
}

.page-menu .arrow:hover {
    background-color: #0B0C0D;
    border-color: #0B0C0D;
    transform: translateY(-2px);
    box-shadow: 0 2px 8px rgba(44, 62, 80, 0.2);
}

.page-menu .arrow:hover:before {
    border-color: white;
}

.page-menu .disabled {
    opacity: 0.3;
    cursor: not-allowed;
    pointer-events: none;
    background-color: #f3f4f6;
    border-color: #e2e4e9;
}

.page-menu .disabled:before {
    border-color: #999;
}

/* 페이지 번호 사이의 간격 조정 */
.page-menu a:not(.arrow) {
    margin: 0 2px;
}

/* 현재 페이지 hover 효과 제거 */
.page-menu .now:hover {
    transform: none;
    background-color: #0B0C0D;
}
        
    </style>
    
</head>
<body>
<header>
    <h1>스텝업 라운지</h1>
</header>
 
<div class="container">
    <table>
        <colgroup>
            <col style="width: 20%;">
            <col style="width: 30%;">
            <col style="width: 20%;">
            <col style="width: 30%;">
        </colgroup>
        <tr>
            <th>작성자</th>
            <td>${vo.board_name}</td>
            <th>작성일</th>
            <td>${vo.board_regdate}</td>
        </tr>
        <tr>
            <th>제목</th>
            <td>${vo.board_subject}</td>
            <th>조회수</th>
            <td>${vo.board_readhit}</td>
        </tr>
        <tr>
    <td colspan="4" style="padding: 20px 15px; text-align: left;">
        <pre style="white-space: pre-wrap; word-wrap: break-word; line-height: 1.8; font-size: 16px;">${vo.board_content}</pre>
    </td>
</tr>

    </table>
    <div class="button-container">
        <button onclick="location.href='list.do'">목록보기</button>
        <button onclick="modify()">수정</button>
        <button onclick="del()">글삭제</button>
    </div>
</div>

<div id="comlist-container" class="comlist-container">
    <h3>댓글 목록</h3>
     <div id="comment_disp">
        <!-- 여기에 댓글이 동적으로 로드됨 -->
    </div>
</div>

<div class="comment-container">
    <h3>댓글 작성</h3>
    <form>
        <table>
            <tr>
                <th>작성자</th>
                <td><input type="text" name="comment_name" placeholder="이름을 입력하세요"></td>
            </tr>
            <tr>
                <th>내용</th>
                <td><textarea name="comment_content" rows="4" placeholder= "내용을 입력하세요"></textarea></td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: right;">
                    <input type="button" value="등록" onclick="send(this.form)">
                </td>
            </tr>
        </table>
    </form>
</div>
<footer>
    <a href="mainhome.do" class="footer-button">메인으로 돌아가기</a>
</footer>

</body>
</html>
