package com.sesame.pojo;

import javax.xml.crypto.Data;
import java.util.Date;

public class ConsultInfo {
    private int consultNo;
    private String dName;
    private Integer usno;

    private Integer dno;
    private String userName;
    private double price;
    private Date startTime;
    private Date endTime;
    private String state;

    public ConsultInfo() {
    }

    public ConsultInfo(int consultNo, String dName,
                       Integer usno, Integer dno, String userName, double price,
                       Date startTime, Date endTime, String state) {
        this.consultNo = consultNo;
        this.dName = dName;
        this.usno = usno;
        this.dno = dno;
        this.userName = userName;
        this.price = price;
        this.startTime = startTime;
        this.endTime = endTime;
        this.state = state;
    }

    public String getdName() {
        return dName;
    }

    public void setdName(String dName) {
        this.dName = dName;
    }

    public Integer getUsno() {
        return usno;
    }

    public void setUsno(Integer usno) {
        this.usno = usno;
    }

    public Integer getDno() {
        return dno;
    }

    public void setDno(Integer dno) {
        this.dno = dno;
    }

    public int getConsultNo() {
        return consultNo;
    }

    public void setConsultNo(int consultNo) {
        this.consultNo = consultNo;
    }

    public String getDname() {
        return dName;
    }

    public void setDname(String dName) {
        this.dName = dName;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    @Override
    public String toString() {
        return "ConsultInfo{" +
                "consultNo=" + consultNo +
                ", dName='" + dName + '\'' +
                ", usno=" + usno +
                ", dno=" + dno +
                ", userName='" + userName + '\'' +
                ", price=" + price +
                ", startTime=" + startTime +
                ", endTime=" + endTime +
                ", state='" + state + '\'' +
                '}';
    }
}
