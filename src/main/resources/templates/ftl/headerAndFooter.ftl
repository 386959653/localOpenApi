<#import "base.ftl" as ListPage>
<#macro Html title="" css="" headAttr="">
    <@ListPage.Html title="${title}" css="${css}" headAttr='${headAttr}'>
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
                    <a class="navbar-brand" href="/index">${companyName?if_exists}</a>
                </div>
                <div class="collapse navbar-collapse" id="header-navbar-collapse">
                    <ul class="nav navbar-nav">
                        <li <#if activeFlag="index" >class="active"</#if> ><a href="/index">网站首页</a></li>
                        <li <#if activeFlag="aboutUs" >class="active"</#if>><a href="/aboutUs">公司介绍</a></li>
                    <#--<li <#if activeFlag="news" >class="active"</#if> ><a href="/news">新闻中心</a></li>-->
                        <li <#if activeFlag="product" >class="active"</#if> ><a href="/product">新品介绍</a></li>
                        <li <#if activeFlag="contact" >class="active"</#if> ><a href="/contact">联系我们</a></li>
                        <li <#if activeFlag="diy" >class="active"</#if> ><a href="${ctx}/diy">自助取货</a></li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>
    <#nested>
    <footer>
        <div class="well text-center" style="background-color: #9d9d9d  ;color: floralwhite">Copyright ©
            2018 ${companyName?if_exists}
            All rights reserved
            <p><a href="/dashboardController/index">后台入口</a></p>
        </div>
    </footer>
</div>
    </@ListPage.Html>
</#macro>