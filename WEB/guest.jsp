<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="game.PickupDAO" %>
<%@ page import="game.Pickup" %>
<%@ page import="game.PickupApply" %>
<%@ page import="game.PickupApplyDAO" %>
<%@ page import="java.io.PrintWriter"%>
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
    <link href="./css/mypage.css?after" rel="stylesheet">
    <script>
        function goPopupShowPickup(game_id){
            var pop = window.open("/showPickupNotApproved.jsp?id=" + game_id,"pop","width=600,height=670, scrollbars=yes, resizable=yes, left=200, top=200");
        }
        function goPopupShowPickupApproved(game_id){
            var pop = window.open("/showPickupApproved.jsp?id=" + game_id,"pop","width=600,height=670, scrollbars=yes, resizable=yes, left=200, top=200");
        }
    </script>
</head>
<body>
    <%
        String user_id = null;
        if(session.getAttribute("user_id") != null) {
            user_id = (String) session.getAttribute("user_id");
        }
    %>
	<div id="wrap">
        <!-- header -->
        <div id="header">
            <div id="gnb-top" class="bg-season"
                style="display: block; background: url('./images/logo.png') no-repeat center 0;">
                <div class="gnb-fix-area">
                    <h1 class="logo-link"><a href="./main.jsp">오직 농구 only basketball</a></h1>
                </div>
            </div>
            <!-- GNB -->
            <div id="gnb">
                <ul id="menu" class="gnb-list drop-menu">
                    <li><a href="./popular.jsp">오직인기</a></li>
                    <li><a href="./general.jsp">오직컨텐츠</a></li>
                    <li><a href="./matching.jsp">오직매칭</a></li>
                    <li><a href="./market.jsp">오직거래</a></li>
                    <li><a href="./gym.jsp">오직대관</a></li>
                </ul>
            </div>
            <!-- //GNB -->
        </div>
        <!-- //header -->
        <!-- container -->
        <div id="container">
            <!-- 본문 -->
            <div id="content-wrap">
                <div id="type-of-game">
                    내가 게스트
                </div>
                <div class="away-approve">
                    <hr>
                    승인 대기중
                    <%
                        PickupApplyDAO pickupApplyDAO = new PickupApplyDAO();
                        ArrayList<PickupApply> listPA = pickupApplyDAO.getNotAcceptedGamesByUserId(user_id);
                        ArrayList<Pickup> listP = new ArrayList<Pickup>();
                        ArrayList<PickupApply> notAcceptListPA = new ArrayList<PickupApply>();
                        
                        for(int i = 0; i < listPA.size(); i++) {
                                ArrayList<PickupApply> listPAGameId = pickupApplyDAO.getPickupGamesByGameId(listPA.get(i).getGame_id_no());

                                int check = 0;
                                for(int k = 0; k < listPAGameId.size(); k++) {
                                    if(listPAGameId.get(k).getAccept_status() == 1) {
                                        check = 1;
                                        break;
                                    }
                                }

                                if(check == 0) {
                                    listP.add(pickupApplyDAO.getPickupById(listPA.get(i).getGame_id_no()));
                                }
                                if(check == 0) {
                                    notAcceptListPA.add(pickupApplyDAO.getPickupApplyByGameId(listPA.get(i).getGame_id_no()));
                                }
                        }

                        if(notAcceptListPA.isEmpty() && listP.isEmpty()) {
                    %>
                    <div id="no-game">
                    승인 대기 중인 경기가 없습니다.
                    </div>
                    <%
                        } else {
                            for(int j = 0; j < listP.size(); j++) {
                    %>
                    <div class="game-exist">
                        <button type="button" class="game-exist-btn" value="<%=listP.get(j).getId_no()%>" onclick="goPopupShowPickup(this.value)">
                            <%=listP.get(j).getRoadAddrPart1()%>
                            —&nbsp<%=listP.get(j).getDate().substring(0,9)%>
                            —&nbsp<%=listP.get(j).getDate().substring(11,12)%>시
                            <%=listP.get(j).getDate().substring(14,15)%>분
                        </button>
                    </div>
                    <%
                            }}
                    %>
                </div> 
                <div class="pickup-approve">
                    <hr>
                    승인 완료
                    <%
                        ArrayList<PickupApply> acceptedlistPA = pickupApplyDAO.getAcceptedGamesByUserId(user_id);
                        if(acceptedlistPA.isEmpty()) {
                    %>
                    <div id="no-game">
                    승인 완료된 경기가 없습니다.
                    </div>
                    <%
                        } else {
                            
                            for(int i = 0; i < acceptedlistPA.size(); i++) {
                                ArrayList<Pickup> acceptedlistP = pickupApplyDAO.getGamesByGameId(acceptedlistPA.get(i).getGame_id_no());
                                for(int j = 0; j < acceptedlistP.size(); j++) {
                                
                    %>
                    <div class="game-exist">
                        <button type="button" class="game-exist-btn" value="<%=acceptedlistP.get(j).getId_no()%>" onclick="goPopupShowPickupApproved(this.value)">
                            <%=acceptedlistP.get(j).getRoadAddrPart1()%>
                            |&nbsp<%=acceptedlistP.get(j).getDate().substring(0,9)%>
                            |&nbsp<%=acceptedlistP.get(j).getDate().substring(11,12)%>시
                            <%=acceptedlistP.get(j).getDate().substring(14,15)%>분
                        </button>
                    </div>
                    <%
                            }}}
                    %>
                </div>
                <div id="matching_btn">
                    <button type="button" onclick="location.href='./guestWantHome.jsp'">게스트 신청하기</button>
                </div>
            </div>
            <!-- //본문 -->
            
            <!-- aside -->
            <div id="aside-wrap">
                <div id="rightside">
                    <%
                        if(user_id == null) {
                    %>
                    <div class="login-wrap">
                        <form id="loginForm" method="post" action="loginAction.jsp" accept-charset="utf-8">
                            <div class="login-box">
                                <span>
                                    <input type="text" name="user_id" placeholder="아이디" >
                                    <input type="password" name="password" placeholder="비밀번호">
                                </span>
                                <button type="submit"><span>로그인</span></button>
                            </div>
                        </form>
                        <div class="user-util">
                            <a href="/join.jsp">회원가입</a>
                            <a href="/member/find/id">아이디·비밀번호 찾기</a>
                        </div>
                    </div>
                    <%
                        } else {
                    %>
                    <div class="logout-wrap">
                            <div class="logout-box">
                                <button type="button" onclick="location.href='./logoutAction.jsp'">내 정보</button><br>
                                <button type="button" onclick="location.href='./logoutAction.jsp'">내 팀 정보</button><br>
                                <button type="button" onclick="location.href='./logoutAction.jsp'">로그아웃</button>
                            </div>
                    </div>
                    <%
                        }
                    %>
                    <!-- //login -->
                </div>
            </div>
            <!-- aside 끝 -->
        </div>
        <!-- //container -->

        <!-- footer -->
        <div id="footer">
        </div>
        <!-- //footer -->
    </div>
</body>
</html>