<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>오직농구</title>
	<link href="./css/base.css?after" rel="stylesheet">
    <link href="./css/common.css?after" rel="stylesheet">
    <link href="./css/main.css?after" rel="stylesheet">
</head>
<body>
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
            	<div id="matching_btn">
	                <button type="button"><img  src="./images/home_btn.png"></button>
	                <button type="button"><img  src="./images/away_btn.png"></button>
	                <button type="button"><img  src="./images/guest_btn.png"></button>
            	</div>
            </div>
            <!-- //본문 -->
            
            <!-- aside -->
            <div id="aside-wrap">
                <div id="rightside">
                    <!-- login -->
                    <script>
                        window.rightside = true;
                        loginProc.loadVaild("#loginForm", false);
                    </script>
                    <div class="login-wrap">
                        <form onsubmit="return false" id="loginForm" method="post" accept-charset="utf-8"
                            novalidate="novalidate">
                            <div class="login-set">
                                <span class="login-chk"><input type="checkbox" class="chk-lock" id="autoLogin"
                                        name="autoLogin" value="Y"><label for="autoLogin"><span
                                            class="ico-chk"></span>로그인 상태 유지</label></span>
                                <span class="check_security"></span>
                            </div>
                            <div class="login-box">
                                <span><input type="text" placeholder="아이디" name="user_id"><input type="password"
                                        name="password" placeholder="비밀번호"></span>
                                <button type="submit"><span>로그인</span></button>
                            </div>
                        </form>
                        <div class="user-util"><a href="/member/joinform">회원가입</a><a href="/member/find/id">아이디·비밀번호
                                찾기</a></div>
                    </div>
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