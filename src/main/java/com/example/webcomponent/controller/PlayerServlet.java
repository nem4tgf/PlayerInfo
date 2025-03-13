package com.example.webcomponent.controller;

import com.example.webcomponent.model.PlayerIndex;
import com.example.webcomponent.utils.DBConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/playerServlet")
public class PlayerServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("player_name");
        String age = request.getParameter("player_age");
        String indexName = request.getParameter("index_name");
        float value = Float.parseFloat(request.getParameter("value"));

        try (Connection conn = DBConnection.getConnection()) {
            // Insert player if not exists
            String playerQuery = "INSERT INTO player (name, full_name, age, index_id) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(playerQuery, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, name);
            ps.setString(2, name);
            ps.setString(3, age);
            ps.setInt(4, getIndexId(conn, indexName));
            ps.executeUpdate();

            ResultSet rs = ps.getGeneratedKeys();
            int playerId = -1;
            if (rs.next()) {
                playerId = rs.getInt(1);
            }

            // Insert player index value
            if (playerId != -1) {
                String indexQuery = "INSERT INTO player_index (player_id, index_id, value) VALUES (?, ?, ?)";
                PreparedStatement psIndex = conn.prepareStatement(indexQuery);
                psIndex.setInt(1, playerId);
                psIndex.setInt(2, getIndexId(conn, indexName));
                psIndex.setFloat(3, value);
                psIndex.executeUpdate();
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        response.sendRedirect("playerServlet");  // Refresh page
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<PlayerIndex> playerList = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection()) {
            String query = "SELECT pi.id, p.name, p.age, i.name, pi.value " +
                    "FROM player_index pi " +
                    "JOIN player p ON pi.player_id = p.player_id " +
                    "JOIN indexer i ON pi.index_id = i.index_id " +
                    "ORDER BY pi.id ASC";
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(query);

            while (rs.next()) {
                PlayerIndex player = new PlayerIndex(
                        rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getFloat(5));
                playerList.add(player);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        request.setAttribute("playerList", playerList);
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    private int getIndexId(Connection conn, String indexName) throws SQLException {
        String query = "SELECT index_id FROM indexer WHERE name = ?";
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setString(1, indexName);
        ResultSet rs = ps.executeQuery();
        return rs.next() ? rs.getInt(1) : -1;
    }
}
