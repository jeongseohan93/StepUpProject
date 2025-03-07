<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>리뷰 작성</title>
    <style>
        /* 기본 스타일 설정 */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Noto Sans KR', sans-serif;
        }

        body {
            display: flex;
            flex-direction: column;
            align-items: center;
            background-color: #f8f9fa;
            padding-top: 50px;
        }

        /* 리뷰 폼 컨테이너 */
        .review-container {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            width: 90%;
            max-width: 500px;
        }

        .review-container h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        /* 폼 요소 스타일 */
        .form-group {
            margin-bottom: 15px;
        }

        label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
        }

        input, select, textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 1rem;
            background-color: #f9f9f9;
        }

        input:focus, select:focus, textarea:focus {
            border-color: #007bff;
            outline: none;
            box-shadow: 0px 0px 5px rgba(0, 123, 255, 0.5);
        }

        /* 별점 선택 스타일 */
        select {
            appearance: none;
            background: #fff;
            cursor: pointer;
        }

        /* 텍스트 입력 스타일 */
        textarea {
            resize: vertical;
            min-height: 100px;
        }

        /* 버튼 스타일 */
        .submit-btn {
            width: 100%;
            padding: 12px;
            font-size: 1.1rem;
            font-weight: bold;
            color: white;
            background: #007bff;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background 0.3s ease-in-out;
            margin-top: 10px;
        }

        .submit-btn:hover {
            background: #0056b3;
        }


    </style>
</head>
<body>

<div class="review-container">
    <h2>리뷰 작성</h2>
    <form action="stepupReviewModify.do" method="post">
        <input type = "hidden" name = "review_idx" value = "${vo.review_idx}">
        <input type = "hidden" id = "academy_idx" name = "academy_idx" value="${vo.academy_idx}">
        <input type = "hidden" name = "academy_id" value = "${vo.academy_id}">
        <input type="hidden" id="stepup_id" name="stepup_id" value = ${member.id} >


        <div class="form-group">
            <label for="rating">별점</label>
            <select id="rating" name="rating" required>
                <option value="1" ${vo.rating eq 1 ? "selected" : ""}>⭐ 1점</option>
                <option value="2" ${vo.rating eq 2 ? "selected" : ""}>⭐⭐ 2점</option>
                <option value="3" ${vo.rating eq 3 ? "selected" : ""}>⭐⭐⭐ 3점</option>
                <option value="4" ${vo.rating eq 4 ? "selected" : ""}>⭐⭐⭐⭐ 4점</option>
                <option value="5" ${vo.rating eq 5 ? "selected" : ""}>⭐⭐⭐⭐⭐ 5점</option>
            </select>
        </div>

        <div class="form-group">
            <label for="content">리뷰 내용</label>
            <textarea id="content" name="content" placeholder="리뷰 내용을 입력하세요" required>${vo.content}</textarea>
        </div>

        <button type="submit" class="submit-btn">리뷰 제출</button>
    </form>
</div>

</body>
</html>
