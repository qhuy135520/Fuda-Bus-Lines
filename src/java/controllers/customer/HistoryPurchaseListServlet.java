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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
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
        LocalDate date = LocalDate.now();
        DateTimeFormatter fomatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

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
//        Check Date Diff
        HashMap<Integer, Integer> dateDiffMap = new HashMap<>();
        int i = 0;
        for (BookingDetailDTO bookingDetailDTO : bookingDetailDTOList) {
            i += 1;
            try {
                int checkDateDiff = find(fomatter.format(date), fomatter.format(bookingDetailDTO.getBooking().getTripSeatDetail().getTripDetail().getDate()));
//                request.setAttribute("checkDateDiff" + i, checkDateDiff);
                System.out.println(checkDateDiff);

                dateDiffMap.put(i, checkDateDiff);
            } catch (ParseException ex) {
                Logger.getLogger(HistoryPurchaseListServlet.class.getName()).log(Level.SEVERE, null, ex);
            }

        }

        session.setAttribute("page", page);
        request.setAttribute("endPage", endPage);
        request.setAttribute("LocaldateNow", date);
        request.setAttribute("dateDiffMap", dateDiffMap);
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

    public static int find(String join_date, String leave_date) throws ParseException {
        SimpleDateFormat obj = new SimpleDateFormat("yyyy-MM-dd");
        // creating the date 1 with sample input date.
        Date date1 = obj.parse(join_date);

        // creating the date 2 with sample input date.
        Date date2 = obj.parse(leave_date);

        // getting milliseconds for both dates
        long date1InMs = date1.getTime();
        long date2InMs = date2.getTime();

        // getting the diff between two dates.
        long timeDiff = date2InMs - date1InMs;

        // converting diff into days
        int daysDiff = (int) (timeDiff / (1000 * 60 * 60 * 24));

        // print diff in days
        return daysDiff;
    }

}
