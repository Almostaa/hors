package com.sesame.service.impl;

import com.sesame.mapper.RoomMapper;
import com.sesame.pojo.Room;
import com.sesame.service.RoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoomServiceImpl implements RoomService {

    @Autowired
    private RoomMapper roomMapper;

    @Override
    public List<Room> roomListById(Integer id) {
        return roomMapper.roomListById(id);
    }

    @Override
    public List<Room> roomList() {
        return roomMapper.roomList();
    }
}
