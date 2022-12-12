<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="game.HomeWantAwayDAO" %>
<%@ page import="game.HomeWantAway" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="home_game" class="game.HomeWantAway" scope="page"/>
<jsp:setProperty name="home_game" property="id"/>
<jsp:setProperty name="home_game" property="home_id"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
    <%
        HomeWantAwayDAO homeWantAwayDAO = new HomeWantAwayDAO();
        int result = homeWantAwayDAO.cancelHomeGame(home_game.getId(), home_game.getHome_id());
        
        if(result == -1) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('홈게임 삭제 실패')");
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