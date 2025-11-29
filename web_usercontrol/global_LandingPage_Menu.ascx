<%@ Control Language="C#" AutoEventWireup="true" CodeFile="global_LandingPage_Menu.ascx.cs" Inherits="web_usercontrol_global_LandingPage_Menu" %>
<header class="header-page wow bounceIn">
    <nav class="navbar navbar-expand navbar-light">
        <div class="container">
            <a class="navbar-brand" href="/koigo-trang-chu">
                <img src="/images/logo_page.png" alt="" srcset="" /></a>
            <div class="collapse navbar-collapse justify-content-md-between">
                <ul class="navbar-nav">
                    <%--<li class="nav-item">
                        <a class="nav-link" href="/koigo-trang-chu">TRANG CHỦ </a>
                    </li>--%>
                    <li class="nav-item">
                        <a class="nav-link" href="/app-danh-muc-khoi-thcs-6">KHỐI 6 </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/app-danh-muc-khoi-thcs-7">KHỐI 7 </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/app-danh-muc-khoi-thcs-8">KHỐI 8 </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/app-danh-muc-khoi-thcs-9">KHỐI 9 </a>
                    </li>
                    <%--<li class="nav-item">
                        <a class="nav-link" href="../dinotech-tin-tuc">GÓC PHỤ HUYNH </a>
                    </li>--%>
                    <li class="nav-item d-md-none">
                        <a class="nav-link" href="../app-register">ĐĂNG KÍ </a>
                    </li>
                    <li class="nav-item d-md-none">
                        <a href="../app-login" class="nav-link">ĐĂNG NHẬP</a>
                    </li>
                </ul>
                <ul class="navbar-nav d-none d-md-flex" id="guestMenu" runat="server">
                    <li class="nav-item">
                        <a class="nav-link" href="../app-register">ĐĂNG KÍ </a>
                    </li>
                    <li class="nav-item">
                        <a href="../app-login" class="nav-link">ĐĂNG NHẬP</a>
                    </li>
                </ul>
                <%--<ul class="navbar-nav d-none d-md-flex" id="userMenu" runat="server" visible="false">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown">
                            <img id="avatarImg" runat="server"
                                 src="/images/user_noimage.jpg"
                                 style="width:35px;height:35px;border-radius:50%" />
                            <span id="userName" runat="server" style="font-weight:500;color:#fff;"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="/app-quan-li-tai-khoan">Hồ sơ</a></li>
                            <li><a class="dropdown-item" href="#" id="btnLogout" runat="server" onserverclick="btnLogout_ServerClick">Đăng xuất</a></li>
                        </ul>
                    </li>
                </ul>--%>
            </div>
        </div>
    </nav>
</header>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

