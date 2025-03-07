<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시물 수정하기</title>

    <style>


        /* 전체 초기화 */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        /* 폰트 */
        @font-face {
            font-family: 'JUA';
            src: url("/a/resources/font/JUA.ttf") format('truetype');
        }

        body {
            font-family: 'JUA', sans-serif;
            background-color: #f3f4f6;
            color: #333;
            line-height: 1.6;
        }

        header {
            background-color: #0B0C0D;
            color: #fff;
            padding: 20px;
            text-align: center;
            font-size: 24px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        form {
            max-width: 800px;
            margin: 30px auto;
            background-color: #fff;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 15px;
            font-size: 16px;
            text-align: left;
        }

        th {
            background-color: #0B0C0D;
            color: white;
            font-weight: bold;
            border-top-left-radius: 8px;
            border-bottom-left-radius: 8px;
        }

        td {
            background-color: #f9f9f9;
        }

        input[type="text"], textarea {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 10px;
            font-size: 16px;
            background-color: #f5f5f5;
            font-family: 'JUA', sans-serif; /* 폰트 적용 */
            transition: box-shadow 0.3s ease, border-color 0.3s ease;
        }

        input[type="text"]:focus, textarea:focus {
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            border-color: #0B0C0D;
            outline: none;
        }

        textarea {
            resize: none;
        }

        .button-container {
            text-align: right;
            margin-top: 20px;
        }

        .button-container button {
            padding: 10px 20px;
            font-size: 16px;
            font-family: 'JUA', sans-serif;
            border: none;
            border-radius: 8px;
            background-color: #0B0C0D;
            color: white;
            cursor: pointer;
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

    <script>
        function send_check() {
            let f = document.f;

            if (!f.board_name.value.trim()) {
                alert("작성자를 입력하세요");
                return;
            }

            if (!f.board_subject.value.trim()) {
                alert("제목을 입력하세요");
                return;
            }

            if (!f.board_content.value.trim()) {
                alert("내용을 입력하세요");
                return;
            }

            f.method = "post";
            f.action = "modify_fin.do";
            f.submit();
        }
    </script>
</head>
<body>

<header>
    <h1>스텝업 라운지</h1>
</header>

<form name="f">
    <input type="hidden" name="board_idx" value="${param.board_idx}">
    <input type="hidden" name="page" value="${param.page}">

    <table>
        <tr>
            <th>작성자</th>
            <td><input type="text" name="board_name" value="${vo.board_name}" placeholder="작성자를 입력하세요"></td>
        </tr>
        <tr>
            <th>제목</th>
            <td><input type="text" name="board_subject" value="${vo.board_subject}" placeholder="제목을 입력하세요"></td>
        </tr>
        <tr>
            <th>내용</th>
            <td><textarea rows="10" name="board_content" placeholder="내용을 입력하세요">${vo.board_content}</textarea></td>
        </tr>
        <tr>
            <td colspan="2" class="button-container">
                <button type="button" onclick="send_check()">수정</button>
                <button type="button" onclick="history.back()">취소</button>
            </td>
        </tr>
    </table>
</form>

<footer>
    <a href="mainhome.do" class="footer-button">메인으로 돌아가기</a>
</footer>


</body>
</html>
