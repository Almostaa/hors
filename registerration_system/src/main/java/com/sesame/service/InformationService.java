package com.sesame.service;

import com.sesame.pojo.Information;

import java.util.List;
import java.util.Map;

public interface InformationService {

    /*根据类型编号查询资讯*/
    List<Information> selectByInforId(Integer ino);

    /*查询所有资讯*/
    List<Information> selectInfoList();
}
