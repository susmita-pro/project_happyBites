package com.HappyBites.Model;

import java.sql.Timestamp;

public class User {

    private int userID;
    private String username;
    private String password;
    private String email;
    private String address;
    private String role;
    private Timestamp createdDate;
    private Timestamp lastLoginDate;

    // Default Constructor
    public User() {

    }

    // Constructor for Registration
    public User(String username, String password, String email,
            String address, String role) {

        this.username = username;
        this.password = password;
        this.email = email;
        this.address = address;
        this.role = role;
    }

    // Constructor for Database Fetch
    public User(int userID, String username, String password,
            String email, String address, String role,
            Timestamp createdDate, Timestamp lastLoginDate) {

        this.userID = userID;
        this.username = username;
        this.password = password;
        this.email = email;
        this.address = address;
        this.role = role;
        this.createdDate = createdDate;
        this.lastLoginDate = lastLoginDate;
    }

    // Getter and Setter for UserID
    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    // Getter and Setter for Username
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    // Getter and Setter for Password
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    // Getter and Setter for Email
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    // Getter and Setter for Address
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    // Getter and Setter for Role
    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    // Getter and Setter for CreatedDate
    public Timestamp getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Timestamp createdDate) {
        this.createdDate = createdDate;
    }

    // Getter and Setter for LastLoginDate
    public Timestamp getLastLoginDate() {
        return lastLoginDate;
    }

    public void setLastLoginDate(Timestamp lastLoginDate) {
        this.lastLoginDate = lastLoginDate;
    }

    @Override
    public String toString() {
        return "User [userID=" + userID +
                ", username=" + username +
                ", password=" + password +
                ", email=" + email +
                ", address=" + address +
                ", role=" + role +
                ", createdDate=" + createdDate +
                ", lastLoginDate=" + lastLoginDate + "]";
    }
}