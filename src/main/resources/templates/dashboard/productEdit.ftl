<#import "ftl/sidebar.ftl" as ListPage>
<#import "../ftl/lib.ftl" as com>

<@ListPage.Html title="设置产品 - ${companyName?if_exists}后台" headAttr='
<!--webUploader文件上传组件-->
<link rel="stylesheet" href="../../css/webUploader.css" type="text/css"/>
<script src="http://cdn.staticfile.org/webuploader/0.1.0/webuploader.js"></script>

<!--ckeditor组件-->
<script src="https://cdn.ckeditor.com/4.10.0/standard/ckeditor.js"></script>
'
css='
'

>

<form action='productEdit' id="hideForm">

</form>
<section class="content">
    <div class="row">
        <section class="col-lg-12 ">

            <div class="box box-primary">
                <div class="box-header">
                    <h3 class="box-title">设置产品</h3>
                </div>
                <div class="box-body" style="">
                    <input type="hidden" id="id" value="<#if product??>${product.id}</#if>">
                    <div class="form-group">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-id-card-o" aria-hidden="true"></i></span>
                            <input id="productName" type="text" class="form-control" placeholder="产品名称"
                                   value="<#if product?? && product.productName??>${product.productName}</#if>">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="input-group">
                            <span class="input-group-addon">
                                <i class="fa fa-pencil-square-o" aria-hidden="true"></i></span>
                            <textarea id="productAbstract" class="form-control" rows="3"
                                      placeholder="产品简介 ..."><#if product?? && product.productAbstract??>${product.productAbstract}</#if></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="input-group" style="padding-bottom:10px">
                            <span class="input-group-addon"><i class="fa fa-picture-o"></i></span>
                            <input id="thumbnailUrl" type="text" class="form-control" placeholder="产品缩略图地址"
                                   value="<#if product?? && product.thumbnailUrl??>${product.thumbnailUrl}</#if>">
                        </div>
                        <div id="filePicker">选择图片</div>
                        <div class="info-box" style="box-shadow:none">
                            <!--用来存放图片item-->
                            <div id="fileList" class="uploader-list"></div>
                        </div>
                    </div>
                    <@com.MY_HR hrName="transparency"/>
                <#--CK Editor-->
                    <div class="box box-primary">
                        <div class="box-header">
                            <h3 class="box-title">产品详情
                            </h3>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body pad">
                            <form>
                                <textarea id="productDetail" name="productDetail" rows="10"
                                          cols="80"><#if product?? && product.productDetail??>${product.productDetail}</#if></textarea>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="box-footer clearfix ">
                    <button id="save" type="button" class="btn btn-default"><i class="fa fa-plus"></i> 保存</button>
                </div>
            </div>

        </section>
    </div>
</section>
    <@com.MY_MODAL id="saveModal" content="确认保存吗？" />


    <script type="text/javascript">
        // CKEditor instance
        ckEditor = CKEDITOR.replace('productDetail');
            <@com.webUploader serverUrl="upload">
            $("#thumbnailUrl").val(response.data.imgUrl);
            </@com.webUploader>

        $('#saveModalConfirm').click(function () {
            $('#saveModal').modal('toggle');
            $(".loading").toggle();
            var url = "productSave";
            var data = {};
            data.id = $('#id').val().trim();
            data.productName = $('#productName').val();
            data.productAbstract = $('#productAbstract').val();
            data.thumbnailUrl = $('#thumbnailUrl').val();
            data.productDetail = ckEditor.getData();
            AjaxHelper.post(url, data, function (response) {
                if (response.status == "ok") {
                    tipModal.content = "保存成功！"
                    $('#id').val(response.data)
                    $('#tipModal').modal('toggle');
                }
            });

        });

        $('#save').click(function () {
            $('#saveModal').modal('toggle');
        });

    </script>
</@ListPage.Html>