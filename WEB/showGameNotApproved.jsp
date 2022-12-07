<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="game.HomeWantAwayDAO" %>
<%@ page import="game.HomeWantAway" %>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>오직농구</title>
	<link href="./css/base.css?after" rel="stylesheet">
    <link href="./css/common.css?after" rel="stylesheet">
    <link href="./css/main.css?after" rel="stylesheet">
</head>
<script>
</script>
<body>
    <%
        String user_id = null;
        int game_id = Integer.parseInt(request.getParameter("id"));
        if(session.getAttribute("user_id") != null) {
            user_id = (String) session.getAttribute("user_id");
        }
    %>
    <!-- container -->
    <div id="popup_container">
        <!-- 본문 -->
        <div id="type-of-game">
            내가 신청한 게임 - 승인 대기 중
        </div>
        <%
            HomeWantAwayDAO homeWantAwayDAO = new HomeWantAwayDAO();
            HomeWantAway homeWantAway = homeWantAwayDAO.getGameById(game_id);
        %>
        <div class="game-exist">
            <%=homeWantAway.getRoadAddrPart1()%>
            <br>
            <%=homeWantAway.getDate().substring(0,9)%>
            |&nbsp<%=homeWantAway.getDate().substring(11,12)%>시
            <%=homeWantAway.getDate().substring(14,15)%>분
            <br>
            <%=homeWantAway.getHome_people()%>
            <br>
            <%=homeWantAway.getHome_age()%>
            <br>
            <%=homeWantAway.getHome_uniform()%>
            <br>
            <%=homeWantAway.getAway_people()%>
            <br>
            <%=homeWantAway.getAway_level()%>
            <br>
            <%=homeWantAway.getAway_age()%>
            <br>
            <%=homeWantAway.getShower()%>
            <br>
            <%=homeWantAway.getParking()%>
            <br>
            <%=homeWantAway.getWarning()%>
            <br>
            <form name="post" method="post" action="/applyCancelAction.jsp">
                <input type="text" name="game_id_no" style="display: none;" value="<%=game_id%>">
                <input type="text" name="away_id" style="display: none;" value="<%=user_id%>">
                <button type="submit" class="game-exist-btn">
                    취소
                </button>
            </form>
            <%-- <button type="button" class="game-exist-btn" value="game_id_no=<%=game_id%>&away_id=<%=user_id%>" onclick="cancel(this.value)">
                취소
            </button> --%>
        </div>
        <br>
        <br>
            
        <!-- 본문 끝-->
    </div>
    <!-- //container -->

      
    
</body>
</html>