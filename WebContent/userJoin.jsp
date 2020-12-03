<%@ page import="user.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>왓플릭스</title>
	<link rel="icon" type="image/x-icon" href="assets/img/favicon.ico" />
	<!-- 부트스트랩 CSS 추가 -->
	<link rel="stylesheet" href="./css/bootstrap.min.css">
	<!-- Custom CSS 추가 -->
	<link rel="stylesheet" href="./css/custom.css">
</head>
<script type="text/javascript">
	function checkValue() {
		var regex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
		var email = document.signup.userEmail.value;
		
		//아이디 유효성 검사 (영문소문자, 숫자만 허용)
		for (var i = 0; i < document.signup.userID.value.length; i++) {
        	ch = document.signup.userID.value.charAt(i)
            if (!(ch >= '0' && ch <= '9') && !(ch >= 'a' && ch <= 'z')&&!(ch >= 'A' && ch <= 'Z')) {
                alert("아이디는 영문 대소문자, 숫자만 입력가능합니다.")
                document.signup.userID.focus();
                document.signup.userID.select();
                return false;
            }
        }
		//아이디에 공백 사용하지 않기
        if (document.signup.userID.value.indexOf(" ") >= 0) {
            alert("아이디에 공백을 사용할 수 없습니다.")
            document.signup.userID.focus();
            document.signup.userID.select()
            return false;
        }
      	//아이디 길이 체크 (6~12자)
        if (document.signup.userID.value.length < 6 || document.signup.userID.value.length > 12) {
            alert("아이디를 6~12자까지 입력해주세요.")
            document.signup.userID.focus();
            document.signup.userID.select();
            return false;
        }
        if (signup.userPassword.value == signup.userID.value) {
            alert("아이디와 비밀번호가 같습니다.")
            document.signup.userPassword.focus();
            return false;
        }
      	//비밀번호 길이 체크(6~14자 까지 허용)
        if (document.signup.userPassword.value.length<6 || document.signup.userPassword.value.length>14) {
            alert("비밀번호를 6~14자까지 입력해주세요.")
            document.signup.userPassword.focus();
            document.signup.userPassword.select();
            return false;
        }
        if (regex.test(userEmail) === false) {
            alert("잘못된 이메일 형식입니다.");
            document.signup.userEmail.value = ""
            document.signup.userEmail.focus();
            return false;
        }
        for (var i = 0; i < document.signup.userEmail.value.length; i++) {
            chm = document.signup.userEmail.value.charAt(i)
            if (!(chm >= '0' && chm <= '9') && !(chm >= 'a' && chm <= 'z')&&!(chm >= 'A' && chm <= 'Z')) {
                alert("이메일은 영문 대소문자, 숫자만 입력가능합니다.")
                document.signup.userEmail.focus();
                document.signup.userEmail.select();
                return false;
            }
        }
	}
</script>
<body>
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String)session.getAttribute("userID");
		}
		if (userID != null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인이 된 상태입니다.');");
			script.println("location.href = 'index.jsp'");
			script.println("</script>");
			script.close();
		}
	%>
	<jsp:include page="menu.jsp">
		<jsp:param value="<%=userID %>" name="userID"/>
	</jsp:include>
	<section class="container mt-3" style="max-width: 560px;">
		<form name="signup" method="POST" action="./userRegisterAction.jsp" onsubmit="return checkValue();">
			<div class="form-group">
				<label>아이디</label>
				<input type="text" id="userID" name="userID" class="form-control">
			</div>
			<div class="form-group">
				<label>비밀번호</label>
				<input type="password" id="userPassword" name="userPassword" class="form-control">
			</div>
			<div class="form-group">
				<label>이메일</label>
				<input type="email" id="userEmail" name="userEmail" class="form-control">
			</div>
			<button type="submit" class="btn btn-primary">회원가입</button>
		</form>
	</section>
	<%@ include file="footer.jsp" %>
	<!-- jQuery 추가 -->
	<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
	<!-- popper 추가 -->
	<script src="./js/popper.js"></script>
	<!-- 부트스트랩 js 추가 -->
	<script src="./js/bootstrap.min.js"></script>
</body>
</html>