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
        </div>
        <hr>
        <%
            if(homeWantAway.getHome_id().equals(user_id)) {
        %>
        <div>
            내가 등록한 게임입니다. 신청이 안됩니다.
        </div>
        <%
            }else{
        %>
        <form id="away_apply" name="form" method="post" action="./AwayApplyAction.jsp">
            <input type="text" name="game_id_no" style="display: none;" value="<%=game_id%>">
            <input type="text" name="away_id" style="display: none;" value="<%=user_id%>">
            <dl class="make-game-info">
                <dt class="essential">내 팀 이름</dt>
                <dd>
                    <span class="item-value modify-on">
                        <input type="text" name="a_team_name" placeholder="팀이름을 입력하세요">
                    </span>
                </dd>
            </dl>
            <dl class="make-game-info">
                <dt class="essential">내 팀 인원</dt>
                <dd>
                    <select class="select-box" name="away_people" form="away_apply">
                        <option value="5people">5명</option>
                        <option value="6people">6명</option>
                        <option value="7people">7명</option>
                        <option value="8people">8명</option>
                        <option value="9people">9명</option>
                        <option value="10people">10명</option>
                        <option value="11people">11명</option>
                        <option value="12people">12명</option>
                    </select>
                </dd>
            </dl>
            <dl class="make-game-info">
                <dt class="essential">내 팀 실력</dt>
                <dd>
                    <select class="select-box" name="away_level" form="away_apply">
                        <option value="S">S</option>
                        <option value="A">A</option>
                        <option value="B">B</option>
                        <option value="C">C</option>
                    </select>
                </dd>
            </dl>
            <dl class="make-game-info">
                <dt class="essential">내 팀 나이대</dt>
                <dd>
                    <select class="select-box" name="away_age" form="away_apply">
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