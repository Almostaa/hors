package com.sesame.pojo;

import java.util.Date;

public class Apptinfo {

    private String roomName;
    private String dName;
    private String userName;
    private String sex;
    private String idCardNumber;
    private int age;


    private Integer apptno;

    private Integer usno;

    private Integer dno;

    private Integer state;

    private Date createtime;

    private Date overtime;

    private Double price;

    private Date apptdate;

    private String appttime;

    public Integer getApptno() {
        return apptno;
    }

    public void setApptno(Integer apptno) {
        this.apptno = apptno;
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

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public Date getOvertime() {
        return overtime;
    }

    public void setOvertime(Date overtime) {
        this.overtime = overtime;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Date getApptdate() {
        return apptdate;
    }

    public void setApptdate(Date apptdate) {
        this.apptdate = apptdate;
    }

    public String getAppttime() {
        return appttime;
    }

    public void setAppttime(String appttime) {
        this.appttime = appttime == null ? null : appttime.trim();
    }

    public String getRoomName() {
        return roomName;
    }

    public void setRoomName(String roomName) {
        this.roomName = roomName;
    }

    public String getdName() {
        return dName;
    }

    public void setdName(String dName) {
        this.dName = dName;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getIdCardNumber() {
        return idCardNumber;
    }

    public void setIdCardNumber(String idCardNumber) {
        this.idCardNumber = idCardNumber;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public Apptinfo() {
    }

    public Apptinfo(String roomName, String dName, String userName, String sex,
                    String idCardNumber, int age, Integer apptno, Integer usno, Integer dno,
                    Integer state, Date createtime, Date overtime, Double price, Date apptdate,
                    String appttime) {

        this.roomName = roomName;
        this.dName = dName;
        this.userName = userName;
        this.sex = sex;
        this.idCardNumber = idCardNumber;
        this.age = age;
        this.apptno = apptno;
        this.usno = usno;
        this.dno = dno;
        this.state = state;
        this.createtime = createtime;
        this.overtime = overtime;
        this.price = price;
        this.apptdate = apptdate;
        this.appttime = appttime;
    }

    @Override
    public String toString() {
        return "Apptinfo{" +
                "roomName='" + roomName + '\'' +
                ", dName='" + dName + '\'' +
                ", userName='" + userName + '\'' +
                ", sex='" + sex + '\'' +
                ", idCardNumber='" + idCardNumber + '\'' +
                ", age=" + age +
                ", apptno=" + apptno +
                ", usno=" + usno +
                ", dno=" + dno +
                ", state='" + state + '\'' +
                ", createtime=" + createtime +
                ", overtime=" + overtime +
                ", price=" + price +
                ", apptdate=" + apptdate +
                ", appttime='" + appttime + '\'' +
                '}';
    }
}