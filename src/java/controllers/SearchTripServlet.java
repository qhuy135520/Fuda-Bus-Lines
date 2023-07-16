package controllers;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import dal.StationDAO;
import dal.TripDetailDao;
import dal.TripSeatDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import model.EmployeeAccount;
import model.Station;
import model.TripDetail;
import model.TripSeatDetail;

/**
 *
 * @author letra
 */
public class SearchTripServlet extends HttpServlet {

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
            out.println("<title>Servlet SearchTripServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SearchTripServlet at " + request.getContextPath() + "</h1>");
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
        //        Reset Session before
        HttpSession session = request.getSession();
        session.setAttribute("list24Seats", null);
        session.setAttribute("list36Seats", null);
        session.setAttribute("customerBooking", null);
        EmployeeAccount employeeAccount = (EmployeeAccount) session.getAttribute("employee");

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");

        String tripDetailId = request.getParameter("tripDetailId");

        TripSeatDao tsd = new TripSeatDao();
        TripDetailDao tdd = new TripDetailDao();
        StationDAO sd = new StationDAO();
        int totalSeatRemaining = 0;

        List<TripSeatDetail> listTripSeatDetail = tsd.getAllTripSeatDetailByTripDetailId(tripDetailId);
//        Count seat remaining
        for (TripSeatDetail tripSeatDetail : listTripSeatDetail) {
            if (tripSeatDetail.isStatus()) {
                totalSeatRemaining++;
            }
        }
        TripDetail td = tdd.getTripDetailById(tripDetailId);


        request.setAttribute("totalSeatRemaining", totalSeatRemaining);
        request.setAttribute("orignStation", td.getTrip().getTripStartingPoint());
        request.setAttribute("destinationStation", td.getTrip().getDestination());
        request.setAttribute("date", td.getDate().format(formatter));
        request.setAttribute("listTripSeatDetail", listTripSeatDetail);
        session.setAttribute("tripDetail", td);
//        if (employeeAccount == null) {
        if (td.getTrip().getTotalSeat() == 36) {
            request.getRequestDispatcher("Book36Seats.jsp").forward(request, response);
        } else if (td.getTrip().getTotalSeat() == 24) {
            request.getRequestDispatcher("Book24Seats.jsp").forward(request, response);
        }
//        } else {
//            response.sendRedirect("index.jsp");
//
//        }
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

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");

        TripDetailDao tdd = new TripDetailDao();
        StationDAO sd = new StationDAO();

        int orign = Integer.parseInt(request.getParameter("orign"));
        int destination = Integer.parseInt(request.getParameter("destination"));
//        Change yyyy/MM/dd to yyyy/dd/MM
        String departureDate_raw = request.getParameter("departure-date");
        LocalDate departureDateInput = LocalDate.parse(departureDate_raw);

        int price = 0;
        if (!"".equals(request.getParameter("ticket-type"))) {
            price = Integer.parseInt(request.getParameter("ticket-type"));
        }

        
        List<TripDetail> listTripDetail = tdd.getTripDetailByStartingPointAndDestinationAndDate(orign, destination, departureDateInput, price);
        Station orignStation = sd.getStationByStationID(orign);
        Station destinationStation = sd.getStationByStationID(destination);

        if (!listTripDetail.isEmpty()) {
            request.setAttribute("departureDate", departureDateInput.format(formatter));
            request.setAttribute("orignStation", orignStation);
            request.setAttribute("destinationStation", destinationStation);
            request.setAttribute("listTripDetail", listTripDetail);
            request.getRequestDispatcher("SearchTrip.jsp").forward(request, response);
        } else {
            response.sendRedirect("SearchTripError.jsp");
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
