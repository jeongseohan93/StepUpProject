var xhr = null;

function createRequest(){
		
	//JavaScript를 이용하여 서버로 정보를 보내는 HTTP request를 만들기 위해서는 이런 기능을 제공하는 클래스 인스턴스가 필요하다. 

//이런 클래스는 InternetExplorer에서는 XMLHTTP라고 불리는 ActivX object를 말한다. 

//그러면 Mozzlia, Safari나 다른 브라우저에서도 Microsoft의 ActiveX 객체의 method와 property를 지원하기 위해 XMLHttpRequest클래스를 구현 하고 있다.

	if(xhr!=null)return;
	if(window.ActiveXObject)
		xhr = new ActiveXObject("Microsoft.XMLHTTP");
	else
		xhr = new XMLHttpRequest();
}


function sendRequest(url, param, callBack, method){
	createRequest();//HTTP request생성

	//전송타입 구분
	var httpMethod = 
	(method!='POST' && method!='post')?'GET':'POST';
	
	//파라미터 구분
	var httpParam = 
	(param==null || param == '')?null:param;
	

	
	//요청 방식이 get방식이고, 전달할 파라미터 값이 있다면
	//url경로를 제작 해야 한다.(.../test.jsp?ch=123)
	var httpURL = url;
	if(httpMethod == 'GET' && httpParam != null)
		httpURL = httpURL+"?"+httpParam;
	
        //xhr.open( 요청방식, 접근url, 비동기(true면 비동기) ); 
	xhr.open(httpMethod, httpURL, true);

	// POST 요청의 경우 Content-Type 헤더 설정
	if (httpMethod === 'POST') {
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	}

	// 응답이 도착했을 때 호출될 콜백 함수 지정
	xhr.onreadystatechange = function () {
		// 요청 상태가 완료(4)이고, 응답 상태가 성공(200)일 때
		if (xhr.readyState === 4 && xhr.status === 200) {
			callBack(xhr.responseText); // 서버 응답 데이터를 콜백 함수로 전달
		}
	};
	
	xhr.send(httpMethod == 'POST'?httpParam:null);
}













