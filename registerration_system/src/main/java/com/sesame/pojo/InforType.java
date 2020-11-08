package com.sesame.pojo;

public class InforType {
    private Integer informationtypeno;

    private String informationtypename;

    public Integer getInformationtypeno() {
        return informationtypeno;
    }

    public void setInformationtypeno(Integer informationtypeno) {
        this.informationtypeno = informationtypeno;
    }

    public String getInformationtypename() {
        return informationtypename;
    }

    public void setInformationtypename(String informationtypename) {
        this.informationtypename = informationtypename == null ? null : informationtypename.trim();
    }
}