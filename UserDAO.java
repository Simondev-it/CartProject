/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import org.mindrot.jbcrypt.BCrypt;

/**
 *
 * @author ADMIN
 */
public class UserDAO extends DBUtils{
    
    
     public List<User> listAllUsers() {
        List<User> users = new ArrayList<>();
        String query = "SELECT * FROM Users";
        try (Connection connection = DBUtils.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                User user = new User(
                        resultSet.getInt("id"),
                        resultSet.getString("username"),
                        resultSet.getString("password"),
                        resultSet.getString("email")
                );
                users.add(user);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return users;
    }
     
     
     // Phương thức cập nhật thông tin của một User trong bảng Users
    public boolean updateUser(User user) {
        String query = "UPDATE Users SET username = ?, password = ?, email = ? WHERE id = ?";
        try (Connection connection = DBUtils.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, user.getUsername());
            statement.setString(2, BCrypt.hashpw(user.getPassword(), BCrypt.gensalt()));
            statement.setString(3, user.getEmail());
            statement.setInt(4, user.getId());
            return statement.executeUpdate() > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    // Phương thức xóa một User khỏi bảng Users
    public boolean deleteUser(int userId) {
        String query = "DELETE FROM Users WHERE id = ?";
        try (Connection connection = DBUtils.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, userId);
            return statement.executeUpdate() > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    // Phương thức lấy một User theo id từ bảng Users
    public User getUserById(int userId) {
        User user = null;
        String query = "SELECT * FROM Users WHERE id = ?";
        try (Connection connection = DBUtils.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, userId);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                user = new User(
                        resultSet.getInt("id"),
                        resultSet.getString("username"),
                        resultSet.getString("password"),
                        resultSet.getString("email")
                );
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return user;
    }
    
    public boolean registerUser(String username, String password, String email) {
        String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
        String query = "INSERT INTO Users (username, password, email) VALUES (?, ?, ?)";
        try (Connection connection = DBUtils.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, username);
            statement.setString(2, hashedPassword);
            statement.setString(3, email);
            return statement.executeUpdate() > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }
    
     // Phương thức đăng nhập User
    public User loginUser(String username, String password) {
        String query = "SELECT * FROM Users WHERE username = ?";
        try (Connection connection = DBUtils.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, username);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                String storedPassword = resultSet.getString("password");
                if (BCrypt.checkpw(password, storedPassword)) {
                    return new User(
                            resultSet.getInt("id"),
                            resultSet.getString("username"),
                            resultSet.getString("password"),
                            resultSet.getString("email")
                    );
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }
    
    public static void main(String[] args) {
        // Thực hiện test các chức năng của UserDAO
        UserDAO userDAO = new UserDAO();

        // Test lấy danh sách tất cả User
        System.out.println("Danh sách tất cả User:");
        userDAO.listAllUsers().forEach(user -> {
            System.out.println(user.getId() + ", " + user.getUsername() + ", " + user.getEmail());
        });
        System.out.println();

//        // Test thêm mới User
//        User newUser = new User(0, "zxc", "zxc", "zxc@example.com");
//        System.out.println("Thêm mới User:");
//        if (userDAO.insertUser(newUser)) {
//            System.out.println("Thêm mới User thành công!");
//        } else {
//            System.out.println("Thêm mới User thất bại!");
//        }
//        System.out.println();
//
        // Test cập nhật thông tin User
        User userToUpdate = userDAO.getUserById(1); // Giả sử User có id là 1
        if (userToUpdate != null) {
            userToUpdate.setEmail("updated_email@example.com");
            System.out.println("Cập nhật thông tin User:");
            if (userDAO.updateUser(userToUpdate)) {
                System.out.println("Cập nhật thông tin User thành công!");
            } else {
                System.out.println("Cập nhật thông tin User thất bại!");
            }
        } else {
            System.out.println("User không tồn tại!");
        }
        System.out.println();
//
//        // Test xóa User
//        int userIdToDelete = 2; // Giả sử User có id là 2
//        System.out.println("Xóa User:");
//        if (userDAO.deleteUser(userIdToDelete)) {
//            System.out.println("Xóa User thành công!");
//        } else {
//            System.out.println("Xóa User thất bại!");
//        }
//        System.out.println();

//        // Test đăng ký User mới
//        String newUsername = "khoa";
//        String newPassword = "khoa";
//        String newEmail = "khoa@example.com";
//        System.out.println("Đăng ký User mới:");
//        if (userDAO.registerUser(newUsername, newPassword, newEmail)) {
//            System.out.println("Đăng ký User mới thành công!");
//        } else {
//            System.out.println("Đăng ký User mới thất bại!");
//        }
//        System.out.println();

//        // Test đăng nhập
//        String usernameToLogin = "khoa";
//        String passwordToLogin = "khoa";
//        System.out.println("Đăng nhập:");
//        User loggedInUser = userDAO.loginUser(usernameToLogin, passwordToLogin);
//        if (loggedInUser != null) {
//            System.out.println("Đăng nhập thành công! User đăng nhập là:");
//            System.out.println(loggedInUser.getId() + ", " + loggedInUser.getUsername() + ", " + loggedInUser.getEmail());
//        } else {
//            System.out.println("Đăng nhập thất bại! Sai tên đăng nhập hoặc mật khẩu.");
//        }
    }
}
