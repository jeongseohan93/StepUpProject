<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel = "stylesheet" href = "<c:url value = '/resources/css/academyImg.css'/>"/>
</head>
<body>
  <jsp:include page="/WEB-INF/views/module/linePage/stepup_top_empty.jsp"/>
  <div class = "academyImgBox">
      <div class = "academyImgBoxInner">
          <div>
              <a href = "javascript:window.history.go(-1)">계정</a> <span> > 이미지 추가</span>
          </div>

          <label>이미지 관리</label>
          <hr/>



                <div class ="academyImgInput">
                    <form action="academyAdd.do" method="post" enctype="multipart/form-data">
                    <input type = "hidden" name = "academy_idx" value = "${academy_idx}"/>
                  <div>
                      <span>이미지1</span>
                      <input type = "file" name = "pic_file" multiple="multiple"/>
                  </div>

                  <div>
                      <span>이미지2</span>
                      <input type = "file" name = "pic_file" multiple="multiple"/>
                  </div>

                  <div>
                      <span>이미지2</span>
                      <input type = "file" name = "pic_file" multiple="multiple"/>
                  </div>

                  <div>
                      <span>이미지2</span>
                      <input type = "file" name = "pic_file" multiple="multiple"/>
                  </div>

                        <input type = "submit" value = "추가하기" class = "addButton"/>

                    </form>

              </div>


      </div>
  </div>
  <jsp:include page="/WEB-INF/views/module/linePage/stepup_bottom.jsp"/>
</body>
</html>
