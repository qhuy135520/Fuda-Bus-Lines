/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers.customer;

import dal.BookingDao;
import dal.BookingDetailDTODao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.BookingDetailDTO;
import model.Customer;

/**
 *
 * @author letra
 */
public class HistoryPurchaseListServlet extends HttpServlet {

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
            out.println("<title>Servlet HistoryPurchaseListServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet HistoryPurchaseListServlet at " + request.getContextPath() + "</h1>");
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
        BookingDao bookingDao = new BookingDao();
        BookingDetailDTODao bookingDetailDTODao = new BookingDetailDTODao();
        String page_raw = request.getParameter("page");
        int page = 1;
        if (page_raw != null) {
            page = Integer.parseInt(page_raw);
        }

        Customer customer = (Customer) session.getAttribute("customer");
        List<BookingDetailDTO> bookingDetailDTOCount = bookingDetailDTODao.getAllBookingDetailByCustomerPhone(customer.getCustomerPhone());

//        Sort List , 1 = sort by status, empty = sort by date
        String sort = request.getParameter("sort");
        List<BookingDetailDTO> bookingDetailDTOList = null;
        if (sort != null && sort.equals("1")) {
            session.setAttribute("sort", 1);
            bookingDetailDTOList = bookingDetailDTODao.getListBookingDetailDTOByCustomerPhoneWithPaginationOrderByStatus(customer.getCustomerPhone(), page);
        } else if (sort != null && sort.equals("2")) {
            session.setAttribute("sort", 2);
            bookingDetailDTOList = bookingDetailDTODao.getListBookingDetailDTOByCustomerPhoneWithPagination(customer.getCustomerPhone(), page);
        } else {
            session.setAttribute("sort", 2);
            bookingDetailDTOList = bookingDetailDTODao.getListBookingDetailDTOByCustomerPhoneWithPagination(customer.getCustomerPhone(), page);
        }
        int count = bookingDetailDTOCount.size();
        int endPage = count / 10;
        if (count % 10 != 0) {
            endPage++;
        }

        session.setAttribute("page", page);
        request.setAttribute("endPage", endPage);
        request.setAttribute("bookingDetailDTOList", bookingDetailDTOList);
        request.getRequestDispatcher("HistoryPurchase.jsp").forward(request, response);
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
