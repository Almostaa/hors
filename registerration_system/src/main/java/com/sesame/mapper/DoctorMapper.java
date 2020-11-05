package com.sesame.mapper;

import com.sesame.pojo.Doctor;

import java.util.List;

public interface DoctorMapper {
    int deleteByPrimaryKey(Integer dno);

    int insert(Doctor record);

    int insertSelective(Doctor record);

    Doctor selectByPrimaryKey(Integer dno);

    int updateByPrimaryKeySelective(Doctor record);

    int updateByPrimaryKey(Doctor record);

    /*查询某科室的医生*/
    List<Doctor> doctorlist(Integer roomNo);

}