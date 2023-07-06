/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import dal.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import model.Customer;

/**
 *
 * @author letra
 */
public class SignUpServlet extends HttpServlet {

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
            out.println("<title>Servlet SignUpServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SignUpServlet at " + request.getContextPath() + "</h1>");
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
        DAO d = new DAO();
        String emailCode = request.getParameter("emailCode");
        int randomCode_raw = (int) session.getAttribute("randomCode");
        String randomCode = String.valueOf(randomCode_raw);
        Customer c = (Customer) session.getAttribute("customer_signup");
        if (emailCode.equals(randomCode)) {
            d.signUp(c);
            response.sendRedirect("SuccessEmail.jsp");
            session.invalidate();
        } else {
            request.setAttribute("error", "Wrong code, try again !!");
            request.getRequestDispatcher("ConfirmEmail.jsp").forward(request, response);
        }

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.io.UnsupportedEncodingException
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, UnsupportedEncodingException {
        HttpSession session = request.getSession();
        MD5 m = new MD5();
        DAO d = new DAO();
//        Current Date => Created Date
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDateTime now = LocalDateTime.now();
        SendMail s = new SendMail();
//        Get Infor
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String birthdate = request.getParameter("birthdate");
        String email_signup = request.getParameter("email_signup");
        String phone_signup = request.getParameter("phone_signup");
        String password_signup = request.getParameter("password_signup");
        String confirmPassword_signup = request.getParameter("confirmPassword_signup");
//         hashing password, 
        String password = m.md5(password_signup);
//        Create Customer,

// Check phone
        Customer c_raw = d.getCustomerByPhone(phone_signup);
//        Check Email
        Customer c_raw_checkEmail = d.getCustomerByEmail(email_signup);
        if (password_signup.equals(confirmPassword_signup) && c_raw == null && c_raw_checkEmail == null) {

            Customer c = new Customer(phone_signup, email_signup, firstname, lastname, birthdate, password, dtf.format(now), null);
//            OTP
            int randomCode = randomCode();
            
            session.setAttribute("customer_signup", c);
            session.setAttribute("randomCode", randomCode);
//            
            try {
                s.sendCode(String.valueOf(randomCode), c.getCustomerEmail());
            } catch (MessagingException ex) {
                Logger.getLogger(SignUpServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
//            
            response.sendRedirect("ConfirmEmail.jsp");
        } else if (c_raw != null) {
            request.setAttribute("errorPhone", "Phone is already existed !");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        } else if (c_raw_checkEmail != null) {
            request.setAttribute("errorEmail", "Email is already existed !");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
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
