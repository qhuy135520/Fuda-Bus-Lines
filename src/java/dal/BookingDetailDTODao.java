/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Booking;
import model.BookingDetailDTO;

/**
 *
 * @author ACER NITRO 5
 */
public class BookingDetailDTODao extends DBContext {

    private String query;
    private PreparedStatement pst;
    private ResultSet rs;

    public List<BookingDetailDTO> getAllBookingDetail() {
        BookingDao bookingDao = new BookingDao();
        List<BookingDetailDTO> list = new ArrayList<>();
        try {
            query = "select b.b_id, b.ts_id, ts.td_id, s.se_name, tr.tr_bus_code, st1.st_name AS starting_point, st2.st_name AS destination,\n"
                    + "tr.tr_destination, b.b_status, td.td_ticket_price, td.td_date, td.td_depature_time, b.b_date\n"
                    + "FROM booking b inner join trip_seat_detail ts on b.ts_id =ts.ts_id\n"
                    + "inner join seat s on s.se_id = ts.se_id \n"
                    + "inner join trip_detail td on td.td_id= ts.td_id\n"
                    + "inner join trip_of_bus tr on tr.tr_id= td.tr_id\n"
                    + "inner join station st1 on st1.st_id= tr.tr_starting_point \n"
                    + "inner join station st2 on st2.st_id= tr.tr_destination\n";
            pst = connection.prepareStatement(query);
            rs = pst.executeQuery();
            while (rs.next()) {
                Booking booking = bookingDao.getBookingById(rs.getInt("b_id"));
                BookingDetailDTO bookingDetail = new BookingDetailDTO();
                bookingDetail.setBooking(booking);
                bookingDetail.setBookingDate(rs.getDate("b_date").toLocalDate());
                bookingDetail.setBookingStatus(rs.getString("b_status"));
                bookingDetail.setBusCode(rs.getString("tr_bus_code"));
                bookingDetail.setDepatureDate(rs.getDate("td_date").toLocalDate());
                bookingDetail.setDepatureTime(rs.getTime("td_depature_time").toString());
                bookingDetail.setDestination(rs.getString("destination"));
                bookingDetail.setPrice(rs.getInt("td_ticket_price"));
                bookingDetail.setSeatName(rs.getString("se_name"));
                bookingDetail.setStartingPoint(rs.getString("starting_point"));
                bookingDetail.setTripDetailId(rs.getString("td_id"));
                bookingDetail.setTripSeatId(rs.getString("ts_id"));
                list.add(bookingDetail);

            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public List<BookingDetailDTO> getAllBookingDetailPagination(int page) {
        BookingDao bookingDao = new BookingDao();
        List<BookingDetailDTO> list = new ArrayList<>();
        try {
            query = "select b.b_id, b.ts_id, ts.td_id, s.se_name, tr.tr_bus_code, st1.st_name AS starting_point, st2.st_name AS destination,\n"
                    + "tr.tr_destination, b.b_status, td.td_ticket_price, td.td_date, td.td_depature_time, b.b_date\n"
                    + "FROM booking b inner join trip_seat_detail ts on b.ts_id =ts.ts_id\n"
                    + "inner join seat s on s.se_id = ts.se_id \n"
                    + "inner join trip_detail td on td.td_id= ts.td_id\n"
                    + "inner join trip_of_bus tr on tr.tr_id= td.tr_id\n"
                    + "inner join station st1 on st1.st_id= tr.tr_starting_point \n"
                    + "inner join station st2 on st2.st_id= tr.tr_destination\n"
                    + "Order by [b_date]"
                    + "OFFSET ? ROWS FETCH NEXT 5 ROWS ONLY";;
            pst = connection.prepareStatement(query);
            pst.setInt(1,(page-1)*5);
            rs = pst.executeQuery();
            while (rs.next()) {
                Booking booking = bookingDao.getBookingById(rs.getInt("b_id"));
                BookingDetailDTO bookingDetail = new BookingDetailDTO();
                bookingDetail.setBooking(booking);
                bookingDetail.setBookingDate(rs.getDate("b_date").toLocalDate());
                bookingDetail.setBookingStatus(rs.getString("b_status"));
                bookingDetail.setBusCode(rs.getString("tr_bus_code"));
                bookingDetail.setDepatureDate(rs.getDate("td_date").toLocalDate());
                bookingDetail.setDepatureTime(rs.getTime("td_depature_time").toString());
                bookingDetail.setDestination(rs.getString("destination"));
                bookingDetail.setPrice(rs.getInt("td_ticket_price"));
                bookingDetail.setSeatName(rs.getString("se_name"));
                bookingDetail.setStartingPoint(rs.getString("starting_point"));
                bookingDetail.setTripDetailId(rs.getString("td_id"));
                bookingDetail.setTripSeatId(rs.getString("ts_id"));
                list.add(bookingDetail);

            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public List<BookingDetailDTO> getAllBookingDetailHaveRefundingWithPagination(int page) {
        BookingDao bookingDao = new BookingDao();
        List<BookingDetailDTO> list = new ArrayList<>();
        try {
            query = "select b.b_id, b.ts_id, ts.td_id, s.se_name, tr.tr_bus_code, st1.st_name AS starting_point, st2.st_name AS destination,\n"
                    + "tr.tr_destination, b.b_status, td.td_ticket_price, td.td_date, td.td_depature_time, b.b_date\n"
                    + "FROM booking b inner join trip_seat_detail ts on b.ts_id =ts.ts_id\n"
                    + "inner join seat s on s.se_id = ts.se_id \n"
                    + "inner join trip_detail td on td.td_id= ts.td_id\n"
                    + "inner join trip_of_bus tr on tr.tr_id= td.tr_id\n"
                    + "inner join station st1 on st1.st_id= tr.tr_starting_point \n"
                    + "inner join station st2 on st2.st_id= tr.tr_destination\n"
                    + "Where b.b_status = 'refunding'"
                    + "Order by [b_date]"
                    + "OFFSET ? ROWS FETCH NEXT 10 ROWS ONLY";
            pst = connection.prepareStatement(query);
            pst.setInt(1, (page - 1) * 10);
            rs = pst.executeQuery();
            while (rs.next()) {
                Booking booking = bookingDao.getBookingById(rs.getInt("b_id"));
                BookingDetailDTO bookingDetail = new BookingDetailDTO();
                bookingDetail.setBooking(booking);
                bookingDetail.setBookingDate(rs.getDate("b_date").toLocalDate());
                bookingDetail.setBookingStatus(rs.getString("b_status"));
                bookingDetail.setBusCode(rs.getString("tr_bus_code"));
                bookingDetail.setDepatureDate(rs.getDate("td_date").toLocalDate());
                bookingDetail.setDepatureTime(rs.getTime("td_depature_time").toString());
                bookingDetail.setDestination(rs.getString("destination"));
                bookingDetail.setPrice(rs.getInt("td_ticket_price"));
                bookingDetail.setSeatName(rs.getString("se_name"));
                bookingDetail.setStartingPoint(rs.getString("starting_point"));
                bookingDetail.setTripDetailId(rs.getString("td_id"));
                bookingDetail.setTripSeatId(rs.getString("ts_id"));
                list.add(bookingDetail);

            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return list;

    }

    public List<BookingDetailDTO> getAllBookingDetailHaveRefunding() {
        BookingDao bookingDao = new BookingDao();
        List<BookingDetailDTO> list = new ArrayList<>();
        try {
            query = "select b.b_id, b.ts_id, ts.td_id, s.se_name, tr.tr_bus_code, st1.st_name AS starting_point, st2.st_name AS destination,\n"
                    + "tr.tr_destination, b.b_status, td.td_ticket_price, td.td_date, td.td_depature_time, b.b_date\n"
                    + "FROM booking b inner join trip_seat_detail ts on b.ts_id =ts.ts_id\n"
                    + "inner join seat s on s.se_id = ts.se_id \n"
                    + "inner join trip_detail td on td.td_id= ts.td_id\n"
                    + "inner join trip_of_bus tr on tr.tr_id= td.tr_id\n"
                    + "inner join station st1 on st1.st_id= tr.tr_starting_point \n"
                    + "inner join station st2 on st2.st_id= tr.tr_destination\n"
                    + "WHERE b.b_status='refunding'";

            pst = connection.prepareStatement(query);
            rs = pst.executeQuery();
            while (rs.next()) {
                Booking booking = bookingDao.getBookingById(rs.getInt("b_id"));
                BookingDetailDTO bookingDetail = new BookingDetailDTO();
                bookingDetail.setBooking(booking);
                bookingDetail.setBookingDate(rs.getDate("b_date").toLocalDate());
                bookingDetail.setBookingStatus(rs.getString("b_status"));
                bookingDetail.setBusCode(rs.getString("tr_bus_code"));
                bookingDetail.setDepatureDate(rs.getDate("td_date").toLocalDate());
                bookingDetail.setDepatureTime(rs.getTime("td_depature_time").toString());
                bookingDetail.setDestination(rs.getString("destination"));
                bookingDetail.setPrice(rs.getInt("td_ticket_price"));
                bookingDetail.setSeatName(rs.getString("se_name"));
                bookingDetail.setStartingPoint(rs.getString("starting_point"));
                bookingDetail.setTripDetailId(rs.getString("td_id"));
                bookingDetail.setTripSeatId(rs.getString("ts_id"));
                list.add(bookingDetail);

            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return list;

    }

    public List<BookingDetailDTO> getAllBookingDetailByCustomerPhone(String phone) {
        BookingDao bookingDao = new BookingDao();
        List<BookingDetailDTO> list = new ArrayList<>();
        try {
            query = "select b.b_id, b.ts_id, ts.td_id, s.se_name, tr.tr_bus_code, st1.st_name AS starting_point, st2.st_name AS destination,\n"
                    + "tr.tr_destination, b.b_status, td.td_ticket_price, td.td_date, td.td_depature_time, b.b_date\n"
                    + "FROM booking b inner join trip_seat_detail ts on b.ts_id =ts.ts_id\n"
                    + "inner join seat s on s.se_id = ts.se_id \n"
                    + "inner join trip_detail td on td.td_id= ts.td_id\n"
                    + "inner join trip_of_bus tr on tr.tr_id= td.tr_id\n"
                    + "inner join station st1 on st1.st_id= tr.tr_starting_point \n"
                    + "inner join station st2 on st2.st_id= tr.tr_destination\n"
                    + "where b.c_phone =?";
            pst = connection.prepareStatement(query);
            pst.setString(1, phone);
            rs = pst.executeQuery();
            while (rs.next()) {
                Booking booking = bookingDao.getBookingById(rs.getInt("b_id"));
                BookingDetailDTO bookingDetail = new BookingDetailDTO();
                bookingDetail.setBooking(booking);
                bookingDetail.setBookingDate(rs.getDate("b_date").toLocalDate());
                bookingDetail.setBookingStatus(rs.getString("b_status"));
                bookingDetail.setBusCode(rs.getString("tr_bus_code"));
                bookingDetail.setDepatureDate(rs.getDate("td_date").toLocalDate());
                bookingDetail.setDepatureTime(rs.getTime("td_depature_time").toString());
                bookingDetail.setDestination(rs.getString("destination"));
                bookingDetail.setPrice(rs.getInt("td_ticket_price"));
                bookingDetail.setSeatName(rs.getString("se_name"));
                bookingDetail.setStartingPoint(rs.getString("starting_point"));
                bookingDetail.setTripDetailId(rs.getString("td_id"));
                bookingDetail.setTripSeatId(rs.getString("ts_id"));
                list.add(bookingDetail);

            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public BookingDetailDTO getBookingDetailByBookingId(int id) {
        BookingDetailDTO bookingDetail = null;
        BookingDao bookingDao = new BookingDao();
        try {
            query = "select b.b_id, b.ts_id, ts.td_id, s.se_name, tr.tr_bus_code, st1.st_name AS starting_point, st2.st_name AS destination,\n"
                    + "tr.tr_destination, b.b_status, td.td_ticket_price, td.td_date, td.td_depature_time, b.b_date\n"
                    + "FROM booking b inner join trip_seat_detail ts on b.ts_id =ts.ts_id\n"
                    + "inner join seat s on s.se_id = ts.se_id \n"
                    + "inner join trip_detail td on td.td_id= ts.td_id\n"
                    + "inner join trip_of_bus tr on tr.tr_id= td.tr_id\n"
                    + "inner join station st1 on st1.st_id= tr.tr_starting_point \n"
                    + "inner join station st2 on st2.st_id= tr.tr_destination\n"
                    + "where b.b_id =?";
            pst = connection.prepareStatement(query);
            pst.setInt(1, id);
            rs = pst.executeQuery();
            while (rs.next()) {
                bookingDetail = new BookingDetailDTO();
                Booking booking = bookingDao.getBookingById(rs.getInt("b_id"));
                bookingDetail.setBooking(booking);
                bookingDetail.setBookingDate(rs.getDate("b_date").toLocalDate());
                bookingDetail.setBookingStatus(rs.getString("b_status"));
                bookingDetail.setBusCode(rs.getString("tr_bus_code"));
                bookingDetail.setDepatureDate(rs.getDate("td_date").toLocalDate());
                bookingDetail.setDepatureTime(rs.getTime("td_depature_time").toString());
                bookingDetail.setDestination(rs.getString("destination"));
                bookingDetail.setPrice(rs.getInt("td_ticket_price"));
                bookingDetail.setSeatName(rs.getString("se_name"));
                bookingDetail.setStartingPoint(rs.getString("starting_point"));
                bookingDetail.setTripDetailId(rs.getString("td_id"));
                bookingDetail.setTripSeatId(rs.getString("ts_id"));

            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return bookingDetail;
    }

    // get booking detail by tripSeatDetailId And bookingStatus='paid' or bookingStatus='order'
    public BookingDetailDTO getBookingDetailByTripSeatDetailIdAndBookingStatus(String tripSeatDetailId) {
        BookingDetailDTO bookingDetail = null;
        BookingDao bookingDao = new BookingDao();
        try {
            query = "select b.b_id, b.ts_id, ts.td_id, s.se_name, tr.tr_bus_code, st1.st_name AS starting_point, st2.st_name AS destination,\n"
                    + "tr.tr_destination, b.b_status, td.td_ticket_price, td.td_date, td.td_depature_time, b.b_date\n"
                    + "FROM booking b inner join trip_seat_detail ts on b.ts_id =ts.ts_id\n"
                    + "inner join seat s on s.se_id = ts.se_id \n"
                    + "inner join trip_detail td on td.td_id= ts.td_id\n"
                    + "inner join trip_of_bus tr on tr.tr_id= td.tr_id\n"
                    + "inner join station st1 on st1.st_id= tr.tr_starting_point \n"
                    + "inner join station st2 on st2.st_id= tr.tr_destination\n"
                    + "where b.ts_id =? and b.b_status IN ('order', 'paid')";
            pst = connection.prepareStatement(query);
            pst.setString(1, tripSeatDetailId);
            rs = pst.executeQuery();
            while (rs.next()) {
                bookingDetail = new BookingDetailDTO();
                Booking booking = bookingDao.getBookingById(rs.getInt("b_id"));
                bookingDetail.setBooking(booking);
                bookingDetail.setBookingDate(rs.getDate("b_date").toLocalDate());
                bookingDetail.setBookingStatus(rs.getString("b_status"));
                bookingDetail.setBusCode(rs.getString("tr_bus_code"));
                bookingDetail.setDepatureDate(rs.getDate("td_date").toLocalDate());
                bookingDetail.setDepatureTime(rs.getTime("td_depature_time").toString());
                bookingDetail.setDestination(rs.getString("destination"));
                bookingDetail.setPrice(rs.getInt("td_ticket_price"));
                bookingDetail.setSeatName(rs.getString("se_name"));
                bookingDetail.setStartingPoint(rs.getString("starting_point"));
                bookingDetail.setTripDetailId(rs.getString("td_id"));
                bookingDetail.setTripSeatId(rs.getString("ts_id"));

            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return bookingDetail;
    }

    public List<BookingDetailDTO> getAllBookingDetailHaveStatusOrderByCustomerPhone(String phone) {
        List<BookingDetailDTO> list = new ArrayList<>();
        BookingDao bookingDao = new BookingDao();
        try {
            query = "select b.b_id, b.ts_id, ts.td_id, s.se_name, tr.tr_bus_code, st1.st_name AS starting_point, st2.st_name AS destination,\n"
                    + "tr.tr_destination, b.b_status, td.td_ticket_price, td.td_date, td.td_depature_time, b.b_date\n"
                    + "FROM booking b inner join trip_seat_detail ts on b.ts_id =ts.ts_id\n"
                    + "inner join seat s on s.se_id = ts.se_id \n"
                    + "inner join trip_detail td on td.td_id= ts.td_id\n"
                    + "inner join trip_of_bus tr on tr.tr_id= td.tr_id\n"
                    + "inner join station st1 on st1.st_id= tr.tr_starting_point \n"
                    + "inner join station st2 on st2.st_id= tr.tr_destination\n"
                    + "where b.c_phone =? and b.b_status = 'order'";
            pst = connection.prepareStatement(query);
            pst.setString(1, phone);
            rs = pst.executeQuery();
            while (rs.next()) {
                BookingDetailDTO bookingDetail = new BookingDetailDTO();
                Booking booking = bookingDao.getBookingById(rs.getInt("b_id"));
                bookingDetail.setBooking(booking);
                bookingDetail.setBookingDate(rs.getDate("b_date").toLocalDate());
                bookingDetail.setBookingStatus(rs.getString("b_status"));
                bookingDetail.setBusCode(rs.getString("tr_bus_code"));
                bookingDetail.setDepatureDate(rs.getDate("td_date").toLocalDate());
                bookingDetail.setDepatureTime(rs.getTime("td_depature_time").toString());
                bookingDetail.setDestination(rs.getString("destination"));
                bookingDetail.setPrice(rs.getInt("td_ticket_price"));
                bookingDetail.setSeatName(rs.getString("se_name"));
                bookingDetail.setStartingPoint(rs.getString("starting_point"));
                bookingDetail.setTripDetailId(rs.getString("td_id"));
                bookingDetail.setTripSeatId(rs.getString("ts_id"));
                list.add(bookingDetail);

            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        if (list.isEmpty()) {
            return null;
        } else {
            return list;
        }
    }

    public List<BookingDetailDTO> getListBookingDetailDTOByCustomerPhoneWithPagination(String phone, int pageNumber) {
        List<BookingDetailDTO> list = new ArrayList<>();

        BookingDao bookingDao = new BookingDao();
        try {
            query = " select b.b_id, b.ts_id, ts.td_id, s.se_name, tr.tr_bus_code, st1.st_name AS starting_point, st2.st_name AS destination,\n"
                    + "                    tr.tr_destination, b.b_status, td.td_ticket_price, td.td_date, td.td_depature_time, b.b_date\n"
                    + "                    FROM booking b inner join trip_seat_detail ts on b.ts_id =ts.ts_id\n"
                    + "                    inner join seat s on s.se_id = ts.se_id \n"
                    + "                    inner join trip_detail td on td.td_id= ts.td_id\n"
                    + "                    inner join trip_of_bus tr on tr.tr_id= td.tr_id\n"
                    + "                    inner join station st1 on st1.st_id= tr.tr_starting_point\n"
                    + "                    inner join station st2 on st2.st_id= tr.tr_destination\n"
                    + "                    where b.c_phone = ?\n"
                    + "					ORDER BY b.b_id DESC\n"
                    + "					OFFSET ? ROWS\n"
                    + "					FETCH NEXT 10 ROW ONLY";
            pst = connection.prepareStatement(query);
            pst.setString(1, phone);
            pst.setInt(2, (pageNumber - 1) * 10);
            rs = pst.executeQuery();
            while (rs.next()) {
                BookingDetailDTO bookingDetail = new BookingDetailDTO();
                Booking booking = bookingDao.getBookingById(rs.getInt("b_id"));
                bookingDetail.setBooking(booking);
                bookingDetail.setBookingDate(rs.getDate("b_date").toLocalDate());
                bookingDetail.setBookingStatus(rs.getString("b_status"));
                bookingDetail.setBusCode(rs.getString("tr_bus_code"));
                bookingDetail.setDepatureDate(rs.getDate("td_date").toLocalDate());
                bookingDetail.setDepatureTime(rs.getTime("td_depature_time").toString());
                bookingDetail.setDestination(rs.getString("destination"));
                bookingDetail.setPrice(rs.getInt("td_ticket_price"));
                bookingDetail.setSeatName(rs.getString("se_name"));
                bookingDetail.setStartingPoint(rs.getString("starting_point"));
                bookingDetail.setTripDetailId(rs.getString("td_id"));
                bookingDetail.setTripSeatId(rs.getString("ts_id"));
                list.add(bookingDetail);

            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public List<BookingDetailDTO> getListBookingDetailDTOByCustomerPhoneWithPaginationOrderByStatus(String phone, int pageNumber) {
        List<BookingDetailDTO> list = new ArrayList<>();
        BookingDao bookingDao = new BookingDao();
        try {
            query = " select b.b_id, b.ts_id, ts.td_id, s.se_name, tr.tr_bus_code, st1.st_name AS starting_point, st2.st_name AS destination,\n"
                    + "                    tr.tr_destination, b.b_status, td.td_ticket_price, td.td_date, td.td_depature_time, b.b_date\n"
                    + "                    FROM booking b inner join trip_seat_detail ts on b.ts_id =ts.ts_id\n"
                    + "                    inner join seat s on s.se_id = ts.se_id \n"
                    + "                    inner join trip_detail td on td.td_id= ts.td_id\n"
                    + "                    inner join trip_of_bus tr on tr.tr_id= td.tr_id\n"
                    + "                    inner join station st1 on st1.st_id= tr.tr_starting_point\n"
                    + "                    inner join station st2 on st2.st_id= tr.tr_destination\n"
                    + "                    where b.c_phone = ?\n"
                    + "					ORDER BY b.b_status DESC\n"
                    + "					OFFSET ? ROWS\n"
                    + "					FETCH NEXT 10 ROW ONLY";
            pst = connection.prepareStatement(query);
            pst.setString(1, phone);
            pst.setInt(2, (pageNumber - 1) * 10);
            rs = pst.executeQuery();
            while (rs.next()) {
                BookingDetailDTO bookingDetail = new BookingDetailDTO();
                Booking booking = bookingDao.getBookingById(rs.getInt("b_id"));
                bookingDetail.setBooking(booking);
                bookingDetail.setBookingDate(rs.getDate("b_date").toLocalDate());
                bookingDetail.setBookingStatus(rs.getString("b_status"));
                bookingDetail.setBusCode(rs.getString("tr_bus_code"));
                bookingDetail.setDepatureDate(rs.getDate("td_date").toLocalDate());
                bookingDetail.setDepatureTime(rs.getTime("td_depature_time").toString());
                bookingDetail.setDestination(rs.getString("destination"));
                bookingDetail.setPrice(rs.getInt("td_ticket_price"));
                bookingDetail.setSeatName(rs.getString("se_name"));
                bookingDetail.setStartingPoint(rs.getString("starting_point"));
                bookingDetail.setTripDetailId(rs.getString("td_id"));
                bookingDetail.setTripSeatId(rs.getString("ts_id"));
                list.add(bookingDetail);

            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public List<BookingDetailDTO> getAllBookingDetailByTripDetailId(String tripDetailId) {
        BookingDao bookingDao = new BookingDao();
        List<BookingDetailDTO> list = new ArrayList<>();
        try {
            query = "select b.b_id, b.ts_id, ts.td_id, s.se_name, tr.tr_bus_code, st1.st_name AS starting_point, st2.st_name AS destination,\n"
                    + "tr.tr_destination, b.b_status, td.td_ticket_price, td.td_date, td.td_depature_time, b.b_date\n"
                    + "FROM booking b inner join trip_seat_detail ts on b.ts_id =ts.ts_id\n"
                    + "inner join seat s on s.se_id = ts.se_id \n"
                    + "inner join trip_detail td on td.td_id= ts.td_id\n"
                    + "inner join trip_of_bus tr on tr.tr_id= td.tr_id\n"
                    + "inner join station st1 on st1.st_id= tr.tr_starting_point \n"
                    + "inner join station st2 on st2.st_id= tr.tr_destination\n"
                    + "where td.td_id =? and b.b_status IN ('order', 'paid','refunding')";
            pst = connection.prepareStatement(query);
            pst.setString(1, tripDetailId);
            rs = pst.executeQuery();
            while (rs.next()) {
                Booking booking = bookingDao.getBookingById(rs.getInt("b_id"));
                BookingDetailDTO bookingDetail = new BookingDetailDTO();
                bookingDetail.setBooking(booking);
                bookingDetail.setBookingDate(rs.getDate("b_date").toLocalDate());
                bookingDetail.setBookingStatus(rs.getString("b_status"));
                bookingDetail.setBusCode(rs.getString("tr_bus_code"));
                bookingDetail.setDepatureDate(rs.getDate("td_date").toLocalDate());
                bookingDetail.setDepatureTime(rs.getTime("td_depature_time").toString());
                bookingDetail.setDestination(rs.getString("destination"));
                bookingDetail.setPrice(rs.getInt("td_ticket_price"));
                bookingDetail.setSeatName(rs.getString("se_name"));
                bookingDetail.setStartingPoint(rs.getString("starting_point"));
                bookingDetail.setTripDetailId(rs.getString("td_id"));
                bookingDetail.setTripSeatId(rs.getString("ts_id"));
                list.add(bookingDetail);

            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        if (list.isEmpty()) {
            return null;
        } else {
            return list;
        }
    }

    public List<BookingDetailDTO> getAllBookingDetailByTripDetailIdAndPhone(String tripDetailId, String phone) {
        BookingDao bookingDao = new BookingDao();
        List<BookingDetailDTO> list = new ArrayList<>();
        try {
            query = "select b.b_id, b.ts_id, ts.td_id, s.se_name, tr.tr_bus_code, st1.st_name AS starting_point, st2.st_name AS destination,\n"
                    + "tr.tr_destination, b.b_status, td.td_ticket_price, td.td_date, td.td_depature_time, b.b_date\n"
                    + "FROM booking b inner join trip_seat_detail ts on b.ts_id =ts.ts_id\n"
                    + "inner join seat s on s.se_id = ts.se_id \n"
                    + "inner join trip_detail td on td.td_id= ts.td_id\n"
                    + "inner join trip_of_bus tr on tr.tr_id= td.tr_id\n"
                    + "inner join station st1 on st1.st_id= tr.tr_starting_point \n"
                    + "inner join station st2 on st2.st_id= tr.tr_destination\n"
                    + "where td.td_id =? and b.b_status IN ('order', 'paid') and b.c_phone like ?";
            pst = connection.prepareStatement(query);
            pst.setString(1, tripDetailId);
            pst.setString(2, phone + "%");
            rs = pst.executeQuery();
            while (rs.next()) {
                Booking booking = bookingDao.getBookingById(rs.getInt("b_id"));
                BookingDetailDTO bookingDetail = new BookingDetailDTO();
                bookingDetail.setBooking(booking);
                bookingDetail.setBookingDate(rs.getDate("b_date").toLocalDate());
                bookingDetail.setBookingStatus(rs.getString("b_status"));
                bookingDetail.setBusCode(rs.getString("tr_bus_code"));
                bookingDetail.setDepatureDate(rs.getDate("td_date").toLocalDate());
                bookingDetail.setDepatureTime(rs.getTime("td_depature_time").toString());
                bookingDetail.setDestination(rs.getString("destination"));
                bookingDetail.setPrice(rs.getInt("td_ticket_price"));
                bookingDetail.setSeatName(rs.getString("se_name"));
                bookingDetail.setStartingPoint(rs.getString("starting_point"));
                bookingDetail.setTripDetailId(rs.getString("td_id"));
                bookingDetail.setTripSeatId(rs.getString("ts_id"));
                list.add(bookingDetail);

            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        if (list.isEmpty()) {
            return null;
        } else {
            return list;
        }
    }

    public List<BookingDetailDTO> getBookingDetailByTripDetailIdAndBookingStatusWithPagination(String tripDetailId, int pageNumber) {
        List<BookingDetailDTO> list = new ArrayList<>();
        BookingDao bookingDao = new BookingDao();
        try {
            query = " select b.b_id, b.ts_id, ts.td_id, s.se_name, tr.tr_bus_code, st1.st_name AS starting_point, st2.st_name AS destination,\n"
                    + "                    tr.tr_destination, b.b_status, td.td_ticket_price, td.td_date, td.td_depature_time, b.b_date\n"
                    + "                    FROM booking b inner join trip_seat_detail ts on b.ts_id =ts.ts_id\n"
                    + "                    inner join seat s on s.se_id = ts.se_id \n"
                    + "                    inner join trip_detail td on td.td_id= ts.td_id\n"
                    + "                    inner join trip_of_bus tr on tr.tr_id= td.tr_id\n"
                    + "                    inner join station st1 on st1.st_id= tr.tr_starting_point\n"
                    + "                    inner join station st2 on st2.st_id= tr.tr_destination\n"
                    + "                    where ts.td_id =? and b.b_status IN ('order', 'paid')\n"
                    + "					ORDER BY td.td_date DESC\n"
                    + "					OFFSET ? ROWS\n"
                    + "					FETCH NEXT 5 ROW ONLY";
            pst = connection.prepareStatement(query);
            pst.setString(1, tripDetailId);
            pst.setInt(2, (pageNumber - 1) * 5);
            rs = pst.executeQuery();
            while (rs.next()) {
                BookingDetailDTO bookingDetail = new BookingDetailDTO();
                bookingDetail.setBooking(bookingDao.getBookingById(rs.getInt("b_id")));
                bookingDetail.setBookingDate(rs.getDate("b_date").toLocalDate());
                bookingDetail.setBookingStatus(rs.getString("b_status"));
                bookingDetail.setBusCode(rs.getString("tr_bus_code"));
                bookingDetail.setDepatureDate(rs.getDate("td_date").toLocalDate());
                bookingDetail.setDepatureTime(rs.getTime("td_depature_time").toString());
                bookingDetail.setDestination(rs.getString("destination"));
                bookingDetail.setPrice(rs.getInt("td_ticket_price"));
                bookingDetail.setSeatName(rs.getString("se_name"));
                bookingDetail.setStartingPoint(rs.getString("starting_point"));
                bookingDetail.setTripDetailId(rs.getString("td_id"));
                bookingDetail.setTripSeatId(rs.getString("ts_id"));
                list.add(bookingDetail);

            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        if (list.isEmpty()) {
            return null;
        } else {
            return list;
        }
    }

    public static void main(String[] args) {
        BookingDetailDTODao bookingDetailDTODao = new BookingDetailDTODao();
        List<BookingDetailDTO> bookingdetailDTO = bookingDetailDTODao.getAllBookingDetailPagination(1);
        if (bookingdetailDTO == null) {
            System.out.println("asd");
        } else {
            for (BookingDetailDTO bookingDetailDTO : bookingdetailDTO) {
                System.out.println(bookingDetailDTO.toString());
            }
        }
    }
}
