<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>오직농구</title>
    <link href="./css/base.css" rel="stylesheet">
    <link href="./css/common.css" rel="stylesheet">
    <link href="./css/main.css" rel="stylesheet">
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
                <!-- widget -->
                <div class="widget-wrap">
                    <div class="widget">
                        <h2><a href="./popular.jsp">오직인기</a></h2>
                        <a href="./popular.jsp" class="widget-more">+</a>
                        <ul>
                            <li>
                                <div class="item-wrap">
									<span class="title-wrap"><span class="date">2022-09-08</span>
                                    <a href="/view/11438096795" class="title">test제목</a></span>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <div class="widget widget-right">
                        <h2><a href="./general.jsp">오직컨텐츠</a></h2>
                        <a href="./general.jsp" class="widget-more">+</a>
                        <ul>
                            <li>
                                <div class="item-wrap">
                                	<span class="title-wrap">
                                		<span class="date">2022-09-08</span>
                                		<a href="/view/11438106259" class="title">test제목</a>
                                		</span>
                                </div>
                            </li>

                        </ul>
                    </div>           
                    <div class="widget">
                        <h2><a href="./popular.jsp">오직거래</a></h2>
                        <a href="./popular.jsp" class="widget-more">+</a>
                        <ul>
                            <li>
                                <div class="item-wrap">
									<span class="title-wrap"><span class="date">2022-09-08</span>
                                    <a href="/view/11438096795" class="title">test제목</a></span>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <div class="widget widget-right">
                        <h2><a href="./general.jsp">오직대관</a></h2>
                        <a href="./general.jsp" class="widget-more">+</a>
                        <ul>
                            <li>
                                <div class="item-wrap">
                                	<span class="title-wrap">
                                		<span class="date">2022-09-08</span>
                                		<a href="/view/11438106259" class="title">test제목</a>
                                		</span>
                                </div>
                            </li>

                        </ul>
                    </div> 
                </div>
            </div>
            <!-- //본문 -->
            
            <!-- aside -->
            <div id="aside-wrap">
                <div id="rightside">
                    <!-- login -->
                    <!-- <script>
                        window.rightside = true;
                        loginProc.loadVaild("#loginForm", false);
                    </script> -->
                    <%
                        if(user_id == null) {
                    %>
                    <div class="login-wrap">
                        <form id="loginForm" method="post" action="loginAction.jsp" accept-charset="utf-8">
                            <!-- onsubmit="return false" -->
                            <!-- <div class="login-set">
                                <span class="login-chk"><input type="checkbox" class="chk-lock" id="autoLogin"
                                        name="autoLogin" value="Y"><label for="autoLogin"><span
                                            class="ico-chk"></span>로그인 상태 유지</label></span>
                                <span class="check_security"></span>
                            </div> -->
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
                                <button type="button"><a href="logoutAction.jsp">회원관리</a></button>
                                <button type="button"><a href="logoutAction.jsp">로그아웃</a></button>
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