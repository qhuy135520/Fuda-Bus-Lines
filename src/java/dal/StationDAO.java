/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.xml.bind.annotation.XmlRootElement;
import model.Station;

/**
 *
 * @author letra
 */
@XmlRootElement(name = "station")

public class StationDAO extends DBContext {

    public ArrayList<Station> getStation() {
        ArrayList<Station> list = new ArrayList<>();
        String sql = "select * from station";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Station s = new Station(rs.getInt(1), rs.getString(2), rs.getString(3));
                list.add(s);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Station getStationByStationID(int stationId) {
        String sql = "SELECT * from station"
                + "  where st_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, stationId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Station s = new Station(rs.getInt(1), rs.getString(2), rs.getString(3));
                return s;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
}
