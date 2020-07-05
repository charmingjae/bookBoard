<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!-- 파일업로드 위한 라이브러리 임포트 -->



<%@ page import="java.io.File" %>

<!-- 파일 이름이 동일한게 나오면 자동으로 다른걸로 바꿔주고 그런 행동 해주는것 -->

<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>

<!-- 실제로 파일 업로드 하기 위한 클래스 -->

<%@ page import="com.oreilly.servlet.MultipartRequest" %>

<!-- 위에것들 head 태그 위에 추가해줄 것 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> write Check </title>
</head>
<body>
	<%

		
		// 해당 폴더에 이미지를 저장시킨다

	 	

		
		
		
		try{
			

			
			String stu_no = "";
			String stu_name = "";
			String stu_grade = "";
			String stu_class = "";
			String seller_tel = "";
			stu_no = (String)session.getAttribute("stu_no");
			
			
			String uploadDir =this.getClass().getResource("").getPath();

			 uploadDir = "/Users/chaminjae/Desktop/INHATC/2학년/2학기/2-2 JSP/bookBoard/bookBoard/WebContent/uploadImage";

			 out.println("절대경로 : " + uploadDir + "<br/>"); 

		 

			

			// 총 100M 까지 저장 가능하게 함

			int maxSize = 1024 * 1024 * 100;

			String encoding = "UTF-8";

			

			// 사용자가 전송한 파일정보 토대로 업로드 장소에 파일 업로드 수행할 수 있게 함

			MultipartRequest multipartRequest

			= new MultipartRequest(request, uploadDir, maxSize, encoding,

					new DefaultFileRenamePolicy());

			
			String bookName = multipartRequest.getParameter("bookname");
			String publisher = multipartRequest.getParameter("publisher");
			String prof = multipartRequest.getParameter("prof");
			String status = multipartRequest.getParameter("status");
			String summary = multipartRequest.getParameter("summary");
			String tradenum = multipartRequest.getParameter("tradenum");
			
			
			
			
	              // 중복된 파일이름이 있기에 fileRealName이 실제로 서버에 저장된 경로이자 파일

	              // fineName은 사용자가 올린 파일의 이름이다

			// 이전 클래스 name = "file" 실제 사용자가 저장한 실제 네임

			String fileName = multipartRequest.getOriginalFileName("file");

			// 실제 서버에 업로드 된 파일시스템 네임

			String fileRealName = multipartRequest.getFilesystemName("file");

			
			
			
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection conn = null;
			Statement stat	= null;
			PreparedStatement pstat = null;
			ResultSet rs1 	= null;
			ResultSet rs2 	= null;
			
			String jdbcDriver = "jdbc:mysql://localhost:3306/bookDB?"+
								"useSSl=false&serverTimezone=UTC";
			
			String dbUser = "root";
			String dbPass = "1234";
			
			
			
			//2. 데이터베이스 커넥션 생성
			conn = DriverManager.getConnection(jdbcDriver,dbUser,dbPass);
			
			String sqlQ = "SELECT STU_NO, STU_NAME, STU_GRADE, STU_CLASS, STU_TEL FROM MEMBER_INFO WHERE STU_NO = '" + stu_no + "'";
			
			//3. 쿼리를 위한 Statement 생성
			stat = conn.createStatement();
			
			//4. 쿼리 실행.
			rs1 = stat.executeQuery(sqlQ);
			
			
			while(rs1.next()){
				stu_name = rs1.getString("STU_NAME");
				stu_grade = rs1.getString("STU_GRADE");
				stu_class = rs1.getString("STU_CLASS");
				seller_tel = rs1.getString("STU_TEL");
			}
			
			String seller = stu_grade + "-" + stu_class + "-" + stu_name;
			
			
			String sql =  "INSERT INTO bookInfo(bookName, publisher, prof, status, seller, summary, stu_no, seller_tel, fileName, fileRealName ) "+
							"VALUES(?,?,?,?,?,?,?,?,?,?)";
			
			
			int result = 0;
			

			

		 	pstat = conn.prepareStatement(sql);
			pstat.setString(1, bookName);
			pstat.setString(2, publisher);
			pstat.setString(3, prof);
			pstat.setString(4, status);
			pstat.setString(5, seller);
			pstat.setString(6, summary);
			pstat.setString(7, stu_no);
			pstat.setString(8, seller_tel);
			pstat.setString(9, fileName);
			pstat.setString(10, fileRealName);
			
			result = pstat.executeUpdate();

			
/* 			request.setAttribute("empCheck", empCheck);
			request.setAttribute("result", result); */
			
			// 디비에 업로드 메소드
			
			/////////////////////////////////////////////////
			
			pstat.close();
			conn.close();
			
			
			%>
			<script type="text/javascript">
			alert("등록 성공");
			location.href = "queryBook.jsp";
			</script>
			<%
			////////////////////////
		}catch(Exception e){
			System.out.println(e.getMessage());
			
		}

		 

		
		
	%>
		
</body>
</html>