package com.example.manage_merch.model;

public class Customer {
    private int id;
    private String name;
    private String email;
    private String phone;
    private String address;
    private AccountUser accountUser;

    public Customer() {
    }

    public Customer(int id, String name, String email, String phone, String address, AccountUser accountUser) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.accountUser = accountUser;
    }

    public Customer(String name, String email, String phone, String address, AccountUser accountUser) {
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.accountUser = accountUser;
    }

    public Customer(String name, String email, String phone, String address) {
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.address = address;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public AccountUser getAccountUser() {
        return accountUser;
    }

    public void setAccountUser(AccountUser accountUser) {
        this.accountUser = accountUser;
    }
}
