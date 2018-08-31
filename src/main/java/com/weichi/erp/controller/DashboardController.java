package com.weichi.erp.controller;

import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.mapper.Condition;
import com.baomidou.mybatisplus.plugins.Page;
import com.weichi.erp.Constant.BaseEnums;
import com.weichi.erp.Constant.SuperDomainEnums;
import com.weichi.erp.component.myType.JsonResult;
import com.weichi.erp.component.utils.DateUtils;
import com.weichi.erp.domain.Carousel;
import com.weichi.erp.domain.Contact;
import com.weichi.erp.domain.Jrebel;
import com.weichi.erp.domain.Product;
import org.springframework.stereotype.Controller;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.*;
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

    @RequestMapping("/jrebelReg")
    public String jrebelReg(Map<String, Object> map) {
        Jrebel jrebel = new Jrebel();
        List<Jrebel> jrebelList = jrebel.selectAll();
        map.put("jrebelList", JSON.toJSONString(jrebelList));
        map.put("activeFlag", "jrebelReg");
        return "dashboard/jrebelReg";
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
    @RequestMapping("/jrebelSave")
    public JsonResult<?> jrebelSave(@RequestBody List<Jrebel> jrebelList) {
        JsonResult jsonResult = new JsonResult();
        try {
            for (Jrebel jrebel : jrebelList)
                if (jrebel.getState().equals(SuperDomainEnums.state.modified.name())) {
                    jrebel.updateById();
                } else if (jrebel.getState().equals(SuperDomainEnums.state.added.name())) {
                    jrebel.insert();
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
    @RequestMapping("/productSave")
    public JsonResult<?> productSave(@RequestBody Product product) {
        JsonResult jsonResult = new JsonResult();
        try {
            if (product.getId() != null) {
                product.updateById();
            } else {
                product.insert();
            }
        } catch (Exception e) {
            jsonResult.setStatus(JsonResult.ERROR);
            e.printStackTrace();
        }
        jsonResult.setData(product.getId().toString());
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

    @ResponseBody
    @RequestMapping("/jrebelDel")
    public JsonResult<?> jrebelDel(@RequestBody List<Long> jrebelIdList) {
        JsonResult jsonResult = new JsonResult();
        try {
            Jrebel jrebel = new Jrebel();
            jrebel.delete(Condition.create().in("id", jrebelIdList));
        } catch (Exception e) {
            jsonResult.setStatus(JsonResult.ERROR);
            e.printStackTrace();
        }

        return jsonResult;
    }

    @RequestMapping("/productDel")
    public String productDel(Map<String, Object> map, @RequestParam(value = "id") Long id) {
        Product product = new Product();
        product.deleteById(id);
        List<Product> productList = product.selectAll();
        map.put("productList", productList);
        map.put("activeFlag", "product");
        return "forward:/dashboardController/product/1";
    }

    @RequestMapping("/product/{currentPage}")
    public String product(Map<String, Object> map, @PathVariable(value = "currentPage") int currentPage) {
        Page<Product> page = new Page<Product>(currentPage, 10);
        Product product = new Product();
        page = product.selectPage(page, Condition.empty());
        map.put("productList", page.getRecords());
        map.put("page", page);
        map.put("activeFlag", "product");
        return "dashboard/product";
    }

    @RequestMapping("/productEdit")
    public String productEdit(Map<String, Object> map, @RequestParam(value = "id") Long id, @RequestParam(value = "optFlag") String optFlag) {
        map.put("activeFlag", "product");
        if (BaseEnums.optFlag.add.name().equals(optFlag)) {
            return "dashboard/productEdit";
        } else if (BaseEnums.optFlag.modify.name().equals(optFlag)) {
            Product product = new Product();
            map.put("product", product.selectById(id));
        }
        return "dashboard/productEdit";
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
