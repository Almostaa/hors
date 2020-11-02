package com.sesame.config;

import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurationSupport;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

/**
 * 跨域请求
 * @author JChiang
 * @currentTime 2020年10月30日下午2:14:40
 */
public class WebMvcConfig implements WebMvcConfigurer{

	/**
	 * WebMvcConfigurerAdapterspringboot2.0使用的spring5，所以会出现过时。
	 * 使用①implements WebMvcConfigurer（官方推荐）
	 * ②extends WebMvcConfigurationSupport
	 */
	
	  //跨域请求
	  @Override
	  public void addCorsMappings(CorsRegistry registry) {
	      registry.addMapping("/**")
	              .allowedOrigins("*")
	              .allowedMethods("POST", "GET", "PUT", "OPTIONS", "DELETE")
	             .maxAge(3600)
	              .allowCredentials(true);
	 }



}
