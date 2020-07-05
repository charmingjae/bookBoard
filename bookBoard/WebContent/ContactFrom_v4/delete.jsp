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
			request.setCharacterEncoding("utf-8");
		
		
			String stu_no = (String)session.getAttribute("stu_no");
			String tradenum = request.getParameter("tradenum");
			
			
			
			
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection conn = null;
			/* Statement stat	= null; */
			PreparedStatement pstat = null;
			ResultSet rs 	= null;
			
			String jdbcDriver = "jdbc:mysql://localhost:3306/bookDB?"+
								"useSSl=false&serverTimezone=UTC";
			
			String dbUser = "root";
			String dbPass = "1234";
			
			
			
			//2. 데이터베이스 커넥션 생성
			conn = DriverManager.getConnection(jdbcDriver,dbUser,dbPass);
			
			String sql = "delete from bookInfo where tradeNum = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, tradenum);
			
			
			int result = 0;
			result = pstat.executeUpdate();
			
			pstat.close();
			conn.close();
		%>
		
		<script type="text/javascript">
			location.href = "../queryBook.jsp";
		</script>

</body>
</html>