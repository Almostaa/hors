package com.sesame.controller;


import com.sesame.pojo.Doctor;
import com.sesame.service.DoctorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * DoctorController 医生
 * @author sfda
 * @currentTime
 */

@RestController
@RequestMapping(value = "doctor")
public class DoctorController {

    @Autowired
    private DoctorService doctorService;

    @RequestMapping(value = "/roomdoctor",method = RequestMethod.GET)
    public List<Doctor> getDoctorList(Integer id){

        return doctorService.doctorlist(id);

    }

    @RequestMapping(value = "/doctorInfor",method = RequestMethod.GET)
    public Doctor selectByPrimaryKey(Integer id){

        return doctorService.selectByPrimaryKey(id);

    }

}
