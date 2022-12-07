<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="game.AwayApplyDAO" %>
<%@ page import="game.AwayApply" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="away_apply" class="game.AwayApply" scope="page"/>
<jsp:setProperty name="away_apply" property="game_id_no"/>
<jsp:setProperty name="away_apply" property="away_id"/>
<jsp:setProperty name="away_apply" property="away_people"/>
<jsp:setProperty name="away_apply" property="away_level"/>
<jsp:setProperty name="away_apply" property="away_age"/>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
    <%
        AwayApplyDAO AwayApplyDAO = new AwayApplyDAO();
        int result = AwayApplyDAO.setApplyAway(away_apply);

        if(result == -1) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('데이터베이스 insert 실패')");
            script.println("history.back()");
            script.println("</script>");
        }
        else {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("window.open(\"about:blank\",\"_self\");");
            script.println("opener.parent.location.reload();");
            script.println("window.close();");
            script.println("</script>");
        }
    %>
</body>
</html>