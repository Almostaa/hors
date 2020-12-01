package com.sesame.pojo;

public class Doctor {
    private Integer dno;

    private String dname;

    private String sex;

    private Integer roomno;

    private String rank;

    private String grade;

    private String describe;

    private String picture;


    private Charge charge;

    private ChargeType chargeType;


	public Doctor() {
		super();
	}

	/*public Doctor(Integer dno, String dname, String sex, Integer roomno, String rank, String grade, String describe,
			String picture) {
		super();
		this.dno = dno;
		this.dname = dname;
		this.sex = sex;
		this.roomno = roomno;
		this.rank = rank;
		this.grade = grade;
		this.describe = describe;
		this.picture = picture;
	}*/

    public Charge getCharge() {
        return charge;
    }

    public void setCharge(Charge charge) {
        this.charge = charge;
    }

    public ChargeType getChargeType() {
        return chargeType;
    }

    public void setChargeType(ChargeType chargeType) {
        this.chargeType = chargeType;
    }

    public Integer getDno() {
        return dno;
    }

    public void setDno(Integer dno) {
        this.dno = dno;
    }

    public String getDname() {
        return dname;
    }

    public void setDname(String dname) {
        this.dname = dname == null ? null : dname.trim();
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex == null ? null : sex.trim();
    }

    public Integer getRoomno() {
        return roomno;
    }

    public void setRoomno(Integer roomno) {
        this.roomno = roomno;
    }

    public String getRank() {
        return rank;
    }

    public void setRank(String rank) {
        this.rank = rank == null ? null : rank.trim();
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade == null ? null : grade.trim();
    }

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe == null ? null : describe.trim();
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture == null ? null : picture.trim();
    }



	/*@Override
	public String toString() {
		return "Doctor [dno=" + dno + ", dname=" + dname + ", sex=" + sex + ", roomno=" + roomno + ", rank=" + rank
				+ ", grade=" + grade + ", describe=" + describe + ", picture=" + picture + "]";
	}*/

    public Doctor(Integer dno, String dname, String sex, Integer roomno, String rank, String grade,
                  String describe, String picture, Charge charge, ChargeType chargeType) {
        this.dno = dno;
        this.dname = dname;
        this.sex = sex;
        this.roomno = roomno;
        this.rank = rank;
        this.grade = grade;
        this.describe = describe;
        this.picture = picture;
        this.charge = charge;
        this.chargeType = chargeType;
    }

    @Override
    public String toString() {
        return "Doctor{" +
                "dno=" + dno +
                ", dname='" + dname + '\'' +
                ", sex='" + sex + '\'' +
                ", roomno=" + roomno +
                ", rank='" + rank + '\'' +
                ", grade='" + grade + '\'' +
                ", describe='" + describe + '\'' +
                ", picture='" + picture + '\'' +
                ", charge=" + charge +
                ", chargeType=" + chargeType +
                '}';
    }
}