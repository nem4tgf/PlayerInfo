<%--
  Created by IntelliJ IDEA.
  User: nguye
  Date: 3/13/2025
  Time: 9:47 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Delete Player</title>
</head>
<body>
<h2>Are you sure you want to delete this player?</h2>
<form action="playerServlet" method="post">
    <input type="hidden" name="id" value="<%= request.getParameter("id") %>">
    <button type="submit" name="action" value="delete">Yes, Delete</button>
    <a href="index.jsp">Cancel</a>
</form>
</body>
</html>

