package dao;

import context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Account;

public class AccountDAO {

    static Connection conn;
    static PreparedStatement ps;
    static ResultSet rs;

    // Dang dung
    public static List<Account> getAllAccount() {
        List<Account> aList = new ArrayList<>();
        String sql = "Select * From Account";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Account acccount = new Account(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getInt(9),
                        rs.getInt(10));
                aList.add(acccount);
            }
        } catch (Exception e) {
        }
        return aList;
    }
    
    public  Account getAccountById2(int id) {
        String sql = "Select * From Account Where AccountID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                Account acccount = new Account(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getInt(9),
                        rs.getInt(10));
                return acccount;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public Account login(String username, String password) {
        String sql = "select * from Account where UserName = ? and Password = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getInt(9),
                        rs.getInt(10));
            }

        } catch (Exception e) {
        }
        return null;
    }

    public void registerAccount(String firstname, String lastname, String username, String password, String phone, String email, String dob, int role) {
        String sql = "INSERT INTO Account (FirstName, LastName, UserName, [Password], Phone, Email, DOB, [Role])\n"
                + "values(?,?,?,?,?,?,?,?)";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, firstname);
            ps.setString(2, lastname);
            ps.setString(3, username);
            ps.setString(4, password);
            ps.setString(5, phone);
            ps.setString(6, email);
            ps.setString(7, dob);
            ps.setInt(8, role);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public Account checkAccountExist(String username) {
        try {
            String sql = "select * from account \n"
                    + "where username = ?;";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getInt(9),
                        rs.getInt(10));
            }
            
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return null;
    }
    
    public Account getAccountByEmail(String email) {
        String sql = "select * from account where email = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getInt(9),
                        rs.getInt(10));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    
    public void updateAccountPassword(Account a, String password) {
        String sql = "update Account set Password = ? where Phone = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, password);
            ps.setString(2, a.getPhone());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public Account getAccountByPhone(String phone) {
        String sql = "select * from Account where Phone = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, phone);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getInt(9),
                        rs.getInt(10));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    
    public Account getAccountById(int id) {
        String sql = "Select * From Account Where AccountID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getInt(9),
                        rs.getInt(10));
            }
        } catch (Exception e) {
        }
        return null;
    }
    
    public void setStatusAccount(String username, int status) {
        String sql = "Update dbo.Account Set status = ? Where username = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, status);
            ps.setString(2, username);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

}
