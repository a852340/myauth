package com.example.myauth;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan("com.example.myauth.*")
public class MyauthApplication {

    public static void main(String[] args) {
        SpringApplication.run(MyauthApplication.class, args);
    }



//    @Bean
//    public DoJoinPoint get() {
//        return new DoJoinPoint();
//    }


}
