package com.sesame.controller;

import com.sesame.pojo.News;
import com.sesame.pojo.Rotation;
import com.sesame.service.NewsService;
import com.sesame.service.RotationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * RotationController  轮播图
 * @author sfda
 * @currentTime
 */

@RestController
@RequestMapping(value = "rotation")
public class RotationController {

    @Autowired
    private RotationService rotationService;

    @Autowired
    private NewsService newsService;

    @RequestMapping(value = "rotationlist")
    public List<Rotation> selectByPrimaryKey(){

        return rotationService.selectByPrimaryKey();

    }

    @RequestMapping(value = "newsById")
    public News selectNewsById(Integer id){

        return newsService.selectByPrimaryKey(id);

    }

    @RequestMapping(value = "newslist")
    public List<News> selectList(){

        return newsService.selectList();

    }

}
