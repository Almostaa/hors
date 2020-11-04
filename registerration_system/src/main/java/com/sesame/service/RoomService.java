package com.sesame.service;

import com.sesame.pojo.Room;

import java.util.List;

public interface RoomService {

    /* 根据大类查询科室*/
    List<Room> roomListById(Integer id);

    /*查询所有科室*/
    List<Room> roomList();

}
