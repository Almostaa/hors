package com.sesame.pojo;

public class Section {
    private Integer sectionno;

    private String sectionname;

    private Room room;

    private Doctor doctor;

    public Integer getSectionno() {
        return sectionno;
    }

    public void setSectionno(Integer sectionno) {
        this.sectionno = sectionno;
    }

    public String getSectionname() {
        return sectionname;
    }

    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }

    public Doctor getDoctor() {
        return doctor;
    }

    public void setDoctor(Doctor doctor) {
        this.doctor = doctor;
    }

    public void setSectionname(String sectionname) {
        this.sectionname = sectionname == null ? null : sectionname.trim();
    }
}