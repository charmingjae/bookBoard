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
	int flag = 0;
	String stu_no = request.getParameter("stu_no");
	String stu_pw = request.getParameter("stu_pw");
	
	
	Class.forName("com.mysql.jdbc.Driver");
	
	Connection conn = null;
	Statement stat	= null;
	ResultSet rs 	= null;
	
	String jdbcDriver = "jdbc:mysql://localhost:3306/bookDB?"+
						"useSSl=false&serverTimezone=UTC";
	
	String dbUser = "root";
	String dbPass = "1234";
	
	String sql = "SELECT * FROM MEMBER_INFO WHERE STU_NO = '" + stu_no +"' and STU_PW = '" + stu_pw + "'";
	
	//2. 데이터베이스 커넥션 생성
	conn = DriverManager.getConnection(jdbcDriver,dbUser,dbPass);
	
	//3. 쿼리를 위한 Statement 생성
	stat = conn.createStatement();
	
	//4. 쿼리 실행.
	rs = stat.executeQuery(sql);
	
	int stuCheck = 0;
	int result = 0;
	
	if(rs.next()){	
		session.setAttribute("stu_no",stu_no);
		response.sendRedirect("/bookBoard/templated-transitive/index.jsp");
	}else{
		%>
		
		<script type="text/javascript">
			alert("학번과 비밀번호를 확인하세요.");
			history.go(-1);
		</script>
		<%
	}
	
/* 	request.setAttribute("empCheck", empCheck);
	request.setAttribute("result", result); */
	
	stat.close();
	conn.close();
%>

</body>
</html>