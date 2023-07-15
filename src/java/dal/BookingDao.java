/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import static controllers.customer.HistoryPurchaseListServlet.find;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import model.Booking;

/**
 *
 * @author ACER NITRO 5
 */
public class BookingDao extends DBContext {

    private String query;
    private PreparedStatement pst;
    private ResultSet rs;

    //tra ve danh sach ve cua khach hang 
    public List<Booking> getAllTickets(String phone) {
        List<Booking> list = new ArrayList<>();
        CustomerDao customerDao = new CustomerDao();
        TripSeatDao tripSeatDao = new TripSeatDao();

        try {
            query = "select * from booking where c_phone=? order by b_date DESC";
            pst = connection.prepareStatement(query);
            rs = pst.executeQuery();
            while (rs.next()) {
                Booking booking = new Booking();
                booking.setBookingId(rs.getInt("b_id"));
                booking.setCustomer(customerDao.getCustomerByPhone(phone));
                booking.setBookedDate(rs.getDate("b_date").toLocalDate());
                booking.setBookingStatus(rs.getString("b_status"));
                booking.setBookedTime(rs.getString("b_time"));
                booking.setTripSeatDetail(tripSeatDao.getTripSeatDetailById(rs.getString("ts_id")));
                booking.setCode(rs.getString("code"));
                booking.setPaidDate(rs.getDate("paid_date").toLocalDate());
                list.add(booking);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    //tra ve danh sach ve khach hang da MUA(thanh toan) theo customerPhone
    public List<Booking> getPaidTicketsByCustomerPhone(String phone) {
        List<Booking> list = new ArrayList<>();
        CustomerDao customerDao = new CustomerDao();
        TripSeatDao tripSeatDao = new TripSeatDao();

        try {
            query = "select * from booking where c_phone=? and b_status ='paid'";
            pst = connection.prepareStatement(query);
            rs = pst.executeQuery();
            while (rs.next()) {
                Booking booking = new Booking();
                booking.setBookingId(rs.getInt("b_id"));
                booking.setCustomer(customerDao.getCustomerByPhone(phone));
                booking.setBookedDate(rs.getDate("b_date").toLocalDate());
                booking.setBookingStatus(rs.getString("b_status"));
                booking.setBookedTime(rs.getString("b_time"));
                booking.setTripSeatDetail(tripSeatDao.getTripSeatDetailById(rs.getString("ts_id")));
                list.add(booking);

            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    //tra ve danh sach ve khach hang da DAT theo customerPhone
    public List<Booking> getOrderedTicketsByCustomerPhone(String phone) {
        List<Booking> list = new ArrayList<>();
        CustomerDao customerDao = new CustomerDao();
        TripSeatDao tripSeatDao = new TripSeatDao();

        try {
            query = "select * from booking where c_phone=? and b_status ='order'";
            pst = connection.prepareStatement(query);
            rs = pst.executeQuery();
            while (rs.next()) {
                Booking booking = new Booking();
                booking.setBookingId(rs.getInt("b_id"));
                booking.setCustomer(customerDao.getCustomerByPhone(phone));
                booking.setBookedDate(rs.getDate("b_date").toLocalDate());
                booking.setBookingStatus(rs.getString("b_status"));
                booking.setBookedTime(rs.getString("b_time"));
                booking.setTripSeatDetail(tripSeatDao.getTripSeatDetailById(rs.getString("ts_id")));
                list.add(booking);

            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    //tra ve danh sach ve khach hang da HUY theo customerPhone
    public List<Booking> getCanceledTicketsByCustomerPhone(String phone) {
        List<Booking> list = new ArrayList<>();
        CustomerDao customerDao = new CustomerDao();
        TripSeatDao tripSeatDao = new TripSeatDao();

        try {
            query = "select * from booking where c_phone=? and b_status ='canceled'";
            pst = connection.prepareStatement(query);
            rs = pst.executeQuery();
            while (rs.next()) {
                Booking booking = new Booking();
                booking.setBookingId(rs.getInt("b_id"));
                booking.setCustomer(customerDao.getCustomerByPhone(phone));
                booking.setBookedDate(rs.getDate("b_date").toLocalDate());
                booking.setBookingStatus(rs.getString("b_status"));
                booking.setBookedTime(rs.getString("b_time"));
                booking.setTripSeatDetail(tripSeatDao.getTripSeatDetailById(rs.getString("ts_id")));
                list.add(booking);

            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    //  insert booking bang list of tripSeatDetailId, customerPhone, b_status
    // neu dat ve thi b_status ="order"
    // neu mua ve thi b-status ="paid"
    public void insertBooking(List<String> tripSeatDetailIds, String customerPhone, String status) {
        TripSeatDao tripSeatDao = new TripSeatDao();

        try {
            for (String tripSeatDetailId : tripSeatDetailIds) {
                query = "insert into booking(c_phone, ts_id, b_status, b_date,b_time, code, paid_date) values (?,?,?,?,?, null, null)";
                pst = connection.prepareStatement(query);
                pst.setString(1, customerPhone);
                pst.setString(2, tripSeatDetailId);
                pst.setString(3, status);
                pst.setDate(4, java.sql.Date.valueOf(LocalDate.now()));
                pst.setTime(5, java.sql.Time.valueOf(LocalTime.now()));
                pst.executeUpdate();

                // update status cua ve trong trip_seat_detail = false
                tripSeatDao.updateStatusById(tripSeatDetailId, false);

            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public Booking getBookingById(int id) {
        Booking booking = null;
        TripSeatDao tripSeatDao = new TripSeatDao();
        CustomerDao customerDao = new CustomerDao();
        try {
            query = "select * from booking where b_id =?";
            pst = connection.prepareStatement(query);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                booking = new Booking();
                booking.setBookedDate(rs.getDate("b_date").toLocalDate());
                booking.setBookedTime(rs.getTime("b_time").toString());
                booking.setBookingId(id);
                booking.setBookingStatus(rs.getString("b_status"));
                booking.setTripSeatDetail(tripSeatDao.getTripSeatDetailById(rs.getString("ts_id")));
                booking.setCustomer(customerDao.getCustomerByPhone(rs.getString("c_phone")));
                booking.setCode(rs.getString("code"));
                if (rs.getDate("paid_date") != null) {
                    booking.setPaidDate(rs.getDate("paid_date").toLocalDate());
                } else {
                    booking.setPaidDate(null);
                }
            }
        } catch (SQLException e) {
        }
        return booking;
    }
    // Update booking status

    public void updateBookingStatus(int bookingId, String status) {
        try {
            query = "update booking set b_status =? where b_id=?";
            pst = connection.prepareStatement(query);
            pst.setString(1, status);
            pst.setInt(2, bookingId);
            pst.executeUpdate();

            // update status cua ve trong trip_seat_detail = true
            if (status.equals("canceled") || status.equals("refunding")) {
                TripSeatDao tripSeatDao = new TripSeatDao();
                tripSeatDao.updateStatusById(getBookingById(bookingId).getTripSeatDetail().getTripSeatId(), true);
            }
        } catch (SQLException e) {
        }
    }

    public int getRevenueByMonthAndYear(int date, int year) {
        int sum = 0;
        try {
            query = "SELECT dbo.calculating_revenue_by_month(?, ?) AS amount";
            pst = connection.prepareStatement(query);
            pst.setInt(1, date);
            pst.setInt(2, year);

            rs = pst.executeQuery();
            while (rs.next()) {
                sum = rs.getInt("amount");
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return sum;
    }

    // Return a map with key is month and value is revenue of this month
    public HashMap<Integer, Integer> getListOfRevenueByMonths(int startMonth, int endMonth, int year) {
        HashMap<Integer, Integer> map = new HashMap<>();
        for (int i = startMonth; i <= endMonth; i++) {
            map.put(i, getRevenueByMonthAndYear(i, year));
        }
        return map;
    }

    public void updateBookingStatusByTripDetailId(String tripDetailId) {
        try {
            query = "  Update booking set b_status ='refunding' where ts_id IN (SELECT ts_id FROM trip_seat_detail WHERE td_id=? ) and b_status='paid';\n"
                    + "    Update booking set b_status ='canceled' where ts_id IN (SELECT ts_id FROM trip_seat_detail WHERE td_id=? ) and b_status='order'";
            pst = connection.prepareStatement(query);
            pst.setString(1, tripDetailId);
            pst.setString(2, tripDetailId);
            pst.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void updateCodeAndPaidDate(int bookingId, String code) {
        try {
            query = "update booking set code =?, paid_date=? where b_id=?";
            pst = connection.prepareStatement(query);
            pst.setString(1, code);
            pst.setDate(2, java.sql.Date.valueOf(LocalDate.now()));
            pst.setInt(3, bookingId);
            pst.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void updatePaidDateByEmployee(int bookingId) {
        String sql = "UPDATE [dbo].[booking]\n"
                + "   SET [paid_date] = ?\n"
                + " WHERE [b_id] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setDate(1, java.sql.Date.valueOf(LocalDate.now()));
            st.setInt(2, bookingId);

            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

   
    
    public static void main(String[] args) throws ParseException {
        LocalDate date = LocalDate.now();
//        BookingDao bookingDao = new BookingDao();
//        Map<Integer, Integer> revenue = bookingDao.getListOfRevenueByMonths(1, 12, date.getYear());
//        int revenueThisMonth = 0;
//        for (Integer name : revenue.keySet()) {
//            
//            System.out.println(name+": "+revenue.get(name));
//            
//        }
//        System.out.println(revenueThisMonth);
        System.out.println(find("2023-07-10", "2023-07-09"));
        
    }
}
