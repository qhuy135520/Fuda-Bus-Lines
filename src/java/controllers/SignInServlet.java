/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import dal.DAO;
import dal.EmployeeDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Customer;
import model.EmployeeAccount;

/**
 *
 * @author letra
 */
public class SignInServlet extends HttpServlet {

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
            out.println("<title>Servlet SignInServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SignInServlet at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
        MD5 m = new MD5();
        DAO d = new DAO();
        EmployeeDao employeeDAO = new EmployeeDao();
        HttpSession session = request.getSession();

//      
//
        session.removeAttribute("customer");
        session.removeAttribute("employee");
        session.removeAttribute("admin");
//        

        String phone_signin = request.getParameter("phone_signin");
        String password_signin = request.getParameter("password_signin");
        String password = m.md5(password_signin);
        String rem = request.getParameter("rem");
//       
        Customer c = d.signIn(phone_signin, password);

        EmployeeAccount employeeAccount = employeeDAO.getEmployeeAccountByUsernameAndPassword(phone_signin, m.md5(password_signin));
//        EMPLOYEE OR ADMIN

//        CUSTOMER
        if (c == null && employeeAccount == null) {
            request.setAttribute("errorUP", "Wrong Username or Password, Please Try Again !!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else if (c != null && employeeAccount == null) {
//            Add Cookie
            if (rem != null) {
                Cookie phone_cookie = new Cookie("phone", phone_signin);
                response.addCookie(phone_cookie);
                Cookie password_cookie = new Cookie("password", password_signin);
                response.addCookie(password_cookie);
            }
            session.setAttribute("customer", c);
            session.setMaxInactiveInterval(3600);
            response.sendRedirect("index.jsp");
//            Employee and Admin
        } else if (c == null && employeeAccount != null) {
            if (employeeAccount.getRole() == 2 && employeeAccount.getStatus().equals("enable")) {
                session.setAttribute("employee", employeeAccount);
                if (rem != null) {
                    Cookie phone_cookie = new Cookie("phone", phone_signin);
                    response.addCookie(phone_cookie);
                    Cookie password_cookie = new Cookie("password", password_signin);
                    response.addCookie(password_cookie);
                }
                response.sendRedirect("index.jsp");
            } else if (employeeAccount.getRole() == 1 && employeeAccount.getStatus().equals("enable")) {
                session.setAttribute("admin", employeeAccount);
                response.sendRedirect("AdminHomePageServlet");
            } else if (employeeAccount.getRole() == 2 && !employeeAccount.getStatus().equals("enable")) {
                request.setAttribute("errorBlock", "This employee is blocked !");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        }

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
