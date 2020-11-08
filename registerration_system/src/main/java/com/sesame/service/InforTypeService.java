package com.sesame.service;

import com.sesame.pojo.InforType;
import com.sesame.pojo.Information;

import java.util.List;
import java.util.Map;

public interface InforTypeService {

    /*查询所有资讯类型*/
    List<InforType> selectInfor();

    /*查询所有分类id*/
    List<InforType> selectId();

}
