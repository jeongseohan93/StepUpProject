<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>장바구니</title>
    <link rel="stylesheet" href="<c:url value='/resources/css/cart.css'/>">
    <script src="https://kit.fontawesome.com/86028631f0.js" crossorigin="anonymous"></script>
    <script>
    function updateTotal(inputElement, price, totalElementId, hiddenInputId, hiddenquantity) {
            var quantity = parseInt(inputElement.value) || 0;
            var total = price * quantity;
            var formattedTotal = total.toLocaleString();
            document.getElementById(totalElementId).innerHTML = formattedTotal + " 원";
            document.getElementById(hiddenInputId).value = total;
            document.getElementById(hiddenquantity).value = quantity;
        }
    </script>
</head>
<body>
<jsp:include page="/WEB-INF/views/module/linePage/stepup_top_empty.jsp"/>
<main class="cart_main_back">
    <h2>장바구니</h2>
    <div class="cart_container">
        <c:forEach var="cart" items="${list}">
            <div class="cart_item">
                <div class="cart_info">
                    <h3>${cart.subject}</h3>
                    <p>카테고리: ${cart.school_type}</p>
                    <p>시작일: ${cart.time_slot}</p>
                    <p>가격: <fmt:formatNumber value="${ cart.price }"/> 원/월</p>
                </div>
                <div class="cart_controls">
                    <form action="cart_update.do" method="post">
                        <input type="hidden" name="cart_idx" value="${cart.cart_idx}">
                        <input type="hidden" name="stepup_id" value="${member.id}">
                        <input type="number" name="quantity" min="1" step="1"
                               value="${cart.quantity}" class="quantity_input"
                               oninput="updateTotal(this, ${cart.price}, 'total-${cart.cart_idx}', 'totalInput-${cart.cart_idx}', 'hiddenQuantity-${cart.cart_idx}')">
                    </form>
                    <p class="cart_total" id="total-${cart.cart_idx}">
                        <fmt:formatNumber value="${cart.price * cart.quantity}" type="number" maxFractionDigits="0"/> 원
                    </p>
                    <form action="check_out.do" method="post">
                        <input type="hidden" name="stepup_id" value="${member.id}">
                        <input type="hidden" name="cart_idx" value="${cart.cart_idx}">
                        <input type="hidden" name="total_price" id="totalInput-${cart.cart_idx}" value="${cart.price * cart.quantity}">
                        <input type="hidden" name="quantity" id="hiddenQuantity-${cart.cart_idx}" value="${cart.quantity}">
                        <input type="submit" value="주문하기" class="naver_pay_btn">
                    </form>
                </div>
            </div>
        </c:forEach>

    </div>
</main>
<jsp:include page="/WEB-INF/views/module/linePage/stepup_bottom.jsp"/>
</body>
</html>
