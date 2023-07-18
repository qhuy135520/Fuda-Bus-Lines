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
public class AdminEmployeeTablesAjax extends HttpServlet {

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
            out.println("<title>Servlet AdminEmployeeTablesAjax</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminEmployeeTablesAjax at " + request.getContextPath() + "</h1>");
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
        response.setContentType("text/html;charsetUTF-8");
        HttpSession session = request.getSession();
        EmployeeDao employeeDao = new EmployeeDao();

        int page = (int) session.getAttribute("page");
        String usernameCustomer = request.getParameter("usernameCustomer");

        List<EmployeeAccount> listEmployeeFound;
        if (usernameCustomer == null || usernameCustomer.equals("")) {
            listEmployeeFound = employeeDao.getAllEmployeeRole2Pagination(page);

        } else {
            listEmployeeFound = employeeDao.searchEmployeeRole2(usernameCustomer);

        }

        PrintWriter out = response.getWriter();

        int i = 0;
        if (listEmployeeFound != null) {
            for (EmployeeAccount employeeAccount : listEmployeeFound) {
                i += 1;
                if (employeeAccount.getStatus().equals("enable")) {
                    out.println("  <tbody id=\"employeeFound\">"
                            + "<tr>\n"
                            + "  <td class=\"text-center\">" + i + "</td>\n"
                            + "  <td>" + employeeAccount.getEmployeeUsername() + "</td>\n"
                            + "  <td>" + employeeAccount.getEmployeePassword() + "</td>\n"
                            + "  <td class=\"text-center\">" + employeeAccount.getStatus() + "</td>\n"
                            + "  <td class=\"text-center\">\n"
                            + "    <button\n"
                            + "      type=\"button\"\n"
                            + "      class=\"btn btn-danger w-75\"\n"
                            + "      data-bs-toggle=\"modal\"\n"
                            + "      data-bs-target=\"#disableEmployee" + employeeAccount.getEmployeeUsername() + "\"\n"
                            + "    >\n"
                            + "      Disable\n"
                            + "    </button>\n"
                            + "  </td>\n"
                            + "</tr>\n"
                            + "</tbody>"
                    );
                } else if (employeeAccount.getStatus().equals("disable")) {
                    out.println("  <tbody id=\"employeeFound\">"
                            + "<tr>\n"
                            + "  <td class=\"text-center\">" + i + "</td>\n"
                            + "  <td>" + employeeAccount.getEmployeeUsername() + "</td>\n"
                            + "  <td>" + employeeAccount.getEmployeePassword() + "</td>\n"
                            + "  <td class=\"text-center\">" + employeeAccount.getStatus() + "</td>\n"
                            + "  \n"
                            + " \n"
                            + "    <td class=\"text-center\">\n"
                            + "      <button\n"
                            + "        type=\"button\"\n"
                            + "        class=\"btn btn-success w-75\"\n"
                            + "        data-bs-toggle=\"modal\"\n"
                            + "        data-bs-target=\"#enableEmployee" + employeeAccount.getEmployeeUsername() + "\"\n"
                            + "      >\n"
                            + "        Enable\n"
                            + "      </button>\n"
                            + "    </td>\n"
                            + "</tr>"
                            + "</tbody>"
                    );
                }
            }
        } else {
            out.print("  <td></td>\n"
                    + "    <td></td>\n"
                    + "    <td><h6 class=\"text-center\" style=\"color: red\">Not Found !!</h6></td>\n"
                    + "    <td></td>\n"
                    + "    <td></td> ");
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
