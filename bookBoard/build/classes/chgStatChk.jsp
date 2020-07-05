<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	String stu_no = (String)session.getAttribute("stu_no");
	int flag = 0;
	String selstat = request.getParameter("selstat");
	String tradenum = request.getParameter("tradenum");
	
	
	Class.forName("com.mysql.jdbc.Driver");
	
	Connection conn = null;
	Statement stat	= null;
	ResultSet rs 	= null;
	
	String jdbcDriver = "jdbc:mysql://localhost:3306/bookDB?"+
						"useSSl=false&serverTimezone=UTC";
	
	String dbUser = "root";
	String dbPass = "1234";
	
	String sql = "UPDATE BOOKINFO SET SELSTAT='"+ selstat +"' WHERE tradenum = '"+tradenum+"'";
	
	
	//2. 데이터베이스 커넥션 생성
	conn = DriverManager.getConnection(jdbcDriver,dbUser,dbPass);
	
	//3. 쿼리를 위한 Statement 생성
	stat = conn.createStatement();
	
	//4. 쿼리 실행.
	stat.executeUpdate(sql);
	
	
	stat.close();
	conn.close();
	%>
	<script type="text/javascript">
		alert("수정 성공");
		location.href = "queryMyBook.jsp?stu_no=<%=stu_no%>";
	</script>
	<%
	
/* 	request.setAttribute("empCheck", empCheck);
	request.setAttribute("result", result); */
	
	stat.close();
	conn.close();
%>

</body>
</html>