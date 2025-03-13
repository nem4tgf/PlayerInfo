package com.example.webcomponent.utils;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    // Thông tin kết nối cơ sở dữ liệu
    private static final String DB_URL = "jdbc:mysql://localhost:3306/player_evaluation";
    private static final String DB_USER = "root";
    private static final String DB_PASS = "";

    // Phương thức tĩnh để lấy kết nối
    public static Connection getConnection() throws SQLException {
        try {
            // Đăng ký driver MySQL
            Class.forName("com.mysql.cj.jdbc.Driver");
            // Tạo và trả về kết nối
            return DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
        } catch (ClassNotFoundException e) {
            throw new SQLException("MySQL JDBC Driver không tìm thấy.", e);
        }
    }

    // Phương thức kiểm tra kết nối (tuỳ chọn)
    public static void testConnection() {
        try (Connection conn = getConnection()) {
            if (conn != null) {
                System.out.println("Kết nối tới player thành công!");
            }
        } catch (SQLException e) {
            System.err.println("Lỗi kết nối: " + e.getMessage());
        }
    }

    // Main để test (có thể xóa khi đưa vào project)
    public static void main(String[] args) {
        testConnection();
    }
}
