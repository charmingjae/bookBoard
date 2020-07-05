<%@page import="java.util.ArrayList"%>
<%@page import="bookBoard.Book"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>메인 페이지</title>
<link href="./css/bootstrap.min.css" rel="stylesheet">
<link href="./css/custom.css" rel="stylesheet">
<link href="./css/bootstrap-theme.css" rel="stylesheet">
<link href="./css/bootstrap.css" rel="stylesheet">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="./js/bootstrap.min.js"></script>



<link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="js/bootstrap.min.js"></script>
    
   <!-- 그리드 -->
   
    <script src="//cdn.datatables.net/1.10.10/js/jquery.dataTables.min.js"></script>
	<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.10/css/jquery.dataTables.min.css">
	<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>


<script>
	$(function(){
   		$("#tablesort").dataTable();
	});
	
	
	function enterkey(keyWord) {
        if (window.event.keyCode == 13) {
 
             // 엔터키가 눌렸을 때 실행할 내용
             location.href='SearchSelMyProduct.jsp?selstat=판매중&keyWord='+keyWord;
        }
	}

</script>

<style type="text/css">
	@import url("mainDes.css");
</style> 
 
</head>
<body>
	 <jsp:include page="navbar.jsp"></jsp:include>
	 
	 <%
	 	String stu_no = (String)session.getAttribute("stu_no");
	 %>


	<div style="text-align:center;">
			<a href="queryMyBook.jsp?stu_no=<%=stu_no%>"><img src="images/mobile-float-mypage.png" width="200px" height="200px" alt=""></a>
	</div>
	<br><br>
	<div class="container">
		<div class="row">
	        <div class="col-lg-4 col-lg-offset-4">
	            <input onkeyup="enterkey(keyWord.value);" type="search" id="keyWord" value="" class="form-control" placeholder="책 이름을 입력하세요 ..">

	        </div>
	    </div>
	    <br>
	    
		<table class="table table-hover" id="table">
  			<thead>
			    <tr>
			      <th scope="col">거래번호</th>
			      <th scope="col">책이름</th>
			      <th scope="col">출판사</th>
			      <th scope="col">교수명</th>
			      <th scope="col">책 상태</th>
			      <th scope="col">판매자</th>
			      <th scope="col">판매여부</th>
			      <th scope="col">이미지</th>
			    </tr>
  			</thead>
  			<tbody>
  			<%
				request.setCharacterEncoding("UTF-8");
		
  				ArrayList<Book> list = (ArrayList<Book>)request.getAttribute("list");

			
			%>
		
			<c:forEach var="emp" items="${list }">
				<tr>
					<td>${emp.getTradeNum() }</td>
					<td><a href="ContactFrom_v4/view.jsp?tradenum=${emp.getTradeNum() }">${emp.getBookName() }</a></td>
					<td>${emp.getPublisher() }</td>
					<td>${emp.getProf() }</td>
					<c:if test="${emp.getStatus() eq '상' }"> <td style="color:green">${emp.getStatus() }</td> </c:if>
					<c:if test="${emp.getStatus() eq '중' }"> <td style="color:orange">${emp.getStatus() }</td> </c:if>
					<c:if test="${emp.getStatus() eq '하' }"> <td style="color:red">${emp.getStatus() }</td> </c:if>
					
					<td>${emp.getSeller() }</td>
					
					<c:if test="${emp.getSelStat() eq '판매중' }"><td style="color:green"><a style="text-decoration:none; color:green" href="chgStat.jsp?selstat=${emp.getSelStat() }&tradenum=${emp.getTradeNum() }" target="_blank">${emp.getSelStat() }</a></td></c:if>
					<c:if test="${emp.getSelStat() eq '거래중' }"><td style="color:orange"><a style="text-decoration:none; color:orange" href="chgStat.jsp?selstat=${emp.getSelStat() }&tradenum=${emp.getTradeNum() }" target="_blank">${emp.getSelStat() }</a></td></c:if>
					<c:if test="${emp.getSelStat() eq '판매완료' }"><td style="color:red"><del><a style="text-decoration:none; color:red" href="chgStat.jsp?selstat=${emp.getSelStat() }&tradenum=${emp.getTradeNum() }" target="_blank">${emp.getSelStat() }</a></del></td></c:if>
					
					
					<c:if test="${emp.getFileName() eq '0' }"><td>사진 없음 </td></c:if>
					
					<c:if test="${emp.getFileName() ne '0' }"><td><a href="imageView.jsp?tradenum=${emp.getTradeNum() }">사진 보기</a></td></c:if>
					
				</tr>
			</c:forEach>

  			</tbody>
		</table>
		
<hr/>
<a class="btn btn-default" href="/bookBoard/ContactFrom_v4/write.jsp">글쓰기</a>
<button type="button" onclick ="location.href='queryMyBook.jsp?stu_no=<%=stu_no %>'" class="btn btn-primary pull-right">모든 책 보기</button>
	<div class="text-center">
		<ul class="pagination">
		
		
		<%
				response.setContentType("text/html;charset=utf-8");
			
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
				String selStat="판매중";

				//2. 데이터베이스 커넥션 생성
				conn = DriverManager.getConnection(jdbcDriver,dbUser,dbPass);
				
				//3. 쿼리를 위한 Statement 생성
				stat = conn.createStatement();
				
					String sqlCount = "SELECT COUNT(*) FROM bookinfo where selstat = '"+selStat+"' and stu_no = '"+stu_no+"'";
					rs = stat.executeQuery(sqlCount);
					
					if(rs.next()){
						total = rs.getInt(1);
					}
				
					
					
					allPage = (int)Math.ceil(total/(double)ROWSIZE);
					
					if(endPage > allPage)
					{
						endPage = allPage;
					}

				rs.close();
				stat.close();
				conn.close();
		%>
		
		<%
							if(pg>BLOCK) {
						%>
							<li>
						      <a href="selMyProduct.jsp?stu_no=<%=stu_no %>&pg=<%=startPage-1 %>" aria-label="Previous">
						        <span aria-hidden="true">&laquo;</span>
						      </a>
						    </li>
						<%
							}
						%>
						
						<%
							for(int i=startPage; i<= endPage; i++){
								if(i==pg){
						%>
									<li class="active"><a href="#"><%=i %></a></li>
						<%
								}else{
						%>
									<li><a href="selMyProduct.jsp?stu_no=<%=stu_no %>&pg=<%=i %>"><%=i %></a></li>
						<%
								}
							}
						%>
						
						<%
							if(endPage<allPage){
						%>
							
							<li>
						      <a href="selMyProduct.jsp?stu_no=<%=stu_no %>&pg=<%=endPage+1 %>" aria-label="Next">
						        <span aria-hidden="true">&raquo;</span>
						      </a>
						    </li>
							
						<%
							}
						%>
		
		</ul>
	</div>	
</div>


 
</body>
</html>