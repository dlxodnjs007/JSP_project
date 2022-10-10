<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="user.User" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="user" class="user.User" scope="page"/>
<jsp:setProperty name="user" property="user_id"/>
<jsp:setProperty name="user" property="password"/>
<jsp:setProperty name="user" property="name"/>
<jsp:setProperty name="user" property="email"/>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
    <%
        String user_id = null;
        if(session.getAttribute("user_id") != null) {
            user_id = (String) session.getAttribute("user_id");
        }
        if(user_id != null) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('이미 로그인이 되어있습니다.')");
            script.println("location.href = 'main.jsp'");
            script.println("</script>");
        }
        if(user.getUser_id() == null || user.getPassword() == null || user.getName() == null || user.getEmail() == null) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('입력이 안 된 사항이 있습니다.')");
            script.println("history.back()");
            script.println("</script>");
        }
        else {
            UserDAO userDAO = new UserDAO();
            int result = userDAO.join(user);

            if(result == -1) {
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("alert('이미 존재하는 아이디입니다.')");
                script.println("history.back()");
                script.println("</script>");
            }
            else {
                session.setAttribute("user_id", user.getUser_id());
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("location.href = 'main.jsp'");
                script.println("</script>");
            }
        }
    %>
</body>
</html>