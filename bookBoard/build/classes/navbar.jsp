<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="js/bootstrap.min.js"></script>
</head>
<body>
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="templated-transitive/index.jsp">For Sale: The Book, Never Used</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
     
      <ul class="nav navbar-nav navbar-right">
      	<li class="dropdown">
      
      	 <%
			String stu_no = "";
			String stu_name = "";
			try{
				stu_no = (String)session.getAttribute("stu_no");
				
				
				
				Class.forName("com.mysql.jdbc.Driver");
				
				Connection conn = null;
				Statement stat	= null;
				ResultSet rs 	= null;
				
				String jdbcDriver = "jdbc:mysql://localhost:3306/bookDB?"+
									"useSSl=false&serverTimezone=UTC";
				
				String dbUser = "root";
				String dbPass = "1234";
				
				String sql = "SELECT STU_NAME FROM MEMBER_INFO WHERE STU_NO = '" + stu_no + "'";
				
				//2. 데이터베이스 커넥션 생성
				conn = DriverManager.getConnection(jdbcDriver,dbUser,dbPass);
				
				//3. 쿼리를 위한 Statement 생성
				stat = conn.createStatement();
				
				//4. 쿼리 실행.
				rs = stat.executeQuery(sql);
				
				if(rs.next()){	
					stu_name = rs.getString("STU_NAME");
			%>
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><%= stu_name %>님 환영합니다. <span class="caret"></span></a>

			<%
				}
				
				stat.close();
				conn.close();
			}
				
			catch(Exception e){
				System.out.println(e.getMessage());
			}
				
			%>
         <!--  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">MENU <span class="caret"></span></a> -->
          <ul class="dropdown-menu" role="menu">
            <li><a href="templated-transitive/index.jsp">메인으로</a></li>
            <li><a href="queryBook.jsp">게시판으로</a></li>
            <li class="divider"></li>
            <li><a href="queryMyBook.jsp?stu_no=<%=stu_no%>">마이 페이지</a></li>
            <li><a href="logout.jsp">로그아웃</a></li>
          </ul>
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>

</body>
</html>