<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
    <link rel="stylesheet" href="style.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js" charset="utf-8"></script>
<!-- <style type="text/css">
	@import url("login.css");
</style>  -->
</head>
<body>

<%-- <jsp:include page="navbar.jsp"></jsp:include> --%>

      <form action="loginChk.jsp" class="login-form">
        <h1>Login</h1>

        <div class="txtb">
          <input type="number" name="stu_no" id="stu_no" required/>
          <span data-placeholder="학번"></span>
        </div>

        <div class="txtb">
          <input type="password" name="stu_pw" id="stu_pw" required/>
          <span data-placeholder="Password"></span>
        </div>

        <input type="submit" class="logbtn" value="Login">

        <div class="bottom-text">
          Don't have account? <a href="register.jsp">Sign up</a>
        </div>

      </form>

      <script type="text/javascript">
      $(".txtb input").on("focus",function(){
        $(this).addClass("focus");
      });

      $(".txtb input").on("blur",function(){
        if($(this).val() == "")
        $(this).removeClass("focus");
      });

      </script>



</body>
</html>