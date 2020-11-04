package com.sesame.pojo;

public class Section {
    private Integer sectionno;

    private String sectionname;

    public Integer getSectionno() {
        return sectionno;
    }

    public void setSectionno(Integer sectionno) {
        this.sectionno = sectionno;
    }

    public String getSectionname() {
        return sectionname;
    }

    public void setSectionname(String sectionname) {
        this.sectionname = sectionname == null ? null : sectionname.trim();
    }
}