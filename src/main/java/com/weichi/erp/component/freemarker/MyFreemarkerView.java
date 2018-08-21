package com.weichi.erp.component.freemarker;

import org.springframework.web.servlet.view.freemarker.FreeMarkerView;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * 自定义Freemarker共享变量
 * Created by Wewon on 2018/8/1.
 */
public class MyFreemarkerView extends FreeMarkerView {
    @Override
    protected void exposeHelpers(Map<String, Object> model, HttpServletRequest request) throws Exception {
        model.put("companyName", "杭州伟驰科技有限公司");
        model.put("ctx", request.getContextPath());
        super.exposeHelpers(model, request);
    }

}
