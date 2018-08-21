<#import "../../ftl/base.ftl" as ListPage>
<#macro Html title="" css="" headAttr="">
    <@ListPage.Html title="${title}" css="${css}"
    headAttr='<link rel="stylesheet" href="../../../css/adminLTE/AdminLTE.min.css" type="text/css"/>
<link rel="stylesheet" href="../../../css/adminLTE/skins/_all-skins.min.css" type="text/css"/>
${headAttr}'
    bodyAttr='class="skin-blue sidebar-mini wysihtml5-supported" style="height: auto; min-height: 100%;"'>
        <div class="wrapper">
            <header class="main-header">
                <!-- Logo -->
                <a href="../../index" class="logo">
                    <!-- mini logo for sidebar mini 50x50 pixels -->
                    <span class="logo-mini"><b>A</b>LT</span>
                    <!-- logo for regular state and mobile devices -->
                    <span class="logo-lg">${companyName?if_exists}</span>
                </a>
                <!-- Header Navbar: style can be found in header.less -->
                <nav class="navbar navbar-static-top">

                </nav>
            </header>

            <!-- Left side column. contains the logo and sidebar -->
            <aside class="main-sidebar">
                <!-- sidebar: style can be found in sidebar.less -->
                <section class="sidebar">
                    <!-- Sidebar user panel -->
                    <div class="user-panel">
                        <div class="pull-left image">
                            <img src="../../../img/defaultAvatar.jpg" class="img-circle" alt="User Image">
                        </div>
                        <div class="pull-left info">
                            <p>Alexander Pierce</p>
                            <a href="#"><i class="fa fa-sign-out"></i> 退出登录</a>
                        </div>
                    </div>

                    <!-- sidebar menu: : style can be found in sidebar.less -->
                    <ul class="sidebar-menu tree" data-widget="tree">
                        <li class="header">MAIN NAVIGATION</li>
                        <li <#if activeFlag="index" >class="active"</#if> ><a href="index"><i
                                class="fa fa-picture-o"></i> <span>设置首页</span></a>
                        <li <#if activeFlag="product/1" >class="active"</#if> ><a href="product"><i
                                class="fa fa-product-hunt"></i> <span>设置产品</span></a>
                        <li <#if activeFlag="contact" >class="active"</#if> ><a href="contact"><i
                                class="fa fa-phone"></i> <span>设置联系方式</span></a>
                        </li>

                    </ul>
                </section>
                <!-- /.sidebar -->
            </aside>

            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper" style="min-height: 901px;">
<#nested>
            </div>

            <footer class="main-footer">
                <div class="well text-center">Copyright ©
                    2018 ${companyName?if_exists}
                    All rights reserved
                </div>
            </footer>

            <!-- Control Sidebar右边导航栏 -->
            <aside class="control-sidebar control-sidebar-dark">

            </aside>

            <!-- Add the sidebar's background. This div must be placed
                 immediately after the control sidebar -->
            <div class="control-sidebar-bg"></div>
        </div>

    </@ListPage.Html>
</#macro>

