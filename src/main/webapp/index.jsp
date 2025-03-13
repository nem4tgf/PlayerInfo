<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.webcomponent.model.PlayerIndex" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Player Information</title>
    <link rel="stylesheet" href="styles.css">
    <style>body {
        font-family: Arial, sans-serif;
        text-align: center;
    }

    h2 {
        color: #d48b07;
    }

    form {
        margin-bottom: 20px;
    }

    input, select, button {
        padding: 10px;
        margin: 5px;
        border-radius: 5px;
        border: 1px solid #ccc;
    }

    button {
        background-color: #d48b07;
        color: white;
        border: none;
        cursor: pointer;
    }

    table {
        width: 80%;
        margin: auto;
        border-collapse: collapse;
    }

    th, td {
        padding: 10px;
        border: 1px solid #ccc;
    }

    th {
        background-color: #d48b07;
        color: white;
    }

    footer {
        background-color: #c94f3d;
        color: white;
        padding: 10px;
        margin-top: 20px;
    }
    </style>
</head>
<body>



<h2>Player Information</h2>

<form action="playerServlet" method="post">
    <input type="text" name="player_name" placeholder="Player name" required>
    <input type="number" name="player_age" placeholder="Player age" required>
    <select name="index_name">
        <option value="speed">Speed</option>
        <option value="strength">Strength</option>
        <option value="accurate">Accurate</option>
    </select>
    <input type="number" name="value" placeholder="Value" required>
    <button type="submit">Add</button>
</form>

<table>
    <thead>
    <tr>
        <th>Id</th>
        <th>Player name</th>
        <th>Player age</th>
        <th>Index name</th>
        <th>Value</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="player" items="${playerList}">
        <tr>
            <td>${player.id}</td>
            <td>${player.playerName}</td>
            <td>${player.playerAge}</td>
            <td>${player.indexName}</td>
            <td>${player.value}</td>
            <td>
                <a href="edit?id=${player.id}">✏️</a>
                <a href="delete?id=${player.id}">🗑️</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<footer>Số 8, Tôn Thất Thuyết, Cầu Giấy, Hà Nội</footer>

</body>
</html>
