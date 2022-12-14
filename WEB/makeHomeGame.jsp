<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>오직농구</title>
	<link href="./css/base.css?after" rel="stylesheet">
    <link href="./css/common.css?after" rel="stylesheet">
    <link href="./css/main.css?after" rel="stylesheet">
    <link href="./css/board.css?after" rel="stylesheet">
    <link href="./css/mypage.css?after" rel="stylesheet">
    <script>
        function chooseForm(radioname) {
            var radios = document.getElementsByName(radioname);
            for(var i = 0, length = radios.length; i < length; i++) {
                document.getElementById(radios[i].value + '-form').style.display = 'none';
                if(radios[i].checked) {
                    document.getElementById(radios[i].value + '-form').style.display = 'block';
                }
            }
        }

        function goPopup(game){
            // 주소검색을 수행할 팝업 페이지를 호출합니다.
            // 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://business.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
            var pop = window.open("/jusoPopup.jsp?id="+game,"pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
            
            // 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://business.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
            //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
        }

        function jusoCallBack(roadAddrPart1){
            // 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
            document.form.roadAddrPart1.value = roadAddrPart1;
        }

        function pickup_jusoCallBack(roadAddrPart1){
            // 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
            document.pickup_form.roadAddrPart1.value = roadAddrPart1;
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
                <div class="account-body" id="step_2">
                    <div id="game-making-button">
                        <input type="radio" name="which-game" value="want-away" onclick="chooseForm(this.name)" checked="checked">어웨이팀을 원해요
                        &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp 
                        <input type="radio" name="which-game" value="want-guest" onclick="chooseForm(this.name)">게스트를 원해요
                        &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp 
                        <input type="radio" name="which-game" value="want-pickup" onclick="chooseForm(this.name)">픽업게임 만들기
                    </div>
                    <!-- 어웨이팀을 원해요 폼 시작 -->
                    <form id="want-away-form" name="form" method="post" action="homeWantAwayAction.jsp" >
                        <div class="section">
                            <input type="text" name="home_id" style="display: none;" value="<%=user_id%>">
                            
                            <dl class="make-game-info">
                                <dt class="essential">내 팀 이름</dt>
                                <dd>
                                    <span class="item-value modify-on">
                                        <input type="text" name="h_team_name" placeholder="팀이름을 입력하세요">
                                    </span>
                                </dd>
                            </dl>
                            <dl class="make-game-info">
                                <dt class="essential">시합 장소</dt>
                                <dd>
                                    <span class="item-value modify-on">
                                        <input type="text" id="roadAddrPart1" name="roadAddrPart1" readonly>
                                    </span>
                                    <button type="button" id="juso-search" class="juso-search" value="away" onclick="goPopup(this.value)">
                                        <span>
                                            <em>주소 검색</em>
                                        </span>
                                    </button>
                                </dd>
                            </dl>
                            <dl class="make-game-info">
                                <dt class="essential">시합 날짜 및 시간</dt>
                                <dd>
                                    <input type="datetime-local" name="date" id="game_date_time" >
                                </dd>
                            </dl>
                            <dl class="make-game-info">
                                <dt class="essential">홈 팀 인원</dt>
                                <dd>
                                    <select class="select-box" name="home_people" form="want-away-form">
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
                                <dt class="essential">홈 팀 나이대</dt>
                                <dd>
                                    <select class="select-box" name="home_age" form="want-away-form">
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
                            <dl class="make-game-info">
                                <dt class="essential">홈 팀 유니폼 색상</dt>
                                <dd>
                                    <select class="select-box" name="home_uniform" form="want-away-form">
                                        <option value="red">빨강</option>
                                        <option value="blue">파랑</option>
                                        <option value="black">검정</option>
                                        <option value="white">하양</option>
                                        <option value="yellow">노랑</option>
                                        <option value="green">초록</option>
                                        <option value="pink">분홍</option>
                                        <option value="orange">주황</option>
                                        <option value="purple">보라</option>
                                    </select>
                                </dd>
                            </dl>
                            <dl class="make-game-info">
                                <dt class="essential">바라는 어웨이 팀 인원</dt>
                                <dd>
                                    <select class="select-box" name="away_people" form="want-away-form">
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
                                <dt class="essential">바라는 어웨이 팀 실력</dt>
                                <dd>
                                    <select class="select-box" name="away_level" form="want-away-form">
                                        <option value="S">S</option>
                                        <option value="A">A</option>
                                        <option value="B">B</option>
                                        <option value="C">C</option>
                                    </select>
                                </dd>
                            </dl>
                            <dl class="make-game-info">
                                <dt class="essential">바라는 어웨이 팀 나이대</dt>
                                <dd>
                                    <select class="select-box" name="away_age" form="want-away-form">
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
                            <dl class="make-game-info">
                                <dt class="essential">샤워 시설</dt>
                                <dd class="radio">
                                <input type="radio" name="shower" value="shower_yes">유
                                &nbsp &nbsp 
                                <input type="radio" name="shower" value="shower_no">무
                                </dd>
                            </dl>
                            <dl class="make-game-info">
                                <dt class="essential">주차 시설</dt>
                                 <dd class="radio">
                                <input type="radio" name="parking" value="parking_yes">유
                                &nbsp &nbsp 
                                <input type="radio" name="parking" value="parking_no">무
                                </dd>
                            </dl>
                            <dl class="make-game-info">
                                <dt class="essential">기타 주의 사항</dt>
                                <dd>
                                <textarea name="warning" cols="40" rows="4"></textarea>
                                </dd>
                            </dl>
                        </div>
                        <!--버튼-->
                        <div class="btn-wrap">
                            <button type="submit" class="btn-orange-big">
                                <span>
                                    <em>등록</em>
                                </span>
                            </button>
                        </div>
                    </form>
                    <!-- 어웨이팀을 원해요 폼 끝 -->
                    <!-- 게스트를 원해요 폼 시작 -->
                    <form id="want-guest-form" method="post" action="GameWantAwayAction.jsp">
                        <div class="section">
                            <input type="text" name="home_id" style="display: none;" value="<%=user_id%>">
                            <dl class="make-game-info">
                                <dt class="essential">시합 장소</dt>
                                <dd>
                                    <span class="item-value modify-on">
                                        <input type="text" id="pickup_juso" name="pickup_juso" readonly>
                                    </span>
                                    <button type="button" id="juso-search" class="juso-search" onclick="pickup_goPopup()">
                                        <span>
                                            <em>주소 검색</em>
                                        </span>
                                    </button>
                                </dd>
                            </dl>
                            <dl class="make-game-info">
                                <dt class="essential">시합 날짜 및 시간</dt>
                                <dd>
                                    <input type="datetime-local" name="game_date_time" id="game_date_time" >
                                </dd>
                            </dl>
                            <dl class="make-game-info">
                                <dt class="essential">홈 팀 인원</dt>
                                <dd>
                                    <select class="select-box" name="home_people_count" form="want-away-form">
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
                                <dt class="essential">홈 팀 나이대</dt>
                                <dd>
                                    <select class="select-box" name="home_age" form="want-away-form">
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
                            <dl class="make-game-info">
                                <dt class="essential">홈 팀 유니폼 색상</dt>
                                <dd>
                                    <select class="select-box" name="home_uniform" form="want-away-form">
                                        <option value="red">빨강</option>
                                        <option value="blue">파랑</option>
                                        <option value="black">검정</option>
                                        <option value="white">하양</option>
                                        <option value="yellow">노랑</option>
                                        <option value="green">초록</option>
                                        <option value="pink">분홍</option>
                                        <option value="orange">주황</option>
                                        <option value="purple">보라</option>
                                    </select>
                                </dd>
                            </dl>
                            <dl class="make-game-info">
                                <dt class="essential">바라는 어웨이 팀 인원</dt>
                                <dd>
                                    <select class="select-box" name="away_people_count" form="want-away-form">
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
                                <dt class="essential">바라는 어웨이 팀 실력</dt>
                                <dd>
                                    <select class="select-box" name="away_people_count" form="want-away-form">
                                        <option value="S">S</option>
                                        <option value="A">A</option>
                                        <option value="B">B</option>
                                        <option value="C">C</option>
                                    </select>
                                </dd>
                            </dl>
                            <dl class="make-game-info">
                                <dt class="essential">바라는 어웨이 팀 나이대</dt>
                                <dd>
                                    <select class="select-box" name="away_age" form="want-away-form">
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
                            <dl class="make-game-info">
                                <dt class="essential">샤워 시설</dt>
                                <dd class="radio">
                                <input type="radio" name="can_shower" value="shower_yes">유
                                &nbsp &nbsp 
                                <input type="radio" name="can_shower" value="shower_no">무
                                </dd>
                            </dl>
                            <dl class="make-game-info">
                                <dt class="essential">주차 시설</dt>
                                 <dd class="radio">
                                <input type="radio" name="can_parking" value="parking_yes">유
                                &nbsp &nbsp 
                                <input type="radio" name="can_parking" value="parking_no">무
                                </dd>
                            </dl>
                            <dl class="make-game-info">
                                <dt class="essential">기타 주의 사항</dt>
                                <dd>
                                <textarea name="warning" cols="40" rows="4">
                                </textarea>
                                </dd>
                            </dl>
                        </div>
                        <!--버튼-->
                        <div class="btn-wrap">
                            <button type="submit" class="btn-orange-big">
                                <span>
                                    <em>등록</em>
                                </span>
                            </button>
                        </div>
                    </form>
                    <!-- 게스트를 원해요 폼 끝 -->
                    <!-- 픽업게임을 원해요 폼 시작 -->
                    <form id="want-pickup-form" name="pickup_form" method="post" action="makePickupAction.jsp">
                        <div class="section">
                            <input type="text" name="home_id" style="display: none;" value="<%=user_id%>">
                            
                            <dl class="make-game-info">
                                <dt class="essential">시합 장소</dt>
                                <dd>
                                    <span class="item-value modify-on">
                                        <input type="text" id="roadAddrPart1" name="roadAddrPart1" readonly>
                                    </span>
                                    <button type="button" id="juso-search" class="juso-search" value="pickup" onclick="goPopup(this.value)">
                                        <span>
                                            <em>주소 검색</em>
                                        </span>
                                    </button>
                                </dd>
                            </dl>
                            <dl class="make-game-info">
                                <dt class="essential">시합 날짜 및 시간</dt>
                                <dd>
                                    <input type="datetime-local" name="date" id="game_date_time" >
                                </dd>
                            </dl>
                            <dl class="make-game-info">
                                <dt class="essential">바라는 게스트 인원</dt>
                                <dd>
                                    <select class="select-box" name="people" form="want-pickup-form">
                                        <option value="11people">11명</option>
                                        <option value="12people">12명</option>
                                        <option value="13people">13명</option>
                                        <option value="14people">14명</option>
                                        <option value="15people">15명</option>
                                        <option value="16people">16명</option>
                                        <option value="17people">17명</option>
                                        <option value="18people">18명</option>
                                        <option value="19people">19명</option>
                                        <option value="20people">20명</option>
                                    </select>
                                </dd>
                            </dl>
                            <dl class="make-game-info">
                                <dt class="essential">게임 수준</dt>
                                <dd>
                                    <select class="select-box" name="level" form="want-pickup-form">
                                        <option value="S">S</option>
                                        <option value="A">A</option>
                                        <option value="B">B</option>
                                        <option value="C">C</option>
                                    </select>
                                </dd>
                            </dl>
                            <dl class="make-game-info">
                                <dt class="essential">게스트 나이대</dt>
                                <dd>
                                    <select class="select-box" name="age" form="want-pickup-form">
                                        <option value="every">관계없음</option>
                                        <option value="20dae">20대</option>
                                        <option value="30dae">30대</option>
                                        <option value="40dae">40대</option>
                                    </select>
                                </dd>
                            </dl>
                            <dl class="make-game-info">
                                <dt class="essential">운동복 색상</dt>
                                <dd>
                                    <select class="select-box" name="color" form="want-pickup-form">
                                        <option value="BandW">검정/하양</option>
                                        <option value="RandB">빨강/파랑</option>
                                    </select>
                                </dd>
                            </dl>
                            <dl class="make-game-info">
                                <dt class="essential">샤워 시설</dt>
                                <dd class="radio">
                                <input type="radio" name="can_shower" value="shower_yes">유
                                &nbsp &nbsp 
                                <input type="radio" name="can_shower" value="shower_no">무
                                </dd>
                            </dl>
                            <dl class="make-game-info">
                                <dt class="essential">주차 시설</dt>
                                 <dd class="radio">
                                <input type="radio" name="can_parking" value="parking_yes">유
                                &nbsp &nbsp 
                                <input type="radio" name="can_parking" value="parking_no">무
                                </dd>
                            </dl>
                            <dl class="make-game-info">
                                <dt class="essential">기타 주의 사항</dt>
                                <dd>
                                <textarea name="warning" cols="40" rows="4"></textarea>
                                </dd>
                            </dl>
                        </div>
                        <!--버튼-->
                        <div class="btn-wrap">
                            <button type="submit" class="btn-orange-big">
                                <span>
                                    <em>등록</em>
                                </span>
                            </button>
                        </div>
                    </form>
                    <!-- 픽업게임을 원해요 폼 끝 -->
                </div>
                <!-- 본문 끝-->           
            </div>
            <!-- aside 시작 -->
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