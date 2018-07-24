<#import "ftl/headerAndFooter.ftl" as ListPage>

<@ListPage.Html title="杭州伟驰科技有限公司 - 首页">
<div id="myCarousel" class="carousel slide">
    <!-- 轮播（Carousel）指标 -->
    <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
    </ol>
    <!-- 轮播（Carousel）项目 -->
    <div class="carousel-inner">
        <div class="item active">
            <img src="https://www.elite-clock.com/uploadfile/bannerimg/15184221212114217928.jpg" alt="First slide">
            <div class="carousel-caption">标题 1</div>
        </div>
        <div class="item">
            <img src="https://www.elite-clock.com/uploadfile/bannerimg/15223112587458217928.jpg" alt="Second slide">
            <div class="carousel-caption">标题 2</div>
        </div>
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
        <p class="text-muted text-center">杭州伟驰科技有限公司，是一家技术导向型软件科技公司，专注开发各种小而美的软件。</p>
    </div>
</div>
</@ListPage.Html>