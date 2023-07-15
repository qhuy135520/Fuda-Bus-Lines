/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

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
public class CustomerBookingConfirmAjax extends HttpServlet {

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
            out.println("<title>Servlet CustomerBookingConfirmAjax</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CustomerBookingConfirmAjax at " + request.getContextPath() + "</h1>");
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
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();

        CustomerDao customerDao = new CustomerDao();

        HttpSession session = request.getSession();
        String phoneCustomer = request.getParameter("phoneCustomer");
        int page = (int) session.getAttribute("page");

        List<Customer> listCustomer;

        if (phoneCustomer == null || phoneCustomer.equals("")) {
            listCustomer = customerDao.getAllCustomerPagination(page);
        } else {
            listCustomer = customerDao.getLikeCustomerByPhone(phoneCustomer);
        }
        if (listCustomer != null) {
            int i = 0;
            for (Customer customer : listCustomer) {
                i++;
                out.println(" <tr>\n"
                        + "                                                    <td>" + i + "</td>\n"
                        + "                                                    <td><a href=\"#\"><img src=\"" + customer.getCustomerUrlImg() + "\" class=\"avatar\" alt=\"Avatar\"> " + customer.getCustomerFirstname() + " " + customer.getCustomerLastname() + "</a></td>\n"
                        + "                                                    <td>" + customer.getCustomerPhone() + "</td>                        \n"
                        + "                                                    <td>" + customer.getCustomerEmail() + "</td>\n"
                        + "                                                    <td>" + customer.getCustomerCreatedDate() + "</td>\n"
                        + "                                                    <td>" + customer.getCustomerBirthdate() + "</td>\n"
                        + "  <td><button class=\"btn btn-primary\" data-bs-toggle=\"modal\" data-bs-target=\"#Customer" + customer.getCustomerPhone() + "\">Choose</button></td>"
                        + "                                                </tr>\n");

            }
        } else {
            out.print("  <td></td>\n"
                    + "    <td></td>\n"
                    + "    <td></td>  \n"
                    + "    <td></td>\n"
                    + "    <td><h6 class=\"text-center\" style=\"color: red\">Not Found !!</h6></td>\n"
                    + "    <td></td> \n"
                    + "    <td></td>\n"
                    + "    <td></td>\n");
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
