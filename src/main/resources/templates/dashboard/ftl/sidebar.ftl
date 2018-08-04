<#import "../../ftl/base.ftl" as ListPage>
<#macro Html title="" css="">
    <@ListPage.Html title="${title}" css="${css}"
    headAttr='<link rel="stylesheet" href="../../../css/adminLTE/AdminLTE.min.css" type="text/css"/>
<link rel="stylesheet" href="../../../css/adminLTE/skins/_all-skins.min.css" type="text/css"/>'
    bodyAttr='class="skin-blue sidebar-mini wysihtml5-supported" style="height: auto; min-height: 100%;"'>
        <div class="wrapper">

            <header class="main-header">
                <!-- Logo -->
                <a href="../../index2.html" class="logo">
                    <!-- mini logo for sidebar mini 50x50 pixels -->
                    <span class="logo-mini"><b>A</b>LT</span>
                    <!-- logo for regular state and mobile devices -->
                    <span class="logo-lg"><b>Admin</b>LTE</span>
                </a>
                <!-- Header Navbar: style can be found in header.less -->
                <nav class="navbar navbar-static-top">


                </nav>
            </header>

            <!-- Left side column. contains the logo and sidebar -->
            <aside class="main-sidebar">
                <!-- sidebar: style can be found in sidebar.less -->
                <section class="sidebar">
                    <!-- sidebar menu: : style can be found in sidebar.less -->
                    <ul class="sidebar-menu tree" data-widget="tree">
                        <li class="header">MAIN NAVIGATION</li>

                    </ul>
                </section>
                <!-- /.sidebar -->
            </aside>

            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
<#nested>
            </div>

            <footer class="main-footer">
                <div class="well text-center" style="background-color: #9d9d9d  ;color: floralwhite">Copyright ©
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

