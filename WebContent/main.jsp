<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="user.UserDAO"%>
<%@ page import="evaluation.EvaluationDTO"%>
<%@ page import="evaluation.EvaluationDAO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.net.URLEncoder"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>영화 평가 사이트</title>
<!-- 부트스트랩 CSS 추가 -->
<link rel="stylesheet" href="./css/bootstrap.min.css">
<!-- Custom CSS 추가 -->
<link rel="stylesheet" href="./css/custom.css">
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String genre = "전체";
		String searchType = "최신순";
		String search = "";
		int pageNumber = 0;
		if (request.getParameter("genre") != null) {
			genre = request.getParameter("genre");
		}
		if (request.getParameter("searchType") != null) {
			searchType = request.getParameter("searchType");
		}
		if (request.getParameter("search") != null) {
			search = request.getParameter("search");
		}
		if (request.getParameter("pageNumber") != null) {
			try {
				pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
			} catch (Exception e) {
				System.out.println("검색 페이지 번호 오류");
			}
	
		}
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
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
		<jsp:param value="<%=userID%>" name="userID" />
	</jsp:include>
	<div class="container">
		<div class="row">
			<div class="col-3" style="padding-top: 40px; padding-bottom: 40px">
				<div>
					<a href="naver.com">
					<img
						src="https://drive.google.com/uc?id=1L20TmRwbgaxNEXsexp8VDFERWPfStzwD"
						alt="..." width="100%" height="30%">
						</a>
				</div>
			</div>
			<div class="col-3" style="padding-top: 40px; padding-bottom: 40px">
				<div>
					<a href="naver.com">
					<img
						src="https://images.unsplash.com/photo-1563725911583-7d108f720483"
						class="card-img-top embed-responsive-item" alt="...">
						</a>
				</div>
			</div>
			<div class="col-3" style="padding-top: 40px; padding-bottom: 40px">
				<div>
					<a href="naver.com">
					<img
						src="https://images.unsplash.com/photo-1563725911583-7d108f720483"
						class="card-img-top embed-responsive-item" alt="...">
						</a>
				</div>
			</div>
			<div class="col-3" style="padding-top: 40px; padding-bottom: 40px">
				<div>
					<a href="naver.com">
					<img
						src="https://images.unsplash.com/photo-1563725911583-7d108f720483"
						class="card-img-top embed-responsive-item" alt="...">
						</a>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-3" style="padding-top: 40px; padding-bottom: 40px">
				<div>
					<a href="naver.com">
					<img
						src="https://images.unsplash.com/photo-1563725911583-7d108f720483"
						class="card-img-top embed-responsive-item" alt="...">
						</a>
				</div>
			</div>
			<div class="col-3" style="padding-top: 40px; padding-bottom: 40px">
				<div>
					<a href="naver.com">
					<img
						src="https://images.unsplash.com/photo-1563725911583-7d108f720483"
						class="card-img-top embed-responsive-item" alt="...">
						</a>
				</div>
			</div>
			<div class="col-3" style="padding-top: 40px; padding-bottom: 40px">
				<div>
					<a href="naver.com">
					<img
						src="https://images.unsplash.com/photo-1563725911583-7d108f720483"
						class="card-img-top embed-responsive-item" alt="...">
						</a>
				</div>
			</div>
			<div class="col-3" style="padding-top: 40px; padding-bottom: 40px">
				<div>
					<a href="naver.com">
					<img
						src="https://images.unsplash.com/photo-1563725911583-7d108f720483"
						class="card-img-top embed-responsive-item" alt="...">
						</a>
				</div>
			</div>
		</div>
	</div>
	
	<%@ include file="footer.jsp"%>
	<!-- jQuery 추가 -->
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"
		integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
		crossorigin="anonymous"></script>
	<!-- popper 추가 -->
	<script src="./js/popper.js"></script>
	<!-- 부트스트랩 js 추가 -->
	<script src="./js/bootstrap.min.js"></script>
</body>
</html>