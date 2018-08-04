package com.weichi.erp.controller;

import com.weichi.erp.domain.Carousel;
import com.weichi.erp.domain.Contact;
import com.weichi.erp.domain.Product;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

/**
 * Created by Wewon on 2018/7/19.
 */
@Controller
public class OfficialWebController {
    @RequestMapping("/index")
    public String index(Map<String, Object> map) {
        Carousel carousel = new Carousel();
        List<Carousel> carouselList = carousel.selectAll();
        map.put("carouselList", carouselList);
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

    @RequestMapping("/aboutUs")
    public String aboutUs(Map<String, Object> map) {
        map.put("activeFlag", "aboutUs");
        return "aboutUs";
    }

    @RequestMapping("/productInfo")
    public String productInfo(@RequestParam(value = "id") String id, Map<String, Object> map) {
        Product product = new Product();
        map.put("product", product.selectById(1L));
        map.put("activeFlag", "product");
        return "productInfo";
    }



}
