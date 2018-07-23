<#import "base.ftl" as ListPage>
<#macro Html title="" css="">
    <@ListPage.Html title="${title}" css="${css}">
<div class="page-wrapper">
    <header>
        <nav class="navbar navbar-default" role="navigation">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse"
                            data-target="#header-navbar-collapse">
                        <span class="sr-only">切换导航</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">杭州伟驰科技有限公司</a>
                </div>
                <div class="collapse navbar-collapse" id="header-navbar-collapse">
                    <ul class="nav navbar-nav">
                        <li <#if activeFlag="index" >class="active"</#if> ><a href="/index">网站首页</a></li>
                        <li <#if activeFlag="aboutUs" >class="active"</#if>><a href="/aboutUs">公司介绍</a></li>
                    <#--<li <#if activeFlag="news" >class="active"</#if> ><a href="/news">新闻中心</a></li>-->
                        <li <#if activeFlag="product" >class="active"</#if> ><a href="/product">新品介绍</a></li>
                        <li <#if activeFlag="contact" >class="active"</#if> ><a href="/contact">联系我们</a></li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>
    <#nested>
</div>
    </@ListPage.Html>
</#macro>