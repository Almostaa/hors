package com.sesame.pojo;

import java.util.Date;

public class News {
    private Integer newsno;

    private String newstitle;

    private String content;

    private Date createtime;

    private String newspicture;

    public Integer getNewsno() {
        return newsno;
    }

    public void setNewsno(Integer newsno) {
        this.newsno = newsno;
    }

    public String getNewstitle() {
        return newstitle;
    }

    public void setNewstitle(String newstitle) {
        this.newstitle = newstitle == null ? null : newstitle.trim();
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public String getNewspicture() {
        return newspicture;
    }

    public void setNewspicture(String newspicture) {
        this.newspicture = newspicture == null ? null : newspicture.trim();
    }
}