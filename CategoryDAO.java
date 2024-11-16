package Model;

import Utils.DBUtils;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CategoryDAO extends DBUtils {

    public void insertCategory(Category category) {
        String query = "INSERT INTO Categories (userId, name, type) VALUES (?, ?, ?)";
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, category.getUserId());
            statement.setString(2, category.getName());
            statement.setString(3, category.getType());
            statement.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public void updateCategory(Category category) {
        String query = "UPDATE Categories SET name = ?, type = ? WHERE id = ? AND userId = ?";
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, category.getName());
            statement.setString(2, category.getType());
            statement.setInt(3, category.getId());
            statement.setInt(4, category.getUserId());
            statement.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public void deleteCategory(int categoryId, int userId) {
        String query = "DELETE FROM Categories WHERE id = ? AND userId = ?";
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, categoryId);
            statement.setInt(2, userId);
            statement.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public Category getCategoryById(int categoryId, int userId) {
        Category category = null;
        String query = "SELECT * FROM Categories WHERE id = ? AND userId = ?";
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, categoryId);
            statement.setInt(2, userId);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                category = new Category(
                    resultSet.getInt("id"),
                    resultSet.getInt("userId"),
                    resultSet.getString("name"),
                    resultSet.getString("type")
                );
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return category;
    }

    public List<Category> getCategoriesByUserId(int userId) {
        List<Category> categories = new ArrayList<>();
        String query = "SELECT * FROM Categories WHERE userId = ?";
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, userId);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                categories.add(new Category(
                    resultSet.getInt("id"),
                    resultSet.getInt("userId"),
                    resultSet.getString("name"),
                    resultSet.getString("type")
                ));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return categories;
    }
}