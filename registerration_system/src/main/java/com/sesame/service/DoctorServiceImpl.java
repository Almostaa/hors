package com.sesame.service.impl;

import com.sesame.mapper.DoctorMapper;
import com.sesame.pojo.Doctor;
import com.sesame.service.DoctorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DoctorServiceImpl implements DoctorService {

    @Autowired
    private DoctorMapper doctorMapper;

    @Override
    public List<Doctor> doctorlist(Integer roomNo) {
        return doctorMapper.doctorlist(roomNo);
    }

    @Override
    public Doctor selectByPrimaryKey(Integer id) {
        return doctorMapper.selectByPrimaryKey(id);
    }
}
