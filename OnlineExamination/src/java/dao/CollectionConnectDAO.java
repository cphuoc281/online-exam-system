/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import model.BankQuestion;
import context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Phuoc
 */
public class CollectionConnectDAO {
    static Connection conn;
    static PreparedStatement ps;
    static ResultSet rs;
    
    public List<BankQuestion> getCollectionById(int id) {
        String sql = "Select * From CollectionConnect Where CollectionID = ?";
        List<BankQuestion> bkList = new ArrayList<>();
        QuestionDAO q = new QuestionDAO();
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                bkList.add(q.getQuestionById(rs.getInt(2)));
            }
        } catch (Exception e) {
        }
        return bkList;
    }
    
    public static void main(String[] args) {
        CollectionConnectDAO c = new CollectionConnectDAO();
        List<BankQuestion> qList = c.getCollectionById(1);
        for (BankQuestion o : qList) {
            System.out.println(o.toString());
        }
    }
}
