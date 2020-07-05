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
	
		String STU_NO = request.getParameter("stu_no");
		String STU_NAME = request.getParameter("stu_name");
		String STU_PW = request.getParameter("stu_pw");
		String STU_TEL = request.getParameter("stu_tel");
		String STU_GRADE = request.getParameter("stu_grade");
		String STU_CLASS = request.getParameter("stu_class");
		
		
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
		
		String sqlQ = "SELECT * FROM member_info WHERE stu_no = ?";
		String sql =  "INSERT INTO member_info VALUES(?,?,?,?,?,?)";
		
		pstat = conn.prepareStatement(sqlQ);
		pstat.setString(1, STU_NO);
		
		rs = pstat.executeQuery();
		
		int stuCheck = 0;
		int result = 0;
		
		if(rs.next()){
			// 테이블에 사원정보가 등록되어 있는 경우.
			stuCheck = 1;
		}else{
			// 테이블에 사원 정보가 등록되어 있지 않은 경우.
		 	pstat = conn.prepareStatement(sql);
			pstat.setString(1, STU_NO);
			pstat.setString(2, STU_PW);
			pstat.setString(3, STU_NAME);
			pstat.setString(4, STU_GRADE);
			pstat.setString(5, STU_CLASS);
			pstat.setString(6, STU_TEL);
			
			result = pstat.executeUpdate();
		}
		
		request.setAttribute("stuCheck", stuCheck);
		request.setAttribute("result", result);
		
		pstat.close();
		conn.close();
	%>
	
	<jsp:forward page="registerResult.jsp"></jsp:forward>
</body>
</html>