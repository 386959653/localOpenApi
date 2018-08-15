<#macro MY_MODAL id="myModal" title="确认消息" content="" backdrop="static" keyboard="false">
	<!-- 模态框（Modal） -->
<div class="modal fade" id="${id}" tabindex="-1" role="dialog" aria-labelledby="myModalTitle"
     aria-hidden="true" data-backdrop="${backdrop}" data-keyboard="${keyboard}">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalTitle">
                    ${title}
                </h4>
            </div>
            <div class="modal-body">
                ${content}{{ content }}
            </div>
            <#if title=="确认消息">
            <div class="modal-footer">
                <button id="${id}Close" type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <button id="${id}Confirm" type="button" class="btn btn-primary">
                    确定
                </button>
            </div></#if>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
</#macro>

<#macro RETURN_NO_ROW grid tip="请选择操作对象。">
<#--点击放大镜的cell，但没有选数据，表格数据为0也要报错-->
var rows2 = ${grid}.getDataLength();
  var rows = ${grid}.getSelectedRows();
  if (rows.length == 0 || rows2 == 0){
$('#tipModal').find('.modal-body').html("${tip}");
$('#tipModal').modal('toggle');
    return false;
  }
</#macro>