/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.time.LocalDate;

/**
 *
 * @author ACER NITRO 5
 */
public class TripDetail {

    private String tripDetailId;
    private TripOfBus trip;
    private String departureTime;
    private LocalDate date;
    private int ticketPrice;

    public TripDetail() {
    }

    public TripDetail(String tripDetailId, TripOfBus trip, String departureTime, LocalDate date, int ticketPrice) {
        this.tripDetailId = tripDetailId;
        this.trip = trip;
        this.departureTime = departureTime;
        this.date = date;
        this.ticketPrice = ticketPrice;
    }

    public String getTripDetailId() {
        return tripDetailId;
    }

    public void setTripDetailId(String tripDetailId) {
        this.tripDetailId = tripDetailId;
    }

    public TripOfBus getTrip() {
        return trip;
    }

    public void setTrip(TripOfBus trip) {
        this.trip = trip;
    }

    public String getDepartureTime() {
        return departureTime;
    }

    public void setDepartureTime(String departureTime) {
        this.departureTime = departureTime;
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    public int getTicketPrice() {
        return ticketPrice;
    }

    public void setTicketPrice(int ticketPrice) {
        this.ticketPrice = ticketPrice;
    }

    @Override
    public String toString() {
        return "TripDetail{" + "tripDetailId=" + tripDetailId + ", trip=" + trip + ", departureTime=" + departureTime + ", date=" + date + ", ticketPrice=" + ticketPrice + '}';
    }

}
