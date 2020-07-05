<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<%
	String tradeNum = request.getParameter("tradenum");

	Class.forName("com.mysql.jdbc.Driver");
	
	Connection conn = null;
	Statement stat	= null;
	ResultSet rs 	= null;
	String fileRealName =null;
	String fileName =null;
	String jdbcDriver = "jdbc:mysql://localhost:3306/bookDB?"+
						"useSSl=false&serverTimezone=UTC";
	
	String dbUser = "root";
	String dbPass = "1234";
	int total = 0;
	
	
	
	String sql = "SELECT fileName FROM BOOKINFO WHERE tradenum = '"+tradeNum+"'";
	
	//2. 데이터베이스 커넥션 생성
	conn = DriverManager.getConnection(jdbcDriver,dbUser,dbPass);
	
	//3. 쿼리를 위한 Statement 생성
	stat = conn.createStatement();
	
	rs = stat.executeQuery(sql);
		
	if(rs.next()){
		fileRealName = rs.getString(1);
		fileName = rs.getString(1);
	}
	
	/* String imagePath = "./uploadImage/"+fileName; */
	String imagePath = fileName;
		
	System.out.println(imagePath);
	
%>

	
	<img src="<%= request.getContextPath()+"/uploadImage/"+fileName%>" width="700px" height="700px"	onerror='this.src="https://dpikorea.org/theme/basic/img/no_img.png"'></img>
	<%-- <img src="<%= "/Users/chaminjae/Desktop/INHATC/2학년/2학기/2-2 JSP/bookBoard/bookBoard/WebContent/uploadImage/"+imagePath%>"></img> --%>	
	

</body>
</html>