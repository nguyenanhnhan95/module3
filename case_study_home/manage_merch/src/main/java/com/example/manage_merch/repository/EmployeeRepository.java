package com.example.manage_merch.repository;

import com.example.manage_merch.model.Employee;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class EmployeeRepository implements IEmployeeRepository{
    private BaseRepository baseRepository =new BaseRepository();
    private  static  final String  SELECT_EMPLOYEE="select *from employee where account_id=?";
    @Override
    public Employee getEmployee(int account_id) {
        Connection connection = baseRepository.getConnection();

        Employee employee=null;
        try {
            PreparedStatement preparedStatement= connection.prepareStatement(SELECT_EMPLOYEE);
            preparedStatement.setInt(1,account_id);
            ResultSet resultSet=preparedStatement.executeQuery();
            while (resultSet.next()) {
                String name = resultSet.getString("employee_name");
                String email = resultSet.getString("email");
                String number_phone = resultSet.getString("phone_number");
                String address = resultSet.getString("address");
                employee = new Employee(name, email, number_phone, address);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return employee;
    }
}
