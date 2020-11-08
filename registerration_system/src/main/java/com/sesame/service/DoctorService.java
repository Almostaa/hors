package com.sesame.service;

import com.sesame.pojo.Doctor;

import java.util.List;

public interface DoctorService {

    /*查询某科室的医生*/
    List<Doctor> doctorlist(Integer roomNo);

    /*根据编号查询医生所有信息*/
    Doctor selectByPrimaryKey(Integer dno);

}
