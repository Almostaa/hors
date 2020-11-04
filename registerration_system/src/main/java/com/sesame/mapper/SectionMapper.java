package com.sesame.mapper;

import com.sesame.pojo.Section;

import java.util.List;

public interface SectionMapper {
    int deleteByPrimaryKey(Integer sectionno);

    int insert(Section record);

    int insertSelective(Section record);

    List<Section> selectByPrimaryKey();

    int updateByPrimaryKeySelective(Section record);

    int updateByPrimaryKey(Section record);
}