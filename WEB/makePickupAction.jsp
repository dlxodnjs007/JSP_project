<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="game.PickupDAO" %>
<%@ page import="game.Pickup" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="pickup_info" class="game.Pickup" scope="page"/>
<jsp:setProperty name="pickup_info" property="home_id"/>
<jsp:setProperty name="pickup_info" property="roadAddrPart1"/>
<jsp:setProperty name="pickup_info" property="date"/>
<jsp:setProperty name="pickup_info" property="people"/>
<jsp:setProperty name="pickup_info" property="level"/>
<jsp:setProperty name="pickup_info" property="age"/>
<jsp:setProperty name="pickup_info" property="color"/>
<jsp:setProperty name="pickup_info" property="shower"/>
<jsp:setProperty name="pickup_info" property="parking"/>
<jsp:setProperty name="pickup_info" property="warning"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
    <%
        if(pickup_info.getRoadAddrPart1() == null || 
        pickup_info.getDate() == null) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('입력이 안 된 사항이 있습니다.')");
            script.println("history.back()");
            script.println("</script>");
        }
        else {
            PickupDAO pickupDAO = new PickupDAO();
            int result = pickupDAO.makeGame(pickup_info);

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
                script.println("location.href = 'home.jsp'");
                script.println("</script>");
            }
        }
    %>
</body>
</html>