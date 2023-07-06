/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

public class TripOfBus {

    private String tripId;
    private Station tripStartingPoint;
    private Station destination;
    private int totalSeat;
    private int during;
    private String busCode;

    public TripOfBus() {
    }

    public TripOfBus(String tripId, Station tripStartingPoint, Station destination, int totalSeat, int during, String busCode) {
        this.tripId = tripId;
        this.tripStartingPoint = tripStartingPoint;
        this.destination = destination;
        this.totalSeat = totalSeat;
        this.during = during;
        this.busCode = busCode;
    }

    public String getTripId() {
        return tripId;
    }

    public void setTripId(String tripId) {
        this.tripId = tripId;
    }

    public Station getTripStartingPoint() {
        return tripStartingPoint;
    }

    public void setTripStartingPoint(Station tripStartingPoint) {
        this.tripStartingPoint = tripStartingPoint;
    }

    public Station getDestination() {
        return destination;
    }

    public void setDestination(Station destination) {
        this.destination = destination;
    }

    public int getTotalSeat() {
        return totalSeat;
    }

    public void setTotalSeat(int totalSeat) {
        this.totalSeat = totalSeat;
    }

    public int getDuring() {
        return during;
    }

    public void setDuring(int during) {
        this.during = during;
    }

    public String getBusCode() {
        return busCode;
    }

    public void setBusCode(String busCode) {
        this.busCode = busCode;
    }

    @Override
    public String toString() {
        return "TripOfBus{" + "tripId=" + tripId + ", tripStartingPoint=" + tripStartingPoint + ", destination=" + destination + ", totalSeat=" + totalSeat + ", during=" + during + ", busCode=" + busCode + '}';
    }

}
