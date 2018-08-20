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

<form action='contact' id="hideForm">

</form>
<section class="content">
    <div class="row">
        <section class="col-lg-12 ">

            <div class="box box-primary">
                <div class="box-header">
                    <h3 class="box-title">设置产品</h3>
                </div>
                <div class="box-body" style="">
                    <input type="hidden" id="id" value="<#if contact??>${contact.id}</#if>">
                    <div class="form-group">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-id-card-o" aria-hidden="true"></i></span>
                            <input id="productName" type="text" class="form-control" placeholder="产品名称"
                                   value="<#if contact?? && contact.qq??>${contact.qq}</#if>">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-pencil-square-o"
                                                               aria-hidden="true"></i></span>
                            <textarea id="product_abstract" class="form-control" rows="3"
                                      placeholder="产品简介 ..."><#if contact?? && contact.emailDescp??>${contact.emailDescp}</#if></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-picture-o"></i></span>
                            <input id="thumbnailUrl" type="text" class="form-control" placeholder="产品缩略图地址"
                                   value="<#if contact?? && contact.qq??>${contact.qq}</#if>">
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
                                <textarea id="editor1" name="editor1" rows="10" cols="80"
                                          placeholder="产品详情..."></textarea>
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
            <@com.webUploader serverUrl="upload">
            </@com.webUploader>

        $('#saveModalConfirm').click(function () {
            $('#saveModal').modal('toggle');
            $(".loading").toggle();
            var url = "contactSave";
            var data = {};
            data.id = $('#id').val().trim();
            data.qq = $('#qq').val();
            data.qqDescp = $('#qqDescp').text();
            data.email = $('#email').val();
            data.emailDescp = $('#emailDescp').text();
            data.city = $('#current_city').text();
            data.gpsAddress = $('#gpsAddress').text();
            data.detailAddress = $('#detailAddress').val();
            AjaxHelper.post(url, data, function (data) {
                if (data.status == "ok") {
                    $('#saveTipModal').modal('toggle');
                    $('#hideForm').submit();
                }
            });

        });

        $('#save').click(function () {
            $('#saveModal').modal('toggle');
        });

        $(function () {
            // CKEditor instance
            CKEDITOR.replace('editor1');
        })

    </script>
</@ListPage.Html>