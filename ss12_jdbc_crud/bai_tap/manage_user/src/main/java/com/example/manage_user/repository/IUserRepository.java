package com.example.manage_user.repository;

import com.example.manage_user.model.User;

import java.util.List;

public interface IUserRepository {
    void addUser(User user);

    List<User> getList();

    List<User> getListSort();

    User getByCountry(String country);

    boolean deleteUser(int id);

    void editUser(User user);

}
