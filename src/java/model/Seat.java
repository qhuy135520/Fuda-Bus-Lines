/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ACER NITRO 5
 */
public class Seat {

    private int seatId;
    private String seatName;

    public Seat() {
    }

    public Seat(int seatId, String seatName) {
        this.seatId = seatId;
        this.seatName = seatName;
    }

    public int getSeatId() {
        return seatId;
    }

    public void setSeatId(int seatId) {
        this.seatId = seatId;
    }

    public String getSeatName() {
        return seatName;
    }

    public void setSeatName(String seatName) {
        this.seatName = seatName;
    }

    @Override
    public String toString() {
        return "Seat{" + "seatId=" + seatId + ", seatName=" + seatName + '}';
    }

}
