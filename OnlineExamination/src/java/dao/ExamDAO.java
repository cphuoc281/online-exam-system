/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import static dao.CollectionDAO.ps;
import static dao.CollectionDAO.rs;
import static dao.QuestionDAO.rs;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Account;
import model.Collection;
import model.Exam;

/**
 *
 * @author Phuoc
 */
public class ExamDAO {

    static Connection conn;
    static PreparedStatement ps;
    static ResultSet rs;

    public static ArrayList<Exam> getListExams() {
        try {
            String query = "select * from Exam";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            ArrayList<Exam> eList = new ArrayList<>();
            while (rs.next()) {
                Exam e = new Exam(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getInt(8));
                eList.add(e);
            }
            return eList;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public void createExam(String name, String password, int timeLimit, String date, int questionNumber, int accountId, int collectionId) {
        try {
            String query = "INSERT INTO Exam ([Name], [Password], TimeLimit, [Date], QuestionNumber, accountId, collectionId)\n"
                    + "VALUES (?, ?, ?, ?, ?, ?, ?);";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, password);
            ps.setInt(3, timeLimit);
            ps.setString(4, date);
            ps.setInt(5, questionNumber);
            ps.setInt(6, accountId);
            ps.setInt(7, collectionId);
            rs = ps.executeQuery();
        } catch (Exception e) {
        }
    }

    public Exam getExamNewest() {

        String sql = "SELECT *\n"
                + "FROM Exam\n"
                + "ORDER BY ExamID DESC";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Exam e = new Exam(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getInt(8));
                return e;
            }
        } catch (Exception e) {

        }
        return null;
    }

    public ArrayList<Exam> getListExamById(int AccountId) {
        String sql = "Select * From Exam Where AccountID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, AccountId);
            rs = ps.executeQuery();
            ArrayList<Exam> eList = new ArrayList<>();
            while (rs.next()) {
                Exam e = new Exam(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getInt(8));
                eList.add(e);
            }
            return eList;
        } catch (Exception e) {
        }
        return null;
    }
}