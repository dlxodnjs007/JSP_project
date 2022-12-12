<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="game.PickupApplyDAO" %>
<%@ page import="game.PickupApply" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="pickup_apply" class="game.PickupApply" scope="page"/>
<jsp:setProperty name="pickup_apply" property="apply_id"/>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
    <%
        PickupApplyDAO pickupApplyDAO = new PickupApplyDAO();
        int result = pickupApplyDAO.matchAccept(pickup_apply.getApply_id());
        
        if(result == -1) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('apply_pickup_info에서 accept_status을 1로 변경 실패')");
            script.println("history.back()");
            script.println("</script>");
        }
        else {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("location.href = document.referrer;");
            script.println("</script>");
        }
    %>
</body>
</html>