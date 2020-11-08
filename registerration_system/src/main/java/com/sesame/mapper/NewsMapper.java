package com.sesame.mapper;

import com.sesame.pojo.News;

import java.util.List;

/*
 * @author sfda
 * 新闻
 */
public interface NewsMapper {

    /*根据编号查询新闻信息*/
    News selectByPrimaryKey(Integer newsno);

    /*查询编号在3以上的新闻信息*/
    List<News> selectList();

}