<%@ Control Language="C#" AutoEventWireup="true" CodeFile="global_LandingPage_Menu_1.ascx.cs" Inherits="web_usercontrol_global_LandingPage_Menu_1" %>
<header class="header-page wow bounceIn">
    <nav class="navbar navbar-expand navbar-light">
        <div class="container">
            <a class="navbar-brand" href="/app-thcs" onclick="DisplayLoadingIcon()">
                <img src="/images/logo_page.png" alt="" srcset="" /></a>
            <div class="collapse navbar-collapse justify-content-md-between">
                <ul class="navbar-nav">
                     <li class="nav-item">
                        <a class="nav-link" href="/app-thcs" onclick="DisplayLoadingIcon()">
                            Trang chủ
                        </a>
                    </li> 
                    <%--<li class="nav-item">
                        <a class="nav-link" href="/app-quan-li-tai-khoan" onclick="DisplayLoadingIcon()">
                            Tài khoản
                        </a>
                    </li>--%>
                    <li class="nav-item">
                        <a class="nav-link" href="/app-thong-ke" onclick="DisplayLoadingIcon()">
                           Thống kê
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/kho-luyen-tap" onclick="DisplayLoadingIcon()">
                           Kho luyện tập
                        </a>
                    </li>
                </ul>
                <!-- Menu đăng ký/đăng nhập - hiển thị khi chưa đăng nhập -->
                <ul class="navbar-nav d-none d-md-flex" id="guestMenu" runat="server">
                    <li class="nav-item">
                        <a class="nav-link" href="/app-register" onclick="DisplayLoadingIcon()">ĐĂNG KÍ</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/app-login" onclick="DisplayLoadingIcon()">ĐĂNG NHẬP</a>
                    </li>
                </ul>
                <!-- Menu avatar với đăng xuất - hiển thị khi đã đăng nhập -->
                <ul class="navbar-nav d-none d-md-flex" id="userMenu" runat="server" visible="false">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle d-flex align-items-center" href="#" id="userDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            <img id="avatarImg" runat="server"
                                 src="/images/user_noimage.jpg"
                                 style="width:35px;height:35px;border-radius:50%;margin-right:8px;" />
                            <span id="userName" runat="server" style="font-weight:500;"></span>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="userDropdown">
                            <li><a class="dropdown-item" href="/app-quan-li-tai-khoan" onclick="DisplayLoadingIcon()">Tài khoản</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item" href="/app-doi-mat-khau" onclick="DisplayLoadingIcon()">Đổi mật khẩu</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item" href="#" id="btnLogout" runat="server" onserverclick="btnLogout_ServerClick">Đăng xuất</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</header>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
