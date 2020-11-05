package com.sesame.service;

import com.sesame.pojo.Doctor;

import java.util.List;

public interface DoctorService {

    /*查询某科室的医生*/
    List<Doctor> doctorlist(Integer roomNo);


}
