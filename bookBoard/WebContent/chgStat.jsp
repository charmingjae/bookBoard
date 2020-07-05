<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600' rel='stylesheet' type='text/css'>
<link href="//netdna.bootstrapcdn.com/font-awesome/3.1.1/css/font-awesome.css" rel="stylesheet">
<style type="text/css">
	@import url("chgStat.css");
</style> 
</head>
<body>


<div class="testbox">
  <h1>STATUS</h1>

	<%
	String selstat = request.getParameter("selstat");
	String tradenum = request.getParameter("tradenum");
	
	%>

  <form action="chgStatChk.jsp">
      <hr>
		  <div class="grade">
		  <%
		  
		  	if(selstat.equals("판매중")){%>
		  		<input type="radio" value="판매중" id="radioOne" name="selstat" checked/>
			      <label for="radioOne" class="radio" chec>판매중</label>
			      <input type="radio" value="거래중" id="radioTwo" name="selstat" />
			      <label for="radioTwo" class="radio">거래중</label>
			      <input type="radio" value="판매완료" id="radioThree" name="selstat" />
			      <label for="radioThree" class="radio">판매완료</label>	
		  <%
		  		
		  	}else if(selstat.equals("거래중")){%>
		  			<input type="radio" value="판매중" id="radioOne" name="selstat"/>
			      <label for="radioOne" class="radio" chec>판매중</label>
			      <input type="radio" value="거래중" id="radioTwo" name="selstat" checked/>
			      <label for="radioTwo" class="radio">거래중</label>
			      <input type="radio" value="판매완료" id="radioThree" name="selstat" />
			      <label for="radioThree" class="radio">판매완료</label>	
		  <%
		  	}else{%>
		  		<input type="radio" value="판매중" id="radioOne" name="selstat"/>
			      <label for="radioOne" class="radio" chec>판매중</label>
			      <input type="radio" value="거래중" id="radioTwo" name="selstat"/>
			      <label for="radioTwo" class="radio">거래중</label>
			      <input type="radio" value="판매완료" id="radioThree" name="selstat" checked/>
			      <label for="radioThree" class="radio">판매완료</label>	
		  	<%}
		  %>
		  <input type="hidden" name="tradenum" value="<%=tradenum %>"/>
	    </div>
		  <br><br>


<!--    		<p>By clicking Register, you agree on our <a href="#">terms and condition</a>.</p> -->
   		<button type="submit" class="buttonset">수정</button>
  </form>
</div>


</body>
</html>