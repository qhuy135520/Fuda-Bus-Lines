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
public class Booking {

    private Customer customer;
    private TripSeatDetail tripSeatDetail;
    private String bookingStatus;
    private LocalDate bookedDate;
    private String bookedTime;
    private int bookingId;
    private String code;
    private LocalDate paidDate;

    public Booking() {
    }

    public Booking(Customer customer, TripSeatDetail tripSeatDetail, String bookingStatus, LocalDate bookedDate, String bookedTime, int bookingId, String code, LocalDate paidDate) {
        this.customer = customer;
        this.tripSeatDetail = tripSeatDetail;
        this.bookingStatus = bookingStatus;
        this.bookedDate = bookedDate;
        this.bookedTime = bookedTime;
        this.bookingId = bookingId;
        this.code = code;
        this.paidDate = paidDate;
    }

    public Booking(Customer customer, TripSeatDetail tripSeatDetail, String bookingStatus, LocalDate bookedDate, String bookedTime, int bookingId) {
        this.customer = customer;
        this.tripSeatDetail = tripSeatDetail;
        this.bookingStatus = bookingStatus;
        this.bookedDate = bookedDate;
        this.bookedTime = bookedTime;
        this.bookingId = bookingId;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public LocalDate getPaidDate() {
        return paidDate;
    }

    public void setPaidDate(LocalDate paidDate) {
        this.paidDate = paidDate;
    }

    public int getBookingId() {
        return bookingId;
    }

    public void setBookingId(int bookingId) {
        this.bookingId = bookingId;
    }

    public String getBookedTime() {
        return bookedTime;
    }

    public void setBookedTime(String bookedTime) {
        this.bookedTime = bookedTime;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public TripSeatDetail getTripSeatDetail() {
        return tripSeatDetail;
    }

    public void setTripSeatDetail(TripSeatDetail tripSeatDetail) {
        this.tripSeatDetail = tripSeatDetail;
    }

    public String getBookingStatus() {
        return bookingStatus;
    }

    public void setBookingStatus(String bookingStatus) {
        this.bookingStatus = bookingStatus;
    }

    public LocalDate getBookedDate() {
        return bookedDate;
    }

    public void setBookedDate(LocalDate bookedDate) {
        this.bookedDate = bookedDate;
    }

    @Override
    public String toString() {
        return "Booking{" + "customer=" + customer + ", tripSeatDetail=" + tripSeatDetail + ", bookingStatus=" + bookingStatus + ", bookedDate=" + bookedDate + ", bookedTime=" + bookedTime + ", bookingId=" + bookingId + '}';
    }

}
