<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600' rel='stylesheet' type='text/css'>
<link href="//netdna.bootstrapcdn.com/font-awesome/3.1.1/css/font-awesome.css" rel="stylesheet">



<style type="text/css">
	@import url("register.css");
</style> 
</head>
<body>


<script type="text/javascript">
	function check(){
		if(!frm.stu_no.value){
			alert("학번을 입력하세요.");
			frm.stu_no.focus();
			return false;
		}
		if(!frm.stu_name.value){
			alert("이름을 입력하세요.");
			frm.stu_name.focus();
			return false;
		}
		if(!frm.stu_pw.value){
			alert("비밀번호를 입력하세요.");
			frm.stu_pw.focus();
			return false;
		}
		if(!frm.stu_tel.value){
			alert("전화번호를 입력하세요.");
			frm.stu_tel.focus();
			return false;
		}
	}
</script>

<%-- <jsp:include page="navbar.jsp"></jsp:include> --%>


<div class="testbox">
  <h1>Register.</h1>

  <form action="registerProc.jsp" name="frm" onsubmit="return check()">
      <hr>
	    <div class="grade">
	      <input type="radio" value="1" id="radioOne" name="stu_grade" checked/>
	      <label for="radioOne" class="radio" chec>1학년</label>
	      <input type="radio" value="2" id="radioTwo" name="stu_grade" />
	      <label for="radioTwo" class="radio">2학년</label>
	      <input type="radio" value="3" id="radioThree" name="stu_grade" />
	      <label for="radioThree" class="radio">3학년</label>
	    </div>
  		<hr>
		  <label id="icon" for="stu_no"><i class="icon-user "></i></label>
		  <input type="number" name="stu_no" id="stu_no" placeholder="학번" required/>
		  
		  <label id="icon" for="stu_name"><i class="icon-smile"></i></label>
		  <input type="text" name="stu_name" id="stu_name" placeholder="이름" required/>
		  
		  <label id="icon" for="stu_pw"><i class="icon-shield"></i></label>
		  <input type="password" name="stu_pw" id="stu_pw" placeholder="비밀번호" required/>
		  
		  <label id="icon" for="stu_tel"><i class="icon-terminal"></i></label>
		  <input type="text" name="stu_tel" id="stu_tel" placeholder="전화번호" required/>
		  
		  <br><br>
		  
		  
		  
		  
		  <div class="class">
		    <input type="radio" value="A" id="classA" name="stu_class" checked/>
		    <label for="classA" class="radio" chec>A반</label>
		    
		    <input type="radio" value="B" id="classB" name="stu_class" />
		    <label for="classB" class="radio">B반</label>
		    
		    <input type="radio" value="C" id="classC" name="stu_class" />
		    <label for="classC" class="radio">C반</label>
		   </div> 
<!--    		<p>By clicking Register, you agree on our <a href="#">terms and condition</a>.</p> -->
<!-- 		<a href="./registerProc.jsp" class="button" onclick ="return check()">Register</a> -->
		<button type="submit" class="buttonset">회원가입</button>
  </form>
</div>


</body>
</html>