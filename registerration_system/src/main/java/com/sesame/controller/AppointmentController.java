package com.sesame.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.sesame.mapper.AppointmentMapper;
import com.sesame.pojo.Record;
import com.sesame.service.AppointmentService;
import com.sesame.utils.RespBean;

@RestController
@RequestMapping("/app")
public class AppointmentController {
	
	@Autowired
	private AppointmentService appointmentService;
	
	//通过医生id查询以当天日期为准的 往后7天的排班记录
	@RequestMapping(value="/selectRecord",method = RequestMethod.GET)
	public List<Map<String,Object>> selectDutyRecordByid(Integer id) {
		
		List<Record> list= appointmentService.selectDutyRecordByid(id);	
		List<Map<String,Object>> li = new ArrayList<>();
		for (Record record : list) {			
			Map<String,Object> map=new HashMap<String,Object>();
			map.put("recordNo",record.getRecordNo());   //编号
			map.put("date",record.getDutyDate());     //日期数组
			map.put("time", record.getTimeSlot().getTimeSlotRange()); //预约时间
			map.put("count",record.getBooking_numb());  //剩余预约数
			li.add(map);			
		}
		System.out.println(li);
		
//		 Map<String, Object> res = new HashMap<String, Object>();
//	        for (Map<String, Object> map : li) {
//	            String key =map.get("date").toString();
//	            String value = map.get("time").toString();
//	      System.out.println(key);
//		      if (res.containsKey(key)) {
//	              String oldVal = res.get(key).toString();
//	              value = oldVal + "," + value;
//	          }
//	          res.put(key, value);
//	        }
//	       System.out.println(res);
	 	return li;
	}
	
	//修改医生预约量
	//先通过值班记录查询对应时间点的预约量之后在进行修改
	@RequestMapping(value="/updateCount",method = RequestMethod.POST)
	public synchronized RespBean updateCount(@RequestParam Integer recordNo) {
		
		Integer Booking_numb = appointmentService.selectCount(recordNo);
		
		if(Booking_numb==0) {
			
			return new RespBean("error", "该医生预约已满!");
		}else {
			Integer counts=Booking_numb--;
			Integer res=appointmentService.updateCount(counts);
			if(res>0) {
				return new RespBean("success", "预约成功！!");
			}else {
				return new RespBean("success", "预约失败！!");
			}
		}
		
		
	}


}
