/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.user;

/**
 *
 * @author thekh
 */
public class UserError {

    private String userID;
    private String fullName;
    private String phone;
    private String address;
    private String email;
    private String password;
    private String confirm;
    private String roleID;
    private String error;

    public UserError() {
        this.userID = "";
        this.fullName = "";
        this.phone = "";
        this.address = "";
        this.email = "";
        this.password = "";
        this.confirm = "";
        this.roleID = "";
        this.error = "";
    }

    public UserError(String userID, String fullName, String phone, String address, String email, String password, String confirm, String roleID, String error) {
        this.userID = userID;
        this.fullName = fullName;
        this.phone = phone;
        this.address = address;
        this.email = email;
        this.password = password;
        this.confirm = confirm;
        this.roleID = roleID;
        this.error = error;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getConfirm() {
        return confirm;
    }

    public void setConfirm(String confirm) {
        this.confirm = confirm;
    }

    public String getRoleID() {
        return roleID;
    }

    public void setRoleID(String roleID) {
        this.roleID = roleID;
    }

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }

}
