package com.weichi.erp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Map;

/**
 * Created by Wewon on 2018/7/19.
 */
@Controller
public class officialWebController {
    @RequestMapping("/index")
    public String index(Map<String, Object> map) {
        return "index";
    }
}
