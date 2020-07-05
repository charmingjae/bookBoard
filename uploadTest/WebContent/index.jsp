<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- enctype은 파입 업로드에서 무조건 사용되어야한다 여러개의 파일이 폼 태그를 이용하여 이동가능-->
	<form action="uploadAction.jsp" method="post" enctype="multipart/form-data">
		파일 : <input type="file" name="file"><br>
		<input type="submit" value="업로드"><br>
	</form>
	
	<!--  테스트로 실제 작동하는지 출력을 위한 것 -->
	<!--  실제 동작하는것은 ImgFile4 이다 나머지는 왜 안되지...? 절대경로인데... -->
	<% 
		 String uploadDir =this.getClass().getResource("").getPath();
		 uploadDir = uploadDir.substring(1,uploadDir.indexOf(".metadata"))+"uploadTest/WebContent/uploadImage/";
		 out.println("절대경로 : " + uploadDir + "<br/>"); 
		 
		 String imgFile = uploadDir + "강아지.PNG";
		 out.println("이미지파일 경로 : " + imgFile + "<br/>");
		 
		 String imgFile2 = uploadDir + "강아지2.PNG";
		 out.println("이미지파일 경로 : " + imgFile2 + "<br/>"); 
		 
		 String imgFile4 = "./uploadImage/강아지.PNG";
	%>
		<img src="<%=imgFile%>" width="300px" height="300px"></img>	
		<img src="<%=imgFile2%>" width="300px" height="300px"></img>
		<img src="<%=imgFile4%>" width="300px" height="300px"></img>

</body>
</html>