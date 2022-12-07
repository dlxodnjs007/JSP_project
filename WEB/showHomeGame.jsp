<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="game.HomeWantAwayDAO" %>
<%@ page import="game.HomeWantAway" %>
<%@ page import="game.AwayApply" %>
<%@ page import="game.AwayApplyDAO" %>
<%@ page import="java.util.ArrayList"%>
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
    function matchAction(apply_id) {
        location.href = "HomeAwayMatchAction.jsp?apply_id="+apply_id;
    }
    function matchCancelAction(apply_id) {
        location.href = "H-A-MatchCancelAction.jsp?apply_id="+apply_id;
    }
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
            내 홈 게임 정보
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
            <button type="button" class="game-exist-btn" onclick="">
                취소
            </button>
        </div>
        <br>
        <br>
        <hr>
        <div id="type-of-game">
            신청한 어웨이 팀들
        </div>
        <br>
        <br>
        <%
            AwayApplyDAO awayApplyDAO = new AwayApplyDAO();
            ArrayList<AwayApply> list = awayApplyDAO.getAppliedGamesByGameId(game_id);
            int check = 0;
            for(int i = 0; i < list.size(); i++) {
                if(list.get(i).getAccept_status() == 1) {
                    check = 1;
                    break;
                }
            }
            if(list.isEmpty()) {
        %>
        <div>
            신청한 팀이 없습니다.
        </div>
        <%
            } else {
                if(check == 0){
                    for(int i = 0; i < list.size(); i++) {
                        if(list.get(i).getAccept_status() == 0) {
        %>
        <%=list.get(i).getAway_id()%>-<%=list.get(i).getAway_people()%>-<%=list.get(i).getAway_level()%>-<%=list.get(i).getAway_age()%>
        <button type="button" class="game-exist-btn" value="<%=list.get(i).getApply_id()%>" onclick="matchAction(this.value)">
            매칭
        </button>
        <br>
        <%
                }}}}
        %>
        <br>
        <br>
        <hr>
        <div id="type-of-game">
            매칭된 팀
        </div>
        <br>
        <br>
        <%
             for(int i = 0; i < list.size(); i++) {
                if(list.get(i).getAccept_status() == 1) {
        %>
        <%=list.get(i).getAway_id()%>-<%=list.get(i).getAway_people()%>-<%=list.get(i).getAway_level()%>-<%=list.get(i).getAway_age()%>
        <button type="button" class="game-exist-btn" value="<%=list.get(i).getApply_id()%>" onclick="matchCancelAction(this.value)">
            취소
        </button>
        <%
                }}
        %>

        <!-- 본문 끝-->
    </div>
    <!-- //container -->

      
    
</body>
</html>