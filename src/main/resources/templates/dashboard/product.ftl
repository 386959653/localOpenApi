<#import "ftl/sidebar.ftl" as ListPage>
<#import "../ftl/lib.ftl" as com>

<@ListPage.Html title="产品列表 - ${companyName?if_exists}后台" headAttr='
'
css='
'

>
<section class="content">
    <div class="box box-primary">
        <div class="box-header ui-sortable-handle" style="cursor: move;">
            <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
            <h3 class="box-title">产品列表</h3>

            <div class="box-tools pull-right">
                <button type="button" class="btn btn-default pull-right"
                        onclick="javascrtpt:window.location.href='productEdit?id=1&optFlag=add'"><i
                        class="fa fa-plus"></i> 新增
                </button>
            </div>
        </div>
        <!-- /.box-header -->
        <div class="box-body">
            <!-- See dist/js/pages/dashboard.js to activate the todoList plugin -->
            <ul class="todo-list ui-sortable">
    <#list productList as item>
        <li class="">
                    <span class="text"><a href="/productInfo?id=${item.id}">${item.productName?if_exists}
                    </a></span>
            <!-- General tools such as edit or delete-->
            <div class="tools" style="display: inline-block;">
                <a href="productEdit?id=${item.id}&optFlag=modify"><i class="fa fa-edit"></i></a>
                <a href="productDel?id=${item.id}"><i class="fa fa-trash-o"></i></a>
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
        </li>
    </#list>
            </ul>
        </div>
        <!-- /.box-body -->
        <div class="box-footer clearfix no-border">
            <@com.paging url="${ctx}/dashboardController/product"/>
        </div>
    </div>
</section>
</@ListPage.Html>