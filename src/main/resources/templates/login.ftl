<#import "${ctx}/ftl/base.ftl" as ListPage>

<@ListPage.Html title="登录" headAttr='

'
css='
body{
    background: url("${ctx}/img/login.jpg");
    background-repeat: no-repeat;
}
.row{width: 100%;}
.form-group{padding-left: 25px;}
.form{background: rgba(255,255,255,0.2);margin:120px auto;}
/*阴影*/
.fa{display: inline-block;top: 27px;left: 6px;position: relative;color: #ccc;}
input[type="text"],input[type="password"]{padding-left:26px;}
.checkbox{padding-left:21px;}
'
>

<div class="container">
    <form action="/user/login" method="post">
        <div class="form row">
            <div class="col-md-offset-4" id="login_form">
                <h3 class="form-title" style="margin-left: 10px;">登录</h3>
                <div class="row">
                    <div class="form-group col-md-6">
                        <i class="fa fa-user fa-lg"></i>
                        <input class="form-control required " type="text" placeholder="用户名" id="username"
                               name="username" autofocus="autofocus"/>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-6">
                        <i class="fa fa-lock fa-lg"></i>
                        <input class="form-control required" type="password" placeholder="密码" id="password"
                               name="password"/>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-6">
                        <label class="checkbox">
                            <input type="checkbox" name="remember" value="1"/>记住我
                        </label>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-6">
                        <button type="submit" class="btn btn-success pull-right" name="submit"
                                style="margin-bottom:10px;">登录
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <#if error ??>
    <div class="alert alert-danger alert-dismissable">
        <button type="button" class="close" data-dismiss="alert"
                aria-hidden="true">
            &times;
        </button>
        用户名或密码错误，请重新输入！
    </div>
    </#if>
</div>

</@ListPage.Html>