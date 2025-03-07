<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>


    <script src="<c:url value="/resources/js/httpRequest.js"/>"></script>
    <link rel="stylesheet" href="<c:url value="/resources/css/instructorJoin.css"/>"> <!-- css -->


    <script>
    
        let isIdChecked = false; // 중복 확인 여부를 추적하는 변수
    
        function region_search() {

            var pop = window.open("/a/resources/popup/jusoPopup.jsp", "pop", "width=570,height=420, scrollbars=yes, resizable=yes");
        }

        function jusoCallBack(roadFullAddr, roadAddrPart1) {
            // 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
            document.getElementById('roadFullAddr').value = roadFullAddr;
        }


        function setGender(value) {
            document.getElementById('genderInput').value = value;
        }

        function check_id() {

            let instructor_id = document.querySelector('[name="instructor_id"]').value;


            let url = "check_instructor_id.do";
            let param = "instructor_id=" + encodeURIComponent(instructor_id);
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
    		
    		let id = document.querySelector('[name="instructor_id"]').value.trim();
    		let pwd = document.querySelector('[name="instructor_pwd"]').value.trim();
    		let name = document.querySelector('[name="instructor_name"]').value.trim();
    		let email = document.querySelector('[name="instructor_email"]').value.trim();
    		let address = document.querySelector('[name="instructor_address"]').value.trim();
    		let birthday = document.querySelector('[name="instructor_birthday"]').value.trim();
    		let nickname = document.querySelector('[name="instructor_nickname"]').value.trim();
    		let phone = document.querySelector('[name="instructor_phone"]').value.trim();
    		let gender = document.querySelector('#genderInput').value.trim();
    		let category = document.querySelector('[name="instructor_category"]').value.trim();
    	    let subject = document.querySelector('[name="instructor_sub"]').value.trim();
    	    
    	    let idPattern = /^[a-zA-Z0-9_]+$/;
    		let emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
    		let phonePattern = /^(?:\d{2,3})-\d{3,4}-\d{4}$/;
    		let passwordPattern = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$/;
    		let datePattern = /^\d{4}-\d{2}-\d{2}$/;

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
    			alert("이름을 입력하세요.");
    			return false;
    		}
    		if (!emailPattern.test(email)) {
    			alert("올바른 이메일 형식을 입력하세요.");
    			return false;
    		}
    		if (!address) {
    			alert("주소를 입력하세요.");
    			return false;
    		}
    		
    		if (!datePattern.test(birthday)) {
    			alert("생년월일을 선택하세요.");
    			return false;
    		}
    		
    		if (!nickname) {
    			alert("닉네임을 입력하세요.");
    			return false;
    		}
    		if (!phonePattern.test(phone)) {
    			alert("핸드폰 번호를 정확히 입력하세요.");
    			return false;
    		}
    		if (!gender) {
    			alert("성별을 선택하세요.");
    			return false;
    		}
    		
    		if (!category) {
    	        alert("카테고리를 입력하세요.");
    	        return false;
    	    }
    	    if (!subject) {
    	        alert("과목을 입력하세요.");
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
    	    if (email.trim() === "") {
    	        alert("이메일은 공백만 입력할 수 없습니다.");
    	        return false;
    	    }
    	    if (address.trim() === "") {
    	        alert("주소는 공백만 입력할 수 없습니다.");
    	        return false;
    	    }
    	    if (birthday.trim() === "") {
    	        alert("생년월일은 공백만 입력할 수 없습니다.");
    	        return false;
    	    }
    	    if (nickname.trim() === "") {
    	        alert("닉네임은 공백만 입력할 수 없습니다.");
    	        return false;
    	    }
    	    if (phone.trim() === "") {
    	        alert("핸드폰 번호는 공백만 입력할 수 없습니다.");
    	        return false;
    	    }
    	    if (category.trim() === "") {
    	        alert("카테고리는 공백만 입력할 수 없습니다.");
    	        return false;
    	    }
    	    if (subject.trim() === "") {
    	        alert("과목은 공백만 입력할 수 없습니다.");
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
    <div class=login_form_top_ins>
        <h1>딱 이것만 체크하면 가입완료!</h1>

        <form action="instructor_member_insert.do" method="post" enctype="multipart/form-data" onsubmit="return validateForm();">

            <div class=login_form_bottom>

                <div class="infor_box">
                    <span class="infor_label">아이디</span>
                    <div class="address_search_con">
                        <input type="text" name="instructor_id" class="academy_input_email" placeholder="아이디를 입력하세요." oninput="resetIdCheck();">
                        <input type="button" value="중복확인" onclick="check_id();" class="address_search"/>
                    </div>
                </div>

                <div class="infor_box">
                    <span class="infor_label">비밀번호</span>
                    <input type="password" name="instructor_pwd" class="academy_input" placeholder="비밀번호를 입력하세요."/>
                </div>

                <div class="infor_box">
                    <span class="infor_label">이름</span>
                    <input type="text" name="instructor_name" class="academy_input" placeholder="이름를 입력하세요."/>
                </div>

                <div class="infor_box_email">
                    <span class="infor_label">이메일</span>
                    <div class="infor_email">
                        <input type="text" name="instructor_email" class="academy_input_email"
                               placeholder="이메일을 입력하세요."/>
                        <input type="button" value="본인인증" onclick="email_cert();" class="address_search"/>
                    </div>

                    <div>
                        <input id="check_input" placeholder="인증번호 6자리" disabled="disabled">
                        <input type="button" value="인증번호 확인" onclick="change_input();" class="address_search">
                    </div>
                </div>

                <div class="infor_box">
                    <span class="infor_label">주소</span>
                    <div class="address_search_con">
                        <input name="instructor_address" class="academy_input_email" id="roadFullAddr" placeholder="주소">
                        <input type="button" value="검색" class="address_search" onclick="region_search();"/>
                    </div>
                </div>

                <div class="infor_box">
						<span class="infor_label">생년월일</span> <input
							name="instructor_birthday" class="input_form" type="date"
							placeholder="생년월일">
					</div>


                <div class="infor_box">
                    <span class="infor_label">닉네임</span>
                    <input type="text" name="instructor_nickname" class="academy_input" placeholder="닉네임를 입력하세요."/>
                </div>

                <div class="infor_box">
                    <span class="infor_label">핸드폰번호</span>
                    <input type="text" name="instructor_phone" class="academy_input" placeholder="핸드폰번호를 입력하세요."/>
                </div>


                <div class="infor_box">
                    <span class="infor_label">카테고리</span>
                    <input type="text" name="instructor_category" class="academy_input" placeholder="카테고리를 입력하세요."/>

                </div>

                <div class="infor_box">
                    <span class="infor_label">과목</span>
                    <input type="text" name="instructor_sub" class="academy_input" placeholder="과목을 입력하세요."/>
                </div>

                <div class="infor_box_gender">
                    <input type="button" value="남자" onclick="setGender('M')">
                    <input type="button" value="여자" onclick="setGender('F')">
                    <input type="hidden" id="genderInput" name="instructor_gender" value="">
                </div>

                <div class="infor_box">
                    <span class="infor_label">프로필 이미지</span>
                    <input type="file" name="instructor_pic"/>
                </div>

                <div class="infor_box">
                    <input type="submit" value="회원가입" class="joinButton">
                </div>

            </div>

        </form>
    </div>
</div>

</body>
</html>