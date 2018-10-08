// ==UserScript==
// @name         抓取淘宝详情页已售出产品数和价格
// @namespace    http://tampermonkey.net/
// @version      0.1
// @description  try to take over the world!
// @author       You
// @match        https://item.taobao.com/item.htm?*
// @grant        none
// @require      https://cdn.bootcss.com/jquery/2.2.4/jquery.js
// ==/UserScript==

//延迟3秒加载脚本，以便使页面的ajax都加载完毕
setTimeout(function () {
    var changeFlag = false;
    var sellerName = $(".tb-seller-name").text().replace(/(^\s*)|(\s*$)/g, "")
    var title = $(".tb-sell-counter a").attr("title");
//alert(title);
    var soldConut = title.substring(7, title.lastIndexOf("件，"));
    var soldConutKey = sellerName + "SoldConut";
    var soldConutLocal = localStorage.getItem(soldConutKey);
    if (soldConut != soldConutLocal) {
        changeFlag = true;
        localStorage.setItem(soldConutKey, soldConut);
    }
//alert(soldConut);

    var rmbNum = $(".tb-rmb-num").text();
    var rmbNumKey = sellerName + "RmbNum";
    var rmbNumLocal = localStorage.getItem(rmbNumKey);
    if (rmbNum != rmbNumLocal) {
        changeFlag = true;
        localStorage.setItem(rmbNumKey, rmbNum);
    }

    if (changeFlag) {
        // 向后台同步数据
        var apiUrl = "http://127.0.0.1:8088/addSoldAndPrice";

        var url = apiUrl + "?soldConut=" + soldConut + "&sellerName=" + sellerName + "&rmbNum=" + rmbNum;
        console.log(url);
        $.ajax({
            url: url,
            cache: false,
            type: "GET",
            dataType: "jsonp"
        }).done(function (msg) {
            console.log('response:' + msg.status);

        });
    }


}, 3 * 1000);

//每隔120秒刷新一次页面
setTimeout(function () {
    location.reload();
}, 120 * 1000);


