/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.Period;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import model.TripDetail;
import model.TripOfBus;

/**
 *
 * @author ACER NITRO 5
 */
public class TripDetailDao extends DBContext {

    private String query;
    private PreparedStatement pst;
    private ResultSet rs;
    public DateFormat formatter = new SimpleDateFormat("HH:mm:ss");

    // Insert TripDetail
    public void insertTripDetail(TripDetail detail) throws ParseException {
        TripSeatDao tripSeatDao = new TripSeatDao();
        try {
            query = "insert into trip_detail (td_id, tr_id, td_depature_time, td_date, td_ticket_price) values(?,?,?,?,?)";
            pst = connection.prepareStatement(query);
            pst.setString(1, detail.getTripDetailId());
            pst.setString(2, detail.getTrip().getTripId());
            pst.setTime(3, new java.sql.Time(formatter.parse(detail.getDepartureTime()).getTime()));
            pst.setDate(4, java.sql.Date.valueOf(detail.getDate()));
            pst.setInt(5, detail.getTicketPrice());
            pst.executeUpdate();
            tripSeatDao.generateTicket(detail.getTripDetailId(), detail.getTrip().getTotalSeat());
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    //Lấy dữ liệu của tất cả chuyến xe
    public List<TripDetail> getAllTripDetail() {
        List<TripDetail> list = new ArrayList<>();
        try {
            query = "select * from trip_detail";
            pst = connection.prepareStatement(query);
            rs = pst.executeQuery();
            while (rs.next()) {
                TripDetail tripDetail = new TripDetail();
                tripDetail.setTripDetailId(rs.getString("td_id"));
                tripDetail.setDate(rs.getDate("td_date").toLocalDate());
                tripDetail.setDepartureTime(rs.getTime("td_depature_time").toString());
                tripDetail.setTicketPrice(rs.getInt("td_ticket_price"));

                TripDao tripDao = new TripDao();
                TripOfBus trip = tripDao.getTripOfBusById(rs.getString("tr_id"));
                tripDetail.setTrip(trip);

                list.add(tripDetail);

            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return list;
    }
public List<TripDetail> getAllTripDetailWithPagination(int page) {
        List<TripDetail> list = new ArrayList<>();
        try {
            query = "SELECT [td_id]\n"
                    + "      ,[tr_id]\n"
                    + "      ,[td_depature_time]\n"
                    + "      ,[td_date]\n"
                    + "      ,[td_ticket_price]\n"
                    + "  FROM [fuda_bus_ticket_booking].[dbo].[trip_detail]\n"
                    + "    ORDER BY [td_date]\n"
                    + "OFFSET ? ROWS FETCH NEXT 10 ROWS ONLY";
            pst = connection.prepareStatement(query);
            pst.setInt(1, (page - 1) * 10);
            rs = pst.executeQuery();
            while (rs.next()) {
                TripDetail tripDetail = new TripDetail();
                tripDetail.setTripDetailId(rs.getString("td_id"));
                tripDetail.setDate(rs.getDate("td_date").toLocalDate());
                tripDetail.setDepartureTime(rs.getTime("td_depature_time").toString());
                tripDetail.setTicketPrice(rs.getInt("td_ticket_price"));

                TripDao tripDao = new TripDao();
                TripOfBus trip = tripDao.getTripOfBusById(rs.getString("tr_id"));
                tripDetail.setTrip(trip);

                list.add(tripDetail);

            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return list;
    }
    public List<TripDetail> getAllTripDetailWithPaginationGet5Elemetns(int page) {
        List<TripDetail> list = new ArrayList<>();
        try {
            query = "SELECT [td_id]\n"
                    + "      ,[tr_id]\n"
                    + "      ,[td_depature_time]\n"
                    + "      ,[td_date]\n"
                    + "      ,[td_ticket_price]\n"
                    + "  FROM [fuda_bus_ticket_booking].[dbo].[trip_detail]\n"
                    + "    ORDER BY [td_date]\n"
                    + "OFFSET ? ROWS FETCH NEXT 5 ROWS ONLY";
            pst = connection.prepareStatement(query);
            pst.setInt(1, (page - 1) * 5);
            rs = pst.executeQuery();
            while (rs.next()) {
                TripDetail tripDetail = new TripDetail();
                tripDetail.setTripDetailId(rs.getString("td_id"));
                tripDetail.setDate(rs.getDate("td_date").toLocalDate());
                tripDetail.setDepartureTime(rs.getTime("td_depature_time").toString());
                tripDetail.setTicketPrice(rs.getInt("td_ticket_price"));

                TripDao tripDao = new TripDao();
                TripOfBus trip = tripDao.getTripOfBusById(rs.getString("tr_id"));
                tripDetail.setTrip(trip);

                list.add(tripDetail);

            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public List<TripDetail> getAllTripDetailWithPaginationByTripId(int page, String tripId) {
        List<TripDetail> list = new ArrayList<>();
        try {
            query = "SELECT [td_id]\n"
                    + "      ,[tr_id]\n"
                    + "      ,[td_depature_time]\n"
                    + "      ,[td_date]\n"
                    + "      ,[td_ticket_price]\n"
                    + "  FROM [fuda_bus_ticket_booking].[dbo].[trip_detail]\n"
                    + "WHERE [tr_id] = ?"
                    + "    ORDER BY [td_date]\n"
                    + "OFFSET ? ROWS FETCH NEXT 10 ROWS ONLY";
            pst = connection.prepareStatement(query);
            pst.setString(1, tripId);
            pst.setInt(2, (page - 1) * 10);
            rs = pst.executeQuery();
            while (rs.next()) {
                TripDetail tripDetail = new TripDetail();
                tripDetail.setTripDetailId(rs.getString("td_id"));
                tripDetail.setDate(rs.getDate("td_date").toLocalDate());
                tripDetail.setDepartureTime(rs.getTime("td_depature_time").toString());
                tripDetail.setTicketPrice(rs.getInt("td_ticket_price"));

                TripDao tripDao = new TripDao();
                TripOfBus trip = tripDao.getTripOfBusById(rs.getString("tr_id"));
                tripDetail.setTrip(trip);

                list.add(tripDetail);

            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return list;
    }
// Trả về danh sách các TripDetail dựa theo điểm xuất phát, điểm dừng, ngày, và giá(optional)
// Nếu tìm kiếm theo gía thì sẽ tìm những chuyến xe có giá bé hơn hoặc bằng giá người dùng nhập vào
// Trường hợp người dùng ko nhập giá, thì truyền giá trị cho parameter price =0

    public List<TripDetail> getTripDetailByStartingPointAndDestinationAndDate(int startingPointId, int destinationId, LocalDate date, int price) {
        List<TripDetail> list = new ArrayList<>();

        try {
            query = "select td.* from trip_detail td inner join trip_of_bus tr on td.tr_id= tr.tr_id where tr.tr_starting_point=? AND tr.tr_destination=? AND td.td_date=? ";

            if (price != 0) {
                query += "AND td_ticket_price<= ?";
                pst = connection.prepareStatement(query);
                pst.setInt(4, price);
            } else {
                pst = connection.prepareStatement(query);

            }
            pst.setInt(1, startingPointId);
            pst.setInt(2, destinationId);
            pst.setDate(3, java.sql.Date.valueOf(date));
            rs = pst.executeQuery();
            while (rs.next()) {
                TripDetail tripDetail = new TripDetail();
                tripDetail.setTripDetailId(rs.getString("td_id"));
                tripDetail.setDate(rs.getDate("td_date").toLocalDate());
                tripDetail.setDepartureTime(rs.getTime("td_depature_time").toString());
                tripDetail.setTicketPrice(rs.getInt("td_ticket_price"));

                TripDao tripDao = new TripDao();
                TripOfBus trip = tripDao.getTripOfBusById(rs.getString("tr_id"));
                tripDetail.setTrip(trip);

                list.add(tripDetail);

            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return list;

    }

    // tra ve tripDetail bang id
    public TripDetail getTripDetailById(String id) {
        TripDetail tripDetail = null;
        try {
            query = "select * from trip_detail where td_id=?";

            pst = connection.prepareStatement(query);
            pst.setString(1, id);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                tripDetail = new TripDetail();
                tripDetail.setTripDetailId(id);
                tripDetail.setDate(rs.getDate("td_date").toLocalDate());
                tripDetail.setDepartureTime(rs.getTime("td_depature_time").toString());
                tripDetail.setTicketPrice(rs.getInt("td_ticket_price"));

                TripDao tripDao = new TripDao();
                TripOfBus trip = tripDao.getTripOfBusById(rs.getString("tr_id"));
                tripDetail.setTrip(trip);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

        return tripDetail;
    }

    // tra ve 1 tripdetail bang starting point
    public List<TripDetail> getTripDetailByStartingPoint(int startingPointId) {
        List<TripDetail> list = new ArrayList<>();

        try {
            query = "select td.* from trip_detail td inner join trip_of_bus tr on td.tr_id= tr.tr_id where tr.tr_starting_point=?";
            pst = connection.prepareStatement(query);

            pst.setInt(1, startingPointId);
            rs = pst.executeQuery();
            while (rs.next()) {
                TripDetail tripDetail = new TripDetail();
                tripDetail.setTripDetailId(rs.getString("td_id"));
                tripDetail.setDate(rs.getDate("td_date").toLocalDate());
                tripDetail.setDepartureTime(rs.getTime("td_depature_time").toString());
                tripDetail.setTicketPrice(rs.getInt("td_ticket_price"));

                TripDao tripDao = new TripDao();
                TripOfBus trip = tripDao.getTripOfBusById(rs.getString("tr_id"));
                tripDetail.setTrip(trip);

                list.add(tripDetail);

            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return list;

    }

    public void deleteTripDetailByTripDetailId(String tripDetailId) {
        try {
            query = "Delete from trip_detail where td_id=? ";
            pst = connection.prepareStatement(query);
            pst.setString(1, tripDetailId);
            pst.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public List<String> calculateDateTime(String time, LocalDate date, int changingTime, String operator) {
        List<String> result = new ArrayList<>();
        String[] timePart = time.split(":");
        int resultHour = 0;
        String officialDate = "";
        String officialTime = "";
        switch (operator) {
            case "add":
                resultHour = Integer.parseInt(timePart[0]) + changingTime;
                if (resultHour >= 24) {
                    resultHour = resultHour % 24;
                    officialDate = date.plus(Period.ofDays(1)).toString();
                    officialTime = String.valueOf(resultHour) + ":" + timePart[1] + ":" + timePart[2];
                } else {
                    officialDate = date.toString();
                    officialTime = String.valueOf(resultHour) + ":" + timePart[1] + ":" + timePart[2];
                }
                result.add(officialTime);
                result.add(officialDate);
                break;
            case "minus":
                resultHour = Integer.parseInt(timePart[0]) - changingTime;
                if (resultHour < 0) {
                    resultHour = 24 + resultHour;
                    officialDate = date.plus(Period.ofDays(-1)).toString();
                    officialTime = String.valueOf(resultHour) + ":" + timePart[1] + ":" + timePart[2];

                } else {
                    officialDate = date.toString();
                    officialTime = String.valueOf(resultHour) + ":" + timePart[1] + ":" + timePart[2];
                }
                result.add(officialTime);
                result.add(officialDate);
                break;
            default:
                throw new AssertionError();
        }
        return result;
    }

    public boolean isAcceptable(TripOfBus tripOfBus, String departureTime, LocalDate date) {
        DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        boolean isAcceptable = false;

        List<String> upperTime = calculateDateTime(departureTime, date, tripOfBus.getDuring(), "add");
        List<String> lowerTime = calculateDateTime(departureTime, date, tripOfBus.getDuring(), "minus");

        try {
            query = " Select COUNT(td.td_id) AS number From trip_detail td INNER JOIN trip_of_bus tr on td.tr_id= tr.tr_id WHERE"
                    + " tr.tr_bus_code=? AND ";
            if (upperTime.get(1).equalsIgnoreCase(lowerTime.get(1))) {
                query = query + "td.td_depature_time < '" + upperTime.get(0) + "' AND td.td_depature_time >'" + lowerTime.get(0) + "' AND td.td_date=?";
                pst = connection.prepareStatement(query);
                pst.setString(1, tripOfBus.getBusCode());
                pst.setDate(2, java.sql.Date.valueOf(LocalDate.parse(upperTime.get(1), dateTimeFormatter)));

            } else {
                query = query + "(td.td_depature_time>'" + lowerTime.get(0) + "' AnD td.td_date=?) OR (td.td_depature_time<'" + upperTime.get(0) + "' AnD td.td_date=?)";
                pst = connection.prepareStatement(query);
                pst.setString(1, tripOfBus.getBusCode());
                pst.setDate(2, java.sql.Date.valueOf(LocalDate.parse(lowerTime.get(1), dateTimeFormatter)));
                pst.setDate(3, java.sql.Date.valueOf(LocalDate.parse(upperTime.get(1), dateTimeFormatter)));
            }

            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                int number = rs.getInt("number");
                if (number == 0) {
                    System.out.println(number);
                    return true;
                }

            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return isAcceptable;
    }

    public static void main(String[] args) {
        TripDetailDao dao = new TripDetailDao();
        TripDao tripDao = new TripDao();
        LocalDate date = LocalDate.parse("2023-12-06");
        TripOfBus trip = tripDao.getTripOfBusById("DNNA01");
       boolean tripDetail = dao.isAcceptable(trip, "20:00:00", date);
        System.out.println(tripDetail);
    }

}
