package com.sesame.service.impl;

import com.sesame.mapper.ConsultInfoMapper;
import com.sesame.pojo.ConsultInfo;
import com.sesame.service.ConsultInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ConsultInfoServiceImpl implements ConsultInfoService {
    @Autowired
    private ConsultInfoMapper consultInfoMapper;

    @Override
    public List<ConsultInfo> getConsultInfoListByUserId(Integer usno) {
        return consultInfoMapper.getConsultInfoListByUserId(usno);
    }

    @Override
    public Integer insertOrder(ConsultInfo consultInfo) {
        return consultInfoMapper.insertOrder(consultInfo);
    }

    @Override
    public Integer updateOrder(Integer id) {
        return consultInfoMapper.updateOrder(id);
    }

    @Override
    public ConsultInfo getConsultInfoState(Integer id) {
        return consultInfoMapper.getConsultInfoState(id);
    }

    @Override
    public Integer updateDate(Integer id) {
        return consultInfoMapper.updateDate(id);
    }
}
