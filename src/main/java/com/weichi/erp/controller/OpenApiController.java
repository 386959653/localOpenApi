package com.weichi.erp.controller;

import com.weichi.erp.component.myType.JsonResult;
import com.weichi.erp.domain.SoldPrice;
import com.weichi.erp.domain.TaobaoOrder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;

/**
 * Created by Wewon on 2018/9/20.
 */
@RestController
public class OpenApiController {
    @RequestMapping("addOrder")
    public void addOrder(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, @RequestParam(value = "orderNum") String orderNum) throws IOException {
        JsonResult jsonResult = new JsonResult();
        TaobaoOrder taobaoOrder = new TaobaoOrder();
        taobaoOrder.setOrderNum(orderNum);
        taobaoOrder.setInsertUsername("auto");
        taobaoOrder.setUpdateUsername("auto");
        taobaoOrder.insert();
        httpServletResponse.setContentType("application/javascript");
        //前端传过来的回调函数名称
        String callback = httpServletRequest.getParameter("callback");
        //用回调函数名称包裹返回数据，这样，返回数据就作为回调函数的参数传回去了
        String result = callback + "(" + jsonResult.toJSONString() + ")";
        httpServletResponse.getWriter().write(result);
    }

    @RequestMapping("addSoldAndPrice")
    public void addSoldAndPrice(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, @RequestParam(value = "soldConut") Long soldConut
            , @RequestParam(value = "sellerName") String sellerName, @RequestParam(value = "rmbNum") BigDecimal rmbNum,
                                @RequestParam(value = "itemId") Long itemId, @RequestParam(value = "daySoldCount") Long daySoldCount) throws IOException {
        JsonResult jsonResult = new JsonResult();
        SoldPrice soldPrice = new SoldPrice();
        soldPrice.setSellerName(sellerName);
        soldPrice.setSoldCount(soldConut);
        soldPrice.setRmbNum(rmbNum);
        soldPrice.setItemId(itemId);
        soldPrice.setDaySoldCount(daySoldCount);
        soldPrice.setInsertUsername("auto");
        soldPrice.setUpdateUsername("auto");
        soldPrice.insert();
        httpServletResponse.setContentType("application/javascript");
        //前端传过来的回调函数名称
        String callback = httpServletRequest.getParameter("callback");
        //用回调函数名称包裹返回数据，这样，返回数据就作为回调函数的参数传回去了
        String result = callback + "(" + jsonResult.toJSONString() + ")";
        httpServletResponse.getWriter().write(result);
    }
}
