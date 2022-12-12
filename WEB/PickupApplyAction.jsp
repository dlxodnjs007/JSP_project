<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="game.PickupApplyDAO" %>
<%@ page import="game.PickupApply" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="pickup_apply" class="game.PickupApply" scope="page"/>
<jsp:setProperty name="pickup_apply" property="game_id_no"/>
<jsp:setProperty name="pickup_apply" property="guest_id"/>
<jsp:setProperty name="pickup_apply" property="name"/>
<jsp:setProperty name="pickup_apply" property="height"/>
<jsp:setProperty name="pickup_apply" property="position"/>
<jsp:setProperty name="pickup_apply" property="age"/>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
    <%
        PickupApplyDAO PickupApplyDAO = new PickupApplyDAO();
        int result = PickupApplyDAO.setApplyPickup(pickup_apply);

        if(result == -1) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('데이터베이스 insert 실패')");
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