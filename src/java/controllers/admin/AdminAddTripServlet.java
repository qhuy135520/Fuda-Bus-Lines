/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers.admin;

import dal.StationDAO;
import dal.TripDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.TripOfBus;

/**
 *
 * @author letra
 */
public class AdminAddTripServlet extends HttpServlet {

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
            out.println("<title>Servlet AdminAddTripServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminAddTripServlet at " + request.getContextPath() + "</h1>");
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
        StationDAO stationDao = new StationDAO();

        String tripId = request.getParameter("tripId").trim();
        String busCode = request.getParameter("busCode");
        String startingPoint = request.getParameter("startingPoint");
        String destination = request.getParameter("destination");
        String totalSeats = request.getParameter("seats");
        String during = request.getParameter("during");

        TripOfBus tripOfBus = tripDao.getTripOfBusById(tripId);
        System.out.println("tripId: "+tripId+" length: "+tripId.length());
        if (tripOfBus != null) {
            request.setAttribute("errorExisted", "This Trip Is Existed !");
            request.getRequestDispatcher("AdminTripTablesServlet").forward(request, response);
        } else if (startingPoint.equals(destination)) {
            request.setAttribute("errorStation", "Starting point and destination can't be match !!");
            request.getRequestDispatcher("AdminTripTablesServlet").forward(request, response);
        } else if (tripId.length() != 6) {
            request.setAttribute("errorIdMaxLength", "Length of TripId must be equals 6");
            request.getRequestDispatcher("AdminTripTablesServlet").forward(request, response);
        } else {
            tripOfBus = new TripOfBus(tripId, stationDao.getStationByStationID(Integer.parseInt(startingPoint)),
                    stationDao.getStationByStationID(Integer.parseInt(destination)),
                    Integer.parseInt(totalSeats), Integer.parseInt(during), busCode);

            tripDao.insertTripOfBus(tripOfBus);
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
