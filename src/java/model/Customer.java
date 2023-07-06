/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author letra
 */
public class Customer {

    private String customerPhone;
    private String customerEmail;
    private String customerFirstname;
    private String customerLastname;
    private String customerBirthdate;
    private String customerPassword;
    private String customerCreatedDate;
    private String customerUrlImg;

    public Customer() {
    }

    public Customer(String customerPhone, String customerEmail, String customerFirstname, String customerLastname, String customerBirthdate, String customerPassword, String customerCreatedDate, String customerUrlImg) {
        this.customerPhone = customerPhone;
        this.customerEmail = customerEmail;
        this.customerFirstname = customerFirstname;
        this.customerLastname = customerLastname;
        this.customerBirthdate = customerBirthdate;
        this.customerPassword = customerPassword;
        this.customerCreatedDate = customerCreatedDate;
        this.customerUrlImg = customerUrlImg;
    }

    public String getCustomerPhone() {
        return customerPhone;
    }

    public void setCustomerPhone(String customerPhone) {
        this.customerPhone = customerPhone;
    }

    public String getCustomerEmail() {
        return customerEmail;
    }

    public void setCustomerEmail(String customerEmail) {
        this.customerEmail = customerEmail;
    }

    public String getCustomerFirstname() {
        return customerFirstname;
    }

    public void setCustomerFirstname(String customerFirstname) {
        this.customerFirstname = customerFirstname;
    }

    public String getCustomerLastname() {
        return customerLastname;
    }

    public void setCustomerLastname(String customerLastName) {
        this.customerLastname = customerLastName;
    }

    public String getCustomerBirthdate() {
        return customerBirthdate;
    }

    public void setCustomerBirthdate(String customerBirthdate) {
        this.customerBirthdate = customerBirthdate;
    }

    public String getCustomerPassword() {
        return customerPassword;
    }

    public void setCustomerPassword(String customerPassword) {
        this.customerPassword = customerPassword;
    }

    public String getCustomerCreatedDate() {
        return customerCreatedDate;
    }

    public void setCustomerCreatedDate(String customerCreatedDate) {
        this.customerCreatedDate = customerCreatedDate;
    }

    public String getCustomerUrlImg() {
        return customerUrlImg;
    }

    public void setCustomerUrlImg(String customerUrlImg) {
        this.customerUrlImg = customerUrlImg;
    }

    @Override
    public String toString() {
        return "Customer{" + "customerPhone=" + customerPhone + ", customerEmail=" + customerEmail + ", customerFirstname=" + customerFirstname + ", customerLastname=" + customerLastname + ", customerBirthdate=" + customerBirthdate + ", customerPassword=" + customerPassword + ", customerCreatedDate=" + customerCreatedDate + ", customerUrlImg=" + customerUrlImg + '}';
    }

}
