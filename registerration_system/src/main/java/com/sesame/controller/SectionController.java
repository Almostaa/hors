package com.sesame.controller;

import com.sesame.pojo.Section;
import com.sesame.service.SectionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
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

}
