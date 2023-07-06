/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers.admin;

import dal.TripDao;
import dal.TripDetailDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.ParseException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.TripDetail;
import model.TripOfBus;

/**
 *
 * @author letra
 */
public class AdminGenerateTicketServlet extends HttpServlet {

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
            out.println("<title>Servlet AdminGenerateTicketServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminGenerateTicketServlet at " + request.getContextPath() + "</h1>");
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
        TripDao tripDao = new TripDao();
        TripDetailDao tripDetailDao = new TripDetailDao();

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd");

        String tripId = request.getParameter("tripId");
        String tripDetailId = request.getParameter("tripDetailId");
        String price_raw = request.getParameter("price");
        int price = Integer.parseInt(price_raw);
        String departureTime = request.getParameter("departureTime")+":00";
        String departureDate_raw = request.getParameter("departureDate");
        LocalDate departureDate = LocalDate.parse(departureDate_raw);
        System.out.println(departureTime);
        System.out.println(departureDate);
        TripOfBus tripOfBus = tripDao.getTripOfBusById(tripId);
        TripDetail tripDetail = tripDetailDao.getTripDetailById(tripDetailId);
        boolean isAcceptable = tripDetailDao.isAcceptable(tripOfBus, departureTime, departureDate);
        
        if (tripDetail != null) {
            request.setAttribute("errorTripId", tripOfBus.getTripId());
            request.setAttribute("errorTripDetailExisted", "This Ticket is existed !!");
            request.getRequestDispatcher("AdminTripTablesServlet").forward(request, response);
        } else if (!isAcceptable) {
            request.setAttribute("errorBusBusy", "Bus of This Trip is scheduled !!");
            request.setAttribute("errorTripId", tripOfBus.getTripId());
            request.getRequestDispatcher("AdminTripTablesServlet").forward(request, response);
        } else {
            tripDetail = new TripDetail(tripDetailId, tripOfBus, departureTime, departureDate, price);
            try {
                tripDetailDao.insertTripDetail(tripDetail);
            } catch (ParseException ex) {
                Logger.getLogger(AdminGenerateTicketServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            response.sendRedirect("AdminTripTablesServlet");
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
