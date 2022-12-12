<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="game.PickupApplyDAO" %>
<%@ page import="game.PickupApply" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="pickup_apply" class="game.PickupApply" scope="page"/>
<jsp:setProperty name="pickup_apply" property="game_id_no"/>
<jsp:setProperty name="pickup_apply" property="guest_id"/>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
    <%
        PickupApplyDAO pickupApplyDAO = new PickupApplyDAO();
        int result = pickupApplyDAO.cancelApply(pickup_apply.getGame_id_no(), pickup_apply.getGuest_id());
        
        if(result == -1) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('삭제할 픽업신청기록이 없습니다.')");
            script.println("history.back()");
            script.println("</script>");
        }
        else {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("window.open(\"about:blank\",\"_self\");");
            script.println("opener.parent.location.reload();");
            script.println("window.close();");
            script.println("</script>");
        }
    %>
</body>
</html>