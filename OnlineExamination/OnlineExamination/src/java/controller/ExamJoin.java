/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dao.ExamDAO;
import dao.BankQuestionDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import model.BankQuestion;
import model.Exam;

/**
 *
 * @author Phuoc
 */
@WebServlet(name="examJoin", urlPatterns={"/examJoin"})
public class ExamJoin extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet examJoin</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet examJoin at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("ExamId", id);
        request.getRequestDispatcher("joinExam.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        int ExamId = Integer.parseInt(request.getParameter("ExamId"));
        String pass = request.getParameter("pass");
        ExamDAO examDao = new ExamDAO();
        Exam exam = examDao.getExamById(ExamId);
        if (examDao.getExamById(ExamId).getPassword().equals(pass)) {
            BankQuestionDAO qdao = new BankQuestionDAO();
            List<BankQuestion> newList = new ArrayList<>();
            List<BankQuestion> list = qdao.getCollectionById(exam.getCollectionId());
            int numberOfQuestions = Math.min(exam.getQuestionNumber(), list.size());
            Collections.shuffle(list);
            newList = list.subList(0, numberOfQuestions);
            request.setAttribute("list", newList);
            request.setAttribute("time", exam.getTimeLimit());
            request.setAttribute("numberQuestion", exam.getQuestionNumber());
            request.setAttribute("ExamId", ExamId);
            request.getRequestDispatcher("showExam.jsp").forward(request, response);
        }
        else {
            request.setAttribute("ExamId", ExamId);
            request.setAttribute("message", "Password incorrect");
            request.getRequestDispatcher("joinExam.jsp").forward(request, response);
        }
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
