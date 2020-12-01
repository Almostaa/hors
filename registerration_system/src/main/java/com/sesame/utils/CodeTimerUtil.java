package com.sesame.utils;

import java.util.Date;
import java.util.Timer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class CodeTimerUtil {
	
	
	 @Autowired
	 private CodeTimerTaskUtil codeTimer;
	  
	  public void startupTimer() {
		  
		  Timer timer = new Timer();
		  //当前时间的5分钟后执行一次
		  timer.schedule(codeTimer, new Date().getTime()+300000); 
	  }

}
