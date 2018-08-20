package com.weichi.erp.controller;

import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.mapper.Condition;
import com.weichi.erp.Constant.SuperDomainEnums;
import com.weichi.erp.component.myType.JsonResult;
import com.weichi.erp.component.utils.DateUtils;
import com.weichi.erp.domain.Carousel;
import com.weichi.erp.domain.Contact;
import com.weichi.erp.domain.Product;
import org.springframework.stereotype.Controller;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
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
                if (carousel.getState().equals(SuperDomainEnums.state.modified.name())) {
                    carousel.updateById();
                } else if (carousel.getState().equals(SuperDomainEnums.state.added.name())) {
                    carousel.insert();
                }
        } catch (Exception e) {
            jsonResult.setStatus(JsonResult.ERROR);
            e.printStackTrace();
        }

        return jsonResult;
    }

    @ResponseBody
    @RequestMapping("/contactSave")
    public JsonResult<?> contactSave(@RequestBody Contact contact) {
        JsonResult jsonResult = new JsonResult();
        try {
            if (contact.getId() != null) {
                contact.updateById();
            } else {
                contact.insert();
            }
        } catch (Exception e) {
            jsonResult.setStatus(JsonResult.ERROR);
            e.printStackTrace();
        }

        return jsonResult;
    }

    @ResponseBody
    @RequestMapping("/carouselDel")
    public JsonResult<?> carouselDel(@RequestBody List<Long> carouselIdList) {
        JsonResult jsonResult = new JsonResult();
        try {
            Carousel carousel = new Carousel();
            carousel.delete(Condition.create().in("id", carouselIdList));
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
        return "dashboard/product";
    }

    @RequestMapping("/contact")
    public String contact(Map<String, Object> map) {
        Contact contact = new Contact();
        map.put("contact", contact.selectById(1L));
        map.put("activeFlag", "contact");
        return "dashboard/contact";
    }

    @RequestMapping(value = "/upload")
    @ResponseBody
    public JsonResult<?> upload(@RequestParam("file") MultipartFile file) {
        JsonResult jsonResult = new JsonResult();
        try {
            if (file.isEmpty()) {
                jsonResult.setStatus(JsonResult.ERROR);
                jsonResult.setMessage("文件为空");
                return jsonResult;
            }
            // 获取文件名
            String fileName = DateUtils.getMillisecondAsName();
            String suffixName = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
            String prefixName = file.getOriginalFilename().substring(0, file.getOriginalFilename().length() - suffixName.length());
            // 设置文件存储路径
            String projectPath = ResourceUtils.getFile("classpath:").getAbsolutePath();
            String imgUrl = "http://localhost:8080/img/upload/" + fileName + suffixName;
            String filePath = projectPath + File.separator + "static" + File.separator + "img" + File.separator + "upload" + File.separator;
            String path = filePath + fileName + suffixName;

            File dest = new File(path);
            // 检测是否存在目录
            if (!dest.getParentFile().exists()) {
                dest.getParentFile().mkdirs();// 新建文件夹
            }
            file.transferTo(dest);// 文件写入
            jsonResult.setMessage("上传成功");

            Carousel carousel = new Carousel();
            carousel.setImgName(prefixName);
            carousel.setImgUrl(imgUrl);
            jsonResult.setData(carousel);
        } catch (Exception e) {
            e.printStackTrace();
            jsonResult.setStatus(JsonResult.ERROR);
            jsonResult.setMessage("上传失败");
        }
        return jsonResult;
    }


}
