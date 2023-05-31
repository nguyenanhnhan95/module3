package com.example.list_custome.service;

import com.example.list_custome.model.Customer;
import com.example.list_custome.repository.CustomerRepository;

import java.util.ArrayList;
import java.util.List;

public class CustomerService implements ICustomerService {
    private CustomerRepository customerRepository = new CustomerRepository();
    private List<Customer> listCustomer;

    @Override
    public List<Customer> displayList() {
        listCustomer = new ArrayList<>();
        listCustomer = customerRepository.getList();
        return listCustomer;
    }
}
