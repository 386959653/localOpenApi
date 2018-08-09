<#import "ftl/sidebar.ftl" as ListPage>

<@ListPage.Html title="${companyName?if_exists}后台 - 首页" headAttr='
<link rel="stylesheet" href="../../js/slickGrid/slick.grid.css" type="text/css"/>
<link rel="stylesheet" href="../../js/slickGrid/slick-default-theme.css" type="text/css"/>
  <link rel="stylesheet" href="../../js/slickGrid/css/smoothness/jquery-ui-1.11.3.custom.css" type="text/css"/>

<script src="../../js/slickGrid/lib/jquery-ui-1.11.3.min.js"></script>
<script src="../../js/slickGrid/lib/jquery.event.drag-2.3.0.js"></script>

<script src="../../js/slickGrid/slick.core.js"></script>
<script src="../../js/slickGrid/plugins/slick.cellrangedecorator.js"></script>
<script src="../../js/slickGrid/plugins/slick.cellrangeselector.js"></script>
<script src="../../js/slickGrid/plugins/slick.cellselectionmodel.js"></script>
<script src="../../js/slickGrid/slick.formatters.js"></script>
<script src="../../js/slickGrid/slick.grid.js"></script>
<!--编辑表格要用到的-->
<script src="../../js/slickGrid/slick.editors.js"></script>
<script src="../../js/slickGrid/plugins/slick.model.js"></script>
<script src="../../js/slickGrid/plugins/slick.editmanager.js"></script>

'
css=''

>


    <div style="width:600px;">
        <div id="myGrid" style="width:100%;height:500px;"></div>
    </div>

    <script>
        function requiredFieldValidator(value) {
            if (value == null || value == undefined || !value.length) {
                return {valid: false, msg: "This is a required field"};
            } else {
                return {valid: true, msg: null};
            }
        }

        function selectFormatter(row, cell, value, columnDef, dataContext) {
            if (value == "Y") {
                return "是";
            } else {
                return "否";
            }

        }

        var grid;
        var data = ${carouselList};
        var columns = [
            {
                id: "imgName",
                name: "图片名称",
                field: "imgName",
                width: 120,
                editor: Slick.Editors.Text,
                validator: requiredFieldValidator
            }
            , {id: "imgUrl", name: "图片地址", field: "imgUrl", width: 100, editor: Slick.Editors.LongText}
            , {id: "imgLink", name: "图片链接", field: "imgLink", width: 100, editor: Slick.Editors.LongText}
            , {
                id: "enableFlag",
                name: "启用标志",
                field: "enableFlag",
                width: 100,
                editor: Slick.Editors.Select,
                options: "<option value=\"Y\">是</option><option value=\"N\">否</option>",
                notEmpVal: true,
                formatter: selectFormatter
            }
            , {id: "orderNum", name: "排序字段", field: "orderNum", width: 100, editor: Slick.Editors.Integer}
        ];
        var options = {
            editable: true,
            enableAddRow: true,
            enableCellNavigation: true,
            asyncEditorLoading: false,
            autoEdit: false
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

        $(function () {
            grid = new Slick.Grid("#myGrid", new Slick.Data.Model({"data": data}), columns, options);
            grid.registerPlugin(editor);
            grid.setSelectionModel(new Slick.CellSelectionModel());
            grid.init();

        })
    </script>
</@ListPage.Html>