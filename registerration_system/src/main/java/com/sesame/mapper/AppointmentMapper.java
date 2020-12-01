package com.sesame.mapper;

import java.util.List;

import com.sesame.pojo.Record;

public interface AppointmentMapper {
	
	//通过医生id查询以当天日期为准的 往后7天的排班记录
	public List<Record> selectDutyRecordByid(Integer id);
	
	//修改预约量
	public Integer updateCount(Integer recordNo);
	
	//查询预约量
	public Integer selectCount(Integer recordNo);
	
	

}
