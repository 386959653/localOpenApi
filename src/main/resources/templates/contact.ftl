<#import "ftl/headerAndFooter.ftl" as ListPage>

<@ListPage.Html title="${companyName?if_exists} - 联系我们">
<div class="container">
    <div class="row">
        <p style="text-align:center;">
        <h1 align="center"> 联系我们 </h1>
        </p>
        <div class="col-sm-3 col-lg-6">
            <address>
                <p class="text-success"><strong>QQ</strong></p>
                <h3> ${contact.qq?if_exists}</h3>
                <p class="text-muted">${contact.qqDescp?if_exists}</p>
            </address>

        </div>
        <div class="col-sm-3 col-lg-6">
            <address>
                <p class="text-success"><strong>EMAIL</strong></p>
                <h3>${contact.email?if_exists}</h3>
                <p class="text-muted">${contact.emailDescp?if_exists}</p>
            </address>
        </div>
    </div>
    <HR>
    <!--百度地图容器-->
    <div class="row">
        <div id="allmap" class="col-xs-10 col-lg-10 col-xs-offset-1" style=" user-select: none; height: 390px;"></div>
    </div>
</div>
    <#if contact.gpsAddress??&&contact.city??>
    <#--百度地图API功能-->
<script type="text/javascript">
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
</script>
    </#if>
​
</@ListPage.Html>