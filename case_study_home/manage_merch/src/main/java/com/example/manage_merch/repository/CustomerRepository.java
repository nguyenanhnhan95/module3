package com.example.manage_merch.repository;

import com.example.manage_merch.model.AccountUser;
import com.example.manage_merch.model.Customer;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepository implements ICustomerRepository {
    private BaseRepository baseRepository = new BaseRepository();
    private static final String SELECT_EMPLOYEE = "SELECT customers.customer_id,customers.customer_name,customers.email,customers.phone_number,customers.address FROM customers \n" +
            "join account_users on account_users.account_id = customers.account_id\n" +
            "join users_role on users_role.account_id =account_users.account_id\n" +
            "join roles on roles.role_id = users_role.role_id\n" +
            "where roles.role_name like \"nhân viên\"";
    private static final String SELECT_CUSTOMER = "select *from customers join account_users on account_users.account_id=customers.account_id where is_delete=0";
    private static final String SELECT_CUSTOMER_BY_NAME = "select *from customers where customer_name like ?";
    private static final String SELECT_CUSTOMER_BY_ADDRESS = "select *from customers where address like ?";
    private static final String SELECT_CUSTOMER_BY_ADDRESS_NAME = "select *from customers where address like ? and customer_name like ?";
    private static final String DELETE_CUSTOMER_BY_ID = "update customers set is_delete=1 where customer_id=?";
    private static final String Edit_Customer = "update customers set customer_name=?,email=?,phone_number=?,address=? where customer_id=?";
    private static final String CREATE_CUSTOMER = "insert into customers(customer_name,email,phone_number,address,account_id) " +
            "values (?,?,?,?,?)";
    private static final String SELECT_CUSTOMER_BY_ID = "select *from customers join account_users on account_users.account_id=customers.account_id where is_delete=0 and customers.account_id=?";

    @Override
    public List<Customer> getListCustomer() {
        List<Customer> customerList = new ArrayList<>();
        Connection connection = baseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CUSTOMER);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id_customer = resultSet.getInt("customer_id");
                String name = resultSet.getString("customer_name");
                String email = resultSet.getString("email");
                String phone = resultSet.getString("phone_number");
                String address = resultSet.getString("address");
                String email_user = resultSet.getString("email_user");
                String user_password = resultSet.getString("password");
                AccountUser accountID = new AccountUser(email_user, user_password);
                Customer customer = new Customer(id_customer, name, email, phone, address, accountID);
                customerList.add(customer);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return customerList;
    }


    @Override
    public void deleteCustomer(int id) {
        Connection connection = baseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_CUSTOMER_BY_ID);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public void createCustomer(Customer customer) {

    }

    //    private static final String Edit_Customer = "update customers set customer_name=?,email=?,phone_number=?,address=? where customer_id=?";
    @Override
    public void editCustomer(int id, Customer customer) {
        Connection connection = baseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(Edit_Customer);
            preparedStatement.setString(1, customer.getName());
            preparedStatement.setString(2, customer.getEmail());
            preparedStatement.setString(3, customer.getPhone());
            preparedStatement.setString(4, customer.getAddress());
            preparedStatement.setInt(5, id);
            int resultSet = preparedStatement.executeUpdate();
            System.out.println(resultSet);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public Customer getCustomer(int account_id) {
        Customer customer = null;
        Connection connection = baseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CUSTOMER_BY_ID);
            preparedStatement.setInt(1, account_id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int customer_id = Integer.parseInt(resultSet.getString("customer_id"));
                String name = resultSet.getString("customer_name");
                String email = resultSet.getString("email_user");
                String password = resultSet.getString("password");
                String phone = resultSet.getString("phone_number");
                String address = resultSet.getString("address");
                AccountUser accountUser = new AccountUser(email,password);
                customer = new Customer(customer_id, name, email, phone, address,accountUser);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customer;
    }
}
