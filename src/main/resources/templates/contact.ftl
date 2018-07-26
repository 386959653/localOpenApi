<#import "ftl/headerAndFooter.ftl" as ListPage>

<@ListPage.Html title="杭州伟驰科技有限公司 - 联系我们">
<div class="container">
    <div class="row">
        <p style="text-align:center;">
        <h1 align="center"> 联系我们 </h1>
        </p>
        <div class="col-sm-3 col-lg-6">
            <address>
                <p class="text-success"><strong>QQ</strong></p>
                <h3> 386959653</h3>
                <p class="text-muted">这是最推荐的方式，大部分时间这个QQ都会有人在线，很多时候都是秒回。</p>
            </address>

        </div>
        <div class="col-sm-3 col-lg-6">
            <address>
                <p class="text-success"><strong>EMAIL</strong></p>
                <h3>386959653@qq.com</h3>
                <p class="text-muted">一般当天回复，最晚24小时内回复。如果24小时没人回复，说明邮件没收到，可以改用QQ。</p>
            </address>
        </div>
    </div>
    <HR>
    <!--百度地图容器-->
    <div class="row">
        <div id="allmap" class="col-xs-10 col-lg-10 col-xs-offset-1" style=" user-select: none; height: 390px;"></div>
    </div>
</div>

<script type="text/javascript">
    // 百度地图API功能
    var map = new BMap.Map("allmap");    // 创建Map实例
    var point = new BMap.Point(120.224788, 30.257314); // 初始化地图,设置中心点坐标和地图级别
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
    map.setCurrentCity("杭州");          // 设置地图显示的城市 此项是必须设置的
    map.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放
    //添加信息窗口
    var opts = {
        width: 100,     // 信息窗口宽度
        height: 50,     // 信息窗口高度
        title: "杭州伟驰科技有限公司" // 信息窗口标题
    }
    var infoWindow = new BMap.InfoWindow("", opts);  // 创建信息窗口对象
    map.openInfoWindow(infoWindow, point); //开启信息窗口
</script>
​
</@ListPage.Html>