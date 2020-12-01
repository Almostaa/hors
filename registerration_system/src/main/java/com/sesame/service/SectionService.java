package com.sesame.service;

import com.sesame.pojo.Doctor;
import com.sesame.pojo.Section;

import java.util.List;

/**
 * Section
 * @author sfda
 * @currentTime
 */

public interface SectionService {

    /*查询所有科室*/
    List<Section> sectionlist();

    /*根据大类id连表查询大类下的医生*/
    List<Doctor> selectDoctor(Integer sectionno);

    /*根据大类id连表查询大类下的医生*/
    List<Doctor> selectDoctorList();


}
