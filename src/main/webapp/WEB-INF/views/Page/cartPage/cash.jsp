<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8" />
    <script src="https://js.tosspayments.com/v2/standard"></script>
  </head>
  <body>
    <!-- 할인 쿠폰 -->
    <div>
      <input type="checkbox" id="coupon-box" />
      <label for="coupon-box"> 5,000원 쿠폰 적용 </label>
    </div>
    <!-- 결제 UI -->
    <div id="payment-method"></div>
    <!-- 이용약관 UI -->
    <div id="agreement"></div>
    <!-- 결제하기 버튼 -->
    <button class="button" id="payment-button" style="margin-top: 30px">결제하기</button>

    <script>
      main();

      async function main() {
        const button = document.getElementById("payment-button");
        const coupon = document.getElementById("coupon-box");
        // ------  결제위젯 초기화 ------
        const clientKey = "test_gck_docs_Ovk5rk1EwkEbP0W43n07xlzm";
        const tossPayments = TossPayments(clientKey);
        // 회원 결제
        const customerKey = "IoLCaKxD9icycK3oHeUWE";
        const widgets = tossPayments.widgets({
          customerKey,
        });
        // 비회원 결제
        // const widgets = tossPayments.widgets({ customerKey: TossPayments.ANONYMOUS });

        // ------ 주문의 결제 금액 설정 ------
        await widgets.setAmount({
          currency: "KRW",
          value: ${vo.total_price},
        });

        await Promise.all([
          // ------  결제 UI 렌더링 ------
          widgets.renderPaymentMethods({
            selector: "#payment-method",
            variantKey: "DEFAULT",
          }),
          // ------  이용약관 UI 렌더링 ------
          widgets.renderAgreement({ selector: "#agreement", variantKey: "AGREEMENT" }),
        ]);

        // ------  주문서의 결제 금액이 변경되었을 경우 결제 금액 업데이트 ------
        coupon.addEventListener("change", async function () {
          if (coupon.checked) {
            await widgets.setAmount({
              currency: "KRW",
              value: ${vo.total_price} - 5000,
            });

            return;
          }

          await widgets.setAmount({
            currency: "KRW",
            value: ${vo.total_price},
          });
        });

        // ------ '결제하기' 버튼 누르면 결제창 띄우기 ------
        button.addEventListener("click", async function () {
          await widgets.requestPayment({
            orderId: "tiZOw7diONrYFJ0FxIewU",
            orderName: "${vo.subject}",  // 강의명
            successUrl: window.location.origin + "/a/success.do" +
                    "?stepup_id=${vo.stepup_id}" +
                    "&schedule_idx=${vo.schedule_idx}" +
                    "&stepup_name=${vo.stepup_name}" +
                    "&subject=${vo.subject}" +
                    "&school_type=${vo.school_type}" +
                    "&total_price=${vo.total_price}" +
                    "&quantity=${vo.quantity}" +
                    "&instructor_idx=${vo.instructor_idx}" +
                    "&cart_idx=${vo.cart_idx}",
            failUrl: window.location.origin + "/fail.do",
            customerEmail: "${vo.stepup_email}",
            customerName: "${vo.stepup_name}",
            customerMobilePhone: "${vo.stepup_phone}"
          });
        });

      }
    </script>
  </body>
</html>