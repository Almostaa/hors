package com.sesame.service.impl;

import com.sesame.mapper.InformationMapper;
import com.sesame.pojo.Information;
import com.sesame.service.InformationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class InformationServiceImpl implements InformationService {

    @Autowired
    private InformationMapper informationMapper;

    /*根据类型编号查询资讯*/
    @Override
    public List<Information> selectByInforId(Integer ino) {
        return informationMapper.selectByInforId(ino);
    }

    /*查询所有资讯*/
    @Override
    public List<Information> selectInfoList() {
        return informationMapper.selectInfoList();
    }

}
