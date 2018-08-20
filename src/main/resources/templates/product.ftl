<#import "ftl/headerAndFooter.ftl" as ListPage>

<@ListPage.Html title="新品发布 - ${companyName?if_exists}">
<div class="container">
    <#list productList as item>
        <div class="row">
            <div class="panel panel-success">
                <div class="panel-heading">
                    <a href="/productInfo?id=${item.id}">
                        <h3 class="panel-title"><strong>${item.productName?if_exists}</strong></h3>
                    </a>
                </div>
                <div class="panel-body">
                    <div class=" col-lg-3">
                        <a href="/productInfo?id=${item.id}">
                            <img class="img-responsive img-thumbnail"
                                 src="${item.thumbnailUrl?if_exists}">
                        </a>
                    </div>
                    <div class=" col-lg-9">
                        <p class="text-muted">${item.productAbstract?if_exists}</p>
                    </div>
                </div>
            </div>
        </div>
    </#list>
</div>
</@ListPage.Html>