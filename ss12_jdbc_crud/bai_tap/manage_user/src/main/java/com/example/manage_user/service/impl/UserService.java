package com.example.manage_user.service.impl;

import com.example.manage_user.model.User;
import com.example.manage_user.repository.impl.UserRepository;
import com.example.manage_user.service.IUserService;

import java.util.List;

public class UserService implements IUserService {
    private UserRepository userRepository = new UserRepository();

    @Override
    public List<User> findAllUser() {
        return userRepository.getList();
    }

    @Override
    public List<User> listSortName() {
        return userRepository.getListSort();
    }

    @Override
    public User findUserByCountry(String country) {
        return userRepository.getByCountry(country);
    }

    @Override
    public void addUser(User user) {
        userRepository.addUser(user);
    }

    @Override
    public boolean deleteUser(int id) {
        return userRepository.deleteUser(id);
    }

    @Override
    public void editUser(User user) {
        userRepository.editUser(user);
    }
}
