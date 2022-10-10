<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>오직농구</title>
    <link href="./css/base.css?after" rel="stylesheet">
    <link href="./css/common.css?after" rel="stylesheet">
    <link href="./css/main.css?after" rel="stylesheet">
    <link href="./css/board.css?after" rel="stylesheet">
    <link href="./css/mypage.css?after" rel="stylesheet">
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
            <div class="account-body" id="step_2">
                <form id="joinForm" method="post" action="joinAction.jsp">
                    <div class="section">
                        <h2 class="content-title">기본 정보</h2>
                        <dl>
                            <dt class="essential">아이디</dt>
                            <dd><span class="item-value modify-on"><input type="text" name="user_id" id="user_id" placeholder="아이디를 입력해주세요."></span>
                            </dd>
                        </dl>
                        <dl>
                            <dt class="essential">비밀번호</dt>
                            <dd><span class="item-value modify-on"><input type="password" name="password" id="password" placeholder="비밀번호를 입력해주세요."></span>
                            </dd>
                        </dl>
                        <dl>
                            <dt class="essential">이름</dt>
                            <dd><span class="item-value modify-on"><input type="text" name="name" id="name" placeholder="이름을 입력해주세요."></span>
                            </dd>
                        </dl>
                    </div>
                    <div class="section second-board">
                        <h2 class="content-title">인증을 위해 이메일 입력</h2>
                        <dl>
                            <dt class="essential">이메일 인증</dt>
                            <dd><span class="item-value modify-on"><input type="text" name="email" id="email_address" placeholder="이메일을 입력해주세요."></span>
                            <p class="txt-hint txt-aleat"></p>
                            </dd>
                        </dl>
                    </div>
                    <div class="btn-wrap"><button type="submit" class="btn-orange-big"><span><em>회원가입</em></span></button></div>
                </form>
            </div>

            <!-- //본문 -->
            
            <!-- aside -->
            <div id="aside-wrap">
                
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