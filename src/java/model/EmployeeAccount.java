/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ACER NITRO 5
 */
public class EmployeeAccount {

    private String employeeUsername;
    private String employeePassword;
    private String status;
    private int role;

    public EmployeeAccount(String employeeUsername, String employeePassword, String status, int role) {
        this.employeeUsername = employeeUsername;
        this.employeePassword = employeePassword;
        this.status = status;
        this.role = role;
    }

    public String getEmployeeUsername() {
        return employeeUsername;
    }

    public void setEmployeeUsername(String employeeUsername) {
        this.employeeUsername = employeeUsername;
    }

    public String getEmployeePassword() {
        return employeePassword;
    }

    public void setEmployeePassword(String employeePassword) {
        this.employeePassword = employeePassword;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    @Override
    public String toString() {
        return "EmployeeAccount{" + "employeeUsername=" + employeeUsername + ", employeePassword=" + employeePassword + ", status=" + status + ", role=" + role + '}';
    }

}
