/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers.customer;

import dal.BookingDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author letra
 */
public class TicketPurchaseListAjax extends HttpServlet {

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
            out.println("<title>Servlet TicketPurchaseListAjax</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet TicketPurchaseListAjax at " + request.getContextPath() + "</h1>");
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
        BookingDao bookingDAO = new BookingDao();
        String bookingId_raw = request.getParameter("checkbox");
        String countSeat_raw = request.getParameter("countSeat");

        int countSeat = 0;
        String seatName = "";
        int price = 0;

        try {
            countSeat = Integer.parseInt(countSeat_raw);
        } catch (NumberFormatException e) {
            System.out.println(e);
        }

        if (bookingId_raw != null && !"".equals(bookingId_raw)) {
            String[] bookingId = bookingId_raw.split(",");
            for (int i = 0; i < bookingId.length; i++) {
                int id = Integer.parseInt(bookingId[i]);
                seatName += bookingDAO.getBookingById(id).getTripSeatDetail().getSeat().getSeatName();

                price += bookingDAO.getBookingById(id).getTripSeatDetail().getTripDetail().getTicketPrice();
                if (i != (bookingId.length - 1)) {
                    seatName += ", ";
                } else {
                    seatName += ".";
                }
            }
        }

        response.setContentType("text/plain");
//        request.setAttribute("data", seatName);
        PrintWriter out = response.getWriter();
        out.print("<span style=\"color: #f03c00; font-size: 20px; font-weight: bold\">Summary</span>\n"
                + "                                    <div class=\"card\">\n"
                + "                                        <div class=\"d-flex justify-content-between p-3\">\n"
                + "                                            <div class=\"d-flex flex-column\">\n"
                + "                                                <span>Total Ticket <i class=\"fa fa-caret-down\"></i></span>\n"
                + "                                            </div>\n"
                + "                                            <div class=\"mt-1\">\n"
                + "                                                <sup class=\"super-price \" id=\"selected-seat\">" + countSeat + "</sup>&nbsp;\n"
                + "                                                <span class=\"super-month\"><i class=\"fa-solid fa-ticket fa-lg\"></i></span>\n"
                + "                                            </div>\n"
                + "                                        </div>\n"
                + "                                        <hr class=\"mt-0 line\">\n"
                + "                                        <div class=\"p-3\">\n"
                + "                                            <div class=\"d-flex justify-content-between mb-2\">\n"
                + "                                                <span>Seat name</span>\n"
                + "                                                <span id=\"selected-seat-name\">" + seatName + "</span>\n"
                + "                                            </div>\n"
                + "                                        </div>\n"
                + "                                        <hr class=\"mt-0 line\">\n"
                + "                                        <div class=\"p-3 d-flex justify-content-between\">\n"
                + "                                            <div class=\"d-flex flex-column\">\n"
                + "                                                <span>Total price(Vietnam dong)</span>\n"
                + "                                            </div>\n"
                + "                                             <div>\n"
                + "                                                <span id=\"selected-total-price\">" + price + "</span>&nbsp;<i class=\"fa-solid fa-dong-sign fa-lg\"></i>\n"
                + "                                            </div>"
                + "                                        </div>\n"
                + "                                        <div class=\"p-3\">\n"
                + "                                            <button type=\"submit\" class=\"btn btn-primary btn-block free-button\">PAY IT NOW</button> \n"
                + "    <div style=\"visibility:hidden; color:red; font-size: 20px; margin-top: 10px; \" id=\"chk_option_error\">\n"
                + "                                                    Please select at least one Trip to pay.\n"
                + "                                                </div>"
                + "                                        </div>\n"
                + "                                    </div>");
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
