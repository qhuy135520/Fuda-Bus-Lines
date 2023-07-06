/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.Seat;

/**
 *
 * @author ACER NITRO 5
 */
public class SeatDao extends DBContext {

    private String query;
    private PreparedStatement pst;
    private ResultSet rs;

    // Get Seat  by Id
    public Seat getSeatById(int id) {
        Seat seat = null;
        try {
            query = "select * from seat where se_id=?";

            pst = connection.prepareStatement(query);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                seat = new Seat();
                seat.setSeatId(id);
                seat.setSeatName(rs.getString("se_name"));
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return seat;
    }
}
