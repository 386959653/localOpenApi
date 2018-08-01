<#import "ftl/headerAndFooter.ftl" as ListPage>

<@ListPage.Html title="${companyName?if_exists} - 唤醒食物">
<div class="container">
    <h1>${product.productName?if_exists}</h1>
    <p class="text-right"><span
            STYLE="background-color: floralwhite">${product.updateTime?if_exists?string('yyyy-MM-dd')}</span></p>
    <hr>
<#--用户编辑的正文内容-->
    ${product.productDetail?if_exists}

<#--百度分享api-->
    <div class="bdsharebuttonbox"><a href="#" class="bds_more" data-cmd="more"></a><a href="#" class="bds_qzone"
                                                                                      data-cmd="qzone"
                                                                                      title="分享到QQ空间"></a><a href="#"
                                                                                                             class="bds_tsina"
                                                                                                             data-cmd="tsina"
                                                                                                             title="分享到新浪微博"></a><a
            href="#" class="bds_tqq" data-cmd="tqq" title="分享到腾讯微博"></a><a href="#" class="bds_renren" data-cmd="renren"
                                                                           title="分享到人人网"></a><a href="#"
                                                                                                 class="bds_weixin"
                                                                                                 data-cmd="weixin"
                                                                                                 title="分享到微信"></a>
    </div>

</div>
<#--百度分享api-->
<script>window._bd_share_config = {
    "common": {
        "bdSnsKey": {},
        "bdUrl": "https://www.baidu.com",
        "bdText": "唤醒食物，基于人工智能与高可靠实验数据与经典文献，为用户提供诉求与疾病的科学食疗方案、补充剂的真实作用，以及强大全面而直观的食物营养成分与营养工具。",
        "bdMini": "2",
        "bdPic": "",
        "bdStyle": "0",
        "bdSize": "16"
    }, "share": {"bdSize": 16}
};
with (document) 0[(getElementsByTagName('head')[0] || body).appendChild(createElement('script')).src = 'http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion=' + ~(-new Date() / 36e5)];</script>
</@ListPage.Html>