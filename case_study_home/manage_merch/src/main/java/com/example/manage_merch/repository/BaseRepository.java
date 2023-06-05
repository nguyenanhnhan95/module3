package com.example.manage_merch.repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class BaseRepository {
    private  static  final  String jdbcURL= "jdbc:mysql://localhost:3306/case_study_2?useSSL=false";
    private  static  final  String jdbcUsername= "root";
    private  static  final  String jdbcPassword= "codegym";
    public Connection getConnection(){
       Connection connection =null;
       try {
           Class.forName("com.mysql.jdbc.Driver");
           connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
       } catch (SQLException throwables) {
           throwables.printStackTrace();
       } catch (ClassNotFoundException e) {
           e.printStackTrace();
       }
       return connection;
    }
}
