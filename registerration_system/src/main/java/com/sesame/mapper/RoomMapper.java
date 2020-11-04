package com.sesame.mapper;

import com.sesame.pojo.Room;

import java.util.List;

public interface RoomMapper {
    int deleteByPrimaryKey(Integer roomno);

    int insert(Room record);

    int insertSelective(Room record);

    Room selectByPrimaryKey(Integer roomno);

    int updateByPrimaryKeySelective(Room record);

    int updateByPrimaryKey(Room record);

    /* 根据大类查询科室*/
    List<Room> roomListById(Integer id);

    /*查询所有科室*/
    List<Room> roomList();

}