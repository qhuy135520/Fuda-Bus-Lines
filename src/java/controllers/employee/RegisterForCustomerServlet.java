/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers.employee;

import controllers.MD5;
import controllers.SendMail;
import dal.CustomerDao;
import dal.DAO;
import dal.StationDAO;
import dal.TripDetailDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import model.Customer;
import model.Station;
import model.TripDetail;

/**
 *
 * @author letra
 */
public class RegisterForCustomerServlet extends HttpServlet {

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
            out.println("<title>Servlet RegisterForCustomerServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterForCustomerServlet at " + request.getContextPath() + "</h1>");
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
     * @throws java.io.UnsupportedEncodingException
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, UnsupportedEncodingException {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDateTime now = LocalDateTime.now();

        HttpSession session = request.getSession();

        TripDetailDao tripDetailDao = new TripDetailDao();
        StationDAO staionDao = new StationDAO();
        CustomerDao customerDao = new CustomerDao();
        DAO dao = new DAO();
        MD5 md5 = new MD5();
        SendMail sendMail = new SendMail();

        String page_raw = request.getParameter("page");
        TripDetail tripDetail = (TripDetail) session.getAttribute("tripDetail");

        int page = 1;
        int endPage = 1;
        if (page_raw != null) {
            page = Integer.parseInt(page_raw);
        }
        int count = customerDao.getAllCustomer().size();
        endPage = count / 5;
        if (count % 5 != 0) {
            endPage++;
        }
        List<Customer> listCustomer = customerDao.getAllCustomerPagination(page);

        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String birthdate = request.getParameter("birthdate");
        String password = getAlphaNumericString();

        session.setAttribute("page", page);
        request.setAttribute("endPage", endPage);
        request.setAttribute("orignStation", tripDetail.getTrip().getTripStartingPoint());
        request.setAttribute("destinationStation", tripDetail.getTrip().getDestination());
        request.setAttribute("date", tripDetail.getDate().format(formatter));
        request.setAttribute("tripDetailId", tripDetail.getTripDetailId());
        request.setAttribute("listCustomer", listCustomer);
        Customer c_raw_phone = dao.getCustomerByPhone(phone);
        Customer c_raw_email = dao.getCustomerByEmail(email);

        if (c_raw_email == null && c_raw_phone == null) {
            Customer customer = new Customer(phone, email, firstname, lastname, birthdate, md5.md5(password), dtf.format(now), null);
            dao.signUp(customer);
            listCustomer = customerDao.getAllCustomerPagination(page);
            try {
                sendMail.sendPasswordToCustomer(password, email);
            } catch (MessagingException ex) {
                Logger.getLogger(RegisterForCustomerServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            request.setAttribute("listCustomer", listCustomer);
            request.setAttribute("listCustomerFull",customerDao.getAllCustomer());
            request.getRequestDispatcher("CustomerBookingConfirm.jsp").forward(request, response);

        } else if (c_raw_phone != null) {
            request.setAttribute("errorPhone", "Phone is already existed !");
            request.getRequestDispatcher("CustomerBookingConfirm.jsp").forward(request, response);
        } else if (c_raw_email != null) {
            request.setAttribute("errorEmail", "Email is already existed !");
            request.getRequestDispatcher("CustomerBookingConfirm.jsp").forward(request, response);
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    public String getAlphaNumericString() {

        // choose a Character random from this String
        String AlphaNumericString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
                + "0123456789"
                + "abcdefghijklmnopqrstuvxyz";

        // create StringBuffer size of AlphaNumericString
        StringBuilder sb = new StringBuilder(8);

        for (int i = 0; i < 8; i++) {

            // generate a random number between
            // 0 to AlphaNumericString variable length
            int index
                    = (int) (AlphaNumericString.length()
                    * Math.random());

            // add Character one by one in end of sb
            sb.append(AlphaNumericString
                    .charAt(index));
        }

        return sb.toString();
    }
}
