<%@ Control Language="C#" AutoEventWireup="true" CodeFile="global_LandingPage_Menu_1.ascx.cs" Inherits="web_usercontrol_global_LandingPage_Menu_1" %>
<header class="header-page wow bounceIn">
    <nav class="navbar navbar-expand navbar-light">
        <div class="container">
            <a class="navbar-brand" href="/koigo-trang-chu">
                <img src="/images/logo_page.png" alt="" srcset="" /></a>
            <div class="collapse navbar-collapse justify-content-md-between">
                <ul class="navbar-nav">
                     <li class="nav-item">
                        <a class="nav-link" href="/app-thcs" onclick="DisplayLoadingIcon()">
                            Trang chủ
                        </a>
                    </li> <li class="nav-item">
                        <a class="nav-link" href="/app-quan-li-tai-khoan" onclick="DisplayLoadingIcon()">
                            Tài khoản
                        </a>
                    </li>
                    <li class="nav-item">
                    <li class="nav-item ">
                        <a class="nav-link" href="/app-thong-ke" onclick="DisplayLoadingIcon()">
                           Thống kê
                        </a>
                    </li>
                   
                </ul>
                <%--<ul class="navbar-nav d-none d-md-flex" id="guestMenu" runat="server">
                    <li class="nav-item">
                        <a class="nav-link" href="/app-thcs" onclick="DisplayLoadingIcon()">
                            Trang chủ
                        </a>
                    </li> <li class="nav-item">
                        <a class="nav-link" href="/app-quan-li-tai-khoan" onclick="DisplayLoadingIcon()">
                            Tài khoản
                        </a>
                    </li>
                    <li class="nav-item">
                    <li class="nav-item ">
                        <a class="nav-link" href="/app-thong-ke" onclick="DisplayLoadingIcon()">
                           Thống kê
                        </a>
                    </li>
                  
                   
                </ul>--%>
            </div>
        </div>
    </nav>
</header>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
