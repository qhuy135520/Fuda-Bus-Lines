/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers.customer;

import controllers.SendMail;
import dal.CustomerDao;
import dal.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import model.Customer;

/**
 *
 * @author letra
 */
public class EditProfileVerifyCodeServlet extends HttpServlet {

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
            out.println("<title>Servlet ChangePasswordProfileServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChangePasswordProfileServlet at " + request.getContextPath() + "</h1>");
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
     * @throws java.io.UnsupportedEncodingException
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, UnsupportedEncodingException {
        HttpSession session = request.getSession();
        DAO d = new DAO();
        SendMail sendMail = new SendMail();

        String email = request.getParameter("email");
//        Compare email
        Customer cInput = d.getCustomerByEmail(email);
        Customer c = (Customer) session.getAttribute("customer");

        int randomCode_raw = randomCode();
        String randomCode = String.valueOf(randomCode_raw);
        if (cInput != null && c.getCustomerEmail().equals(cInput.getCustomerEmail())) {
            try {
                sendMail.sendCodeChangePassword(randomCode, c.getCustomerEmail());
            } catch (MessagingException ex) {
                Logger.getLogger(EditProfileVerifyCodeServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            session.setAttribute("codeVerify", randomCode);
            response.sendRedirect("EditProfileVerifyCode.jsp");
        } else {
            request.setAttribute("editEmailVerificationError", "Email doesn't match, try again!");
            request.getRequestDispatcher("EditProfileEmailVerification.jsp").forward(request, response);
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
        HttpSession session = request.getSession();

        String code = request.getParameter("code");
        String codeVerify = (String) session.getAttribute("codeVerify");
        if (code.equals(codeVerify)) {
            response.sendRedirect("EditProfileChangePassword.jsp");
        } else {
            request.setAttribute("editProfileCodeError", "The code isn't correct, try again!");
            request.getRequestDispatcher("EditProfileVerifyCode.jsp").forward(request, response);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
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

}
