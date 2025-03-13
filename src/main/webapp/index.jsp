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
    <input type="hidden" name="player_id" id="player_id">
    <input type="text" name="player_name" id="player_name" placeholder="Player name" required>
    <input type="number" name="player_age" id="player_age" placeholder="Player age" required>
    <select name="index_name" id="index_name">
        <option value="speed">Speed</option>
        <option value="strength">Strength</option>
        <option value="accurate">Accurate</option>
    </select>
    <input type="number" name="value" id="value" placeholder="Value" required>
    <button type="submit">Save</button>
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
                <button onclick="editPlayer('${player.id}', '${player.playerName}', '${player.playerAge}', '${player.indexName}', '${player.value}')">✏️</button>
                <a href="playerServlet?action=delete&id=${player.id}" onclick="return confirm('Are you sure?')">🗑️</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<script>
    function editPlayer(id, name, age, index, value) {
        document.getElementById("player_id").value = id;
        document.getElementById("player_name").value = name;
        document.getElementById("player_age").value = age;
        document.getElementById("index_name").value = index;
        document.getElementById("value").value = value;
    }
</script>


<footer>Số 8, Tôn Thất Thuyết, Cầu Giấy, Hà Nội</footer>

</body>
</html>
