package com.sesame.service.impl;

import com.sesame.mapper.ApptinfoMapper;
import com.sesame.pojo.Apptinfo;
import com.sesame.pojo.Apptinfo;
import com.sesame.service.ApptInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class ApptInfoServiceImpl implements ApptInfoService {
    @Autowired
    private ApptinfoMapper apptInfoMapper;

    @Override
    public List<Apptinfo> selectALLByUserId(Integer usno) {
        return apptInfoMapper.selectALLByUserId(usno);
    }

    @Override
    public Integer insertOrder(Apptinfo apptinfo) {
        return apptInfoMapper.insertOrder(apptinfo);
    }

    @Override
    public Integer updateOrder(Integer apptNo) {
        return apptInfoMapper.updateOrder(apptNo);
    }
}
