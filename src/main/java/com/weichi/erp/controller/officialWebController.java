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
        map.put("activeFlag", "index");
        return "index";
    }

    @RequestMapping("/news")
    public String news(Map<String, Object> map) {
        map.put("activeFlag", "news");
        return "news";
    }

    @RequestMapping("/product")
    public String product(Map<String, Object> map) {
        map.put("activeFlag", "product");
        return "product";
    }

    @RequestMapping("/contact")
    public String contact(Map<String, Object> map) {
        map.put("activeFlag", "contact");
        return "contact";
    }

    @RequestMapping("/aboutUs")
    public String aboutUs(Map<String, Object> map) {
        map.put("activeFlag", "aboutUs");
        return "aboutUs";
    }

    @RequestMapping("/productInfo")
    public String productInfo(Map<String, Object> map) {
        map.put("activeFlag", "product");
        return "productInfo";
    }



}
