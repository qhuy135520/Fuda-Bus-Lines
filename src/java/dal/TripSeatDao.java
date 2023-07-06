package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Seat;
import model.TripDetail;
import model.TripSeatDetail;

/**
 *
 * @author ACER NITRO 5
 */
public class TripSeatDao extends DBContext {

    private String query;
    private PreparedStatement pst;
    private ResultSet rs;

    //generate ticket 
    public void generateTicket(String tripDetailId, int totalSeat) {
        try {
            for (int i = 1; i <= totalSeat; i++) {
                query = "insert into trip_seat_detail(ts_id, td_id, se_id, se_status) values(?,?,?,?)";
                pst = connection.prepareStatement(query);
                if (i < 10) {
                    pst.setString(1, tripDetailId + "0" + i);
                } else {
                    pst.setString(1, tripDetailId + i);
                }
                pst.setString(2, tripDetailId);
                pst.setInt(3, i);
                pst.setBoolean(4, true);
                pst.executeUpdate();
            }
        } catch (SQLException e) {
        }
    }

    // Lấy ra tất cả các vé của 1 chuyến xe có td_id
    public List<TripSeatDetail> getAllTripSeatDetailByTripDetailId(String id) {
        List<TripSeatDetail> list = new ArrayList<>();
        try {
            query = "select * from trip_seat_detail WHERE td_id=?";
            pst = connection.prepareStatement(query);
            pst.setString(1, id);
            rs = pst.executeQuery();
            while (rs.next()) {
                TripSeatDetail tripSeatDetail = new TripSeatDetail();
                tripSeatDetail.setTripSeatId(rs.getString("ts_id"));
                tripSeatDetail.setStatus(rs.getBoolean("se_status"));

                TripDetailDao tripDetailDao = new TripDetailDao();
                TripDetail tripDetail = tripDetailDao.getTripDetailById(rs.getString("td_id"));
                tripSeatDetail.setTripDetail(tripDetail);

                SeatDao seatDao = new SeatDao();
                Seat seat = seatDao.getSeatById(rs.getInt("se_id"));
                tripSeatDetail.setSeat(seat);

                list.add(tripSeatDetail);

            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    // lay ra thong tin 1 ve xe theo id
    public TripSeatDetail getTripSeatDetailById(String id) {
        TripSeatDetail tripSeatDetail = null;
        SeatDao seatDao = new SeatDao();
        TripDetailDao tripDetailDao = new TripDetailDao();
        try {
            query = "select * from trip_seat_detail where ts_id=?";
            pst = connection.prepareStatement(query);
            pst.setString(1, id);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                tripSeatDetail = new TripSeatDetail();
                tripSeatDetail.setTripSeatId(id);
                tripSeatDetail.setSeat(seatDao.getSeatById(rs.getInt("se_id")));
                tripSeatDetail.setStatus(rs.getBoolean("se_status"));
                tripSeatDetail.setTripDetail(tripDetailDao.getTripDetailById(rs.getString("td_id")));

            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

        return tripSeatDetail;
    }

    // update tripSeatDetail Status
    public void updateStatusById(String id, boolean status) {
        try {
            query = "update trip_seat_detail set se_status =? where ts_id =?";
            pst = connection.prepareStatement(query);
            pst.setBoolean(1, status);
            pst.setString(2, id);
            pst.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public List<String> getTripSeatDetailIdsBySeatNamesAndTripDetailId(String[] seatNames, String tripDetailId) {
        List<String> list = new ArrayList<>();
        try {
            for (String seatName : seatNames) {
                query = "select ts.ts_id from trip_seat_detail ts inner join seat s on ts.se_id =s.se_id  where ts.td_id=? and s.se_name=?";
                pst = connection.prepareStatement(query);
                pst.setString(1, tripDetailId);
                pst.setString(2, seatName);
                ResultSet rs = pst.executeQuery();
                if (rs.next()) {
                    list.add(rs.getString("ts_id"));
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return list;
    }

    public int getNumberOfBookedSeatByTripDetailId(String tripDetailId) {
        int total = 0;
        try {
            query = "SELECT dbo.get_number_of_booked_ticket(?) AS number";
            pst = connection.prepareStatement(query);
            pst.setString(1, tripDetailId);
            rs = pst.executeQuery();
            while (rs.next()) {
                total = rs.getInt("number");
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return total;
    }

    public static void main(String[] args) {
        TripSeatDao dao = new TripSeatDao();
//        List<TripSeatDetail> tripSeatDetails = dao.getAllTripSeatDetailByTripDetailId("DNNAV1001");
//        System.out.println(tripSeatDetails.size());
   
        int a = dao.getNumberOfBookedSeatByTripDetailId("DNSG01001");
        System.out.println(a);
    }
}
