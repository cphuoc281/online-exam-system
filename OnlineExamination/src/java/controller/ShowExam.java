/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dao.CollectionConnectDAO;
import dao.ExamDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.BankQuestion;
import model.Exam;

/**
 *
 * @author Phuoc
 */
@WebServlet(name="ShowExam", urlPatterns={"/ShowExam"})
public class ShowExam extends HttpServlet {
   
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
            out.println("<title>Servlet ShowExam</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ShowExam at " + request.getContextPath () + "</h1>");
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
        ExamDAO dao = new ExamDAO();
        List<Exam> list = dao.getListExams();
        request.setAttribute("listExam", list);
        request.getRequestDispatcher("allExamView.jsp").forward(request, response);
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
        if (request.getParameter("timeLimit").matches("\\d+") && request.getParameter("questionNumber").matches("\\d+")) {
            // la so
            String name = request.getParameter("name");
            String password = request.getParameter("password");
            int timeLimit = Integer.parseInt(request.getParameter("timeLimit"));
            String date = request.getParameter("date");
            int questionNumber = Integer.parseInt(request.getParameter("questionNumber"));
            int AccountId = Integer.parseInt(request.getParameter("AccountId"));
            int CollectionId = Integer.parseInt(request.getParameter("CollectionId"));
            ExamDAO examDao = new ExamDAO();
            CollectionConnectDAO collectionDao = new CollectionConnectDAO();
            List<BankQuestion> list = collectionDao.getCollectionById(CollectionId);
            if (questionNumber <= list.size()) {
                examDao.createExam(name, password, timeLimit, date, questionNumber, AccountId, CollectionId);
                List<Exam> list1 = examDao.getListExamById(AccountId);
                request.setAttribute("listExam", list1);
                request.getRequestDispatcher("myExams.jsp").forward(request, response);
            } else {
                int cid = Integer.parseInt(request.getParameter("CollectionId"));
                request.setAttribute("collectionId", cid);
                request.getRequestDispatcher("ExamSetting.jsp").forward(request, response);
                response.sendRedirect("ExamSetting.jsp");
            }
        } else {
            // khong la so
            int id = Integer.parseInt(request.getParameter("CollectionId"));
            request.setAttribute("collectionId", id);
            request.getRequestDispatcher("ExamSetting.jsp").forward(request, response);
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
