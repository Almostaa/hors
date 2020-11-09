//package com.sesame.controller;
//
///*import com.github.pagehelper.PageHelper;
//import com.github.pagehelper.PageInfo;*/
//
//import com.sesame.pojo.InforType;
//import com.sesame.pojo.Information;
//import com.sesame.service.InforTypeService;
//import com.sesame.service.InformationService;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.web.bind.annotation.*;
//
//import java.util.List;
//
///**
// * InformationController  资讯信息
// * @author sfda
// * @currentTime
// */
//
//@RestController
//@RequestMapping(value = "infor")
//public class InformationController {
//
//    @Autowired
//    private InforTypeService inforTypeService;
//
//    @Autowired
//    private InformationService informationService;
//
//    /*查询所有资讯类型*/
//    @RequestMapping(value = "infortypelist")
//    public List<InforType> selectInfor(){
//        return inforTypeService.selectInfor();
//    }
//
//    /*查询所有分类id*/
//    @RequestMapping(value = "setid")
//    public List<InforType> selectId(){
//        return inforTypeService.selectId();
//    }
//
//    /*根据类型编号查询资讯*/
//    @RequestMapping(value = "setinforbyid",method = RequestMethod.GET)
//    public PageInfo<Information> selectByInforId(@RequestParam(defaultValue = "1") int pageNo,
//                                                 @RequestParam(defaultValue = "3") int pageSize,
//                                                 Integer ino){
//        PageHelper.startPage(pageNo,pageSize);
//        List<Information> op =informationService.selectByInforId(ino);
//        PageInfo<Information> pageInfo=new PageInfo(op);
//        return pageInfo;
//    }
//
//    /*分页查询所有资讯*/
//    @RequestMapping(value = "inforlist" ,method = RequestMethod.GET)
//    public PageInfo<Information> selectInfoList(@RequestParam(defaultValue = "1") int pageNo,
//                                                @RequestParam(defaultValue = "3") int pageSize){
//        PageHelper.startPage(pageNo,pageSize);
//
//        List<Information> inforList = informationService.selectInfoList();
//
//        PageInfo pageInfo=new PageInfo(inforList);
//        return pageInfo;
//    }
//}
