/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;

/**
 *
 * @author cphuo
 */
@WebServlet(name = "ForgotPasswordServlet", urlPatterns = {"/ForgotPasswordServlet"})
public class ForgotPasswordServlet extends HttpServlet {

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
            out.println("<title>Servlet ForgotPasswordServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ForgotPasswordServlet at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();

        String emailCode = request.getParameter("emailCode");
        String randomCode = (String) session.getAttribute("randomCode");

        if (emailCode.equals(randomCode)) {
            response.sendRedirect("getPassword.jsp");
        } else {
            request.setAttribute("errorEnterCode", "Wrong code, try again !!");
            request.getRequestDispatcher("enterCodeSetPass.jsp").forward(request, response);
        }
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
        AccountDAO dao = new AccountDAO();
        HttpSession session = request.getSession();
        SendMail s = new SendMail();

        String email = request.getParameter("email");
        int randomCode_raw = randomCode();
        String randomCode = String.valueOf(randomCode_raw);
        Account a = dao.getAccountByEmail(email);
        if (a != null) {
            session.setAttribute("randomCode", randomCode);
            session.setAttribute("accountReset", a);

            try {
                s.resetPassword(randomCode, email);
            } catch (Exception ex) {
                Logger.getLogger(ForgotPasswordServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            response.sendRedirect("enterCodeSetPass.jsp");
        } else {
            request.setAttribute("errorEmail", "Email isn't existed, try again !!");
            request.getRequestDispatcher("forgotPassword.jsp").forward(request, response);
        }
    }
    public static int randomCode() {
        int min = 100000; // Minimum value of range
        int max = 999999; // Maximum value of range
        // Print the min and max  
        System.out.println("Random Code in int from " + min + " to " + max + ":");
        // Generate random int value from min to max
        int random_int = (int) Math.floor(Math.random() * (max - min + 1) + min);
        // Printing the generated random numbers
        System.out.println(random_int);
        return random_int;
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
