package com.weichi.erp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Map;

/**
 * 后台控制面板
 * Created by Wewon on 2018/8/3.
 */
@Controller
@RequestMapping("/dashboardController")
public class DashboardController {
    @RequestMapping("/index")
    public String index(Map<String, Object> map) {
//        Carousel carousel = new Carousel();
//        List<Carousel> carouselList = carousel.selectAll();
//        map.put("carouselList", carouselList);
//        map.put("activeFlag", "index");
        return "dashboard/index";
    }


}
