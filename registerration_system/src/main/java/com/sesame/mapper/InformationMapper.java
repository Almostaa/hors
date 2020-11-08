package com.sesame.mapper;

import com.sesame.pojo.Information;

import java.util.List;
import java.util.Map;

/*
 * @author sfda
 * 资讯信息
 */

public interface InformationMapper {

    /*根据类型编号查询资讯*/
    List<Information> selectByInforId(Integer ino);

    /*查询所有资讯*/
    List<Information> selectInfoList();

}