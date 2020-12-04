<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="user.UserDAO" %>
<%@ page import="evaluation.EvaluationDTO" %>
<%@ page import="evaluation.EvaluationDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.net.URLEncoder" %>
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
<body>
	<%
		request.setCharacterEncoding("UTF-8");	
	
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String)session.getAttribute("userID");
		}
		if (userID == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 해주세요.');");
			script.println("location.href = 'userLogin.jsp'");
			script.println("</script>");
			script.close();
			return;
		}
		boolean emailChecked = new UserDAO().getUserEmailChecked(userID);
		if (emailChecked == false) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'emailSendConfirm.jsp'");
			script.println("</script>");
			script.close();
			return;
		}
	%>
	<jsp:include page="menu.jsp">
		<jsp:param value="<%=userID %>" name="userID"/>
	</jsp:include>
	<div class="jumbotron">
		<div class="container">
			<h2 class="aalert alert-danger">요청하신 페이지를 찾을 수 없습니다.</h2>
		</div>
		<div class="container">
			<p><%=request.getRequestURL()%></p>
			<p><a href="index.jsp" class="btn btn-secondary">홈&raquo;</a>
		</div>
	</div>
	<%@ include file="footer.jsp" %>
	<!-- jQuery 추가 -->
	<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
	<!-- popper 추가 -->
	<script src="./js/popper.js"></script>
	<!-- 부트스트랩 js 추가 -->
	<script src="./js/bootstrap.min.js"></script>
</body>
</html>