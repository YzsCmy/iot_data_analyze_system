package com.yzs.manage.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestController {

    @RequestMapping("/")
    public String index() {
        System.out.println("index...");
        return "main";
    }
    @RequestMapping("index.do")
    public String toIndex() {
        System.out.println("index...");
        return "main";
    }
    //@RequestMapping("/login.do")
    //public String login() {
    //    System.out.println("login...");
    //    return "main";
    //}

}
