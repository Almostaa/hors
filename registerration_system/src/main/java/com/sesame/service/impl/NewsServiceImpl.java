package com.sesame.service.impl;

import com.sesame.mapper.NewsMapper;
import com.sesame.pojo.News;
import com.sesame.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/*
* author sfda
*
* */
@Service
public class NewsServiceImpl implements NewsService {

    @Autowired
    private NewsMapper newsMapper;

    @Override
    public News selectByPrimaryKey(Integer newsno) {
        return newsMapper.selectByPrimaryKey(newsno);
    }

    @Override
    public List<News> selectList() {
        return newsMapper.selectList();
    }
}
