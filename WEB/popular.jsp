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
                    <h1 class="logo-link"><a href="./main.jsp">�ǳ� ����ũ ���� ö��</a></h1>
                </div>
                <script src="/js/search.js?202292"></script>

            </div>
            <!-- GNB -->
            <div id="gnb">

                <ul id="menu" class="gnb-list drop-menu">
                    <li><a href="./popular.jsp">�α��</a>
                    </li>
                    <li><a href="./general.jsp">�����Խ���</a>
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
				<span>���� <span style="color:#E93F0B;">12342</span> ���� ������� <span style="color:#E93F0B;">�ǳ� ����ũ ����</span>�� �䱸�մϴ�.</span>
			</div>
        </div>
        <!-- //header -->
        <!-- container -->
        <div id="container">
            <!-- ���� -->
            <div id="content-wrap">
                <div class="board-wrap">
                    <!-- ��� -->
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
                            <h2><a href="./popular.jsp">�α��</a><span class="ico-bookmark" data-mid="ilbe"
                                    data-name="�α��" onclick="bookmark(this)"></span></h2>
                        </div>
                        <ul class="board-body">
                            <li class="title-line">
                                <span class="count">��ȣ</span>
                                <span class="nick">�г���</span>
                                <span class="date list_sort " data-order="date" style="cursor: pointer;">��¥</span>
                            </li>
                            <li>

                                <span class="count">847,729</span>

                                <span class="title ">
                                    <a href="/view/11438123217" class="subject ">test����</a>
                                </span>
                                <span class="global-nick nick">test�г���</span>

                                <span class="date">00:07:16</span>
                            </li>
                        </ul>


                        <div class="post-btn-wrap">
                            <div class="btn-left">
                                <button type="button" onclick="location.href='/list/ilbe'" id="list_back"
                                    class="btn-default"><span>���</span></button>
                            </div>
                            <div class="paginate">
                                <a href="javascript:;" onclick="searchList(1)" class="prev"><span></span>����</a>
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
                                <a href="javascript:;" onclick="searchList(11)" class="next">����<span></span></a>
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
                    <!-- //��� -->



                </div>

                <!--<div class="widget cutin-banner js-genieessp-com"></div>-->

            </div>

            <!-- //���� -->

            <!-- aside -->
            <div id="aside-wrap">
                <div id="event-notice" class="event-wrap">
                    <div class="event-header">
                        <h3>���ο� �˸�<span class="notify-count"></span></h3>
                        <div class="btn-set"><button class="event-delete" onclick="deleteNotiAll()"
                                title="�˸� ��ü ����">��ü����</button><button class="event-close"
                                onclick="hideNotifyList()">�ݱ�</button></div>
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
                                            class="ico-chk"></span>�α��� ���� ����</label></span>
                                <span class="check_security"></span>
                            </div>
                            <div class="login-box">
                                <span><input type="text" placeholder="���̵�" name="user_id"><input type="password"
                                        name="password" placeholder="��й�ȣ"></span>
                                <button type="submit"><span>�α���</span></button>
                            </div>
                        </form>
                        <div class="user-util"><a href="/member/joinform">ȸ������</a><a href="/member/find/id">���̵𡤺�й�ȣ
                                ã��</a></div>
                    </div>
                    <!-- //login -->


                    <script>
                        window.arrayId = [];</script>


                    <!-- ��ũ�� -->
                    <!-- <div class="aside-section">
                    </div> -->
                    <!-- //��ũ�� -->

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