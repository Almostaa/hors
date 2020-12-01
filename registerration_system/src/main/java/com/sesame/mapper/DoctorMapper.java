package com.sesame.mapper;

import com.sesame.pojo.Doctor;

import java.util.List;

/*
 * @author sfda
 * 医生
 */
public interface DoctorMapper {

    /*根据编号查询医生所有信息*/
    Doctor selectByPrimaryKey(Integer dno);

    /*查询某科室的医生*/
    List<Doctor> doctorlist(Integer roomNo);
    
    /**问诊费*/
    public Doctor queryInquiry();
    /**挂号费*/
    public Doctor queryRegister();
    
    //查询所有医生
    List<Doctor> selectAllDoc();



}