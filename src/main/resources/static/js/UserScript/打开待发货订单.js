// ==UserScript==
// @name 打开待发货订单
// @namespace Violentmonkey Scripts
// @grant none
// @require      https://cdn.bootcss.com/jquery/2.2.4/jquery.js
// @include     https://trade.taobao.com/trade/itemlist/list_sold_items.htm?action=itemlist*tabCode=waitSend
// ==/UserScript==

// js休眠函数
function sleep(numberMillis) {
    var now = new Date();
    var exitTime = now.getTime() + numberMillis;
    while (true) {
        now = new Date();
        if (now.getTime() > exitTime)
            return;
    }
}

var elements = $(".button-mod__secondary___1p4be");
//var elements = $(".text-mod__secondary___1TASQ:contains('查看物流')").slice(1,5);
for (var i = 0; i < elements.length; i++) {
    elements[i].click();
    sleep(2000);
}