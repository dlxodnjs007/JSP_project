<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="game.AwayApplyDAO" %>
<%@ page import="game.AwayApply" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="away_apply" class="game.AwayApply" scope="page"/>
<jsp:setProperty name="away_apply" property="apply_id"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
    <%
        AwayApplyDAO AwayApplyDAO = new AwayApplyDAO();
        int result = AwayApplyDAO.matchAcceptCancel(away_apply.getApply_id());
        
        if(result == -1) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('apply_away_info에서 accept_status를 0으로 변경 실패')");
            script.println("history.back()");
            script.println("</script>");
        }
        else {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("location.href = document.referrer;");
            script.println("</script>");
        }
    %>
</body>
</html>