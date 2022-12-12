<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="game.PickupDAO" %>
<%@ page import="game.Pickup" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="pickup" class="game.Pickup" scope="page"/>
<jsp:setProperty name="pickup" property="id_no"/>
<jsp:setProperty name="pickup" property="home_id"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
    <%
        PickupDAO pickupDAO = new PickupDAO();
        int result = pickupDAO.cancelPickup(pickup.getId_no(), pickup.getHome_id());
        
        if(result == -1) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('픽업게임 삭제 실패')");
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