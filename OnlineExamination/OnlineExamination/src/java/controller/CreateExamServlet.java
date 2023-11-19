/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.BankQuestionDAO;
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
@WebServlet(name = "CreateExamServlet", urlPatterns = {"/createExam"})
public class CreateExamServlet extends HttpServlet {

    int maxAllowed = 0;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CreateExamServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CreateExamServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        int timeLimit = Integer.parseInt(request.getParameter("timeLimit"));
        String date = request.getParameter("date");
        int questionNumber = Integer.parseInt(request.getParameter("questionNumber"));
        System.out.println("questionNumber" + questionNumber);
        int accountId = Integer.parseInt(request.getParameter("accountId"));
        int collectionId = Integer.parseInt(request.getParameter("collectionId"));
        BankQuestionDAO dao = new BankQuestionDAO();
        List<BankQuestion> listB = dao.getQuestionByCollectionID(collectionId);
        for (BankQuestion o : listB) {
            System.out.println(o);
        }
//        maxAllowed = questionNumber;
//        ExamDAO d = new ExamDAO();
//        d.createExam(name, password, timeLimit, date, questionNumber, accountId, collectionId);
//        Exam exam = d.getExamNewest();
//        request.setAttribute("maxAllowed", maxAllowed);
//        request.setAttribute("listBSize", listB.size());
//        request.setAttribute("listB", listB);
//        request.setAttribute("exam", exam);
//        request.setAttribute("successMsg", "Exam created successfully!");
//        request.getRequestDispatcher("addQuestion.jsp").forward(request, response);
        if (questionNumber <= listB.size()) {
            maxAllowed = questionNumber;
            ExamDAO d = new ExamDAO();
            d.createExam(name, password, timeLimit, date, questionNumber, accountId, collectionId);
            Exam exam = d.getExamNewest();
            request.setAttribute("maxAllowed", maxAllowed);
            request.setAttribute("listB", listB);
            request.setAttribute("exam", exam);
            request.setAttribute("successMsg", "Exam created successfully!");
            request.getRequestDispatcher("addQuestion.jsp").forward(request, response);
        } else {
            request.setAttribute("errorMsg", "questionLimitExceeded");
        }

    }

    public int getMaxAllowed() {
        return maxAllowed;
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
