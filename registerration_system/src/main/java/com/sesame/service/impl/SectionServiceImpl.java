package com.sesame.service.impl;

import com.sesame.mapper.SectionMapper;
import com.sesame.mapper.UserMapper;
import com.sesame.pojo.Doctor;
import com.sesame.pojo.Section;
import com.sesame.service.SectionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * SectionService实现类
 * @author sfda
 * @currentTime
 */

@Service
public class SectionServiceImpl implements SectionService {

    @Autowired
    private SectionMapper sectionMapper;

    @Override
    public List<Section> sectionlist() {
        return sectionMapper.selectByPrimaryKey();
    }

    @Override
    public List<Doctor> selectDoctor(Integer sectionno) {
        return sectionMapper.selectDoctor(sectionno);
    }

    @Override
    public List<Doctor> selectDoctorList() {
        return sectionMapper.selectDoctorList();
    }
}
