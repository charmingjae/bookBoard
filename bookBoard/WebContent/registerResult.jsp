<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:choose>
		<c:when test="${stuCheck >0}">
			<script type="text/javascript">
				alert("이미 등록된 학생입니다.");
				history.go(-1);
			</script>
		</c:when>
		<c:when test="${stuCheck == 0 }">
			<script type="text/javascript">
				alert("회원가입 성공");
				location.href ="login.jsp";
			</script>
		</c:when>
		<c:when test="${stuCheck < 0 }">
			<script type="text/javascript">
				alert("회원 등록 실패");
				history.go(-1);
			</script>
		</c:when>
	</c:choose>
</body>
</html>