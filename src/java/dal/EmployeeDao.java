/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.EmployeeAccount;

/**
 *
 * @author letra
 */
public class EmployeeDao extends DBContext {

    public EmployeeAccount getEmployeeAccountByUsernameAndPassword(String username, String password) {
        String sql = "SELECT [ea_username]\n"
                + "      ,[ea_password]\n"
                + "      ,[status]\n"
                + "      ,[r_id]\n"
                + "  FROM [fuda_bus_ticket_booking].[dbo].[employee_account]\n"
                + "  WHERE [ea_username] = ? and [ea_password] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                EmployeeAccount employeeAccount = new EmployeeAccount(rs.getString(1), rs.getString(2), rs.getString(3), rs.getInt(4));
                return employeeAccount;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<EmployeeAccount> getAllEmployeeRole2Pagination(int page) {
        List<EmployeeAccount> list = new ArrayList<>();
        String sql = "SELECT [ea_username]\n"
                + "      ,[ea_password]\n"
                + "      ,[status]\n"
                + "      ,[r_id]\n"
                + "  FROM [dbo].[employee_account]\n"
                + "  where [r_id] = 2\n"
                + "  ORDER BY [ea_username]\n"
                + "  OFFSET ? ROWS FETCH NEXT 10 ROWS ONLY";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, (page - 1) * 10);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                EmployeeAccount employeeAccount = new EmployeeAccount(rs.getString(1), rs.getString(2), rs.getString(3), rs.getInt(4));
                list.add(employeeAccount);
            }
        } catch (SQLException e) {
            System.out.println(e);

        }
        if (list.isEmpty()) {
            return null;
        } else {
            return list;
        }
    }

    public List<EmployeeAccount> getAllEmployeeRole2() {
        List<EmployeeAccount> list = new ArrayList<>();
        String sql = "SELECT TOP (1000) [ea_username]\n"
                + "      ,[ea_password]\n"
                + "      ,[status]\n"
                + "      ,[r_id]\n"
                + "  FROM [fuda_bus_ticket_booking].[dbo].[employee_account]\n"
                + "  WHERE [r_id] = 2";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                EmployeeAccount employeeAccount = new EmployeeAccount(rs.getString(1), rs.getString(2), rs.getString(3), rs.getInt(4));
                list.add(employeeAccount);
            }
        } catch (SQLException e) {
            System.out.println(e);

        }
        if (list.isEmpty()) {
            return null;
        } else {
            return list;
        }
    }

    public List<EmployeeAccount> getAllEmployeeRole1() {
        List<EmployeeAccount> list = new ArrayList<>();
        String sql = "SELECT TOP (1000) [ea_username]\n"
                + "      ,[ea_password]\n"
                + "      ,[status]\n"
                + "      ,[r_id]\n"
                + "  FROM [fuda_bus_ticket_booking].[dbo].[employee_account]\n"
                + "  WHERE [r_id] = 1";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                EmployeeAccount employeeAccount = new EmployeeAccount(rs.getString(1), rs.getString(2), rs.getString(3), rs.getInt(4));
                list.add(employeeAccount);
            }
        } catch (SQLException e) {
            System.out.println(e);

        }
        if (list.isEmpty()) {
            return null;
        } else {
            return list;
        }
    }

    public List<EmployeeAccount> searchEmployeeRole2(String employeeUsername) {
        List<EmployeeAccount> list = new ArrayList<>();
        String sql = "SELECT TOP (1000) [ea_username]\n"
                + "      ,[ea_password]\n"
                + "      ,[status]\n"
                + "      ,[r_id]\n"
                + "  FROM [fuda_bus_ticket_booking].[dbo].[employee_account]\n"
                + "  WHERE [r_id] = 2 and [ea_username] like ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, employeeUsername + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                EmployeeAccount employeeAccount = new EmployeeAccount(rs.getString(1), rs.getString(2), rs.getString(3), rs.getInt(4));
                list.add(employeeAccount);
            }
        } catch (SQLException e) {
            System.out.println(e);

        }
        if (list.isEmpty()) {
            return null;
        } else {
            return list;
        }
    }

    public void setStatusEmployee(String employeeUsername, String status) {
        String sql = "UPDATE [dbo].[employee_account]\n"
                + "   SET [status] = ?\n"
                + " \n"
                + " WHERE [ea_username] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, status);
            st.setString(2, employeeUsername);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public EmployeeAccount getEmployeeAccountByUsername(String username) {
        String sql = "SELECT [ea_username]\n"
                + "      ,[ea_password]\n"
                + "      ,[status]\n"
                + "      ,[r_id]\n"
                + "  FROM [dbo].[employee_account]\n"
                + "  where [ea_username] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                EmployeeAccount employeeAccount = new EmployeeAccount(rs.getString(1), rs.getString(2), rs.getString(3), rs.getInt(4));
                return employeeAccount;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void insertEmployee(EmployeeAccount employee) {
        String sql = "INSERT INTO [dbo].[employee_account]\n"
                + "           ([ea_username]\n"
                + "           ,[ea_password]\n"
                + "           ,[status]\n"
                + "           ,[r_id])\n"
                + "     VALUES (?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, employee.getEmployeeUsername());
            st.setString(2, employee.getEmployeePassword());
            st.setString(3, employee.getStatus());
            st.setInt(4, employee.getRole());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public static void main(String[] args) {
        EmployeeDao ed = new EmployeeDao();
        List<EmployeeAccount> list = ed.searchEmployeeRole2("e");
        for (EmployeeAccount employeeAccount : list) {
            System.out.println(employeeAccount.toString());
        }

    }
}
