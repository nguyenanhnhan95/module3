package com.example.list_custome.repository;

import com.example.list_custome.model.Customer;

import java.util.List;

public interface ICustomerRepository {
    List<Customer> getList();
}
