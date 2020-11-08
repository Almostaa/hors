package com.sesame.service;

import com.sesame.pojo.News;

import java.util.List;

public interface NewsService {

    /*根据编号查询新闻信息*/
    News selectByPrimaryKey(Integer newsno);

    /*查询编号在3以上的新闻信息*/
    List<News> selectList();
}
