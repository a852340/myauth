package com.example.myauth.controller;

import com.example.myauth.MyAuth;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TestController {

    @MyAuth
    @GetMapping("/test")
    public String test(String user) {
        return "调用成功:" + user;
    }

}
