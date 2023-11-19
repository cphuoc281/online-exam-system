/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.AccountDAO;
import dao.BankQuestionDAO;
import dao.CollectionDAO;
import dao.ExamDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import model.Collection;
import model.Exam;

/**
 *
 * @author Phuoc
 */
@WebServlet(name = "Delete", urlPatterns = {"/Delete"})
public class Delete extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        switch (id.charAt(0)) {
            case 'a': {
                AccountDAO dao = new AccountDAO();
                if (dao.getAccount(id.substring(1)).getRole() >= 0) {
                    dao.deleteAccount(id.substring(1));
                }
                response.sendRedirect("manageUser.jsp");
                break;
            }
            case 'q': {
                BankQuestionDAO dao = new BankQuestionDAO();
                dao.deleteQuestion(id.substring(1));
                response.sendRedirect("manageQuestion.jsp");
                break;
            }
            case 'o': {
                BankQuestionDAO dao = new BankQuestionDAO();
                dao.deleteQuestion(id.substring(1));
//                String[] split = id.split("o");
                request.setAttribute("id", "2");
                request.getRequestDispatcher("EditOptionServlet").forward(request, response);
//                response.sendRedirect("EditOptionServlet");
                break;
            }
            case 'e': {
                ExamDAO dao = new ExamDAO();
                int ExamId = Integer.parseInt(id.substring(1));
                int AccountId = dao.getExamById(ExamId).getAccountId();

                dao.DeleteExam(Integer.parseInt(id.substring(1)));
                List<Exam> list = dao.getListExamByAccountID(AccountId);

                request.setAttribute("listExam", list);
                request.getRequestDispatcher("myExams.jsp").forward(request, response);
            }
            case 'c': {
                CollectionDAO dao = new CollectionDAO();
                int CollectionId = Integer.parseInt(id.substring(1));
                int AccountId = dao.getCollectionById1(CollectionId).getAccountID().getId();

                dao.DeleteCollection(CollectionId);

                List<Collection> list = dao.getCollectionByAccountId(AccountId);

                request.setAttribute("listCollectionDetail", list);
                request.getRequestDispatcher("myCourses.jsp").forward(request, response);
            }
            default:
                break;
        }
    }
}
