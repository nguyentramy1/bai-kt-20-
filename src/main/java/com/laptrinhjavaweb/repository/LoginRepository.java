package com.laptrinhjavaweb.repository;

import java.sql.*;

public class LoginRepository {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/springbootwebshopguide";
    private static final String USER = "root";
    private static final String PASS = "12345";

    public String getUserRole(String username, String password) {
        String role = null;
        String sql = "SELECT r.code FROM user u " +
                "JOIN role r ON u.roleid = r.id " +
                "WHERE u.username = ? AND u.password = ?";
        try (Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, username);
            pstmt.setString(2, password);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    role = rs.getString("code");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return role;
    }
}
