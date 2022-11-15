package com.ssafy.enjoytrip;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.ComponentScans;

@SpringBootApplication
@ComponentScan(basePackages = {"com.ssafy"})
public class EnjoytripSpringTeam09Application {

	public static void main(String[] args) {
		SpringApplication.run(EnjoytripSpringTeam09Application.class, args);
	}

}
