package com.sesame.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sesame.pojo.Doctor;
import com.sesame.pojo.Section;
import com.sesame.service.SectionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * SectionController  科室大类
 * @author sfda
 * @currentTime
 */

@RestController
@RequestMapping(value = "section")
public class SectionController {

    @Autowired
    private SectionService sectionService;

    @RequestMapping(value = "/allsection")
    public List<Section> getSectionList(){

        return sectionService.sectionlist();

    }

    /*根据大类id连表查询大类下的医生*/

    @RequestMapping(value = "selectdoctor",method = RequestMethod.GET)
    public PageInfo<Doctor> selectDoctor(@RequestParam(defaultValue = "1") int pageNo,
                                         @RequestParam(defaultValue = "3") int pageSize,
                                         Integer sectionno){

        PageHelper.startPage(pageNo,pageSize);
        List<Doctor> list = sectionService.selectDoctor(sectionno);
        PageInfo pageInfo=new PageInfo(list);
        return pageInfo;
    }

    @RequestMapping(value = "selectdoctorlist",method = RequestMethod.GET)
    public PageInfo<Doctor> selectDoctorList(@RequestParam(defaultValue = "1") int pageNo, @RequestParam(defaultValue = "3") int pageSize){

        PageHelper.startPage(pageNo,pageSize);
        List<Doctor> list = sectionService.selectDoctorList();
        PageInfo pageInfo=new PageInfo(list);
        return pageInfo;
    }

}
