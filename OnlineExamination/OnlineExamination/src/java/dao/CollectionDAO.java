/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.Collection;

/**
 *
 * @author cphuo
 */
public class CollectionDAO {
    static Connection conn;
    static PreparedStatement ps;
    static ResultSet rs;
    
    // lấy tất cả khoá học
    public List<Collection> getAllCollection() {
        List<Collection> cList = new ArrayList<>();
        String sql = "Select * From Collection";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                AccountDAO dao = new AccountDAO();
                Account a = dao.getAccountById(rs.getInt(4));
                Collection c = new Collection(rs.getInt(1), rs.getString(2), rs.getInt(3), a);
                cList.add(c);
            }
        } catch (Exception e) {
        }
        return cList;
    }
    
    // lấy khoá học tương ứng theo id
    
    
    public Collection getCollectionById1(int id) {
        String sql = "Select * From Collection Where CollectionID = ? ";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                AccountDAO dao = new AccountDAO();
                Account a = dao.getAccountById2(rs.getInt(4));
                return new Collection(rs.getInt(1), rs.getString(2), rs.getInt(3), a);
            }
        } catch (Exception e) {
        }
        return null;
    }
    
    // lấy khoá học theo role giáo viên
    public List<Collection> getCollectionByAccountId(int AccountId) {
        List<Collection> cList = new ArrayList<>();
        String sql = "select * from Collection where AccountID in (select AccountID from Account where Role = 1)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, AccountId);
            rs = ps.executeQuery();
            while (rs.next()) {
                AccountDAO dao = new AccountDAO();
                Account a = dao.getAccountById2(rs.getInt(4));
                Collection c = new Collection(rs.getInt(1), rs.getString(2), rs.getInt(3), a);
                cList.add(c);
            }
        } catch (Exception e) {
        }
        return cList;
    }
    
    public List<Collection> SearchAllCollectionByName(String name) {
        List<Collection> list = new ArrayList<>();

        String sql = "Select * From Collection";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                if (rs.getString(2).toLowerCase().contains(name.toLowerCase())) {
                    AccountDAO accDAO = new AccountDAO();
                    Account acc = accDAO.getAccountById2(rs.getInt(4));
                    Collection cd = new Collection(rs.getInt(1), rs.getString(2), rs.getInt(3), acc);
                    list.add(cd);
                }
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public void DeleteCollection(int collectionId) {
        String sql = "DELETE FROM CollectionConnect WHERE CollectionID = ?";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, collectionId);
            ps.setInt(2, collectionId);
            ps.executeUpdate();

        } catch (Exception e) {
        }
    }
}
