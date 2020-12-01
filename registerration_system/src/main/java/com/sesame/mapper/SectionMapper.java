package com.sesame.mapper;

import com.sesame.pojo.Doctor;
import com.sesame.pojo.Section;

import java.util.List;

/*
 * @author sfda
 * 大类
 */
public interface SectionMapper {

    /*查询所有大类*/
    List<Section> selectByPrimaryKey();

    /*根据大类id连表查询大类下的医生*/
    List<Doctor> selectDoctor(Integer sectionno);

    /*根据大类id连表查询大类下的医生*/
    List<Doctor> selectDoctorList();
}