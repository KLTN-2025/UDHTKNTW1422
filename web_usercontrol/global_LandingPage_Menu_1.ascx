<%@ Control Language="C#" AutoEventWireup="true" CodeFile="global_LandingPage_Menu_1.ascx.cs" Inherits="web_usercontrol_global_LandingPage_Menu_1" %>
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
                    <%--<li class="nav-item">
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
                    </li>--%>
                    <%--<li class="nav-item">
                        <a class="nav-link" href="../dinotech-tin-tuc">GÓC PHỤ HUYNH </a>
                    </li>--%>
                    <li class="nav-item d-md-none">
                        <a class="btn-menu" id="menu-home" href="/app-thcs" onclick="DisplayLoadingIcon()"><i class="bi bi-house-door"></i>
                            <p>Trang chủ</p>
                        </a>
                    </li>
                    <li class="nav-item d-md-none">
                        <a class="btn-menu" id="menu-contact" href="#" onclick="DisplayLoadingIcon()">
                            <i class="bi bi-headset"></i>
                            <p>Hỗ  trợ </p>
                        </a>
                    </li>
                    <li class="nav-item d-md-none">
                        <a class="btn-menu" id="menu-static" href="/app-thong-ke" onclick="DisplayLoadingIcon()"><i class="bi bi-graph-up-arrow"></i>

                            <p>Thống kê</p>
                        </a>
                    </li>
                    <li class="nav-item d-md-none">
                        <a class="btn-menu" id="menu-user" href="/app-quan-li-tai-khoan" onclick="DisplayLoadingIcon()"><i class="bi bi-person"></i>
                            <p>Tài khoản</p>
                        </a>
                    </li>
                </ul>
                <ul class="navbar-nav d-none d-md-flex" id="guestMenu" runat="server">
                    <li class="nav-item">
                        <a class="btn-menu" href="/app-thcs" onclick="DisplayLoadingIcon()"><i class="bi bi-house-door"></i>
                            <p>Trang chủ</p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="btn-menu" href="#" onclick="DisplayLoadingIcon()">
                            <i class="bi bi-headset"></i>
                            <p>Hỗ  trợ </p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="btn-menu" href="/app-quan-li-tai-khoan" onclick="DisplayLoadingIcon()"><i class="bi bi-person"></i>
                            <p>Tài khoản</p>
                        </a>
                    </li>
                    <li class="nav-item">
                    <li class="nav-item ">
                        <a class="btn-menu" href="/app-thong-ke" onclick="DisplayLoadingIcon()"><i class="bi bi-graph-up-arrow"></i>
                            <p>Thống kê</p>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</header>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
