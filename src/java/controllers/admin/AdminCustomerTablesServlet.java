/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers.admin;

import dal.CustomerDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Customer;

/**
 *
 * @author letra
 */
public class AdminCustomerTablesServlet extends HttpServlet {

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
            out.println("<title>Servlet AdminCustomerTablesServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminCustomerTablesServlet at " + request.getContextPath() + "</h1>");
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
        CustomerDao customerDao = new CustomerDao();
        HttpSession session = request.getSession();
        String page_raw = request.getParameter("page");

        List<Customer> customerListFull = customerDao.getAllCustomer();
        int page = 1;
        int count = customerListFull.size();
        if (page_raw != null) {
            page = Integer.parseInt(page_raw);
        }
        int endPage = count / 5;
        if (count % 5 != 0) {
            endPage++;
        }

        List<Customer> customerList = customerDao.getAllCustomerPagination(page);

        session.setAttribute("page", page);
        request.setAttribute("endPage", endPage);
        request.setAttribute("customerList", customerList);
        request.setAttribute("customerListFull", customerListFull);
        request.getRequestDispatcher("AdminCustomerTables.jsp").forward(request, response);
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
        CustomerDao customerDao = new CustomerDao();
        HttpSession session = request.getSession();
        String page_raw = request.getParameter("page");

        String emailExisted = (String) request.getAttribute("emailExisted");
        String customerPhone = (String) request.getAttribute("customerPhone");
        List<Customer> customerListFull = customerDao.getAllCustomer();
        int page = 1;
        int count = customerListFull.size();
        if (page_raw != null) {
            page = Integer.parseInt(page_raw);
        }
        int endPage = count / 5;
        if (count % 5 != 0) {
            endPage++;
        }

        List<Customer> customerList = customerDao.getAllCustomerPagination(page);

        session.setAttribute("page", page);
        request.setAttribute("endPage", endPage);
        request.setAttribute("customerList", customerList);
        request.setAttribute("customerListFull", customerListFull);
        request.setAttribute("emailExisted", emailExisted);
        request.setAttribute("customerPhone", customerPhone);
        request.getRequestDispatcher("AdminCustomerTables.jsp").forward(request, response);
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
