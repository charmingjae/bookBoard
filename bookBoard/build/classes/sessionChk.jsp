<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String stu_no = "";
		try{
			stu_no = (String)session.getAttribute("stu_no");
			
			if(stu_no == null || stu_no.equals("")){
				response.sendRedirect("login.jsp");
			}
			else{
				response.sendRedirect("queryBook.jsp");
			}
		}catch(Exception e){
			%>
			<script type="text/javascript">
				alert("에러 발생.");
			</script>
			<%
			
		}
	%>

</body>
</html>