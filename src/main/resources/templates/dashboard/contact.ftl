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

<form action='index' id="hideForm">

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
                    <div class="form-group">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-qq" aria-hidden="true"></i></span>
                            <input type="text" class="form-control" placeholder="QQ">
                            <textarea class="form-control" rows="3" placeholder="说明 ..."></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-envelope"></i></span>
                            <input type="email" class="form-control" placeholder="Email">
                            <textarea class="form-control" rows="3" placeholder="说明 ..."></textarea>
                        </div>
                    </div>
                </div>
                <div class="box-footer clearfix ">
                    <button id="save" type="button" class="btn btn-default"><i class="fa fa-plus"></i> 保存</button>
                </div>
            </div>

        <#--设置地址-->
            <div class="box box-primary">
                <div class="box-header">
                    <h3 class="box-title">设置地址</h3>
                </div>
                <div class="box-body" style="">
                    <div class="row">
                    <#--left-->
                        <div class="col-lg-4">
                            <div id="setCity" style="height:26px;">
                                <div style="display: block;">当前城市：
                                    <span id="current_city">平阳县</span>
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
                                <p>当前地图中心点经纬度：</p>
                                <div style="margin-bottom:10px;">
                                    <label class="l" style="line-height:22px">X：</label>
                                    <div id="input_x"
                                         style="line-height:20px; width: 110px;display:block; margin-left:30px">
                                        120.202197
                                    </div>
                                </div>
                                <div style="margin-bottom:10px;">
                                    <label class="l" style="line-height:22px">Y：</label>
                                    <div id="input_y" style="line-height:20px; width: 110px;margin-left: 30px;">
                                        30.229946
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-map-marker"
                                                                           aria-hidden="true"></i></span>
                                        <textarea class="form-control" rows="3" placeholder="详细地址 ..."></textarea>
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
    <@com.MY_MODAL id="confirmModal" content="确认删除吗？" />
    <@com.MY_MODAL id="saveModal" content="确认保存吗？" />
    <@com.MY_MODAL id="saveTipModal" title="提示信息" content="保存成功！" />


    <script type="text/javascript">
            <#if contact.gpsAddress??&&contact.city??>
            <#--百度地图API功能-->
    var map = new BMap.Map("allmap");    // 创建Map实例
    var point = new BMap.Point(${contact.gpsAddress}); // 初始化地图,设置中心点坐标和地图级别
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
    map.setCurrentCity("${contact.city}");          // 设置地图显示的城市 此项是必须设置的
    map.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放
    //添加信息窗口
    var opts = {
        width: 100,     // 信息窗口宽度
        height: 50,     // 信息窗口高度
        title: "${companyName?if_exists}" // 信息窗口标题
    }
    var infoWindow = new BMap.InfoWindow("${contact.detailAddress?if_exists}", opts);  // 创建信息窗口对象
    map.openInfoWindow(infoWindow, point); //开启信息窗口
            </#if>
    </script>
</@ListPage.Html>