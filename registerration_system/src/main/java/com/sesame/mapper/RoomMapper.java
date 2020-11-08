package com.sesame.mapper;

import com.sesame.pojo.Room;

import java.util.List;

/*
 * @author sfda
 * 科室
 */
public interface RoomMapper {

    /* 根据大类查询科室*/
    List<Room> roomListById(Integer id);

    /*查询所有科室*/
    List<Room> roomList();

}