<#import "ftl/headerAndFooter.ftl" as ListPage>

<@ListPage.Html title="首页 - ${companyName?if_exists}">
<div id="myCarousel" class="carousel slide">
    <!-- 轮播（Carousel）指标 -->
    <ol class="carousel-indicators" style="
    background-color: #333;
    opacity: 0.5;
">
    <#list carouselList as item>
        <li data-target="#myCarousel" data-slide-to="${item_index}" <#if item_index==0>class="active"</#if>></li>
    </#list>
    </ol>
    <!-- 轮播（Carousel）项目 -->
    <div class="carousel-inner">
<#list carouselList as item>
    <div class="item <#if item_index==0>active</#if>">
        <img src="${item.imgUrl}" alt="First slide">
        <div class="carousel-caption"><STRONG>${item.imgName}</STRONG></div>
        </div>
</#list>
    </div>
    <!-- 轮播（Carousel）导航 -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>
<div class="container">
    <div class="row">
        <h3 class="text-center"><STRONG>简单可靠</STRONG></h3>
        <p class="text-muted text-center">${companyName?if_exists}，是一家技术导向型软件科技公司，专注开发各种小而美的软件系统。</p>
    </div>
</div>
</@ListPage.Html>