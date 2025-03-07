<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <title>Title</title>


    <link rel="stylesheet" href="<c:url value="/resources/css/academyJoin.css"/>"> <!-- css -->

    <script src="<c:url value="/resources/js/httpRequest.js"/>"></script>
    <script type="text/javascript"
            src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=2hvgemd6sm&submodules=geocoder"></script>
    <script>
    
        let isIdChecked = false; // 중복 확인 여부를 추적하는 변수
        
        function region_search() {

            var pop = window.open("/a/resources/popup/jusoPopup.jsp", "pop", "width=570,height=420, scrollbars=yes, resizable=yes");
        }

        function jusoCallBack(roadFullAddr, roadAddrPart1) {
            // 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
            document.getElementById('roadFullAddr').value = roadFullAddr;
            document.getElementById('roadAddrPart1').value = roadAddrPart1;
            a(roadAddrPart1);
            region(roadAddrPart1)
        }

        function a(roadAddrPart1) {
            naver.maps.Service.geocode({address: roadAddrPart1}, function (status, response) {
                if (status === naver.maps.Service.Status.ERROR) {
                    return alert('Something wrong!');
                }

                // 성공 시의 response 처리
                document.getElementById('academy_longitude').value = response.result.items[0].point.x;
                document.getElementById('academy_latitude').value = response.result.items[0].point.y;
            });

        }

        function region(roadAddrPart1) {
            document.getElementById('academy_region').value = roadAddrPart1.substring(0, 2);
        }

        function check_id() {

            let academy_id = document.querySelector('[name="academy_id"]').value;


            let url = "check_academy_id.do";
            let param = "academy_id=" + encodeURIComponent(academy_id);
            sendRequest(url, param, result, "post");

        }

        function result() {

            if (xhr.readyState == 4 && xhr.status == 200) {
                console.log(xhr.responseText);
                let data = xhr.responseText;

                let json = (new Function('return ' + data))();

                if (json[0].result === 'yes') {
    				alert("중복된 아이디입니다. 다른 아이디를 입력해주세요.")
    				isIdChecked = false;
    			} else {
    				alert("아이디 사용 가능합니다.");
    				isIdChecked = true;
    			}

            }
        }
        
function validateForm() {
    		
    		if (!isIdChecked) {
    			alert("아이디 중복 확인을 먼저 해주세요.");
    			return false; // 중복 확인을 하지 않으면 회원가입 진행 불가
    		}
    		
    		let id = document.querySelector('[name="academy_id"]').value.trim();
    		let pwd = document.querySelector('[name="academy_pwd"]').value.trim();
    		let name = document.querySelector('[name="academy_name"]').value.trim();
    		let phone = document.querySelector('[name="academy_phone"]').value.trim();
    		let bus_num = document.querySelector('[name="academy_bus_num"]').value.trim();
    		let address = document.querySelector('[name="academy_address"]').value.trim();
    		let category = document.querySelector('[name="academy_category"]').value.trim();
    		let email = document.querySelector('[name="academy_email"]').value.trim();

    		let idPattern = /^[a-zA-Z0-9_]+$/;
    		let emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
    		let phonePattern = /^(?:\d{2,3})-\d{3,4}-\d{4}$/;
    		let passwordPattern = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$/;
    		let busNumPattern = /^\d{3}-\d{2}-\d{6}$/;

    		if (!id) {
    			alert("아이디를 입력하세요.");
    			return false;
    		}
    		if (!idPattern.test(id)) { 
    		    alert("아이디는 영문자, 숫자, _만 사용할 수 있습니다."); 
    		    return false; 
    		}
    		if (!passwordPattern.test(pwd)) {
    			alert("비밀번호는 최소 6자 이상이며, 문자와 숫자를 포함해야 합니다.");
    			return false;
    		}
    		if (!name) {
    			alert("학원이름을 입력하세요.");
    			return false;
    		}
    		if (!phonePattern.test(phone)) {
    			alert("핸드폰 번호를 정확히 입력하세요.");
    			return false;
    		}
    		if (!busNumPattern.test(bus_num)) {
    	        alert("사업자 등록번호 형식이 올바르지 않습니다.");
    	        return false;
    	    }
    		if (!address) {
    			alert("주소를 입력하세요.");
    			return false;
    		}
    		if (!category) {
    	        alert("카테고리를 입력하세요.");
    	        return false;
    	    }
    		if (!emailPattern.test(email)) {
    			alert("올바른 이메일 형식을 입력하세요.");
    			return false;
    		}
    		
    		if (id.trim() === "") {
    	        alert("아이디는 공백만 입력할 수 없습니다.");
    	        return false;
    	    }
    	    if (pwd.trim() === "") {
    	        alert("비밀번호는 공백만 입력할 수 없습니다.");
    	        return false;
    	    }
    	    if (name.trim() === "") {
    	        alert("이름은 공백만 입력할 수 없습니다.");
    	        return false;
    	    }
    	    if (phone.trim() === "") {
    	        alert("핸드폰 번호는 공백만 입력할 수 없습니다.");
    	        return false;
    	    }
    	    if (bus_num.trim() === "") {
    	        alert("사업자 번호는 공백만 입력할 수 없습니다.");
    	        return false;
    	    }
    	    if (address.trim() === "") {
    	        alert("주소는 공백만 입력할 수 없습니다.");
    	        return false;
    	    }
    	    if (category.trim() === "") {
    	        alert("카테고리는 공백만 입력할 수 없습니다.");
    	        return false;
    	    }
    	    if (email.trim() === "") {
    	        alert("이메일은 공백만 입력할 수 없습니다.");
    	        return false;
    	    }

    		return true;
    	}
    	
function resetIdCheck() {
    isIdChecked = false;
}

    </script>

    <script>
        function email_cert() {
            let academy_email = document.querySelector('[name="academy_email"]').value;

            let url = "mail_check.do";
            let param = "academy_email=" + academy_email;
            sendRequest(url, param, check_result, "get");
        }	

        function check_result() {
            let check_input = document.getElementById("check_input");
            if (xhr.readyState == 4 && xhr.status == 200) {

                let data = xhr.responseText;


                check_input.disabled = false; //인증번호 입력란 활성화

                res = data;
            }
        }

        function change_input() {
            let userInput = document.getElementById("check_input").value;

            if (userInput === res) {
                alert("인증번호가 일치합니다!");
                document.getElementById("check_input").disabled = true; // 인증번호 입력란 비활성화
            } else {
                alert("인증번호가 일치하지 않습니다. 다시 확인해주세요.");
            }
        }

    </script>


</head>
<body>
<div class="join">
    <a href="<c:url value="/mainhome.do"/>"><img src="<c:url value="/resources/img/b_logo.png"/>" class="logo_img"
                                                 style="width: 150px; height: 75px;" alt="안나옴"></a>
    <div class=login_form_top>
        <h1>딱 이것만 체크하면 가입완료!</h1>

        <form action="academy_join_insert.do" method="post" enctype="multipart/form-data" onsubmit="return validateForm();">

            <div class=login_form_bottom>

                <div class="infor_box">
                    <span class="infor_label">아이디</span>
                    <div class = "address_search_con">
                        <input type="text" name="academy_id" class="academy_input_email" placeholder="아이디를 입력하세요." oninput="resetIdCheck();">
                        <input type="button" value="중복확인" onclick="check_id();" class="address_search"/>
                    </div>
                </div>

                <div class="infor_box">
                    <span class="infor_label">비밀번호</span>
                    <input type="password" name="academy_pwd" class="academy_input" placeholder="비밀번호를 입력하세요."/>
                </div>

                <div class="infor_box">
                    <span class="infor_label">학원이름</span>
                    <input type="text" name="academy_name" class="academy_input" placeholder="이름를 입력하세요."/>
                </div>

                <div class="infor_box">	
                    <span class="infor_label">학원전화번호</span>
                    <input type="text" name="academy_phone" class="academy_input" placeholder="전화번호를 입력하세요."/>
                </div>


                <div class="infor_box">
                    <span class="infor_label">학원사업자등록번호</span>
                    <input type="text" name="academy_bus_num" class="academy_input" placeholder="사업자 등록번호를 입력하세요."/>
                </div>

                <div class="infor_box">
                    <span class="infor_label">학원주소</span>
                    <div class = "address_search_con">
                        <input type="text" style="width:500px;" id="roadFullAddr" name="academy_address"
                               class="academy_input_address"/>
                        <input type="hidden" id="roadAddrPart1"/>
                        <input type="hidden" id="academy_latitude" name="academy_latitude"/>
                        <input type="hidden" id="academy_longitude" name="academy_longitude"/>
                        <input type="hidden" id="academy_region" name="academy_region"/>
                        <input type="button" value="검색" onclick="region_search();" class="address_search"/>
                    </div>
                </div>

                <div class="infor_box">
                    <span class="infor_label">학원카테고리</span>
                    <select name="academy_category" class="academy_input">
                        <option value="">--</option> <!-- value 속성으로 기본값 처리 -->
                        <option value="종합반">종합반</option>
                        <option value="건강">건강</option>
                        <option value="예체능">예체능</option>
                        <option value="다른 카테고리">다른 카테고리</option>
                    </select>
                </div>

                <div class="infor_box">
                    <span class="infor_label">학원 과목</span>
                    <input type="text" name="academy_sub" class="academy_input"/>
                </div>


                <div class="infor_box_email">
                    <span class="infor_label">학원 이메일</span>
                    <div class = "infor_email">
                        <input type="text" name="academy_email" class="academy_input_email"/>
                        <input type="button" value="본인인증" onclick="email_cert();" class="address_search"/>
                    </div>

                    <div>
                        <input id="check_input" placeholder="인증번호 6자리" disabled="disabled">
                        <input type="button" value="인증번호 확인" onclick="change_input();" class="address_search"/>
                    </div>
                </div>


                <div class="infor_box">
                    <span class="infor_label">학원 이미지</span>
                    <input type="file" name="academy_pic" />
                </div>

                <div>
                    <input type="submit" value="가입" class="joinButton">
                </div>
            </div>

        </form>
    </div>
</div>
</body>
</html>
