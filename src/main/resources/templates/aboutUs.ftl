<#import "ftl/headerAndFooter.ftl" as ListPage>
<#import "ftl/lib.ftl" as com>

<@ListPage.Html title="公司介绍 - ${companyName?if_exists}">
<div class="container">
    <div class="row well">
        <div class="col-md-7 col-md-offset-2">
            <p style="text-align:center; line-height: 36px">
                <span class="badge" style="background-color: orangered">${companyName?if_exists}</span>
                创立于“上有天堂，下有苏杭”美誉的浙江省会城市杭州，<br>
                致力于高端网站开发、<br>H5响应式网站建设、<br>各种软件管理系统设计、<br>微信小程序开发<br>
                及相关软件产品的定制化服务。
            </p>
            <@com.MY_HR/>
            <p style="text-align:center; line-height: 36px">
                公司的核心价值观是<STRONG>“简单可靠”</STRONG>。<br>对每一个员工而言，同事关系是简单的，大家聚在一起为了共同的目标而奋斗；<br>同事之间是可靠的，大家为了共同的目标而相互协作、相互依赖。<br>
                对每一位客户而言，我们提供的软件产品是可靠的，是能确实帮客户解决问题的；<br>同时我们提供的软件产品又是简单易用的，是注重用户体验的。
            </p>
            <@com.MY_HR/>
            <p style="text-align:center; line-height: 36px">
                已服务于： 国际航空电讯协会、<br>全球婴电商平台、<br>百度供应链项目、<br>中国移动浙江分公司供应链项目
                等等企业机构，<br>得到了业界客户的一致好评和广大用户的认可。
        </p>
        </div>
        <div class="col-md-3">
            <img class="img-responsive block-center" src="../img/aboutUs.png">
        </div>
    </div>
</div>
​
</@ListPage.Html>