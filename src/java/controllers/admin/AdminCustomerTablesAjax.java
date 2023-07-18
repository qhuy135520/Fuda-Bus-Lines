/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers.admin;

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
public class AdminCustomerTablesAjax extends HttpServlet {

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
            out.println("<title>Servlet AdminCustomerTablesAjax</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminCustomerTablesAjax at " + request.getContextPath() + "</h1>");
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
        CustomerDao customerDao = new CustomerDao();

        int page = (int) session.getAttribute("page");
        String usernameCustomer = request.getParameter("usernameCustomer");

        List<Customer> listCustomerFound;
        if (usernameCustomer == null || usernameCustomer.equals("")) {

            listCustomerFound = customerDao.getAllCustomerPagination(page);
        } else {
            listCustomerFound = customerDao.getLikeCustomerByPhone(usernameCustomer);

        }

        PrintWriter out = response.getWriter();

        int i = 0;
        if (listCustomerFound != null) {
            for (Customer customer : listCustomerFound) {
                i += 1;
                out.println("  <tr>\n"
                        + "                                                    <td class=\"text-center\">" + i + "</td>\n"
                        + "                                                    <td class=\"text-center\">" + customer.getCustomerPhone() + "</td>\n"
                        + "                                                    <td class=\"text-center\">" + customer.getCustomerEmail() + "</td>\n"
                        + "                                                    <td class=\"text-center\">" + customer.getCustomerFirstname() + " " + customer.getCustomerLastname() + "</td>\n"
                        + "                                                    <td class=\"text-center\">" + customer.getCustomerBirthdate() + "</td>\n"
                        + "                                                    <td class=\"text-center\">" + customer.getCustomerCreatedDate() + "</td>\n"
                        + "                                                    <td class=\"text-center\"><button type=\"button\" class=\"btn btn-info w-100\"  data-bs-toggle=\"modal\" data-bs-target=\"#customer" + customer.getCustomerPhone() + "\">Edit Profile</button></td>\n"
                        + "                                                </tr>\n"
                        + "");
            }
        } else {
            out.print("<td></td>  "
                    + "<td></td>\n"
                    + "    <td></td>\n"
                    + "    <td><h6 class=\"text-center\" style=\"color: red\">Not Found !!</h6></td>\n"
                    + "    <td></td>\n"
                    + "    <td></td>"
                    + "<td></td> ");
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
