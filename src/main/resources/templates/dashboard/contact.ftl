<#import "ftl/sidebar.ftl" as ListPage>
<#import "../ftl/lib.ftl" as com>

<@ListPage.Html title="${companyName?if_exists}后台 - 首页" headAttr='
<!--引用百度地图API-->
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=M5FEI32V9dDwpsrTbN9lU92xOf9vpYCK"></script>
    <script type="text/javascript" src="../../js/baiduMap.js"></script>
'
css='
'

>

<form action='contact' id="hideForm">

</form>
<section class="content">
    <div class="row">
        <section class="col-lg-12 ">
        <#--设置联系方式-->
            <div class="box box-primary">
                <div class="box-header">
                    <h3 class="box-title">设置联系方式</h3>
                </div>
                <div class="box-body" style="">
                    <input type="hidden" id="id" value="<#if contact??>${contact.id}</#if>">
                    <div class="form-group">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-qq" aria-hidden="true"></i></span>
                            <input id="qq" type="text" class="form-control" placeholder="QQ"
                                   value="<#if contact?? && contact.qq??>${contact.qq}</#if>">
                            <textarea id="qqDescp" class="form-control" rows="3"
                                      placeholder="说明 ..."><#if contact?? && contact.qqDescp??>${contact.qqDescp}</#if></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-envelope"></i></span>
                            <input id="email" type="email" class="form-control" placeholder="Email"
                                   value="<#if contact?? && contact.email??>${contact.email}</#if>">
                            <textarea id="emailDescp" class="form-control" rows="3"
                                      placeholder="说明 ..."><#if contact?? && contact.emailDescp??>${contact.emailDescp}</#if></textarea>
                        </div>
                    </div>

                    <div class="row">
                    <#--left-->
                        <div class="col-lg-4">
                            <div id="setCity" style="height:26px;">
                                <div style="display: block;">当前城市：
                                    <span id="current_city"><#if contact?? && contact.city??>${contact.city}<#else>
                                        杭州</#if></span>
                                    <span style="color:#2f83c7; cursor:pointer;" id="change_city" onclick="setCity()"> 切换</span>
                                </div>
                                <div style="display: none;">
                                    <input id="input_city" type="text" value="请输入城市名称" style="width: 115px"
                                           onclick="this.value = ''" onkeyup="citynameKeyUp()">
                                    <button type="button" class="btn btn-info btn-xs" onclick="confirmCity()">确定
                                    </button>
                                    <button type="button" class="btn btn-info btn-xs" onclick="exitSetCity()">取消
                                    </button>
                                </div>
                                <div class="input-group input-group-sm">
                                    <input id="input_site" type="text" class="form-control" placeholder="输入地名、大厦快速定位"
                                           onkeyup="siteKeyUp()" style="">
                                    <span class="input-group-btn">
                      <button type="button" class="btn btn-info btn-flat" onclick="searchLocation()">查找</button>
                    </span>
                                </div>
                                <label class="l" style="line-height:22px"></label>
                                <p>当前地图中心点经纬度：<span
                                        id="gpsAddress"><#if contact?? && contact.gpsAddress??>${contact.gpsAddress}<#else>
                                    120.21551,30.253082</#if></span></p>
                                <div class="form-group">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-map-marker"
                                                                           aria-hidden="true"></i></span>
                                        <textarea id="detailAddress" class="form-control" rows="3"
                                                  placeholder="详细地址 ..."><#if contact?? && contact.detailAddress?? && contact.detailAddress?trim?length gt 0>${contact.detailAddress}</#if></textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                    <#--right-->
                        <div class="col-lg-8">
                        <#--百度地图容器-->
                            <div id="allmap" class="" style=" user-select: none; height: 390px;"></div>
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
        <#--百度地图API功能-->
        var map = new BMap.Map("allmap", {enableMapClick: false});    // 创建Map实例
        var point = new BMap.Point(<#if contact?? && contact.gpsAddress??>${contact.gpsAddress}<#else>120.21551, 30.253082</#if>); // 初始化地图,设置中心点坐标和地图级别
        map.centerAndZoom(point, 15);
        var marker = new BMap.Marker(point);        // 创建标注
        map.addOverlay(marker);                     // 将标注添加到地图中
        //添加地图类型控件
        map.addControl(new BMap.MapTypeControl({
            mapTypes: [
                BMAP_NORMAL_MAP,
                BMAP_HYBRID_MAP
            ]
        }));
        map.setCurrentCity("<#if contact?? && contact.city??> ${contact.city}<#else>杭州</#if>");          // 设置地图显示的城市 此项是必须设置的
        map.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放
                <#if contact?? && contact.gpsAddress??&&contact.city??>
    //添加信息窗口
    var opts = {
        width: 100,     // 信息窗口宽度
        height: 50,     // 信息窗口高度
        title: "${companyName?if_exists}" // 信息窗口标题
    }
    var infoWindow = new BMap.InfoWindow("${contact.detailAddress?if_exists}", opts);  // 创建信息窗口对象
    map.openInfoWindow(infoWindow, point); //开启信息窗口
                </#if>
        // 点击百度地图获取地址
        var geoc = new BMap.Geocoder();
        map.addEventListener("click", function (e) {
            //通过点击百度地图，可以获取到对应的point, 由point的lng、lat属性就可以获取对应的经度纬度
            var pt = e.point;
            geoc.getLocation(pt, function (results) {
                //addressComponents对象可以获取到详细的地址信息
                var addComp = results.addressComponents;
                // var detailAddress = addComp.province + ", " + addComp.city + ", " + addComp.district + ", " + addComp.street + ", " + addComp.streetNumber;
                var detailAddress = results.address;
                //将对应的HTML元素设置值
                $("#detailAddress").val(detailAddress);
                $("#gpsAddress").text(pt.lng + "," + pt.lat);
                $("#current_city").text(addComp.city);
            });
        });

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

    </script>
</@ListPage.Html>