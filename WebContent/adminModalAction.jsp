<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="guidance.GuidanceDTO"%>
<%@page import="guidance.GuidanceDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Properties"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
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
	}
	
	int descriptionID = 0;
	String descriptionTitle = null;
	String descriptionContent = null;
	String descriptionImage = "";
	
	String realFolder = "D:/Study/Project/Movie-Evaluation/WebContent/assets/img";
	int maxSize = 5 * 1024 * 1024;
	String encType = "utf-8";
	
	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
	
	if (multi.getParameter("descriptionID") != null) {
		try {
			descriptionID = Integer.parseInt(multi.getParameter("descriptionID"));
		} catch (Exception e) {
			System.out.println("인덱스 오류");
		}
	}
	
	if (multi.getParameter("descriptionTitle") != null) {
		descriptionTitle = multi.getParameter("descriptionTitle");
	}
	
	if (multi.getParameter("descriptionContent") != null) {
		descriptionContent = multi.getParameter("descriptionContent");
	}
	
	Enumeration files = multi.getFileNames();
	String fname = (String) files.nextElement();
	descriptionImage = multi.getOriginalFileName(fname);
	
	System.out.println(descriptionID);
	System.out.println(descriptionTitle);
	System.out.println(descriptionContent);
	System.out.println(descriptionImage);
	
	if (descriptionTitle == null || descriptionContent == null || descriptionImage == null || descriptionTitle.equals("")
			|| descriptionContent.equals("") || descriptionImage.equals("")) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
	} else {
		GuidanceDAO guidanceDAO = new GuidanceDAO();
		int result = guidanceDAO.update(new GuidanceDTO(descriptionID, descriptionTitle, descriptionContent, descriptionImage));
		if (result == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('업데이트에 실패하였습니다.');");
			script.println("history.back();");
			script.println("</script>");
			script.close();
			return;
		} else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'main.jsp';");
			script.println("</script>");
			script.close();
			return;
		}
	}

%>