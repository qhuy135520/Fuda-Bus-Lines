/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ACER NITRO 5
 */
public class TripSeatDetail {

    private String tripSeatId;
    private TripDetail tripDetail;
    private Seat seat;
    private boolean status;

    public TripSeatDetail() {
    }

    public TripSeatDetail(String tripSeatId, TripDetail tripDetail, Seat seat, boolean status) {
        this.tripSeatId = tripSeatId;
        this.tripDetail = tripDetail;
        this.seat = seat;
        this.status = status;
    }

    public String getTripSeatId() {
        return tripSeatId;
    }

    public void setTripSeatId(String tripSeatId) {
        this.tripSeatId = tripSeatId;
    }

    public TripDetail getTripDetail() {
        return tripDetail;
    }

    public void setTripDetail(TripDetail tripDetail) {
        this.tripDetail = tripDetail;
    }

    public Seat getSeat() {
        return seat;
    }

    public void setSeat(Seat seat) {
        this.seat = seat;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "TripSeatDetail{" + "tripSeatId=" + tripSeatId + ", tripDetail=" + tripDetail + ", seat=" + seat + ", status=" + status + '}';
    }

}
