<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="/a/resources/css/member_join_page.css">

<script src="<c:url value="/resources/js/httpRequest.js"/>"></script>

<script>

    let isIdChecked = false; // 중복 확인 여부를 추적하는 변수

	function region_search() {

		var pop = window.open("/a/resources/popup/jusoPopup.jsp", "pop",
				"width=570,height=420, scrollbars=yes, resizable=yes");
	}

	function jusoCallBack(roadFullAddr, roadAddrPart1) {
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
		document.getElementById('roadFullAddr').value = roadFullAddr;
	}

	function setGender(value) {
		document.getElementById('genderInput').value = value;
	}

	function check_id() {

		let stepup_id = document.querySelector('[name="stepup_id"]').value;

		let url = "check_stepup_id.do";
		let param = "stepup_id=" + encodeURIComponent(stepup_id);
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
		
		let id = document.querySelector('[name="stepup_id"]').value.trim();
		let pwd = document.querySelector('[name="stepup_pwd"]').value.trim();
		let name = document.querySelector('[name="stepup_name"]').value.trim();
		let email = document.querySelector('[name="stepup_email"]').value.trim();
		let address = document.querySelector('[name="stepup_address"]').value.trim();
		let birthday = document.querySelector('[name="stepup_birthday"]').value.trim();
		let nickname = document.querySelector('[name="stepup_nickname"]').value.trim();
		let phone = document.querySelector('[name="stepup_phone"]').value.trim();
		let gender = document.querySelector('#genderInput').value.trim();
		
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

		return true;
	}
	
	function resetIdCheck() {
	    isIdChecked = false;
	}
</script>


</head>

<body>

	<div class="login_container">
		<div class="logoicon">
			<a href="<c:url value="/mainhome.do"/>"><img id="logoIcon"
				src="<c:url value='/resources/img/logo_light.png'/>"
				class="logo-img"></a>
		</div>

		<div class="login_form">
			<div class="login_form_top">
				<h1>회원가입</h1>
				<form class="login_form1" action="member_insert.do" method="post"
					enctype="multipart/form-data" onsubmit="return validateForm();">

					<div class="infor_box">
						<span class="infor_label">아이디</span>
						<div class="infor_box_id">
							<input name="stepup_id" class="input_form23" placeholder="아이디" oninput="resetIdCheck();">
							<input type="button" value="중복확인" class="button_design"
								onclick="check_id();" />
						</div>
					</div>

					<div class="infor_box">
						<span class="infor_label">비밀번호</span> <input name="stepup_pwd"
							type="password" class="input_form" placeholder="비밀번호">
					</div>

					<div class="infor_box">
						<span class="infor_label">이름</span> <input name="stepup_name"
							class="input_form" placeholder="이름">
					</div>

					<div class="infor_box">
						<span class="infor_label">이메일</span>
						<div class="infor_box_id">
							<input name="stepup_email" class="input_form23" placeholder="이메일">
							<input type="button" value="본인인증" class="button_design"
								onclick="email_cert();" />
						</div>

						<div class="infor_box_id">
							<input id="check_input" placeholder="인증번호 6자리"
								disabled="disabled"> <input type="button"
								value="인증번호 확인" onclick="change_input();" class="button_design">
						</div>
					</div>

					<div class="infor_box">
						<span class="infor_label">주소</span>
						<div class="infor_box_id">
							<input name="stepup_address" class="input_form23"
								id="roadFullAddr" placeholder="주소"> <input type="button"
								value="검색" class="button_design" onclick="region_search();" />
						</div>
					</div>

					<div class="infor_box">
						<span class="infor_label">생년월일</span> <input
							name="stepup_birthday" class="input_form" type="date"
							placeholder="생년월일">
					</div>

					<div class="infor_box">
						<span class="infor_label">닉네임</span> <input name="stepup_nickname"
							class="input_form" placeholder="닉네임">
					</div>

					<div class="infor_box">
						<span class="infor_label">핸드폰번호</span> <input name="stepup_phone"
							class="input_form" placeholder="핸드폰번호">
					</div>

					<div class="infor_box">
						<span class="infor_label">프로필</span> <input type="file"
							name="stepup_pic" class="input_form">
					</div>

					<div class="infor_box_gender">
						<input type="button" value="남자" onclick="setGender('M')"
							class="button_design"> <input type="button" value="여자"
							onclick="setGender('F')" class="button_design">
					</div>


					<input type="hidden" id="genderInput" name="stepup_gender" value="">

					<div>
						<input type="submit" value="회원가입" class="joinButton">
					</div>
				</form>
			</div>
		</div>
	</div>

</body>
</html>