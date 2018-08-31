<#import "ftl/sidebar.ftl" as ListPage>
<#import "../ftl/lib.ftl" as com>

<@ListPage.Html title="jrebel注册 - ${companyName?if_exists}后台" headAttr='
<link rel="stylesheet" href="../../js/slickGrid/slick.grid.css" type="text/css"/>
<link rel="stylesheet" href="../../js/slickGrid/slick-default-theme.css" type="text/css"/>
  <link rel="stylesheet" href="../../js/slickGrid/css/smoothness/jquery-ui-1.11.3.custom.css" type="text/css"/>

<script src="../../js/slickGrid/lib/jquery-ui-1.11.3.min.js"></script>
<script src="../../js/slickGrid/lib/jquery.event.drag-2.3.0.js"></script>

<script src="../../js/slickGrid/slick.core.js"></script>
<script src="../../js/slickGrid/plugins/slick.cellrangedecorator.js"></script>
<script src="../../js/slickGrid/plugins/slick.cellrangeselector.js"></script>
<script src="../../js/slickGrid/plugins/slick.rowselectionmodel.js"></script>
<script src="../../js/slickGrid/slick.formatters.js"></script>
<script src="../../js/slickGrid/slick.grid.js"></script>
<!--编辑表格要用到的-->
<script src="../../js/slickGrid/slick.editors.js"></script>
<script src="../../js/slickGrid/plugins/slick.model.js"></script>
<script src="../../js/slickGrid/plugins/slick.editmanager.js"></script>
<script src="../../js/slickGrid/plugins/slick.checkboxselectcolumn.js"></script>
<!--webUploader文件上传组件-->
<link rel="stylesheet" href="../../css/webUploader.css" type="text/css"/>
<script src="http://cdn.staticfile.org/webuploader/0.1.0/webuploader.js"></script>

'
css='
.slick-cell-checkboxsel {
      background: #f0f0f0;
      border-right-color: silver;
      border-right-style: solid;
    }
'

>
<form action='${ctx}/dashboardController/jrebelReg' id="hideForm">

</form>
<section class="content">
    <div class="row">
        <section class="col-lg-12 ">
        <#--表格-->
            <div class="row">
            <div class="box box-primary">
                <div class="box-header">
                    <h3 class="box-title">jrebel注册</h3>
                </div>
                <div class="box-body" style="">
                    <div id="myGrid" class="col-lg-7 col-xs-12"></div>
                </div>
                <div class="box-footer clearfix ">
                    <button id="delete" type="button" class="btn btn-default"><i class="fa fa-minus"></i> 删除选中行</button>
                    <button id="save" type="button" class="btn btn-default"><i class="fa fa-plus"></i> 保存</button>
                </div>
            </div>
            </div>

        </section>
    </div>
</section>
    <@com.MY_MODAL id="deleteModal" content="确认删除吗？" />
    <@com.MY_MODAL id="saveModal" content="确认保存吗？" />

    <script type="text/javascript">
        function requiredFieldValidator(value) {
            if (value == null || value == undefined || !value.length) {
                return {valid: false, msg: "This is a required field"};
            } else {
                return {valid: true, msg: null};
            }
        }

        var grid;
        var checkboxSelector = new Slick.CheckboxSelectColumn({
            cssClass: "slick-cell-checkboxsel"
        });
        var data = ${jrebelList};
        var columns = [
            checkboxSelector.getColumnDefinition()
            , {
                id: "definedUserId",
                name: "注册邮箱",
                field: "definedUserId",
                width: 260,
                editor: Slick.Editors.LongText,
                validator: requiredFieldValidator
            }
            , {
                id: "token",
                name: "36位GUID",
                field: "token",
                width: 370,
                editor: Slick.Editors.LongText,
                validator: requiredFieldValidator
            }
        ];
        var options = {
            editable: true,
            enableAddRow: true,
            enableCellNavigation: true,
            asyncEditorLoading: false,
            autoEdit: false,
            autoHeight: true
        };
        var editor = new Slick.EditManager({
            onUpdateItem: function (i, item) {
                grid.invalidate();
            },
            onAddItem: function (item) {
                grid.updateRowCount();
                grid.render();
                grid.scrollRowIntoView(grid.getDataLength() - 1);
            },
            onDeleteItem: function () {
                grid.invalidate();
            }
        });

        $('#saveModalConfirm').click(function () {
            $('#saveModal').modal('toggle');
            $(".loading").toggle();
            grid.getEditController().commitCurrentEdit();
            var url = "${ctx}/dashboardController/jrebelSave";
            var data = editor.getChanged();

            if (data.length > 0) {
                AjaxHelper.post(url, data, function (data) {
                    if (data.status == "ok") {
                        tipModal.content = "保存成功！";
                        $('#tipModal').modal('toggle');
                        $('#hideForm').submit();
                    }
                });
            } else {
                $(".loading").toggle();
            }
        });

        $('#save').click(function () {
            $('#saveModal').modal('toggle');
        });

        $('#deleteModalConfirm').click(function () {
            $('#deleteModal').modal('toggle');
            var rows = grid.getSelectedRows();
            grid.getEditController().commitCurrentEdit();

            var del_all_ids = new Array();
            var del_db_ids = new Array();
            $.each(rows, function (idx, row) {
                var item = editor.getGrid().getDataItem(row);
                del_all_ids.push(item.id);
                if (item._state != 'added') {
                    del_db_ids.push(item.id);
                }
            });

            var url = '${ctx}/dashboardController/jrebelDel';

            AjaxHelper.post(url, del_db_ids, function (response) {
                if (response.status == "ok") {
                    $.each(del_all_ids, function (idx, _id) {
                        var _idx = editor.getIndex("id", _id);
                        editor.removeItem(_idx);
                        grid.setSelectedRows([]);//去掉默认勾选
                    });
                    $('#tipModal').find('.modal-body').html("删除成功！");
                    $('#tipModal').modal('toggle');
                    $('#hideForm').submit();
                } else {
                    $('#errorModal').find('.modal-body').html(response.message);
                    $('#errorModal').modal('toggle');
                }
            });
        });

        $('#delete').click(function () {
            <@com.RETURN_NO_ROW "grid" />
            $('#deleteModal').modal('toggle');
        });

        $(function () {
            grid = new Slick.Grid("#myGrid", new Slick.Data.Model({"data": data}), columns, options);
            grid.registerPlugin(editor);
            grid.setSelectionModel(new Slick.RowSelectionModel({selectActiveRow: false}));
            grid.registerPlugin(checkboxSelector);
            grid.init();
        });
    </script>
</@ListPage.Html>