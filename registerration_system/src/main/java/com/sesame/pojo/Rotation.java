package com.sesame.pojo;

import java.util.Date;

public class Rotation {
    private Integer rotno;

    private String rotpicture;

    private String rotdescribe;

    private Date rotcreate;

    public Integer getRotno() {
        return rotno;
    }

    public void setRotno(Integer rotno) {
        this.rotno = rotno;
    }

    public String getRotpicture() {
        return rotpicture;
    }

    public void setRotpicture(String rotpicture) {
        this.rotpicture = rotpicture == null ? null : rotpicture.trim();
    }

    public String getRotdescribe() {
        return rotdescribe;
    }

    public void setRotdescribe(String rotdescribe) {
        this.rotdescribe = rotdescribe == null ? null : rotdescribe.trim();
    }

    public Date getRotcreate() {
        return rotcreate;
    }

    public void setRotcreate(Date rotcreate) {
        this.rotcreate = rotcreate;
    }
}