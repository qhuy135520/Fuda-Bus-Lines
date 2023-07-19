/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers.admin;

import dal.BookingDao;
import dal.CustomerDao;
import dal.EmployeeDao;
import dal.TripDao;
import dal.TripDetailDao;
import dal.TripSeatDao;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.DecimalFormat;
import java.time.LocalDate;
import java.util.List;
import java.util.Map;
import model.TripDetail;
import model.TripOfBus;

/**
 *
 * @author letra
 */
public class AdminHomePageServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
        LocalDate date = LocalDate.now();
        BookingDao bookingDao = new BookingDao();
        CustomerDao customerDao = new CustomerDao();
        TripSeatDao tripSeatDao = new TripSeatDao();
        TripDetailDao tripDetailDao = new TripDetailDao();
        EmployeeDao employeeDao = new EmployeeDao();
        DecimalFormat formatRevenue = new DecimalFormat("###,###,###");

//      
        Map<Integer, Integer> revenue = bookingDao.getListOfRevenueByMonths(1, 12, date.getYear());

        List<TripDetail> listTripDetail = tripDetailDao.getAllTripDetail();
        List<TripDetail> listTripDetailGet5Elemetns = tripDetailDao.getAllTripDetailWithPaginationGet5Elemetns(1);
        int revenueThisMonth = 0;
        int revenueThisYear = 0;
        int CustomerJoined = customerDao.getAllCustomer().size();
        int seatBooked = 0;
        int totalSeat = 0;

//      MAP
        for (Integer name : revenue.keySet()) {
            if (name == date.getMonthValue()) {
                revenueThisMonth = revenue.get(name);
            }
            revenueThisYear += revenue.get(name);
        }
//      ListTripDetail
        for (TripDetail tripDetail : listTripDetail) {
            totalSeat += tripDetail.getTrip().getTotalSeat();
            seatBooked += tripSeatDao.getNumberOfBookedSeatByTripDetailId(tripDetail.getTripDetailId());
        }
//      ListTripDetail5Elements
        for (int i = 0; i < listTripDetailGet5Elemetns.size(); i++) {
            int totalSeatTripDetail = listTripDetailGet5Elemetns.get(i).getTrip().getTotalSeat();
            int seatBookedTripDetail = tripSeatDao.getNumberOfBookedSeatByTripDetailId(listTripDetailGet5Elemetns.get(i).getTripDetailId());
            float seatCalculateTripDetail = ((float) seatBookedTripDetail / (float) totalSeatTripDetail) * 100;
            seatCalculateTripDetail = Math.round(seatCalculateTripDetail);
            request.setAttribute("seaCalculateTripDetail" + i, fmt(seatCalculateTripDetail));
            request.setAttribute("tripDetailId" + i, listTripDetailGet5Elemetns.get(i).getTripDetailId());
        }
        float seatCalculate = ((float) seatBooked / (float) totalSeat) * 100;

        seatCalculate = Math.round(seatCalculate);
        request.setAttribute("revenueThisMonth", formatRevenue.format(revenueThisMonth));
        request.setAttribute("revenueThisYear", formatRevenue.format(revenueThisYear));
        request.setAttribute("seatCalculate", fmt(seatCalculate));
        request.setAttribute("customerJoined", CustomerJoined);
        request.setAttribute("employeeJoined", employeeDao.getAllEmployeeRole2().size());
        request.setAttribute("adminJoined", employeeDao.getAllEmployeeRole1().size());
        request.setAttribute("revenueMap", revenue);
        request.getRequestDispatcher("AdminPage.jsp").forward(request, response);
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

    public static String fmt(float d) {
        if (d == (long) d) {
            return String.format("%d", (long) d);
        } else {
            return String.format("%s", d);
        }
    }

}
