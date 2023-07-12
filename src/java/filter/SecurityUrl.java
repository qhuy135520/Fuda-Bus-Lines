/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Filter.java to edit this template
 */
package filter;

import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.Customer;
import model.EmployeeAccount;

/**
 *
 * @author letra
 */
public class SecurityUrl implements Filter {

    private static final boolean debug = true;

    // The filter configuration object we are associated with.  If
    // this value is null, this filter instance is not currently
    // configured. 
    private FilterConfig filterConfig = null;

    public SecurityUrl() {
    }

    @Override
    public void init(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
        if (filterConfig != null) {
            if (debug) {
                log("SecurityFilter: Initializing filter");
            }
        }
    }

    private void doBeforeProcessing(ServletRequest request, ServletResponse response)
            throws IOException, ServletException {
        if (debug) {
            log("SecurityUrl:DoBeforeProcessing");
        }

        // Write code here to process the request and/or response before
        // the rest of the filter chain is invoked.
        // For example, a logging filter might log items on the request object,
        // such as the parameters.
        /*
	for (Enumeration en = request.getParameterNames(); en.hasMoreElements(); ) {
	    String name = (String)en.nextElement();
	    String values[] = request.getParameterValues(name);
	    int n = values.length;
	    StringBuffer buf = new StringBuffer();
	    buf.append(name);
	    buf.append("=");
	    for(int i=0; i < n; i++) {
	        buf.append(values[i]);
	        if (i < n-1)
	            buf.append(",");
	    }
	    log(buf.toString());
	}
         */
    }

    private void doAfterProcessing(ServletRequest request, ServletResponse response)
            throws IOException, ServletException {
        if (debug) {
            log("SecurityUrl:DoAfterProcessing");
        }

        // Write code here to process the request and/or response after
        // the rest of the filter chain is invoked.
        // For example, a logging filter might log the attributes on the
        // request object after the request has been processed. 
        /*
	for (Enumeration en = request.getAttributeNames(); en.hasMoreElements(); ) {
	    String name = (String)en.nextElement();
	    Object value = request.getAttribute(name);
	    log("attribute: " + name + "=" + value.toString());

	}
         */
        // For example, a filter might append something to the response.
        /*
	PrintWriter respOut = new PrintWriter(response.getWriter());
	respOut.println("<P><B>This has been appended by an intrusive filter.</B>");
         */
    }

    /**
     *
     * @param request The servlet request we are processing
     * @param response The servlet response we are creating
     * @param chain The filter chain we are processing
     *
     * @exception IOException if an input/output error occurs
     * @exception ServletException if a servlet error occurs
     */
    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {

        if (debug) {
            log("SecurityUrl:doFilter()");
        }

        doBeforeProcessing(request, response);

        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        HttpSession session = httpRequest.getSession();

        Customer customer = (Customer) session.getAttribute("customer");
        EmployeeAccount employee = (EmployeeAccount) session.getAttribute("employee");

        List<String> urlEmployee = new ArrayList<>();
        List<String> urlAdmin = new ArrayList<>();
        List<String> urlCustomer = new ArrayList<>();

        boolean flag = true;

        String url = httpRequest.getServletPath();

        urlCustomer.add("vnpay_ipn.jsp");
        urlCustomer.add("vnpay_pay.jsp");
        urlCustomer.add("Paypal_pay.jsp");

        urlCustomer.add("CancelTicketPaidCustomerServlet");
        urlCustomer.add("CancelTicketPurchaseServlet");
        urlCustomer.add("ChangePasswordProfileServlet");
        urlCustomer.add("EditProfileServlet");
        urlCustomer.add("EditProfileUploadImageServlet");
        urlCustomer.add("HistoryPurchaseListServlet");
        urlCustomer.add("InsertBookingServlet");
        urlCustomer.add("PayticketPurchaseListServlet");
        urlCustomer.add("ShowTicketPurchasedServlet");
        urlCustomer.add("TicketPurchaseListAjax");
        urlCustomer.add("TicketPurchaseListServlet");
        urlCustomer.add("CustomerPaypalPaymentServlet");
        if (customer != null) {
            System.out.println("Customer access: " + customer.getCustomerPhone() + " to: " + url);
        } else {
            for (String string : urlCustomer) {
                if (url.contains(string)) {
                    flag = false;
                }
            }
        }

//      the link that is only accessible to employees
        urlEmployee.add("CustomerBookingConfirm.jsp");
        urlEmployee.add("ShowBookedCustomer.jsp");
        urlEmployee.add("SuccessInsertPurchaseByEmployee.jsp");
        urlEmployee.add("EmployeeRefundingList.jsp");
        urlEmployee.add("vnpay_refund.jsp");

        urlEmployee.add("ListRefundingServlet");
        urlEmployee.add("BookingForCustomerServlet");
        urlEmployee.add("RegisterForCustomerServlet");
        urlEmployee.add("ShowBookedCustomer");
        urlEmployee.add("ShowBookedCustomerAjax");
        urlEmployee.add("ShowBookedCustomerCancelServlet");
        urlEmployee.add("ShowBookedCustomerConfirmServlet");
        urlEmployee.add("EmployeeRefundCustomerServlet");
        urlEmployee.add("EmployeeCancelTicketRefunding");
//      
//      the link that is only accessible to admin

        urlAdmin.add("AdminPage.jsp");
        urlAdmin.add("AdminEmployeeTables.jsp");
        urlAdmin.add("AdminTripTables.jsp");
        urlAdmin.add("AdminBookingDetailTables.jsp");
        urlAdmin.add("AdminTripExploitedTables.jsp");

        urlAdmin.add("AdminAddTripServlet");
        urlAdmin.add("AdminBookingDetailTablesServlet");
        urlAdmin.add("AdminDeleteTripServlet");
        urlAdmin.add("AdminDisableEmployeeServlet");
        urlAdmin.add("AdminEmployeeTablesAjax");
        urlAdmin.add("AdminEmployeeTablesServlet");
        urlAdmin.add("AdminHomePageServlet");
        urlAdmin.add("AdminEnableEmployeeServlet");
        urlAdmin.add("AdminRegisterEmployeeServlet");
        urlAdmin.add("AdminTripTablesServlet");
        urlAdmin.add("AdminTripExploitedTablesServlet");
        urlAdmin.add("AdminGenerateTicketServlet");

//        Check Url of Employee
        if (employee == null) {
            for (String string : urlEmployee) {
                if (url.contains(string)) {
                    flag = false;
                }
            }
        }
//            Check Url of Admin

        EmployeeAccount admin = (EmployeeAccount) session.getAttribute("admin");

        if (admin == null) {
            for (String string : urlAdmin) {
                if (url.contains(string)) {
                    flag = false;
                }
            }

        }

        if (flag == false) {
            httpResponse.sendRedirect("ErrorPagePermission.jsp");
        } else {

            Throwable problem = null;
            try {
                chain.doFilter(request, response);
            } catch (ServletException | IOException t) {
                // If an exception is thrown somewhere down the filter chain,
                // we still want to execute our after processing, and then
                // rethrow the problem after that.
                problem = t;
            }

            doAfterProcessing(request, response);

            // If there was a problem, we want to rethrow it if it is
            // a known type, otherwise log it.
            if (problem != null) {
                if (problem instanceof ServletException) {
                    throw (ServletException) problem;
                }
                if (problem instanceof IOException) {
                    throw (IOException) problem;
                }
                sendProcessingError(problem, response);
            }
        }
    }

    /**
     * Return the filter configuration object for this filter.
     *
     * @return
     */
    public FilterConfig getFilterConfig() {
        return (this.filterConfig);
    }

    /**
     * Set the filter configuration object for this filter.
     *
     * @param filterConfig The filter configuration object
     */
    public void setFilterConfig(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
    }

    /**
     * Destroy method for this filter
     */
    @Override
    public void destroy() {
    }

    /**
     * Init method for this filter
     */
    /**
     * Return a String representation of this object.
     */
    @Override
    public String toString() {
        if (filterConfig == null) {
            return ("SecurityUrl()");
        }
        StringBuilder sb = new StringBuilder("SecurityUrl(");
        sb.append(filterConfig);
        sb.append(")");
        return (sb.toString());
    }

    private void sendProcessingError(Throwable t, ServletResponse response) {
        String stackTrace = getStackTrace(t);

        if (stackTrace != null && !stackTrace.equals("")) {
            try {
                response.setContentType("text/html");
                try ( PrintStream ps = new PrintStream(response.getOutputStream());  PrintWriter pw = new PrintWriter(ps)) {
                    pw.print("<html>\n<head>\n<title>Error</title>\n</head>\n<body>\n"); //NOI18N

                    // PENDING! Localize this for next official release
                    pw.print("<h1>The resource did not process correctly</h1>\n<pre>\n");
                    pw.print(stackTrace);
                    pw.print("</pre></body>\n</html>"); //NOI18N
                }
                response.getOutputStream().close();
            } catch (IOException ex) {
            }
        } else {
            try {
                try ( PrintStream ps = new PrintStream(response.getOutputStream())) {
                    t.printStackTrace(ps);
                }
                response.getOutputStream().close();
            } catch (IOException ex) {
            }
        }
    }

    public static String getStackTrace(Throwable t) {
        String stackTrace = null;
        try {
            StringWriter sw = new StringWriter();
            PrintWriter pw = new PrintWriter(sw);
            t.printStackTrace(pw);
            pw.close();
            sw.close();
            stackTrace = sw.getBuffer().toString();
        } catch (IOException ex) {
        }
        return stackTrace;
    }

    public void log(String msg) {
        filterConfig.getServletContext().log(msg);
    }

}
