<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="game.PickupDAO" %>
<%@ page import="game.Pickup" %>
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
            내가 신청한 게임 - 승인 완료
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
            <form name="post" method="post" action="/pickupApplyCancelAction.jsp">
                <input type="text" name="game_id_no" style="display: none;" value="<%=game_id%>">
                <input type="text" name="guest_id" style="display: none;" value="<%=user_id%>">
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