<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="evaluation.EvaluationDTO"%>
<%@ page import="evaluation.EvaluationDAO"%>
<%@ page import="util.SHA256"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String)session.getAttribute("userID");
	}
	if (userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 해주세요');");
		script.println("location.href = 'userLogin.jsp");
		script.println("</script>");
		script.close();
		return;
	}
	
	String movieTitle = null;
	String directorName = null;
	String genre = null;
	String evaluationTitle = null;
	String evaluationContent = null;
	int totalScore = 0;
	int storyScore = 0;
	int videoScore = 0;
	int characterScore = 0;
	
	if(request.getParameter("movieTitle") != null) {
		movieTitle = (String) request.getParameter("movieTitle");
	}
	if(request.getParameter("directorName") != null) {
		directorName = (String) request.getParameter("directorName");
	}
	if(request.getParameter("genre") != null) {
		genre = (String) request.getParameter("genre");
	}
	if(request.getParameter("evaluationTitle") != null) {
		evaluationTitle = (String) request.getParameter("evaluationTitle");
	}
	if(request.getParameter("evaluationContent") != null) {
		evaluationContent = (String) request.getParameter("evaluationContent");
	}
	if(request.getParameter("totalScore") != null) {
		try {
			totalScore = Integer.parseInt(request.getParameter("totalScore"));
		} catch (Exception e) {
			System.out.println("영화 스코어 오류");
		}	
	}
	if(request.getParameter("storyScore") != null) {
		try {
			storyScore = Integer.parseInt(request.getParameter("storyScore"));
		} catch (Exception e) {
			System.out.println("영화 스코어 오류");
		}	
	}
	if(request.getParameter("videoScore") != null) {
		try {
			videoScore = Integer.parseInt(request.getParameter("videoScore"));
		} catch (Exception e) {
			System.out.println("영화 스코어 오류");
		}	
	}
	if(request.getParameter("characterScore") != null) {
		try {
			characterScore = Integer.parseInt(request.getParameter("characterScore"));
		} catch (Exception e) {
			System.out.println("영화 스코어 오류");
		}	
	}
	if (movieTitle == null || directorName == null || genre == null || evaluationTitle == null || evaluationContent == null ||
			movieTitle.equals("") || directorName.equals("") || genre.equals("") || evaluationTitle.equals("") || evaluationContent.equals("")) {
	 	PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	} else {
		EvaluationDAO evaluationDAO = new EvaluationDAO();
		int result = evaluationDAO.write(new EvaluationDTO(0, userID, movieTitle, directorName, genre, evaluationTitle, evaluationContent, 
				totalScore, storyScore, videoScore, characterScore, 0));
		if (result == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('영화 평가 등록에 실패하였습니다.');");
			script.println("history.back();");
			script.println("</script>");
			script.close();
			return;
		} else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'index.jsp';");
			script.println("</script>");
			script.close();
			return;
		}
	}
%>