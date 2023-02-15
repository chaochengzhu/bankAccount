package pojo;

import java.util.Date;

public class User {
    private String username;
    private String password;
    private Character sex;
    private String dob;
    private String PID;
    private String telephone;
    private String address;

    public User() {
    }

    public User(String username, String password, Character sex, String dob, String PID, String telephone, String address) {
        this.username = username;
        this.password = password;
        this.sex = sex;
        this.dob = dob;
        this.PID = PID;
        this.telephone = telephone;
        this.address = address;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Character getSex() {
        return sex;
    }

    public void setSex(Character sex) {
        this.sex = sex;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getPID() {
        return PID;
    }

    public void setPID(String PID) {
        this.PID = PID;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Override
    public String toString() {
        return "User{" +
                "username='" + username + '\'' +
                ", sex=" + sex +
                ", dob=" + dob +
                ", PID='" + PID + '\'' +
                ", telephone='" + telephone + '\'' +
                ", address='" + address + '\'' +
                '}';
    }
}