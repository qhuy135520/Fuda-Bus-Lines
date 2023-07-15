/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import dal.CustomerDao;
import dal.StationDAO;
import dal.TripDao;
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
import model.Customer;
import model.EmployeeAccount;
import model.TripDetail;

/**
 *
 * @author letra
 */
public class TakeSeatServlet extends HttpServlet {

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
            out.println("<title>Servlet TakeSeatServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet TakeSeatServlet at " + request.getContextPath() + "</h1>");
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
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        HttpSession session = request.getSession();
//        DAO
        TripDetailDao tdd = new TripDetailDao();
        TripDao tdao = new TripDao();
        StationDAO sd = new StationDAO();
        CustomerDao customerDao = new CustomerDao();
//
        String[] list36Seats = request.getParameterValues("36Seats");
        String[] list24Seats = request.getParameterValues("24Seats");
        TripDetail td = (TripDetail) session.getAttribute("tripDetail");

        List<String> routes = tdao.getRoutes(td.getTrip().getTripId());
//        
//        
        if (list36Seats != null) {
            int price = list36Seats.length * td.getTicketPrice();
            request.setAttribute("price", price);
            session.setAttribute("price", price);
            session.setAttribute("list36Seats", list36Seats);
        } else {
            int price = list24Seats.length * td.getTicketPrice();
            request.setAttribute("price", price);
            session.setAttribute("price", price);
            session.setAttribute("list24Seats", list24Seats);
        }
        request.setAttribute("orignStation", td.getTrip().getTripStartingPoint());
        request.setAttribute("destinationStation", td.getTrip().getDestination());
        request.setAttribute("date", td.getDate().format(formatter));
        request.setAttribute("routes", routes);

        if ((EmployeeAccount) session.getAttribute("employee") == null) {

            request.getRequestDispatcher("RouteConfirmation.jsp").forward(request, response);

        } else {
            int page = 1;
            int endPage = 1;

            int count = customerDao.getAllCustomer().size();
            endPage = count / 5;
            if (count % 5 != 0) {
                endPage++;
            }
            System.out.println(endPage);
            System.out.println(page);

            List<Customer> listCustomer = customerDao.getAllCustomerPagination(page);
            session.setAttribute("page", page);
            request.setAttribute("endPage", endPage);
            request.setAttribute("listCustomer", listCustomer);
            request.getRequestDispatcher("CustomerBookingConfirm.jsp").forward(request, response);
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
