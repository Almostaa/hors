package com.sesame.mapper;

import com.sesame.pojo.InforType;

import java.util.List;

/*
 * @author sfda
 * 资讯类型
 */
public interface InforTypeMapper {

    /*查询所有资讯类型*/
    List<InforType> selectInfor();

    /*查询所有分类id*/
    List<InforType> selectId();
}