<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>Insert title here</title>
    <link href="./css/base.css" rel="stylesheet">
    <link href="./css/common.css" rel="stylesheet">
    <link href="./css/main.css" rel="stylesheet">
</head>
<body>
	<div id="wrap">
        <!-- header -->
        <div id="header">
            <div id="gnb-top" class="bg-season"
                style="display: block; background: url('./images/logo.png') no-repeat center 0;">
                <div class="gnb-fix-area">
                    <h1 class="logo-link"><a href="./main.jsp">실내 마스크 강요 철폐</a></h1>
                </div>
                <script src="/js/search.js?202292"></script>

            </div>
            <!-- GNB -->
            <div id="gnb">

                <ul id="menu" class="gnb-list drop-menu">
                    <li><a href="./popular.jsp">인기글</a>
                    </li>
                    <li><a href="./general.jsp">자유게시판</a>
                    </li>
                </ul>
                <script>
                    $(function () {
                        var link = location.pathname;

                        $(".top_menu_sub").each(function () {
                            var obj = $(this);
                            if ($(this).find("a").attr("focus-id") == "4044bfe31de72a1de22410b74a17b58f") {
                                obj.addClass("on");

                            }
                        });
                    });
                </script>
                <div id="pd-menu" class="pulldown-wrap">

                </div>
            </div>
            <!-- //GNB -->
			<div style="text-align:center; margin: 10px auto;">
				<span>현재 <span style="color:#E93F0B;">12342</span> 명의 사람들이 <span style="color:#E93F0B;">실내 마스크 해제</span>를 요구합니다.</span>
			</div>
        </div>
        <!-- //header -->
        <!-- container -->
        <div id="container">
            <!-- 본문 -->
            <div id="content-wrap">
                <div class="board-wrap">
                    <!-- 목록 -->
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
                            <h2><a href="./popular.jsp">인기글</a><span class="ico-bookmark" data-mid="ilbe"
                                    data-name="인기글" onclick="bookmark(this)"></span></h2>
                        </div>
                        <ul class="board-body">
                            <li class="title-line">
                                <span class="count">번호</span>
                                <span class="nick">닉네임</span>
                                <span class="date list_sort " data-order="date" style="cursor: pointer;">날짜</span>
                            </li>
                            <li>

                                <span class="count">847,729</span>

                                <span class="title ">
                                    <a href="/view/11438123217" class="subject ">test제목</a>
                                </span>
                                <span class="global-nick nick">test닉네임</span>

                                <span class="date">00:07:16</span>
                            </li>
                        </ul>


                        <div class="post-btn-wrap">
                            <div class="btn-left">
                                <button type="button" onclick="location.href='/list/ilbe'" id="list_back"
                                    class="btn-default"><span>목록</span></button>
                            </div>
                            <div class="paginate">
                                <a href="javascript:;" onclick="searchList(1)" class="prev"><span></span>이전</a>
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
                                <a href="javascript:;" onclick="searchList(11)" class="next">다음<span></span></a>
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
                    <!-- //목록 -->



                </div>

                <!--<div class="widget cutin-banner js-genieessp-com"></div>-->

            </div>

            <!-- //본문 -->

            <!-- aside -->
            <div id="aside-wrap">
                <div id="event-notice" class="event-wrap">
                    <div class="event-header">
                        <h3>새로운 알림<span class="notify-count"></span></h3>
                        <div class="btn-set"><button class="event-delete" onclick="deleteNotiAll()"
                                title="알림 전체 삭제">전체삭제</button><button class="event-close"
                                onclick="hideNotifyList()">닫기</button></div>
                    </div>
                    <div class="event-container" id="notice_list_wrap">
                        <ul id="notify_list">
                        </ul>
                    </div>

                </div>
                <div id="rightside">
                    <!-- login -->
                    <script src="/js/jquery/jquery.validate.min.js?202292"></script>
                    <script src="/js/jquery/additional-methods.min.js?202292"></script>
                    <script src="/js/jquery/messages_ko.min.js?202292"></script>
                    <script src="/js/jquery/validator_method.js?202292"></script>
                    <script src="/js/member/member.js?202292"></script>
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


                    <script>
                        window.arrayId = [];</script>


                    <!-- 스크랩 -->
                    <!-- <div class="aside-section">
                    </div> -->
                    <!-- //스크랩 -->

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