function setCity() {
    $("#setCity div").slideToggle();
}

function exitSetCity(value) {
    $("#setCity div").slideToggle("fast", function () {
        $("#input_city").val(value);
        $("#current_city").text(value);
    });
}

//根据当前城市设置地图中心点
function confirmCity() {
    var value = $("#input_city").val();
    var option = {
        onSearchComplete: function (results) {
            if (local.getStatus() == BMAP_STATUS_SUCCESS) {
                if (results.getCurrentNumPois()) {
                    if (results.getCurrentNumPois()) {
                        map.setCenter(results.getPoi(0).point, 15);
                        $("#input_x").text(results.getPoi(0).point.lng);
                        $("#input_y").text(results.getPoi(0).point.lat);
                    }
                    exitSetCity(value);
                }
            } else {
                tipModal.content = "没有检索到您输入的城市";
                $('#tipModal').modal('toggle');
                exitSetCity();
            }
        }
    };
    var local = new BMap.LocalSearch(map, option);
    local.search(value);
}

//根据给定的地址设置地图的中心点
function searchLocation() {
    var site = $("#input_site").val();
    var option = {
        onSearchComplete: function (results) {
            if (local.getStatus() == BMAP_STATUS_SUCCESS) {
                if (results.getCurrentNumPois()) {
                    map.centerAndZoom(results.getPoi(0).point, 15);
                    $("#current_city").text(results.city);
                    $("#input_x").text(results.getPoi(0).point.lng);
                    $("#input_y").text(results.getPoi(0).point.lat);
                }
            } else {
                tipModal.content = "没有检索到您输入的地址";
                $('#tipModal').modal('toggle');
            }
        }
    };
    var local = new BMap.LocalSearch(map, option);
    local.search(site);
}


function citynameKeyUp() {
    if (window.event.keyCode == 13)
        confirmCity();
}

function siteKeyUp() {
    if (event.keyCode == 13)
        searchLocation();
}