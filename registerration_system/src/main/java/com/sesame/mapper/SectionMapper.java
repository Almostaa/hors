package com.sesame.mapper;

import com.sesame.pojo.Section;

import java.util.List;

/*
 * @author sfda
 * 大类
 */
public interface SectionMapper {

    /*查询所有大类*/
    List<Section> selectByPrimaryKey();
}