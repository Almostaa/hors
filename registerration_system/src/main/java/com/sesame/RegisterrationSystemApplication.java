package com.sesame;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.sesame.mapper")
public class RegisterrationSystemApplication {

	public static void main(String[] args) {
		SpringApplication.run(RegisterrationSystemApplication.class, args);
	}

}
