package com.sesame.mapper;

import com.sesame.pojo.Rotation;

import java.util.List;

/*
 * @author sfda
 * 轮播图
 */
public interface RotationMapper {

    /*查询轮播图*/
    List<Rotation> selectByPrimaryKey();

}