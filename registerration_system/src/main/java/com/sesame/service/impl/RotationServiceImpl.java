package com.sesame.service.impl;

import com.sesame.mapper.RotationMapper;
import com.sesame.pojo.Rotation;
import com.sesame.service.RotationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RotationServiceImpl implements RotationService {

    @Autowired
    private RotationMapper rotationMapper;

    @Override
    public List<Rotation> selectByPrimaryKey() {
        return rotationMapper.selectByPrimaryKey();
    }
}
