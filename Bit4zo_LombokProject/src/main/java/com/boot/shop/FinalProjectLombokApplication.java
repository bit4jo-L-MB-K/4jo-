package com.boot.shop;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan({"data.*","com.boot.shop"})
@MapperScan("data.*")
public class FinalProjectLombokApplication {

	public static void main(String[] args) {
		SpringApplication.run(FinalProjectLombokApplication.class, args);
	}

}
