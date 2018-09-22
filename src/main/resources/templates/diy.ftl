<#import "ftl/headerAndFooter.ftl" as ListPage>
<#import "ftl/lib.ftl" as com>

<@ListPage.Html title="自助取货 - ${companyName?if_exists}"css='
.row{width: 100%;}
.form-group{padding-left: 25px;}
.fa{display: inline-block;top: 27px;left: 6px;position: relative;color: #ccc;}
input[type="text"],input[type="password"]{padding-left:26px;}
'>

<div class="container" xmlns="http://www.w3.org/1999/html">
    <form id="diyForm" action="${ctx}/getGoods" method="post" class="form-horizontal" role="form">
        <div class="form row">
            <div class="col-md-offset-4">
                <h1 class="form-title" style="margin-left: 10px;">自助取货</h1>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group ">
                            <i class="fa fa-file-text"></i>
                            <input class="form-control required " type="text" placeholder="订单编号" id="orderNum"
                                   name="orderNum" autofocus="autofocus"/>
                        </div>
                        <div class="form-group ">
                            <i class="fa fa-envelope-o"></i>
                            <input class="form-control required " type="text" placeholder="邮箱地址" id="email"
                                   name="email" autofocus="autofocus"/>
                        </div>
                        <div class="form-group ">
                            <div class="row">
                                <div class="col-md-8 col-xs-6  ">

                                    <i class="fa fa-shield" aria-hidden="true"></i>
                                    <input class="form-control required" type="text" name="verifyCode" placeholder="验证码"
                                           id="verifyCode"/>

                                </div>
                                <div class="col-md-4 col-xs-6">
                                    <img id="verifyCodeImg" class="pull-right" alt="验证码"
                                         onclick="this.src='${ctx}/verifyCode?d='+new Date()*1" src="${ctx}/verifyCode"
                                         style="padding-top:20px;"/>
                                </div>
                            </div>
                        </div>

                        <div class="form-group ">
                            <button type="submit" class="btn btn-success pull-right" name="submit" id="submit"
                                    style="margin-bottom:10px;">取货
                            </button>
                        </div>
                    </div>
                </div>
            </div>

            <div id="verifyCodeCheckResult" style="display:<#if captchaError ??> block<#else> none</#if>"
                 class="alert alert-danger alert-dismissable text-center">
                <button type="button" class="close" data-dismiss="alert"
                        aria-hidden="true">
                    &times;
                </button>
                验证码错误，请重新输入！
            </div>

                         <#if error ??>
    <div class="alert alert-danger alert-dismissable text-center">
        <button type="button" class="close" data-dismiss="alert"
                aria-hidden="true">
            &times;
        </button>
        不存在该订单编号，请重新核对，如果您确认订单编号输入正确，可能是订单还没同步过来，请过3分钟后重试！
    </div>
                         </#if>

            <#if emailError ??>
    <div class="alert alert-danger alert-dismissable text-center">
        <button type="button" class="close" data-dismiss="alert"
                aria-hidden="true">
            &times;
        </button>
        请填写正确的邮箱格式！
    </div>
            </#if>

    <#if jrebel ??>
            <div class="well">
                <p>
                    亲，您的激活链接是：<br>
                    http://jrebel.weichi.tech:9001/${jrebel.token?if_exists}
    <@com.MY_HR/>
                    对应邮箱：<br>${jrebel.definedUserId?if_exists}
                </p>
            </div>
    </#if>
        </div>
    </form>

</div>
<script type="text/javascript">
    $('#verifyCode').focus(function () {
        $("#submit").attr("disabled", false);
    });
    $('#verifyCode').blur(function () {
        var url = "${ctx}/verifyCodeCheck";
        var data = $('#verifyCode').val().trim();
        AjaxHelper.post(url, data, function (response) {
            if (response.message == "验证码错误") {
                $('#verifyCodeCheckResult').show();
                $('#verifyCodeImg').click();
                $("#verifyCode").val("");
                $("#submit").attr("disabled", true);
            } else {
                $('#verifyCodeCheckResult').hide();
                $("#submit").attr("disabled", false);
            }
        });
    });
</script>
​
</@ListPage.Html>