<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->
</head>
<body>

	<script type="text/javascript">
		function getVal(mode)
		{
			var theForm = document.bookFrame;
			if(mode == "00"){
				theForm.action = "modify.jsp";
			}
			else if(mode == "01"){
				theForm.action = "delete.jsp";
			}
			theForm.submit();
		}
	
	</script>
	<%
	
		String session_stu_no = "";
		int tradenum = Integer.parseInt(request.getParameter("tradenum"));
		String seller = "";
		String seller_tel ="";
		String bookname ="";
		String publisher ="";
		String prof = "";
		String status = "";
		String summary = "";
		String stu_no = "";
		try{
			
			session_stu_no = (String)session.getAttribute("stu_no");
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = null;
			Statement stat	= null;
			ResultSet rs 	= null;
			
			String jdbcDriver = "jdbc:mysql://localhost:3306/bookDB?"+
								"useSSl=false&serverTimezone=UTC";
			
			String dbUser = "root";
			String dbPass = "1234";
			
			
			
			//2. 데이터베이스 커넥션 생성
			conn = DriverManager.getConnection(jdbcDriver,dbUser,dbPass);
			
			String sql = "SELECT seller, seller_tel, bookName, publisher, prof, status, summary, stu_no FROM BOOKINFO WHERE TRADENUM = " + tradenum;
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			if(rs.next()){
				seller = rs.getString(1);
				seller_tel = rs.getString(2);
				bookname = rs.getString(3);
				publisher = rs.getString(4);
				prof = rs.getString(5);
				status = rs.getString(6);
				summary = rs.getString(7);
				stu_no = rs.getString(8);
			}
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
	%>



	<div class="container-contact100">
		<div class="wrap-contact100">
			<form name="bookFrame" class="contact100-form validate-form" action="modify.jsp">
				<span class="contact100-form-title">
					BOOK INFO
				</span>
				
				<div class="wrap-input100 validate-input" data-validate="책 이름을 입력하세요.">
					<span class="label-input100">판매자</span>
					<input class="input100" type="text" name="seller" value="<%=seller %>" readonly>
					<input type="hidden" name="tradenum" value="<%=tradenum %>"/>
					<span class="focus-input100"></span>
				</div>
				
				<div class="wrap-input100 validate-input" data-validate="책 이름을 입력하세요.">
					<span class="label-input100">연락처</span>
					<input class="input100" type="text" name="tel" value="<%=seller_tel %>" readonly>
					<span class="focus-input100"></span>
				</div>

				<div class="wrap-input100 validate-input" data-validate="책 이름을 입력하세요.">
					<span class="label-input100">책 이름</span>
					<input class="input100" type="text" name="bookname" value="<%=bookname %>" readonly>
					<span class="focus-input100"></span>
				</div>

				<div class="wrap-input100 validate-input" data-validate = "출판사를 입력하세요.">
					<span class="label-input100">출판사</span>
					<input class="input100" type="text" name="publisher" value="<%=publisher %>" readonly>
					<span class="focus-input100"></span>
				</div>
				
				<div class="wrap-input100 validate-input" data-validate = "교수명을 입력하세요.">
					<span class="label-input100">교수명</span>
					<input class="input100" type="text" name="prof" value="<%=prof %>" readonly>
					<span class="focus-input100"></span>
				</div>

				<div class="wrap-input100 input100-select">
					<span class="label-input100">책 상태</span>
					<div>
						<input class="input100" type="text" name="prof" value="<%=status %>" readonly>
						<span class="focus-input100"></span>
					</div>
					<span class="focus-input100"></span>
				</div>

				<!-- <div class="wrap-input100 input100-select">
					<span class="label-input100">가격</span>
					<div>
						<select class="selection-2" name="budget">
							<option>구두 협의</option>
						</select>
					</div>
					<span class="focus-input100"></span>
				</div> -->

				<div class="wrap-input100 validate-input" data-validate = "상세정보를 입력하세요.">
					<span class="label-input100">상세정보</span>
					<textarea class="input100" name="summary" readonly><%=summary %></textarea>
					<span class="focus-input100"></span>
				</div>

				<div class="container-contact100-form-btn">
					<div class="wrap-contact100-form-btn">
						<div class="contact100-form-bgbtn"></div>
						<%
							if(!stu_no.equals(session_stu_no)){
						%>
								<button class="contact100-form-btn" onclick='history.go(-1); return false;'>
									<span>
										다른 책 보러가기
										<i class="fa fa-long-arrow-right m-l-7" aria-hidden="true"></i>
									</span>
								</button>
						<%
							}else{
						%>
							<button class="contact100-form-btn" type="submit">
								<span>
									수정하기
									<i class="fa fa-long-arrow-right m-l-7" aria-hidden="true"></i>
								</span>
							</button>
							
							<button type="button" class="contact100-form-btn" onclick = "getVal('01') ">
								<span>
									삭제하기
									<i class="fa fa-long-arrow-right m-l-7" aria-hidden="true"></i>
								</span>
							</button>
						
						<%
							}
						%>
											
						
						
						
						
					</div>
				</div>
			</form>
		</div>
	</div>



	<div id="dropDownSelect1"></div>
	
	

<!--===============================================================================================-->
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
	<script>
		$(".selection-2").select2({
			minimumResultsForSearch: 20,
			dropdownParent: $('#dropDownSelect1')
		});
	</script>
<!--===============================================================================================-->
	<script src="vendor/daterangepicker/moment.min.js"></script>
	<script src="vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>

	<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-23581568-13');
</script>

</body>
</html>