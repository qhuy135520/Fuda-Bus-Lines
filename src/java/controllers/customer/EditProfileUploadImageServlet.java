/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers.customer;

import dal.CustomerDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import javax.imageio.ImageIO;
import model.Customer;

/**
 *
 * @author letra
 */
@MultipartConfig
public class EditProfileUploadImageServlet extends HttpServlet {

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
            out.println("<title>Servlet EditProfileUploadServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditProfileUploadServlet at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        CustomerDao cusDao = new CustomerDao();
//        Get Cusotmer form session
        Customer c = (Customer) session.getAttribute("customer");
//      Initial Part
        Part part = request.getPart("file");
        String fileName = part.getSubmittedFileName();
        String path = getServletContext().getRealPath("/img/customer" + File.separator + c.getCustomerPhone() + fileName);
        InputStream is = part.getInputStream();
//      Check uploadFile 
        boolean succs = uploadFile(is, path);
        String pathData = "img/customer" + File.separator + c.getCustomerPhone() + fileName;
        if (succs) {
            String pathDataTrue = pathData.replace("\\" , "/");
            cusDao.updateCustomerUrlImage(pathDataTrue, c.getCustomerPhone());
//            Update Customer session
            Customer cusRefresh = cusDao.getCustomerByPhone(c.getCustomerPhone());
            System.out.println(path);
            session.setAttribute("customer", cusRefresh);
            response.sendRedirect("EditProfileLoading.jsp");
        } else {
            request.setAttribute("errorUploadImage", "Upload image failed !");
            request.getRequestDispatcher("EditProfile.jsp").forward(request, response);
        }
    }

    public boolean uploadFile(InputStream is, String path) {
        boolean test = false;
        try {
            BufferedImage bImage = ImageIO.read(is);
            ImageIO.write(bImage, "gif", new File(path));
            bImage.flush();
            test = true;
        } catch (IOException e) {
            System.out.println(e);
        }
        return test;
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
