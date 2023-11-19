/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.BankQuestion;
import model.Collection;

/**
 *
 * @author cphuo
 */
public class BankQuestionDAO {

    static Connection conn;
    static PreparedStatement ps;
    static ResultSet rs;

    public ArrayList<BankQuestion> getListQuestions() {
        try {
            String query = "select * from BankQuestion";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            ArrayList<BankQuestion> qList = new ArrayList<>();
            while (rs.next()) {
                AccountDAO dao = new AccountDAO();
                CollectionDAO d = new CollectionDAO();
                Collection c = d.getCollectionById1(rs.getInt(9));
                Account a = dao.getAccountById(rs.getInt(10));
                String image = rs.getString(3);
                BankQuestion q = new BankQuestion((rs.getInt(1)),
                        rs.getString(2),
                        image,
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8), c, a);

                qList.add(q);
            }
            return qList;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public List<BankQuestion> getCollectionById(int id) {
        String sql = "Select * From BankQuestion Where CollectionID = ?";
        List<BankQuestion> bkList = new ArrayList<>();
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                AccountDAO dao = new AccountDAO();
                CollectionDAO d = new CollectionDAO();
                Collection c = d.getCollectionById1(rs.getInt(9));
                Account a = dao.getAccountById(rs.getInt(10));
                String image = rs.getString(3);
                BankQuestion q = new BankQuestion((rs.getInt(1)),
                        rs.getString(2),
                        image,
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8), c, a);
                bkList.add(q);
            }
        } catch (Exception e) {
        }
        return bkList;
    }

//    public BankQuestion getQuestionById(int id) {
//        String sql = "Select * From BankQuestion Where BankQuestionID = ?";
//        try {
//            conn = new DBContext().getConnection();
//            ps = conn.prepareStatement(sql);
//            ps.setInt(1, id);
//            rs = ps.executeQuery();
//            while (rs.next()) {
//                AccountDAO dao = new AccountDAO();
//                CollectionDAO d = new CollectionDAO();
//                Collection c = d.getCollectionById1(rs.getInt(9));
//                Account a = dao.getAccountById(rs.getInt(10));
//                String image = rs.getString(3);
//                BankQuestion q = new BankQuestion((rs.getInt(1)),
//                        rs.getString(2),
//                        image,
//                        rs.getString(4),
//                        rs.getString(5),
//                        rs.getString(6),
//                        rs.getString(7),
//                        rs.getString(8), c, a);
//                return q;
//            }
//        } catch (Exception e) {
//        }
//        return null;
//    }
    public List<BankQuestion> getQuestionByCollectionID(int id) {
        String sql = "Select * From BankQuestion Where CollectionID = ?";
        List<BankQuestion> list = new ArrayList<>();

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                AccountDAO dao = new AccountDAO();
                CollectionDAO d = new CollectionDAO();
                Collection c = d.getCollectionById1(rs.getInt(9));
                Account a = dao.getAccountById(rs.getInt(10));
                String image = rs.getString(3);
                BankQuestion q = new BankQuestion((rs.getInt(1)),
                        rs.getString(2),
                        image,
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8), c, a);
                list.add(q);
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public void deleteQuestion(String id) {
        String query = "DELETE FROM BankQuestion WHERE QuestionID = ?";
        try {
            conn = new DBContext().getConnection();
            System.out.println(conn);
            ps = conn.prepareStatement(query);
            ps.setInt(1, Integer.parseInt(id));
            ps.setInt(2, Integer.parseInt(id));
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public int lastPagesP(int size, int id) {
        int lastPages = 0;
        String createQuery = "Select count (*) From BankQuestion Where CollectionID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(createQuery);
            rs = ps.executeQuery();
            ps.setInt(1, id);
            while (rs.next()) {
                int total = rs.getInt(1);
                lastPages = total / size;

                if (total % size != 0) {
                    lastPages++;
                }
            }
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
        return lastPages;
    }

    

    

    

//    public static void main(String[] args) {
//        BankQuestionDAO q = new BankQuestionDAO();
//        List<BankQuestion> bkList = q.getCollectionById(1);
//        for (BankQuestion o : bkList) {
//            System.out.println(o.toString());
//        }
//    }
}
