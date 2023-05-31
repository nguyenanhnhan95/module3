package com.example.list_custome.model;

import java.time.LocalDate;

public class Customer {
    private int id;
    private String name;
    private LocalDate birthOfDay;
    private String address;
    private String imgPass;

    public Customer() {
    }

    public Customer(int id, String name, LocalDate birthOfDay, String address, String imgPass) {
        this.id = id;
        this.name = name;
        this.birthOfDay = birthOfDay;
        this.address = address;
        this.imgPass = imgPass;
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

    public LocalDate getBirthOfDay() {
        return birthOfDay;
    }

    public void setBirthOfDay(LocalDate birthOfDay) {
        this.birthOfDay = birthOfDay;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getImgPass() {
        return imgPass;
    }

    public void setImgPass(String imgPass) {
        this.imgPass = imgPass;
    }

    @Override
    public String toString() {
        return "Customer{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", birthOfDay=" + birthOfDay +
                ", address='" + address + '\'' +
                ", imgPass='" + imgPass + '\'' +
                '}';
    }
}
