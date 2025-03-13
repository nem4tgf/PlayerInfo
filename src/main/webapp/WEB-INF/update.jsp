<%--
  Created by IntelliJ IDEA.
  User: nguye
  Date: 3/13/2025
  Time: 9:46 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.example.webcomponent.utils.DBConnection" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    String name = "";
    String age = "";
    String indexName = "";
    float value = 0;

    try (Connection conn = DBConnection.getConnection()) {
        String query = "SELECT p.name, p.age, i.name, pi.value FROM player p " +
                "JOIN player_index pi ON p.player_id = pi.player_id " +
                "JOIN indexer i ON pi.index_id = i.index_id WHERE p.player_id=?";
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            name = rs.getString(1);
            age = rs.getString(2);
            indexName = rs.getString(3);
            value = rs.getFloat(4);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Update Player</title>
</head>
<body>
<h2>Update Player</h2>
<form action="playerServlet" method="post">
    <input type="hidden" name="id" value="<%= id %>">
    <input type="text" name="player_name" value="<%= name %>" required>
    <input type="number" name="player_age" value="<%= age %>" required>
    <select name="index_name">
        <option value="speed" <%= "speed".equals(indexName) ? "selected" : "" %>>Speed</option>
        <option value="strength" <%= "strength".equals(indexName) ? "selected" : "" %>>Strength</option>
        <option value="accurate" <%= "accurate".equals(indexName) ? "selected" : "" %>>Accurate</option>
    </select>
    <input type="number" name="value" value="<%= value %>" required>
    <button type="submit" name="action" value="update">Update</button>
</form>
<a href="index.jsp">Back</a>
</body>
</html>