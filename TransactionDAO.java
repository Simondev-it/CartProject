/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Model.Transaction;
import Utils.DBUtils;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class TransactionDAO extends DBUtils {

    public void insertTransaction(Transaction transaction) {
        String query = "INSERT INTO Transactions (userId, categoryId, date, amount, description, status) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection connection = getConnection();
                PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, transaction.getUserId());
            statement.setInt(2, transaction.getCategoryId());
            statement.setDate(3, new java.sql.Date(transaction.getDate().getTime()));
            statement.setDouble(4, transaction.getAmount());
            statement.setString(5, transaction.getDescription());
            statement.setString(6, transaction.getStatus());
            statement.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public void updateTransaction(Transaction transaction) {
        String query = "UPDATE Transactions SET categoryId = ?, date = ?, amount = ?, description = ?, status = ? WHERE id = ?";
        try (Connection connection = getConnection();
                PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, transaction.getCategoryId());
            statement.setDate(2, new java.sql.Date(transaction.getDate().getTime()));
            statement.setDouble(3, transaction.getAmount());
            statement.setString(4, transaction.getDescription());
            statement.setString(5, transaction.getStatus());
            statement.setInt(6, transaction.getId());
            statement.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public List<Transaction> getTransactionsByUserId(int userId) {
        List<Transaction> transactions = new ArrayList<>();
        String query = "SELECT * FROM Transactions WHERE userId = ?";
        try (Connection connection = getConnection();
                PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, userId);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                transactions.add(new Transaction(
                        resultSet.getInt("id"),
                        resultSet.getInt("userId"),
                        resultSet.getInt("categoryId"),
                        resultSet.getDate("date"),
                        resultSet.getDouble("amount"),
                        resultSet.getString("description"),
                        resultSet.getString("status")
                ));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return transactions;
    }

    public void deleteTransaction(int transactionId) {
        String query = "UPDATE Transactions SET status = 'Deleted' WHERE id = ?";
        try (Connection connection = getConnection();
                PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, transactionId);
            statement.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public List<Transaction> getActiveTransactionsByUserId(int userId) {
        List<Transaction> transactions = new ArrayList<>();
        String query = "SELECT * FROM Transactions WHERE userId = ? AND status = 'Active'";
        try (Connection connection = getConnection();
                PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, userId);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                transactions.add(new Transaction(
                        resultSet.getInt("id"),
                        resultSet.getInt("userId"),
                        resultSet.getInt("categoryId"),
                        resultSet.getDate("date"),
                        resultSet.getDouble("amount"),
                        resultSet.getString("description"),
                        resultSet.getString("status")
                ));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return transactions;
    }

    public List<Transaction> getDeletedTransactionsByUserId(int userId) {
        List<Transaction> transactions = new ArrayList<>();
        String query = "SELECT * FROM Transactions WHERE userId = ? AND status = 'Deleted'";
        try (Connection connection = getConnection();
                PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, userId);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                transactions.add(new Transaction(
                        resultSet.getInt("id"),
                        resultSet.getInt("userId"),
                        resultSet.getInt("categoryId"),
                        resultSet.getDate("date"),
                        resultSet.getDouble("amount"),
                        resultSet.getString("description"),
                        resultSet.getString("status")
                ));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return transactions;
    }

    public Transaction getTransactionById(int transactionId) {
        Transaction transaction = null;
        String query = "SELECT * FROM Transactions WHERE id = ?";
        try (Connection connection = getConnection();
                PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, transactionId);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                transaction = new Transaction(
                        resultSet.getInt("id"),
                        resultSet.getInt("userId"),
                        resultSet.getInt("categoryId"),
                        resultSet.getDate("date"),
                        resultSet.getDouble("amount"),
                        resultSet.getString("description"),
                        resultSet.getString("status")
                );
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return transaction;
    }
    
    public List<Transaction> getTransactionByDateAndCategory(int userId, Date startDate, Date endDate, Integer categoryId) {
    List<Transaction> transactions = new ArrayList<>();
    StringBuilder queryBuilder = new StringBuilder("SELECT * FROM Transactions WHERE userId = ?");

    if (startDate != null) {
        queryBuilder.append(" AND date >= ?");
    }
    if (endDate != null) {
        queryBuilder.append(" AND date <= ?");
    }
    if (categoryId != null) {
        queryBuilder.append(" AND categoryId = ?");
    }

    try (Connection connection = getConnection();
         PreparedStatement statement = connection.prepareStatement(queryBuilder.toString())) {
        
        int parameterIndex = 1;
        statement.setInt(parameterIndex++, userId);
        
        if (startDate != null) {
            statement.setDate(parameterIndex++, new java.sql.Date(startDate.getTime()));
        }
        if (endDate != null) {
            statement.setDate(parameterIndex++, new java.sql.Date(endDate.getTime()));
        }
        if (categoryId != null) {
            statement.setInt(parameterIndex, categoryId);
        }

        ResultSet resultSet = statement.executeQuery();
        while (resultSet.next()) {
            transactions.add(new Transaction(
                resultSet.getInt("id"),
                resultSet.getInt("userId"),
                resultSet.getInt("categoryId"),
                resultSet.getDate("date"),
                resultSet.getDouble("amount"),
                resultSet.getString("description"),
                resultSet.getString("status")
            ));
        }
    } catch (SQLException ex) {
        ex.printStackTrace();
    }
    return transactions;
}

    public static void main(String[] args) {
        TransactionDAO transactionDAO = new TransactionDAO();

        // Insert a new transaction
        Transaction newTransaction = new Transaction(0, 1, 1, Date.valueOf("2023-07-01"), 100.0, "Groceries", "Deleted");
        transactionDAO.insertTransaction(newTransaction);
        System.out.println("Inserted new transaction.");

        // Retrieve all transactions for userId 1
        List<Transaction> transactions = transactionDAO.getTransactionsByUserId(1);
        System.out.println("All transactions for userId 1:");
        for (Transaction transaction : transactions) {
            System.out.println(transaction);
        }

        // Retrieve all active transactions for userId 1
//        List<Transaction> activeTransactions = transactionDAO.getActiveTransactionsByUserId(1);
//        System.out.println("Active transactions for userId 1:");
//        for (Transaction transaction : activeTransactions) {
//            System.out.println(transaction);
//        }
        // Retrieve all deleted transactions for userId 1
        List<Transaction> deletedTransactions = transactionDAO.getDeletedTransactionsByUserId(1);
        System.out.println("Deleted transactions for userId 1:");
        for (Transaction transaction : deletedTransactions) {
            System.out.println(transaction);
        }

        // Retrieve a transaction by its ID
//        int transactionId = transactions.get(0).getId();
//        Transaction retrievedTransaction = transactionDAO.getTransactionById(transactionId);
//        System.out.println("Retrieved transaction by ID:");
//        System.out.println(retrievedTransaction);
//
//        // Update the retrieved transaction
//        retrievedTransaction.setAmount(200.0);
//        retrievedTransaction.setDescription("Updated groceries");
//        transactionDAO.updateTransaction(retrievedTransaction);
//        System.out.println("Updated transaction.");
//
//        // Retrieve the updated transaction by its ID
//        Transaction updatedTransaction = transactionDAO.getTransactionById(transactionId);
//        System.out.println("Updated transaction by ID:");
//        System.out.println(updatedTransaction);
    }
}
