package com.sesame.service.impl;

import com.sesame.mapper.InforTypeMapper;
import com.sesame.mapper.InformationMapper;
import com.sesame.pojo.InforType;
import com.sesame.pojo.Information;
import com.sesame.service.InforTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class InforTypeServiceImpl implements InforTypeService {

    @Autowired
    private InforTypeMapper inforTypeMapper;

    /*查询所有资讯类型*/
    @Override
    public List<InforType> selectInfor() {
        return inforTypeMapper.selectInfor();
    }

    /*查询所有分类id*/
    @Override
    public List<InforType> selectId() {
        return inforTypeMapper.selectId();
    }

}
