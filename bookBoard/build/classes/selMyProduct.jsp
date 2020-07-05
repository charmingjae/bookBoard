<%@page import="bookBoard.Book"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	response.setContentType("text/html;charset=utf-8");
	String stu_no = request.getParameter("stu_no");

	///페이징 ///
				final int ROWSIZE = 5; // 한 페이지에 보일 게시물 수
				final int BLOCK = 5; // 아래에 보일 페이지 최대 개수 1~5 / 6 ~ 10 / 11 ~ 15
				int pg = 1; // 기본 페이지 값
				
				if(request.getParameter("pg") != null) { // 받아온 pg 값이 있을 때 .
					pg = Integer.parseInt(request.getParameter("pg")); // pg 값 저장
				}
				int start = (pg*ROWSIZE) - (ROWSIZE -1); // 해당페이지에서 시작 번호 ( DB - SORT )
				int end = (pg*ROWSIZE); // 해당 페이지에서 끝 번호 ( DB - SORT )
				
				int allPage = 0; // 전체 페이지 수
				
				int startPage = ((pg-1)/BLOCK*BLOCK)+1; // 시작 블럭 숫자. 1~5번은 1, 6~10 6
				int endPage = ((pg-1)/BLOCK*BLOCK)+BLOCK; // 끝 블럭 숫자. 1~5번은 5, 6~10 10



	Class.forName("com.mysql.jdbc.Driver");
	
	Connection conn = null;
	Statement stat	= null;
	Statement stat1 = null;
	ResultSet rs 	= null;
	
	String jdbcDriver = "jdbc:mysql://localhost:3306/bookDB?"+
						"useSSl=false&serverTimezone=UTC";
	
	String dbUser = "root";
	String dbPass = "1234";
	int total = 0;
	
	String selStat ="판매중";
	
	
	String sql =
			"SELECT * FROM BOOKINFO WHERE SORT >= " + start + " AND SORT <= " + end + " AND stu_no = '" +stu_no+ "' and selstat = '"+selStat+"' ORDER BY SORT";
	
	//2. 데이터베이스 커넥션 생성
	conn = DriverManager.getConnection(jdbcDriver,dbUser,dbPass);
	
	//3. 쿼리를 위한 Statement 생성
	stat = conn.createStatement();
	stat1 = conn.createStatement();
	
		String sqlCount = "SELECT COUNT(*) FROM bookinfo where selstat='"+selStat+"' AND stu_no ='" + stu_no + "'";
		ResultSet rs1 = stat.executeQuery(sqlCount);
		
		if(rs1.next()){
			total = rs1.getInt(1);
		}
	
		int sort = 1;
		String sqlSort = "SELECT tradenum FROM bookinfo WHERE selstat = '"+selStat+"' AND STU_NO = '"+stu_no+"' ORDER BY tradenum DESC";
		rs = stat1.executeQuery(sqlSort);
		
		
		while(rs.next()){
			int stepNum = rs.getInt(1);
			String sqlColumnUpdate = "UPDATE bookinfo SET SORT = " + sort + " WHERE tradenum = " + stepNum+ " and selstat='"+selStat+"' and stu_no = '"+stu_no+"'";
			stat.executeUpdate(sqlColumnUpdate);
			sort++;
		}
		
		allPage = (int)Math.ceil(total/(double)ROWSIZE);
		
		if(endPage > allPage)
		{
			endPage = allPage;
		}
	
	//4. 쿼리 실행.
	rs = stat.executeQuery(sql);
	
	ArrayList<Book> list = new ArrayList<Book>(); 
	
	while(rs.next()){
		Book book = new Book();
		
		
		book.setTradeNum(rs.getString(1));
		book.setBookName(rs.getString(2));
		book.setPublisher(rs.getString(3));
		book.setProf(rs.getString(4));
		book.setStatus(rs.getString(5));
		book.setSeller(rs.getString(6));
		book.setSummary(rs.getString(7));
		book.setStu_no(rs.getString(8));
		book.setSeller_tel(rs.getString(9));
		book.setSelStat(rs.getString(11));
		book.setFileName(rs.getString(12));
		book.setFileRealName(rs.getString(13));
		
		
		list.add(book);
	}
	
	request.setAttribute("list", list);
	
	rs.close();
	rs1.close();
	stat.close();
	stat1.close();
	conn.close();
	
	RequestDispatcher rd = request.getRequestDispatcher("selMyProductView.jsp");
	
	rd.forward(request,response);
%>
</body>
</html>