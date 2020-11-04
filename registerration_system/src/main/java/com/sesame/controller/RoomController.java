package com.sesame.controller;

import com.sesame.pojo.Room;
import com.sesame.service.RoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping(value = "room")
public class RoomController {

    @Autowired
    private RoomService roomService;

    @RequestMapping(value = "roomlistbyid")
    public List<Room> roomListById(Integer id){
        return roomService.roomListById(id);
    }

    @RequestMapping(value = "roomlist")
    public List<Room> roomList(){
        return roomService.roomList();
    }
}
