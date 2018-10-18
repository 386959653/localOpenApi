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

//获取url中的参数
function getUrlParam(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
    var r = window.location.search.substr(1).match(reg);  //匹配目标参数
    if (r != null) return unescape(r[2]);
    return null; //返回参数值
}

//延迟3秒加载脚本，以便使页面的ajax都加载完毕
setTimeout(function () {
    debugger;
    var itemId = getUrlParam("id");
    //每天0点初始化当日销量为0
    var now = new Date();
    var daySoldCountKey = itemId + "DaySoldCountKey";
    //如果当前时间是处于0点0分到10分之间，就把当日销量清零
    if (now.getHours() == 0 && now.getMinutes() >= 0 && now.getMinutes() <= 10) {
        localStorage.setItem(daySoldCountKey, 0);
    }

    // daySoldCountKey如果不存在就初始化
    if (!localStorage.hasOwnProperty(daySoldCountKey)) {
        localStorage.setItem(daySoldCountKey, 0);
    }

    var daySoldCountLocal = parseInt(localStorage.getItem(daySoldCountKey));
    var changeFlag = false;
    var sellerName = $(".tb-seller-name").text().replace(/(^\s*)|(\s*$)/g, "")
    var title = $(".tb-sell-counter a").attr("title");
//alert(title);
//获取商品名称
    var itemName = $(".tb-main-title").attr("data-title");

    var soldConut = parseInt(title.substring(7, title.lastIndexOf("件，")));
    var soldConutKey = itemId + "SoldConut";
    if (!localStorage.hasOwnProperty(soldConutKey)) {
        localStorage.setItem(soldConutKey, soldConut);
    }
    var soldConutLocal = parseInt(localStorage.getItem(soldConutKey));
    if (soldConut != soldConutLocal) {
        localStorage.setItem(soldConutKey, soldConut);
        if (soldConut > soldConutLocal) {
            changeFlag = true;
            daySoldCountLocal = daySoldCountLocal + soldConut - soldConutLocal;
            localStorage.setItem(daySoldCountKey, daySoldCountLocal);
        }
    }
//alert(soldConut);

    var rmbNum = $(".tb-rmb-num").text();
    var rmbNumKey = itemId + "RmbNum";
    var rmbNumLocal = localStorage.getItem(rmbNumKey);
    if (rmbNum != rmbNumLocal) {
        changeFlag = true;
        localStorage.setItem(rmbNumKey, rmbNum);
    }

    if (changeFlag) {
        // 向后台同步数据
        var apiUrl = "http://127.0.0.1:8088/addSoldAndPrice";

        var url = encodeURI(apiUrl + "?soldConut=" + soldConut + "&sellerName=" + sellerName + "&rmbNum=" + rmbNum + "&itemId=" + itemId + "&daySoldCount=" + daySoldCountLocal + "&itemName=" + itemName);
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


