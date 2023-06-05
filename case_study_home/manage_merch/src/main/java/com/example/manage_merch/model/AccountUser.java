package com.example.manage_merch.model;

public class AccountUser {
    private  String email_user;
    private String passWord;

    public AccountUser(){}

    public AccountUser(String userName, String passWord) {
        this.email_user = userName;
        this.passWord = passWord;
    }



    public String getEmail_user() {
        return email_user;
    }

    public void setEmail_user(String email_user) {
        this.email_user = email_user;
    }

    public String getPassWord() {
        return passWord;
    }

    public void setPassWord(String passWord) {
        this.passWord = passWord;
    }
}
