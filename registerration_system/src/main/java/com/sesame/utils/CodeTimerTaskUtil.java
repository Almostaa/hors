package com.sesame.utils;

import java.util.TimerTask;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.sesame.controller.AliyunSmsController;

@Component
public class CodeTimerTaskUtil extends TimerTask{
	
	@Autowired
	HttpServletRequest request;
	@Override
	public void run() {
		System.out.println("1111");
		request.getServletContext().removeAttribute(AliyunSmsController.getTel());			
	}

}
