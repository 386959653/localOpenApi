package com.weichi.erp.controller;

import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.mapper.Condition;
import com.weichi.erp.Constant.SuperDomainEnums;
import com.weichi.erp.component.myType.JsonResult;
import com.weichi.erp.domain.Carousel;
import com.weichi.erp.domain.Contact;
import com.weichi.erp.domain.Product;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
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
        Carousel carousel = new Carousel();
        List<Carousel> carouselList = carousel.selectList(Condition.create().orderBy("order_num"));
        map.put("carouselList", JSON.toJSONString(carouselList));
        map.put("activeFlag", "index");
        return "dashboard/index";
    }

    @ResponseBody
    @RequestMapping("/carouselSave")
    public JsonResult<?> carouselSave(@RequestBody List<Carousel> carouselList) {
        JsonResult jsonResult = new JsonResult();
        try {
            for (Carousel carousel : carouselList)
                if (carousel.getState().equals(SuperDomainEnums.state.modified)) {
                    carousel.updateById();
                } else if (carousel.getState().equals(SuperDomainEnums.state.added)) {
                    carousel.insert();
                }
        } catch (Exception e) {
            jsonResult.setStatus(JsonResult.ERROR);
            e.printStackTrace();
        }

        return jsonResult;
    }

    @RequestMapping("/product")
    public String product(Map<String, Object> map) {
        Product product = new Product();
        List<Product> productList = product.selectAll();
        map.put("productList", productList);
        map.put("activeFlag", "product");
        return "product";
    }

    @RequestMapping("/contact")
    public String contact(Map<String, Object> map) {
        Contact contact = new Contact();
        map.put("contact", contact.selectById(1L));
        map.put("activeFlag", "contact");
        return "contact";
    }


}
