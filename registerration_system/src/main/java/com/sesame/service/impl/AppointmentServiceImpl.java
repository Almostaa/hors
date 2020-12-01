package com.sesame.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sesame.mapper.AppointmentMapper;
import com.sesame.pojo.Record;
import com.sesame.service.AppointmentService;

@Service
public class AppointmentServiceImpl implements AppointmentService {

		@Autowired
		private AppointmentMapper app;
		
		@Override
		public List<Record> selectDutyRecordByid(Integer id) {
			// TODO Auto-generated method stub
			return app.selectDutyRecordByid(id);
		}
		
		//修改预约量
		public Integer updateCount(Integer recordNo) {
			return app.updateCount(recordNo);
		}
		
		//查询预约量
		public Integer selectCount(Integer recordNo) {
			
			return app.selectCount(recordNo);
		}

}
