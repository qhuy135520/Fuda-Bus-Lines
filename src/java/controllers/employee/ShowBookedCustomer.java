/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers.employee;

import dal.BookingDetailDTODao;
import dal.StationDAO;
import dal.TripDetailDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.format.DateTimeFormatter;
import java.util.List;
import model.BookingDetailDTO;
import model.TripDetail;

/**
 *
 * @author letra
 */
public class ShowBookedCustomer extends HttpServlet {

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
            out.println("<title>Servlet ShowBookedCustomer</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ShowBookedCustomer at " + request.getContextPath() + "</h1>");
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
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        String page_raw = request.getParameter("page");
        String tripDetailId = request.getParameter("tripDetailId");

        BookingDetailDTODao bookingDetailDTODao = new BookingDetailDTODao();
        TripDetailDao tripDetailDao = new TripDetailDao();
        StationDAO stationDao = new StationDAO();
        HttpSession session = request.getSession();
//        Get TripDetail
        TripDetail tripDetail = tripDetailDao.getTripDetailById(tripDetailId);
//        Get Orign and Destination

        List<BookingDetailDTO> listBookingDetailDTO = bookingDetailDTODao.getAllBookingDetailByTripDetailId(tripDetailId);

//          Pagination
        int page = 1;
        int endPage = 1;
        if (listBookingDetailDTO != null) {
            if (page_raw != null) {
                page = Integer.parseInt(page_raw);
            }
            int count = bookingDetailDTODao.getAllBookingDetailByTripDetailId(tripDetailId).size();
            endPage = count / 5;
            if (count % 5 != 0) {
                endPage++;
            }
        }
//
        List<BookingDetailDTO> listBookingDetailDTOPage = bookingDetailDTODao.getBookingDetailByTripDetailIdAndBookingStatusWithPagination(tripDetailId, page);

        session.setAttribute("tripDetail", tripDetail);
        session.setAttribute("page", page);
        request.setAttribute("endPage", endPage);
        request.setAttribute("listBookingDetailDTO", listBookingDetailDTOPage);
        request.setAttribute("startingPoint", tripDetail.getTrip().getTripStartingPoint().getStationName());
        request.setAttribute("destination", tripDetail.getTrip().getDestination().getStationName());
        request.setAttribute("date", tripDetail.getDate().format(formatter));
        request.setAttribute("tripDetailId", tripDetailId);

        request.getRequestDispatcher("ShowBookedCustomer.jsp").forward(request, response);

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
