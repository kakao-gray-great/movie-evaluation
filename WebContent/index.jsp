<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO"%>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="guidance.GuidanceDTO" %>
<%@ page import="guidance.GuidanceDAO" %>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>왓플릭스</title>
    <link rel="icon" type="image/x-icon" href="assets/img/favicon.ico" />
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v5.15.1/js/all.js" crossorigin="anonymous"></script>
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="css/styles.css" rel="stylesheet" />
</head>
<body id="page-top">
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String)session.getAttribute("userID");
		}
	%>
    <!-- Navigation-->
    <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
        <div class="container">
            <a class="navbar-brand js-scroll-trigger" href="#page-top">왓플릭스</a>
            <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                Menu
                <i class="fas fa-bars"></i>
            </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#about">왓플릭스란</a></li>
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#projects">이용방법</a></li>
                    <%
                		if (userID != null) {
	                %>
                			<li class="nav-item"><a class="nav-link js-scroll-trigger" href="./userLogout.jsp">로그아웃</a></li>
	                <%
                		} else {
                	%>
                			<li class="nav-item"><a class="nav-link js-scroll-trigger" href="./userLogin.jsp">로그인</a></li>
                	<%
                		}
                   		try {
                   			if (userID.equals("admin")) {
	                %>
	                		<li class="nav-item"><a data-toggle="modal" class="nav-link"  href="#adminModal">관리자</a></li>
	                <%
                   			}
                   		} catch (Exception e) {   
                   			e.printStackTrace();
           				} 
                   	%>
                </ul>
            </div>
        </div>
    </nav>
    <!-- Masthead-->
    <header class="masthead">
        <div class="container d-flex h-100 align-items-center">
            <div class="mx-auto text-center">
                <h1 class="mx-auto my-0 text-uppercase">왓플릭스</h1>
                <h2 class="text-white-50 mx-auto mt-2 mb-5">무슨 영화가 좋을까? 이 영화는 어떨까?</h2>
                <a class="btn btn-primary js-scroll-trigger" href="./main.jsp">Get Started</a>
            </div>
        </div>
    </header>
    <!-- About-->
    <section class="about-section text-center" id="about">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 mx-auto">
                    <h2 class="text-white mb-4">Why 왓플릭스?</h2>
                    <p class="text-white-50">
                       		무슨 영화가 좋을까? 이 영화는 어떨까?<br/>
                           	어떤 영화를 봐야할 지 고민인 당신에게 좋은 친구가 되어줄 수 있습니다.
                    </p>
                </div>
            </div>
            <img class="img-fluid" src="assets/img/movie-popcon.jpg" alt="" />
        </div>
    </section>

    <!-- Admin Modal -->
	<div class="modal fade" id="adminModal" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="modal">이용방법 내용 변경</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="./reportAction.jsp" method="POST">
						<div class="form-row">
							<div class="form-group col-sm-10">
								<label>제목</label> <input type="text" name="descriptionTitle" class="form-control" maxlength="30">
							</div>
							<div class="form-group col-sm-2">
								<label>인덱스</label>
								<select name="descriptionTitle" class="form-control">
									<option value="1" selected>1</option>
									<option value="2">2</option>
									<option value="3">3</option>				
								</select>
							</div>
						</div>
						<div class="form-group">
							<label>내용</label>
							<textarea name="descriptionContent" class="form-control" maxlength="2048" style="height: 180px;"></textarea>
						</div>
						<div class="form-group row">
							<label class="col-sm-2">이미지</label>
							<div class="col-sm-10">
								<input type="file" name="descriptionImage" class="form-control">
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
							<button type="submit" class="btn btn-primary">신고하기</button>
						</div>
					</form>
				</div>
	
			</div>
		</div>
	</div>
    <!-- Projects-->
    <section class="projects-section bg-light" id="projects">
        <div class="container">
        	<%
        		ArrayList<GuidanceDTO> guidanceList = new ArrayList<>();
        		guidanceList = new GuidanceDAO().getList();
        		if (guidanceList != null) {
        	%>
            <!-- Featured Project Row-->
            <div class="row justify-content-center no-gutters">
                <div class="col-lg-6"><img class="img-fluid" src="assets/img/<%=guidanceList.get(0).getDescriptionImage() %>" alt="" /></div>
                <div class="col-lg-6 order-lg-first">
                    <div class="bg-black text-center h-100 project">
                        <div class="d-flex h-100">
                            <div class="project-text w-100 my-auto text-center text-lg-right">
                                <h4 class="text-white"><%= guidanceList.get(0).getDescriptionTitle() %>&nbsp;</h4>
                                <p class="mb-0 text-white-50"><%= guidanceList.get(0).getDescriptionContent() %>&nbsp;</p>
                                <hr class="d-none d-lg-block mb-0 mr-0" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Project One Row-->
            <div class="row justify-content-center no-gutters mb-5 mb-lg-0">
                <div class="col-lg-6"><img class="img-fluid" src="assets/img/<%=guidanceList.get(1).getDescriptionImage() %>" alt="" /></div>
                <div class="col-lg-6">
                    <div class="bg-black text-center h-100 project">
                        <div class="d-flex h-100">
                            <div class="project-text w-100 my-auto text-center text-lg-left">
                                <h4 class="text-white"><%= guidanceList.get(1).getDescriptionTitle() %>&nbsp;</h4>
                                <p class="mb-0 text-white-50"><%= guidanceList.get(1).getDescriptionContent() %>&nbsp;</p>
                                <hr class="d-none d-lg-block mb-0 ml-0" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Project Two Row-->
            <div class="row justify-content-center no-gutters">
                <div class="col-lg-6"><img class="img-fluid" src="assets/img/<%=guidanceList.get(2).getDescriptionImage() %>" alt="" /></div>
                <div class="col-lg-6 order-lg-first">
                    <div class="bg-black text-center h-100 project">
                        <div class="d-flex h-100">
                            <div class="project-text w-100 my-auto text-center text-lg-right">
                                <h4 class="text-white"><%= guidanceList.get(2).getDescriptionTitle() %>&nbsp;</h4>
                                <p class="mb-0 text-white-50"><%= guidanceList.get(2).getDescriptionContent() %>&nbsp;</p>
                                <hr class="d-none d-lg-block mb-0 mr-0" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <% 
        		}
            %>
            
        </div>
    </section>   
    <!-- Footer-->
    <%@ include file="footer.jsp" %>
    <!-- Bootstrap core JS-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Third party plugin JS-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
    <!-- Core theme JS-->
    <script src="js/scripts.js"></script>
</body>
</html>
