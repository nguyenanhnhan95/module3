package com.example.manage_user.service;

import com.example.manage_user.model.User;

import java.util.List;

public interface IUserService {
    List<User> findAllUser();

    User findUserByCountry(String country);

    void addUser(User user);

    boolean deleteUser(int id);
}
