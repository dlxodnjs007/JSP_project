<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="game.PickupDAO" %>
<%@ page import="game.Pickup" %>
<%@ page import="user.User" %>
<%@ page import="user.UserDAO" %>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>오직농구</title>
	<link href="./css/base.css?after" rel="stylesheet">
    <link href="./css/common.css?after" rel="stylesheet">
    <link href="./css/main.css?after" rel="stylesheet">
    <link href="./css/mypage.css?after" rel="stylesheet">
</head>
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
            해당 홈 게임 정보
        </div>
        <%
            PickupDAO pickupDAO = new PickupDAO();
            Pickup pickup = pickupDAO.getGameById(game_id);
            UserDAO userDAO = new UserDAO();
            User user = userDAO.getUserByUserId(user_id);
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
        </div>
        <hr>
        <%
            if(pickup.getHome_id().equals(user_id)) {
        %>
        <div>
            내가 등록한 게임입니다. 신청이 안됩니다.
        </div>
        <%
            }else{
        %>
        <form id="pickup_apply" name="form" method="post" action="./PickupApplyAction.jsp">
            <input type="text" name="game_id_no" style="display: none;" value="<%=game_id%>">
            <input type="text" name="guest_id" style="display: none;" value="<%=user_id%>">
            <input type="text" name="name" style="display: none;" value="<%=user.getName()%>">
            <input type="text" name="height" style="display: none;" value="<%=user.getHeight()%>">
            <dl class="make-game-info">
                <dt class="essential">내 포지션</dt>
                <dd>
                    <select class="select-box" name="position" form="pickup_apply">
                        <option value="1">1번</option>
                        <option value="2">2번</option>
                        <option value="3">3번</option>
                        <option value="4">4번</option>
                        <option value="5">5번</option>
                    </select>
                </dd>
            </dl>
            <dl class="make-game-info">
                <dt class="essential">내 나이</dt>
                <dd>
                    <select class="select-box" name="age" form="pickup_apply">
                        <option value="late_10dae">10대 후반</option>
                        <option value="early_20dae">20대 초반</option>
                        <option value="middle_20dae">20대 중반</option>
                        <option value="late_20dae">20대 후반</option>
                        <option value="early_30dae">30대 초반</option>
                        <option value="middle_30dae">30대 중반</option>
                        <option value="late_30dae">30대 후반</option>
                    </select>
                </dd>
            </dl>
            <button type="submit" class="game-exist-btn">
                신청
            </button>
        </form>
        <%
            }
        %>
        <br>
        <br>
        <!-- 본문 끝-->
    </div>
    <!-- //container -->

      
    
</body>
</html>