<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>이력서 목록</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        table {
            width: 80%;
            border-collapse: collapse;
            background-color: #ffffff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        th {
            background-color: #4CAF50;
            color: white;
            padding: 10px;
            text-align: center;
            font-weight: bold;
        }

        td {
            padding: 10px;
            text-align: center;
            border: 1px solid #ddd;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .table-container {
            width: 100%;
            display: flex;
            justify-content: center;
        }

        h1 {
            text-align: center;
            font-size: 24px;
            color: #333;
            margin-bottom: 20px;
        }

        .approved {
            color: green;
            font-weight: bold;
        }

        .rejected {
            color: red;
            font-weight: bold;
        }
    </style>
</head>
<body>


<div class="table-container">
    <table>
        <thead>
        <tr>
            <th>결과 수신 시간</th>
            <th>학원 이름</th>
            <th>상태</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="resume" items="${resumeList}">
            <tr>
                <td>${resume.updated_at }</td>
                <td>${resume.academy_name}</td>
                <td class="${resume.approval_status == 'APPROVED' ? 'approved' : (resume.approval_status == 'REJECTED' ? 'rejected' : '')}">
                    <c:choose>
                        <c:when test="${resume.approval_status == 'APPROVED'}">✔ 승인됨</c:when>
                        <c:when test="${resume.approval_status == 'REJECTED'}">❌ 거절됨</c:when>
                        <c:otherwise>⏳ 대기 중</c:otherwise>
                    </c:choose>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>