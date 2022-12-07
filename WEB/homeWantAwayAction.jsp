<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="game.HomeWantAwayDAO" %>
<%@ page import="game.HomeWantAway" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="game_info" class="game.HomeWantAway" scope="page"/>
<jsp:setProperty name="game_info" property="home_id"/>
<jsp:setProperty name="game_info" property="roadAddrPart1"/>
<jsp:setProperty name="game_info" property="date"/>
<jsp:setProperty name="game_info" property="home_people"/>
<jsp:setProperty name="game_info" property="home_age"/>
<jsp:setProperty name="game_info" property="home_uniform"/>
<jsp:setProperty name="game_info" property="away_people"/>
<jsp:setProperty name="game_info" property="away_level"/>
<jsp:setProperty name="game_info" property="away_age"/>
<jsp:setProperty name="game_info" property="shower"/>
<jsp:setProperty name="game_info" property="parking"/>
<jsp:setProperty name="game_info" property="warning"/>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
    <%
        if(game_info.getRoadAddrPart1() == null || 
        game_info.getDate() == null) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('입력이 안 된 사항이 있습니다.')");
            script.println("history.back()");
            script.println("</script>");
        }
        else {
            HomeWantAwayDAO homeWantAwayDAO = new HomeWantAwayDAO();
            int result = homeWantAwayDAO.makeGame(game_info);

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
                script.println("location.href = 'home.jsp'");
                script.println("</script>");
            }
        }
    %>
</body>
</html>