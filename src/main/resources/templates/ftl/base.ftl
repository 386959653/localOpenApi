<#macro Html title="" css="" headAttr="" bodyAttr="">

<!DOCTYPE HTML>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>${title}</title>
<#--jquery文件-->
    <script
            src="https://code.jquery.com/jquery-3.3.1.min.js"
            integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
            crossorigin="anonymous"></script>

    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"
            integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="../css/myStyle.css" type="text/css"/>
    <script src="https://cdn.jsdelivr.net/npm/vue@2.5.16/dist/vue.min.js"></script>
    <script src="../js/utils.js"></script>
    <link rel="stylesheet" href="../../css/adminLTE/component/font-awesome/css/font-awesome.css" type="text/css"/>


    <!--引用百度统计-->
    <script>
        var _hmt = _hmt || [];
        (function () {
            var hm = document.createElement("script");
            hm.src = "https://hm.baidu.com/hm.js?bd8fb8f9215d6240371923e76382ae02";
            var s = document.getElementsByTagName("script")[0];
            s.parentNode.insertBefore(hm, s);
        })();
    </script>

    ${headAttr}

    <style>
            ${css}
    </style>
</head>


<body ${bodyAttr}>
    <@com.MY_MODAL id="errorModal" title="错误消息"/>
    <@com.MY_MODAL id="tipModal" title="提示消息"/>
<div class="loading" style="display: none;">
    <i class="fa fa-refresh fa-spin"></i>
</div>
    <#nested>
<script>
    var errorModal = new Vue({
        el: '#errorModal',
        data: {
            content: ''
        }
    });
    var tipModal = new Vue({
        el: '#tipModal',
        data: {
            content: ''
        }
    });
</script>
</body>

</html>

</#macro>