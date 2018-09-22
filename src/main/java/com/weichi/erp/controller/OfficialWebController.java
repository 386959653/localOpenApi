package com.weichi.erp.controller;

import com.baomidou.mybatisplus.mapper.Condition;
import com.google.code.kaptcha.Constants;
import com.weichi.erp.Constant.BaseEnums;
import com.weichi.erp.Constant.CarouselEnums;
import com.weichi.erp.component.utils.StringUtils;
import com.weichi.erp.domain.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * Created by Wewon on 2018/7/19.
 */
@Controller
public class OfficialWebController {
    @RequestMapping("/index")
    public String index(Map<String, Object> map) {
        Carousel carousel = new Carousel();
        List<Carousel> carouselList = carousel.selectList(Condition.create().eq("enable_flag", CarouselEnums.enableFlag.Y).orderBy("order_num"));
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
//        防止freemarker报空指针错误
        if (map.get("contact") == null) {
            map.put("contact", new HashMap<>());
        }

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

    @RequestMapping("/diy")
    public String diy(Map<String, Object> map) {
        map.put("activeFlag", "diy");
        return "diy";
    }

    @RequestMapping("/getGoods")
    public String getGoods(HttpSession httpSession, Map<String, Object> map, @RequestParam(value = "orderNum") String orderNum,
                           @RequestParam(value = "email") String email, @RequestParam(value = "verifyCode") String verifyCode) {
        map.put("activeFlag", "diy");
        if (!StringUtils.isEmail(email)) {
            map.put("emailError", "emailError");
            return "diy";
        }
        String captchaId = (String) httpSession.getAttribute(Constants.KAPTCHA_SESSION_KEY);
        if (!verifyCode.equalsIgnoreCase(captchaId)) {
            httpSession.removeAttribute(Constants.KAPTCHA_SESSION_KEY);
            map.put("captchaError", "captchaError");
            return "diy";
        }
        TaobaoOrder taobaoOrder = new TaobaoOrder();
        taobaoOrder.setOrderNum(orderNum);
        taobaoOrder.setUpdateUsername("auto");
        taobaoOrder.setEnableFlag(BaseEnums.enableFlag.N.name());
        int taobaoOrderCount = taobaoOrder.selectCount(Condition.create().eq("order_num", orderNum).and().eq("enable_flag", BaseEnums.enableFlag.Y.name()));
        if (taobaoOrderCount <= 0) {
            map.put("error", "error");
            return "diy";
        }
        taobaoOrder.update(Condition.create().eq("order_num", orderNum));
        //把激活链接发送给前端
        Jrebel jrebel = new Jrebel();
        jrebel.setDefinedUserId(email);
        jrebel.setToken(UUID.randomUUID().toString());
        jrebel.setInsertUsername("auto");
        jrebel.setUpdateUsername("auto");
        jrebel.insert();
        map.put("jrebel", jrebel);
        return "diy";
    }



}
