/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers.admin;

import dal.TripDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.TripOfBus;

/**
 *
 * @author letra
 */
public class AdminTripTablesServlet extends HttpServlet {

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
            out.println("<title>Servlet AdminTripTablesServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminTripTablesServlet at " + request.getContextPath() + "</h1>");
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
        TripDao tripDao = new TripDao();
        String errorExisted = (String) request.getAttribute("errorExisted");
        String page_raw = request.getParameter("page");
        

        int page = 1;
        if (page_raw != null) {
            page = Integer.parseInt(page_raw);
        }
        int count = tripDao.getAllTrips().size();
        int endPage = count / 10;
        if (count % 10 != 0) {
            endPage++;
        }

        List<TripOfBus> listTripOfBus = tripDao.getAllTripsWithPagination(page);

        session.setAttribute("page", page);
        request.setAttribute("errorExisted", errorExisted);
        request.setAttribute("endPage", endPage);
        request.setAttribute("listTripOfBus", listTripOfBus);
        request.getRequestDispatcher("AdminTripTables.jsp").forward(request, response);

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
        HttpSession session = request.getSession();
        TripDao tripDao = new TripDao();
        String errorExisted = (String) request.getAttribute("errorExisted");
        String errorTripDetailExisted = (String) request.getAttribute("errorTripDetailExisted");
        String errorTripId = (String) request.getAttribute("errorTripId");
        String errorBusBusy = (String) request.getAttribute("errorBusBusy");
        String errorIdMaxLength = (String) request.getAttribute("errorIdMaxLength");
        String page_raw = request.getParameter("page");

        int page = 1;
        if (page_raw != null) {
            page = Integer.parseInt(page_raw);
        }
        int count = tripDao.getAllTrips().size();
        int endPage = count / 10;
        if (count % 10 != 0) {
            endPage++;
        }

        List<TripOfBus> listTripOfBus = tripDao.getAllTripsWithPagination(page);

        session.setAttribute("page", page);

        request.setAttribute("errorTripId", errorTripId);
        request.setAttribute("errorExisted", errorExisted);
        request.setAttribute("errorTripDetailExisted", errorTripDetailExisted);
        request.setAttribute("errorBusBusy",errorBusBusy);
        request.setAttribute("errorIdMaxLength", errorIdMaxLength);
        request.setAttribute("endPage", endPage);
        request.setAttribute("listTripOfBus", listTripOfBus);
        request.getRequestDispatcher("AdminTripTables.jsp").forward(request, response);
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
