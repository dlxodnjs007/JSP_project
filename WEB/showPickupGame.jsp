<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="game.PickupDAO" %>
<%@ page import="game.Pickup" %>
<%@ page import="game.PickupApply" %>
<%@ page import="game.PickupApplyDAO" %>
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
    function pickupCancel(cancel_info) {
        location.href = "PickupCancelAction.jsp?"+cancel_info;
    }
    function match(apply_id) {
        location.href = "PickupMatchAction.jsp?apply_id="+apply_id;
    }
    function matchCancel(apply_id) {
        location.href = "PickupMatchCancelAction.jsp?apply_id="+apply_id;
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
            내 홈 게임 정보 — 픽업게임
        </div>
        <%
            PickupDAO pickupDAO = new PickupDAO();
            Pickup pickup = pickupDAO.getGameById(game_id);
        %>
        <div class="game-exist">
            <%=pickup.getRoadAddrPart1()%>
            <br>
            <%=pickup.getDate().substring(0,9)%>
            |&nbsp<%=pickup.getDate().substring(11,12)%>시
            <%=pickup.getDate().substring(14,15)%>분
            <br>
            <%=pickup.getPeople()%>
            <br>
            <%=pickup.getLevel()%>
            <br>
            <%=pickup.getAge()%>
            <br>
            <%=pickup.getColor()%>
            <br>
            <%=pickup.getShower()%>
            <br>
            <%=pickup.getParking()%>
            <br>
            <%=pickup.getWarning()%>
            <br>
            <button type="button" class="game-exist-btn" value="id_no=<%=game_id%>&home_id=<%=user_id%>" onclick="pickupCancel(this.value)">
                취소
            </button>
        </div>
        <br>
        <br>
        <hr>
        <div id="type-of-game">
            신청한 게스트들
        </div>
        <br>
        <br>
        <%
            PickupApplyDAO pickupApplyDAO = new PickupApplyDAO();
            ArrayList<PickupApply> list = pickupApplyDAO.getPickupAppliesByGameId(game_id);
            
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
                for(int i = 0; i < list.size(); i++) {
                    if(list.get(i).getAccept_status() == 0) {
        %>
        <%=list.get(i).getName()%>&nbsp—&nbsp<%=list.get(i).getGuest_id()%>&nbsp—&nbsp<%=list.get(i).getHeight()%>&nbsp—&nbsp<%=list.get(i).getPosition()%>&nbsp—&nbsp<%=list.get(i).getAge()%>
        <button type="button" class="game-exist-btn" value="<%=list.get(i).getApply_id()%>" onclick="match(this.value)">
            매칭
        </button>
        <br>
        <%
                }}}
        %>
        <br>
        <br>
        <hr>
        <div id="type-of-game">
            매칭된 게스트
        </div>
        <br>
        <br>
        <%
             for(int i = 0; i < list.size(); i++) {
                if(list.get(i).getAccept_status() == 1) {
        %>
        <%=list.get(i).getName()%>&nbsp—&nbsp<%=list.get(i).getGuest_id()%>&nbsp—&nbsp<%=list.get(i).getHeight()%>&nbsp—&nbsp<%=list.get(i).getPosition()%>&nbsp—&nbsp<%=list.get(i).getAge()%>
        <button type="button" class="game-exist-btn" value="<%=list.get(i).getApply_id()%>" onclick="matchCancel(this.value)">
            취소
        </button>
        <br>
        <%
                }}
        %>

        <!-- 본문 끝-->
    </div>
    <!-- //container -->

      
    
</body>
</html>