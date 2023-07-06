/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers.employee;

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

/**
 *
 * @author letra
 */
public class ShowBookedCustomerAjax extends HttpServlet {

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
            out.println("<title>Servlet ShowBookedCustomerAjax</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ShowBookedCustomerAjax at " + request.getContextPath() + "</h1>");
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
        PrintWriter out = response.getWriter();
        BookingDetailDTODao bookingDetailDTODao = new BookingDetailDTODao();

        String phoneCustomer = request.getParameter("phoneCustomer");
        String tripDetailId = request.getParameter("tripDetailId");

        int page = (int) session.getAttribute("page");

        List<BookingDetailDTO> listBookingDetailDTO;
        String paginationNull;
        if (phoneCustomer == null || phoneCustomer.equals("")) {
            paginationNull = null;
            listBookingDetailDTO = bookingDetailDTODao.getBookingDetailByTripDetailIdAndBookingStatusWithPagination(tripDetailId, page);
        } else {
            paginationNull = "not null";
            listBookingDetailDTO = bookingDetailDTODao.getAllBookingDetailByTripDetailIdAndPhone(tripDetailId, phoneCustomer);
        }
        request.setAttribute("paginationNull", paginationNull);
        if (listBookingDetailDTO != null) {

            for (BookingDetailDTO bookingDetailDTO : listBookingDetailDTO) {
                if (bookingDetailDTO.getBooking().getBookingStatus().equals("paid")) {
                    out.println("<tbody id=\"searchCustomerTable\">\n"
                            + "    <tr class=\"alert\" role=\"alert\">\n"
                            //                            + "      <td>&nbsp;</td>\n"
                            + "\n"
                            + "      <td class=\"d-flex align-items-center\">\n"
                            + "        <div\n"
                            + "          class=\"img\"\n"
                            + "          style=\"\n"
                            + "            background-image: url('" + bookingDetailDTO.getBooking().getCustomer().getCustomerUrlImg() + "') !important;\n"
                            + "          \"\n"
                            + "        ></div>\n"
                            + "        <div class=\"pl-3 email\">\n"
                            + "          <span>" + bookingDetailDTO.getBooking().getCustomer().getCustomerEmail() + "</span>\n"
                            + "          <span\n"
                            + "            >Created date:\n"
                            + "            " + bookingDetailDTO.getBooking().getCustomer().getCustomerCreatedDate() + "\n"
                            + "          </span>\n"
                            + "        </div>\n"
                            + "      </td>\n"
                            + "      <td>\n"
                            + "        " + bookingDetailDTO.getBooking().getCustomer().getCustomerFirstname() + "\n"
                            + "       " + bookingDetailDTO.getBooking().getCustomer().getCustomerLastname() + "\n"
                            + "      </td>\n"
                            + "      <td>" + bookingDetailDTO.getBooking().getCustomer().getCustomerPhone() + "</td>\n"
                            + "      <td>" + bookingDetailDTO.getBooking().getTripSeatDetail().getSeat().getSeatName() + "</td>\n"
                            + "\n"
                            + "     <td>" + bookingDetailDTO.getBooking().getBookedDate() + "</td>\n"
                            + "     <td>" + bookingDetailDTO.getBooking().getBookedTime() + "</td>"
                            + " <td>" + bookingDetailDTO.getBooking().getTripSeatDetail().getTripDetail().getTicketPrice() + "</td>"
                            + "      <td class=\"status\">\n"
                            + "        <span class=\"active\">" + bookingDetailDTO.getBooking().getBookingStatus() + "</span>\n"
                            + "      </td>\n"
                            + "\n"
                            + "      <td>\n"
                            + "        <button\n"
                            + "          type=\"button\"\n"
                            + "          class=\"w-100 btn btn-outline-danger\"\n"
                            + "          data-bs-toggle=\"modal\"\n"
                            + "          data-bs-target=\"#CancelModal" + bookingDetailDTO.getBooking().getBookingId() + "\"\n"
                            + "        >\n"
                            + "          cancel\n"
                            + "        </button>\n"
                            + "        <div\n"
                            + "          class=\"modal fade\"\n"
                            + "          id=\"CancelModal" + bookingDetailDTO.getBooking().getBookingId() + "\"\n"
                            + "          tabindex=\"-1\"\n"
                            + "          aria-labelledby=\"exampleModalLabel\"\n"
                            + "          aria-hidden=\"true\"\n"
                            + "        >\n"
                            + "          <div class=\"modal-dialog\">\n"
                            + "            <div class=\"modal-content\">\n"
                            + "              <div class=\"modal-header\">\n"
                            + "                <h1 class=\"modal-title fs-5\" id=\"exampleModalLabel\">\n"
                            + "                  Cancel ticket\n"
                            + "                </h1>\n"
                            + "                <button\n"
                            + "                  type=\"button\"\n"
                            + "                  class=\"btn-close\"\n"
                            + "                  data-bs-dismiss=\"modal\"\n"
                            + "                  aria-label=\"Close\"\n"
                            + "                ></button>\n"
                            + "              </div>\n"
                            + "            <div class=\"modal-body\">\n"
                            + "         Customer phone: " + bookingDetailDTO.getBooking().getCustomer().getCustomerPhone() + "<br>\n"
                            + "                   Customer name: " + bookingDetailDTO.getBooking().getCustomer().getCustomerFirstname() + " " + bookingDetailDTO.getBooking().getCustomer().getCustomerLastname() + " <br>\n"
                            + "           Price: " + bookingDetailDTO.getBooking().getTripSeatDetail().getTripDetail().getTicketPrice() + " <br>\n"
                            + "       Seat name: " + bookingDetailDTO.getBooking().getTripSeatDetail().getSeat().getSeatName() + " <br>\n"
                            + "       Are you sure to Cancel Ticket ?\n"
                            + "       </div>"
                            + "              <div class=\"modal-footer\">\n"
                            + "                <button\n"
                            + "                  type=\"button\"\n"
                            + "                  class=\"btn btn-secondary\"\n"
                            + "                  data-bs-dismiss=\"modal\"\n"
                            + "                >\n"
                            + "                  Close\n"
                            + "                </button>\n"
                            + "                <button\n"
                            + "                  style=\"margin-left: 15px\"\n"
                            + "                  onclick=\"window.location = 'ShowBookedCustomerCancelServlet?bookingId=" + bookingDetailDTO.getBooking().getBookingId() + "&tripDetailId=" + bookingDetailDTO.getTripDetailId() + "'\"\n"
                            + "                  type=\"button\"\n"
                            + "                  class=\"btn btn-danger\"\n"
                            + "                >\n"
                            + "                  Agree\n"
                            + "                </button>\n"
                            + "              </div>\n"
                            + "            </div>\n"
                            + "          </div>\n"
                            + "        </div>\n"
                            + "      </td>\n"
                            + "    </tr>\n"
                            + "</tbody>");
                } else if (bookingDetailDTO.getBooking().getBookingStatus().equals("order")) {
                    out.println("<tbody id=\"searchCustomerTable\">\n"
                            + "  <tr class=\"alert\" role=\"alert\">\n"
                            //                            + "    <td>\n"
                            //                            + "      <label class=\"checkbox-wrap checkbox-primary\">\n"
                            //                            + "        <input class=\"checkbox\" type=\"checkbox\" name=\"\" />\n"
                            //                            + "        <span class=\"checkmark\"></span>\n"
                            //                            + "      </label>\n"
                            //                            + "    </td>\n"
                            + "\n"
                            + "    <td class=\"d-flex align-items-center\">\n"
                            + "      <div\n"
                            + "        class=\"img\"\n"
                            + "        style=\"\n"
                            + "          background-image: url('" + bookingDetailDTO.getBooking().getCustomer().getCustomerUrlImg() + "') !important;\n"
                            + "        \"\n"
                            + "      ></div>\n"
                            + "      <div class=\"pl-3 email\">\n"
                            + "        <span>" + bookingDetailDTO.getBooking().getCustomer().getCustomerEmail() + "</span>\n"
                            + "        <span\n"
                            + "          >Created date:\n"
                            + "          " + bookingDetailDTO.getBooking().getCustomer().getCustomerCreatedDate() + "\n"
                            + "        </span>\n"
                            + "      </div>\n"
                            + "    </td>\n"
                            + "    <td>\n"
                            + "      " + bookingDetailDTO.getBooking().getCustomer().getCustomerFirstname() + "\n"
                            + "      " + bookingDetailDTO.getBooking().getCustomer().getCustomerLastname() + "\n"
                            + "    </td>\n"
                            + "    <td>" + bookingDetailDTO.getBooking().getCustomer().getCustomerPhone() + "</td>\n"
                            + "    <td>" + bookingDetailDTO.getBooking().getTripSeatDetail().getSeat().getSeatName() + "</td>\n"
                            + "\n"
                            + "     <td>" + bookingDetailDTO.getBooking().getBookedDate() + "</td>\n"
                            + " <td>" + bookingDetailDTO.getBooking().getBookedTime() + "</td>"
                            + " <td>" + bookingDetailDTO.getBooking().getTripSeatDetail().getTripDetail().getTicketPrice() + "</td>"
                            + "    <td class=\"status\">\n"
                            + "      <span class=\"waiting\">" + bookingDetailDTO.getBooking().getBookingStatus() + "</span>\n"
                            + "    </td>\n"
                            + "\n"
                            + "    <td>\n"
                            + "      <div\n"
                            + "        class=\"btn-group w-100\"\n"
                            + "        role=\"group\"\n"
                            + "        aria-label=\"Basic mixed styles example\"\n"
                            + "      >\n"
                            + "        <button type=\"button\" class=\"w-50 btn btn-outline-success\" data-bs-toggle=\"modal\" data-bs-target=\"#ConfirmModal" + bookingDetailDTO.getBooking().getBookingId() + "\">\n"
                            + "          Confirm\n"
                            + "        </button>\n"
                            + "        <button\n"
                            + "          type=\"button\"\n"
                            + "          class=\"w-50 btn btn-outline-danger\"\n"
                            + "          data-bs-toggle=\"modal\"\n"
                            + "          data-bs-target=\"#CancelModal" + bookingDetailDTO.getBooking().getBookingId() + "\"\n"
                            + "        >\n"
                            + "          Cancel\n"
                            + "        </button>\n"
                            + "      </div>\n"
                            + "      <div\n"
                            + "        class=\"modal fade\"\n"
                            + "        id=\"CancelModal" + bookingDetailDTO.getBooking().getBookingId() + "\"\n"
                            + "        tabindex=\"-1\"\n"
                            + "        aria-labelledby=\"exampleModalLabel\"\n"
                            + "        aria-hidden=\"true\"\n"
                            + "      >\n"
                            + "        <div class=\"modal-dialog\">\n"
                            + "          <div class=\"modal-content\">\n"
                            + "            <div class=\"modal-header\">\n"
                            + "              <h1 class=\"modal-title fs-5\" id=\"exampleModalLabel\">\n"
                            + "                Cancel ticket\n"
                            + "              </h1>\n"
                            + "              <button\n"
                            + "                type=\"button\"\n"
                            + "                class=\"btn-close\"\n"
                            + "                data-bs-dismiss=\"modal\"\n"
                            + "                aria-label=\"Close\"\n"
                            + "              ></button>\n"
                            + "            </div>\n"
                            + "            <div class=\"modal-body\">\n"
                            + "         Customer phone: " + bookingDetailDTO.getBooking().getCustomer().getCustomerPhone() + "<br>\n"
                            + "                   Customer name: " + bookingDetailDTO.getBooking().getCustomer().getCustomerFirstname() + " " + bookingDetailDTO.getBooking().getCustomer().getCustomerLastname() + " <br>\n"
                            + "           Price: " + bookingDetailDTO.getBooking().getTripSeatDetail().getTripDetail().getTicketPrice() + " <br>\n"
                            + "       Seat name: " + bookingDetailDTO.getBooking().getTripSeatDetail().getSeat().getSeatName() + " <br>\n"
                            + "       Are you sure to Cancel Ticket ?\n"
                            + "                                                                </div>"
                            + "            <div class=\"modal-footer\">\n"
                            + "              <button\n"
                            + "                type=\"button\"\n"
                            + "                class=\"btn btn-secondary\"\n"
                            + "                data-bs-dismiss=\"modal\"\n"
                            + "              >\n"
                            + "                Close\n"
                            + "              </button>\n"
                            + "              <button\n"
                            + "                style=\"margin-left: 15px\"\n"
                            + "                onclick=\"window.location = 'ShowBookedCustomerCancelServlet?bookingId=" + bookingDetailDTO.getBooking().getBookingId() + "&tripDetailId=" + bookingDetailDTO.getTripDetailId() + "'\"\n"
                            + "                type=\"button\"\n"
                            + "                class=\"btn btn-danger\"\n"
                            + "              >\n"
                            + "                Agree\n"
                            + "              </button>\n"
                            + "            </div>\n"
                            + "          </div>\n"
                            + "        </div>\n"
                            + "      </div>\n"
                            + "<div class=\"modal fade\" id=\"ConfirmModal" + bookingDetailDTO.getBooking().getBookingId() + "\" tabindex=\"-1\" aria-labelledby=\"exampleModalLabel\" aria-hidden=\"true\">\n"
                            + "                                                        <div class=\"modal-dialog\">\n"
                            + "                                                            <div class=\"modal-content\">\n"
                            + "                                                                <div class=\"modal-header\">\n"
                            + "                                                                    <h1 class=\"modal-title fs-5\" id=\"exampleModalLabel\">Cancel ticket</h1>\n"
                            + "                                                                    <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"modal\" aria-label=\"Close\"></button>\n"
                            + "                                                                </div>\n"
                            + "            <div class=\"modal-body\">\n"
                            + "         Customer phone: " + bookingDetailDTO.getBooking().getCustomer().getCustomerPhone() + "<br>\n"
                            + "                   Customer name: " + bookingDetailDTO.getBooking().getCustomer().getCustomerFirstname() + " " + bookingDetailDTO.getBooking().getCustomer().getCustomerLastname() + " <br>\n"
                            + "           Price: " + bookingDetailDTO.getBooking().getTripSeatDetail().getTripDetail().getTicketPrice() + " <br>\n"
                            + "       Seat name: " + bookingDetailDTO.getBooking().getTripSeatDetail().getSeat().getSeatName() + " <br>\n"
                            + "       Are you sure to Cancel Ticket ?\n"
                            + "                                                                </div>"
                            + "                                                                <div class=\"modal-footer\">\n"
                            + "                                                                    <button type=\"button\" class=\"btn btn-secondary\" data-bs-dismiss=\"modal\">Close</button>\n"
                            + "                                                                    <button style=\"margin-left: 15px;\" onclick=\"window.location = 'ShowBookedCustomerConfirmServlet?bookingId=" + bookingDetailDTO.getBooking().getBookingId() + "&tripDetailId=" + bookingDetailDTO.getTripDetailId() + "'\" type=\"button\" class=\"btn btn-success\">Agree</button>\n"
                            + "                                                                </div>\n"
                            + "                                                            </div>\n"
                            + "                                                        </div>\n"
                            + "                                                    </div>"
                            + "    </td>\n"
                            + "  </tr>\n"
                            + "</tbody>");
                }
            }
        } else {
            out.print("  <td></td>\n"
                    + "    <td></td>\n"
                    + "    <td></td>  \n"
                    + "    <td></td>\n"
                    + "    <td><h6 class=\"text-center\" style=\"color: red\">Not Found !!</h6></td>\n"
                    + "    <td></td> \n"
                    + "    <td></td>\n"
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
