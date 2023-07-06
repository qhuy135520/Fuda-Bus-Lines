/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers.admin;

import controllers.MD5;
import dal.CustomerDao;
import dal.EmployeeDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Customer;
import model.EmployeeAccount;

/**
 *
 * @author letra
 */
public class AdminRegisterEmployeeServlet extends HttpServlet {

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
            out.println("<title>Servlet AdminRegisterEmployeeServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminRegisterEmployeeServlet at " + request.getContextPath() + "</h1>");
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
        EmployeeDao employeeDao = new EmployeeDao();
        CustomerDao customerDao = new CustomerDao();
        HttpSession session = request.getSession();
        MD5 md5 = new MD5();

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        System.out.println(username);
        EmployeeAccount employee = employeeDao.getEmployeeAccountByUsername(username);
        Customer customer = customerDao.getCustomerByPhone(username);
        if (employee != null || customer != null) {
            int page = (int) session.getAttribute("page");
            int count = employeeDao.getAllEmployeeRole2().size();
            int endPage = count / 10;
            if (count % 10 != 0) {
                endPage++;
            }
            List<EmployeeAccount> employeeAccountList = employeeDao.getAllEmployeeRole2Pagination(page);
            request.setAttribute("errorExisted", "This Employee already exist !! ");
            request.setAttribute("endPage", endPage);
            request.setAttribute("employeeList", employeeAccountList);
            request.getRequestDispatcher("AdminTables.jsp").forward(request, response);
        } else {
            EmployeeAccount employeeInserted = new EmployeeAccount(username, md5.md5(password), "enable", 2);
            employeeDao.insertEmployee(employeeInserted);
            response.sendRedirect("AdminEmployeeTablesServlet");
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
