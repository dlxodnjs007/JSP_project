<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
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
            <!-- ???? -->
            <div id="content-wrap">
                <div class="board-wrap">
                    <!-- ??? -->
                    <div class="board-list">

                        <script src="/js/board/thumb.js?202292"></script>

                        <script>
                            window.boardId = "ilbe";
                            function changeListSize(val) {
                                $("#searchForm input[name=listSize]").val(val);
                                searchList(1);
                            }
                            function listStyle(val) {
                                $("#searchForm input[name=listStyle]").val(val);
                                //$("#searchForm")[0].submit();
                                searchList(0);
                            }


                            $(".write-num strong").html("847,729");

                        </script>
                        <script src="/oa/ad_bbs_list.js?202292"></script>

                        <div class="board-header">
                            <h2><a href="./popular.jsp">?α??</a><span class="ico-bookmark" data-mid="ilbe"
                                    data-name="?α??" onclick="bookmark(this)"></span></h2>
                        </div>
                        <ul class="board-body">
                            <li class="title-line">
                                <span class="count">???</span>
                                <span class="nick">?г???</span>
                                <span class="date list_sort " data-order="date" style="cursor: pointer;">???</span>
                            </li>
                            <li>

                                <span class="count">847,729</span>

                                <span class="title ">
                                    <a href="/view/11438123217" class="subject ">test????</a>
                                </span>
                                <span class="global-nick nick">test?г???</span>

                                <span class="date">00:07:16</span>
                            </li>
                        </ul>


                        <div class="post-btn-wrap">
                            <div class="btn-left">
                                <button type="button" onclick="location.href='/list/ilbe'" id="list_back"
                                    class="btn-default"><span>???</span></button>
                            </div>
                            <div class="paginate">
                                <a href="javascript:;" onclick="searchList(1)" class="prev"><span></span>????</a>
                                <a href="javascript:;" onclick="searchList(1)" class="page-on">1</a>
                                <a href="javascript:;" onclick="searchList(2)">2</a>
                                <a href="javascript:;" onclick="searchList(3)">3</a>
                                <a href="javascript:;" onclick="searchList(4)">4</a>
                                <a href="javascript:;" onclick="searchList(5)">5</a>
                                <a href="javascript:;" onclick="searchList(6)">6</a>
                                <a href="javascript:;" onclick="searchList(7)">7</a>
                                <a href="javascript:;" onclick="searchList(8)">8</a>
                                <a href="javascript:;" onclick="searchList(9)">9</a>
                                <a href="javascript:;" onclick="searchList(10)">10</a>
                                <a href="javascript:;" onclick="searchList(11)" class="next">????<span></span></a>
                                <a href="javascript:;" style="display:none;" onclick="searchList(2)"
                                    class="accesskey_118" accesskey="v"></a>
                            </div>
                        </div>

                        <script>

                            $(function () {
                                $(".list_sort").each(function () {
                                    $(this).css("cursor", "pointer");
                                    $(this).click(function () {

                                        var order = $(this).attr("data-order");
                                        var sort = $(this).hasClass("asc") ? "desc" : "asc";
                                        $("#searchForm input[name=order]").val(order);
                                        $("#searchForm input[name=sort]").val(sort);
                                        searchList(1);
                                    });
                                });
                            });
                        </script>

                    </div>
                    <!-- //??? -->



                </div>

                <!--<div class="widget cutin-banner js-genieessp-com"></div>-->

            </div>

            <!-- //???? -->

            <!-- aside -->
            <div id="aside-wrap">
                <div id="rightside">
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
            <!-- //aside -->

        </div>
        <!-- //container -->
        <!-- footer -->
        <div id="footer">
        </div>
        <!-- //footer -->
    </div>
</body>
</html>