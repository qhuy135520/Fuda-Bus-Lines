/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers.admin;

import dal.EmployeeDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.EmployeeAccount;

/**
 *
 * @author letra
 */
public class AdminEmployeeTablesServlet extends HttpServlet {

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
            out.println("<title>Servlet AdminEmployeeTablesServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminEmployeeTablesServlet at " + request.getContextPath() + "</h1>");
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
        EmployeeDao employeeDao = new EmployeeDao();
        HttpSession session = request.getSession();
        String page_raw = request.getParameter("page");
        
        List<EmployeeAccount> employeeAccountListFull = employeeDao.getAllEmployeeRole2();
        int page = 1;
        int count = employeeAccountListFull.size();
        if (page_raw != null) {
            page = Integer.parseInt(page_raw);
        }
        int endPage = count / 10;
        if (count % 10 != 0) {
            endPage++;
        }

        List<EmployeeAccount> employeeAccountList = employeeDao.getAllEmployeeRole2Pagination(page);
        
        
        session.setAttribute("page", page);
        request.setAttribute("endPage", endPage);
        request.setAttribute("employeeList", employeeAccountList);
        request.setAttribute("employeeListFull",employeeAccountListFull);
        request.getRequestDispatcher("AdminEmployeeTables.jsp").forward(request, response);
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
        processRequest(request, response);
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
