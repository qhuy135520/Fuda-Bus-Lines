/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Customer;

/**
 *
 * @author letra
 */
public class DAO extends DBContext {

    public void signUp(Customer c) {
        String sql = "INSERT INTO [dbo].[customer]\n"
                + "           ([c_phone]\n"
                + "           ,[c_email]\n"
                + "           ,[c_first_name]\n"
                + "           ,[c_last_name]\n"
                + "           ,[c_birth_date]\n"
                + "           ,[c_password]\n"
                + "           ,[c_created_date]\n"
                + "           ,[c_url_img])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, c.getCustomerPhone());
            st.setString(2, c.getCustomerEmail());
            st.setString(3, c.getCustomerFirstname());
            st.setString(4, c.getCustomerLastname());
            st.setString(5, c.getCustomerBirthdate());
            st.setString(6, c.getCustomerPassword());
            st.setString(7, c.getCustomerCreatedDate());
            st.setString(8, "img/customer/img-profile-none-bg.png");
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public Customer getCustomerByPhone(String phone) {
        String sql = "SELECT [c_phone]\n"
                + "      ,[c_email]\n"
                + "      ,[c_first_name]\n"
                + "      ,[c_last_name]\n"
                + "      ,[c_birth_date]\n"
                + "      ,[c_password]\n"
                + "      ,[c_created_date]\n"
                + "      ,[c_url_img]\n"
                + "  FROM [dbo].[customer]\n"
                + "  WHERE c_phone = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, phone);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Customer c = new Customer(rs.getString("c_phone"), rs.getString("c_email"), rs.getString("c_first_name"), rs.getString("c_last_name"), rs.getString("c_birth_date"), rs.getString("c_password"), rs.getString("c_created_date"), rs.getString("c_url_img"));
                return c;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Customer signIn(String phone, String password) {
        String sql = "SELECT [c_phone]\n"
                + "      ,[c_email]\n"
                + "      ,[c_first_name]\n"
                + "      ,[c_last_name]\n"
                + "      ,[c_birth_date]\n"
                + "      ,[c_password]\n"
                + "      ,[c_created_date]\n"
                + "      ,[c_url_img]\n"
                + "  FROM [fuda_bus_ticket_booking].[dbo].[customer]\n"
                + "WHERE [c_phone] = ? and  [c_password] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, phone);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Customer c = new Customer(rs.getString("c_phone"), rs.getString("c_email"), rs.getString("c_first_name"), rs.getString("c_last_name"), rs.getString("c_birth_date"), rs.getString("c_password"), rs.getString("c_created_date"), rs.getString("c_url_img"));
                return c;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Customer getCustomerByEmail(String email) {
        String sql = "SELECT [c_phone]\n"
                + "      ,[c_email]\n"
                + "      ,[c_first_name]\n"
                + "      ,[c_last_name]\n"
                + "      ,[c_birth_date]\n"
                + "      ,[c_password]\n"
                + "      ,[c_created_date]\n"
                + "      ,[c_url_img]\n"
                + "  FROM [dbo].[customer]\n"
                + "  WHERE c_email = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Customer c = new Customer(rs.getString("c_phone"), rs.getString("c_email"), rs.getString("c_first_name"), rs.getString("c_last_name"), rs.getString("c_birth_date"), rs.getString("c_password"), rs.getString("c_created_date"), rs.getString("c_url_img"));
                return c;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void updateCustomerPassword(Customer c, String password) {
        String sql = "UPDATE [dbo].[customer]\n"
                + "   SET [c_password] = ?\n"
                + " WHERE c_phone = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, password);
            st.setString(2, c.getCustomerPhone());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

//    public static void main(String[] args) {
//        DAO d = new DAO();
//        System.out.println(d.getStation().toString());
//    }
}
