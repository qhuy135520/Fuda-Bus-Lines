/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import model.Station;
import model.TripOfBus;

/**
 *
 * @author ACER NITRO 5
 */
public class TripDao extends DBContext {

    private String query;
    private PreparedStatement pst;
    private ResultSet rs;

    public boolean insertTripOfBus(TripOfBus tripOfBus) {
        boolean result = false;
        try {
            query = "insert into trip_of_bus (tr_id, tr_starting_point, tr_destination, tr_total_seat, tr_during, tr_bus_code) values(?,?,?,?,?,?)";
            pst = connection.prepareStatement(query);
            pst.setString(1, tripOfBus.getTripId());
            pst.setInt(2, tripOfBus.getTripStartingPoint().getStationId());
            pst.setInt(3, tripOfBus.getDestination().getStationId());
            pst.setInt(4, tripOfBus.getTotalSeat());
            pst.setInt(5, tripOfBus.getDuring());
            pst.setString(6, tripOfBus.getBusCode());
            pst.executeUpdate();
            result = true;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return result;
    }

    public List<TripOfBus> getAllTrips() {
        List<TripOfBus> list = new ArrayList<>();
        StationDAO stationDao = new StationDAO();
        try {
            query = "select * from trip_of_bus";
            pst = connection.prepareStatement(query);
            rs = pst.executeQuery();
            while (rs.next()) {
                Station startingPoint = stationDao.getStationByStationID(rs.getInt("tr_starting_point"));
                Station destination = stationDao.getStationByStationID(rs.getInt("tr_destination"));
                TripOfBus tripOfBus = new TripOfBus();
                tripOfBus.setTripId(rs.getString("tr_id"));
                tripOfBus.setTripStartingPoint(startingPoint);
                tripOfBus.setDestination(destination);
                tripOfBus.setTotalSeat(rs.getInt("tr_total_seat"));
                tripOfBus.setDuring(rs.getInt("tr_during"));
                tripOfBus.setBusCode(rs.getString("tr_bus_code"));
                list.add(tripOfBus);

            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public List<TripOfBus> getAllTripsWithPagination(int page) {
        List<TripOfBus> list = new ArrayList<>();
        StationDAO stationDao = new StationDAO();
        try {
            query = "select * from trip_of_bus\n"
                    + "ORDER BY [tr_id]\n"
                    + "OFFSET ? ROWS\n"
                    + "FETCH NEXT 10 ROWS ONLY;";
            pst = connection.prepareStatement(query);
            pst.setInt(1, (page - 1) * 10);
            rs = pst.executeQuery();
            while (rs.next()) {
                Station startingPoint = stationDao.getStationByStationID(rs.getInt("tr_starting_point"));
                Station destination = stationDao.getStationByStationID(rs.getInt("tr_destination"));
                TripOfBus tripOfBus = new TripOfBus();
                tripOfBus.setTripId(rs.getString("tr_id"));
                tripOfBus.setTripStartingPoint(startingPoint);
                tripOfBus.setDestination(destination);
                tripOfBus.setTotalSeat(rs.getInt("tr_total_seat"));
                tripOfBus.setDuring(rs.getInt("tr_during"));
                tripOfBus.setBusCode(rs.getString("tr_bus_code"));
                list.add(tripOfBus);

            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    //tra ve 1 tripOfBus bang id
    public TripOfBus getTripOfBusById(String id) {
        StationDAO stationDao = new StationDAO();
        TripOfBus tripOfBus = null;
        try {
            query = "select * from trip_of_bus where tr_id=?";

            pst = connection.prepareStatement(query);
            pst.setString(1, id);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                Station startingPoint = stationDao.getStationByStationID(rs.getInt("tr_starting_point"));
                Station destination = stationDao.getStationByStationID(rs.getInt("tr_destination"));
                tripOfBus = new TripOfBus();
                tripOfBus.setTripId(id);
                tripOfBus.setBusCode(rs.getString("tr_bus_code"));
                tripOfBus.setDestination(destination);
                tripOfBus.setDuring(rs.getInt("tr_during"));
                tripOfBus.setTotalSeat(rs.getInt("tr_total_seat"));
                tripOfBus.setTripStartingPoint(startingPoint);
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return tripOfBus;
    }

    // tra ve danh sach cac dia diem ma chuyen xe di qua
    public List<String> getRoutes(String tripId) {
        List<String> routes = new ArrayList<>();
        try {
            query = "select st.st_name from route r inner join station st on st.st_id = r.st_id where r.tr_id =?";
            pst = connection.prepareStatement(query);
            pst.setString(1, tripId);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                routes.add(rs.getString("st_name"));
            }
        } catch (SQLException e) {
        }
        return routes;
    }

    public static void main(String[] args) {
        TripDao dao = new TripDao();
        StationDAO stationDao = new StationDAO();
        TripOfBus tripOfBus  = new TripOfBus("DNH01", stationDao.getStationByStationID(15), stationDao.getStationByStationID(57), 36, 2, "43A12312");
        dao.insertTripOfBus(tripOfBus);
        
    }
}
