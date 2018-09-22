// ==UserScript==
// @name 同步订单并发货
// @namespace Violentmonkey Scripts
// @include     https://wuliu.taobao.com/user/consign.htm?trade_id=*
// @grant none
// ==/UserScript==
// 后端接口地址
var apiUrl = "http://127.0.0.1:8080/addOrder";

var url = location.href;
var rawArray = url.split("=")
var orderNum = rawArray[1];
console.log(orderNum);
$.ajax({
    url: apiUrl + "?orderNum=" + orderNum,
    cache: false,
    type: "GET",
    dataType: "jsonp"
}).done(function (msg) {
    console.log('response:' + msg.status);
    $("button:contains('确认')")[0].click();
});