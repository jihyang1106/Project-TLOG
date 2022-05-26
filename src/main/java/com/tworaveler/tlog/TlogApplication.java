package com.tworaveler.tlog;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

@SpringBootApplication
//임시  :DB 없이 프로젝트 실행해보기 위해 추가한 어노테이션
@EnableAutoConfiguration(exclude={DataSourceAutoConfiguration.class})
public class TlogApplication {

	public static void main(String[] args) {
		SpringApplication.run(TlogApplication.class, args);
	}

}
