package com.sesame.pojo;

public class Room {
    private Integer roomno;

    private String roomname;

    private String roomdescribe;

    private Integer sectionno;

    private Section Section;

    public Integer getRoomno() {
        return roomno;
    }

    public void setRoomno(Integer roomno) {
        this.roomno = roomno;
    }

    public String getRoomname() {
        return roomname;
    }

    public void setRoomname(String roomname) {
        this.roomname = roomname == null ? null : roomname.trim();
    }

    public String getRoomdescribe() {
        return roomdescribe;
    }

    public void setRoomdescribe(String roomdescribe) {
        this.roomdescribe = roomdescribe == null ? null : roomdescribe.trim();
    }

    public Integer getSectionno() {
        return sectionno;
    }

    public void setSectionno(Integer sectionno) {
        this.sectionno = sectionno;
    }
}