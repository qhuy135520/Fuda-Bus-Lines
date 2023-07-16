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
import model.Customer;

/**
 *
 * @author ACER NITRO 5
 */
public class CustomerDao extends DBContext {

    private String query;
    private PreparedStatement pst;
    private ResultSet rs;

    //tra ve list cac customer
    public List<Customer> getAllCustomer() {
        List<Customer> list = new ArrayList<>();
        try {
            query = "select * from customer";
            pst = connection.prepareStatement(query);
            rs = pst.executeQuery();
            while (rs.next()) {
                Customer customer = new Customer(rs.getString("c_phone"), rs.getString("c_email"), rs.getString("c_first_name"), rs.getString("c_last_name"), rs.getString("c_birth_date"), rs.getString("c_password"), rs.getString("c_created_date"), rs.getString("c_url_img"));
                list.add(customer);

            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public List<Customer> getAllCustomerPagination(int page) {
        List<Customer> list = new ArrayList<>();
        try {
            query = "SELECT [c_phone]\n"
                    + "      ,[c_email]\n"
                    + "      ,[c_first_name]\n"
                    + "      ,[c_last_name]\n"
                    + "      ,[c_birth_date]\n"
                    + "      ,[c_password]\n"
                    + "      ,[c_created_date]\n"
                    + "      ,[c_url_img]\n"
                    + "  FROM [dbo].[customer]\n"
                    + "  ORDER BY [c_last_name]\n"
                    + "  OFFSET ? ROWS FETCH NEXT 5 ROWS ONLY";
            pst = connection.prepareStatement(query);
            pst.setInt(1, (page - 1) * 5);
            rs = pst.executeQuery();
            while (rs.next()) {
                Customer customer = new Customer(rs.getString("c_phone"), rs.getString("c_email"), rs.getString("c_first_name"), rs.getString("c_last_name"), rs.getString("c_birth_date"), rs.getString("c_password"), rs.getString("c_created_date"), rs.getString("c_url_img"));
                list.add(customer);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        if (list.isEmpty()) {
            return null;
        } else {
            return list;
        }
    }

    //tra ve 1 khach hang theo phone
    public Customer getCustomerByPhone(String phone) {
        String sql = "SELECT TOP (1000) [c_phone]\n"
                + "      ,[c_email]\n"
                + "      ,[c_first_name]\n"
                + "      ,[c_last_name]\n"
                + "      ,[c_birth_date]\n"
                + "      ,[c_password]\n"
                + "      ,[c_created_date]\n"
                + "      ,[c_url_img]\n"
                + "  FROM [fuda_bus_ticket_booking].[dbo].[customer]\n"
                + "  where [c_phone] = ?";
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

    public List<Customer> getLikeCustomerByPhone(String phone) {
        List<Customer> list = new ArrayList<>();

        String sql = "SELECT  [c_phone]\n"
                + "      ,[c_email]\n"
                + "      ,[c_first_name]\n"
                + "      ,[c_last_name]\n"
                + "      ,[c_birth_date]\n"
                + "      ,[c_password]\n"
                + "      ,[c_created_date]\n"
                + "      ,[c_url_img]\n"
                + "  FROM [fuda_bus_ticket_booking].[dbo].[customer]\n"
                + "  where [c_phone] like ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, phone + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Customer c = new Customer(rs.getString("c_phone"), rs.getString("c_email"), rs.getString("c_first_name"), rs.getString("c_last_name"), rs.getString("c_birth_date"), rs.getString("c_password"), rs.getString("c_created_date"), rs.getString("c_url_img"));

                list.add(c);
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

    public void updateCustomerInfor(String phone, String firstname, String lastname, String birthdate) {
        String sql = "UPDATE [dbo].[customer]\n"
                + "   SET [c_first_name] = ?\n"
                + "      ,[c_last_name] = ?\n"
                + "      ,[c_birth_date] = ?\n"
                + " WHERE [c_phone] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, firstname);
            st.setString(2, lastname);
            st.setString(3, birthdate);
            st.setString(4, phone);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateCustomerInfor(String phone, String email, String firstname, String lastname, String birthdate) {
        String sql = "UPDATE [dbo].[customer]\n"
                + "   SET [c_first_name] = ?\n"
                + "      ,[c_last_name] = ?\n"
                + "      ,[c_birth_date] = ?\n"
                + "       ,[c_email] = ?\n"
                + " WHERE [c_phone] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, firstname);
            st.setString(2, lastname);
            st.setString(3, birthdate);
            st.setString(4, email);
            st.setString(5, phone);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateCustomerUrlImage(String path, String phone) {
        String sql = "UPDATE [dbo].[customer]\n"
                + "   SET [c_url_img] = ?\n"
                + " WHERE [c_phone] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, path);
            st.setString(2, phone);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public Customer getCustomerByPassword(String phone, String password) {
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
                Customer c = new Customer(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8));
                return c;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void updatePasswordCustomer(String phone, String oldPassword, String newPassword) {
        String sql = "UPDATE [dbo].[customer]\n"
                + "   SET [c_password] = ?\n"
                + " WHERE [c_phone] = ? and [c_password] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, newPassword);
            st.setString(2, phone);
            st.setString(3, oldPassword);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public static void main(String[] args) {
        CustomerDao c = new CustomerDao();
        List<Customer> list = c.getLikeCustomerByPhone("0");
        for (Customer customer : list) {
            System.out.println(customer.toString());
        }
    }
}
