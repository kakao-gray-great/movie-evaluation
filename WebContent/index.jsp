<%@page import="movie.MovieDAO"%>
<%@page import="movie.MovieDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="user.UserDAO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.net.URLEncoder"%>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>왓플릭스</title>
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
	<section class="container">
		<form method="GET" action="./index.jsp" class="form-inline mt-3">
			<select name="genre" class="form-control mx-1 mt-2">
				<option value="전체">전체</option>
				<option value="한국" <% if(genre.contentEquals("한국")) out.println("selected"); %>>한국</option>
				<option value="미국" <% if(genre.contentEquals("미국")) out.println("selected"); %>>미국</option>
				<option value="외국" <% if(genre.contentEquals("외국")) out.println("selected"); %>>외국</option>
			</select>
			<button type="submit" class="btn btn-primary mx-1 mt-2">검색</button>
		</form>
	<%
			ArrayList<MovieDTO> movieList = new ArrayList<MovieDTO>();
			movieList = new MovieDAO().getList(genre);
			int j = 0;
			if (movieList != null) {
				for (int i = 0; i < (movieList.size() / 4); i++) {
	%>			
					<div class="row">
	<%
						for (; j < movieList.size(); j++) {
							if (j % 4 == 0) {
								break;
							}
							MovieDTO movie = movieList.get(j);
	%>
							<div class="col-3" style="padding-top: 40px; padding-bottom: 40px">
								<div>
									<a href="./movieEvalution.jsp?movieID=<%=movie.getMovieID() %>">
										<img src="D:\\Study\\Project\\Movie-Evaluation\\image\\<%=movie.getMovieTitle() %>.png" width="100%" height="30%">
									</a>
								</div>
							</div>
						}
						
					</div>			
	<%
				}			
	%>			
	</section>
	<%
					
				}
			}
			
	%>
	
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