package com.sesame.controller;


/*
* Section
* author sfda
*/

import com.sesame.pojo.Section;
import com.sesame.service.SectionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

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
