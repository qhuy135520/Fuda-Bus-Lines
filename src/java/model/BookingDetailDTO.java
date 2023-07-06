package model;

import java.time.LocalDate;


public class BookingDetailDTO {

    private Booking booking;
    private String tripSeatId;
    private String tripDetailId;
    private String seatName;
    private String busCode;
    private String startingPoint;
    private String destination;
    private String depatureTime;
    private LocalDate depatureDate;
    private String bookingStatus;
    private int price;
    private LocalDate bookingDate;

    public BookingDetailDTO() {
    }

    public BookingDetailDTO(Booking booking, String tripSeatId, String tripDetailId, String seatName, String busCode, String startingPoint, String destination, String depatureTime, LocalDate depatureDate, String bookingStatus, int price, LocalDate bookingDate) {
        this.booking = booking;
        this.tripSeatId = tripSeatId;
        this.tripDetailId = tripDetailId;
        this.seatName = seatName;
        this.busCode = busCode;
        this.startingPoint = startingPoint;
        this.destination = destination;
        this.depatureTime = depatureTime;
        this.depatureDate = depatureDate;
        this.bookingStatus = bookingStatus;
        this.price = price;
        this.bookingDate = bookingDate;
    }

    public Booking getBooking() {
        return booking;
    }

    public void setBooking(Booking booking) {
        this.booking = booking;
    }

    public String getDepatureTime() {
        return depatureTime;
    }

    public void setDepatureTime(String depatureTime) {
        this.depatureTime = depatureTime;
    }

    public LocalDate getDepatureDate() {
        return depatureDate;
    }

    public void setDepatureDate(LocalDate depatureDate) {
        this.depatureDate = depatureDate;
    }

    public String getTripSeatId() {
        return tripSeatId;
    }

    public void setTripSeatId(String tripSeatId) {
        this.tripSeatId = tripSeatId;
    }

    public String getTripDetailId() {
        return tripDetailId;
    }

    public void setTripDetailId(String tripDetailId) {
        this.tripDetailId = tripDetailId;
    }

    public String getSeatName() {
        return seatName;
    }

    public void setSeatName(String seatName) {
        this.seatName = seatName;
    }

    public String getBusCode() {
        return busCode;
    }

    public void setBusCode(String busCode) {
        this.busCode = busCode;
    }

    public String getStartingPoint() {
        return startingPoint;
    }

    public void setStartingPoint(String startingPoint) {
        this.startingPoint = startingPoint;
    }

    public String getDestination() {
        return destination;
    }

    public void setDestination(String destination) {
        this.destination = destination;
    }

    public String getBookingStatus() {
        return bookingStatus;
    }

    public void setBookingStatus(String bookingStatus) {
        this.bookingStatus = bookingStatus;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public LocalDate getBookingDate() {
        return bookingDate;
    }

    public void setBookingDate(LocalDate bookingDate) {
        this.bookingDate = bookingDate;
    }

    @Override
    public String toString() {
        return "BookingDetailDTO{" + "booking=" + booking + ", tripSeatId=" + tripSeatId + ", tripDetailId=" + tripDetailId + ", seatName=" + seatName + ", busCode=" + busCode + ", startingPoint=" + startingPoint + ", destination=" + destination + ", depatureTime=" + depatureTime + ", depatureDate=" + depatureDate + ", bookingStatus=" + bookingStatus + ", price=" + price + ", bookingDate=" + bookingDate + '}';
    }

 

}
