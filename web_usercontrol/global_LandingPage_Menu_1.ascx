<%@ Control Language="C#" AutoEventWireup="true" CodeFile="global_LandingPage_Menu_1.ascx.cs" Inherits="web_usercontrol_global_LandingPage_Menu_1" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<style>
    /* Fix logo to be above quiz container */
    .header-page {
        position: relative !important;
        z-index: 1000 !important;
    }
    .navbar {
        position: relative !important;
        z-index: 1000 !important;
    }
    .navbar-brand {
        position: relative !important;
        z-index: 1001 !important;
    }
    /* Custom dropdown menu styling */
    .dropdown-menu {
        border: none !important;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15) !important;
        border-radius: 8px !important;
        padding: 8px 0 !important;
        margin-top: 8px !important;
        min-width: 200px !important;
        background: white !important;
    }
    .dropdown-item {
        padding: 12px 20px !important;
        color: #333 !important;
        font-size: 15px !important;
        transition: all 0.2s ease !important;
        border: none !important;
        display: flex !important;
        align-items: center !important;
        gap: 10px !important;
        text-decoration: none !important;
    }
    .dropdown-item i {
        font-size: 18px !important;
        width: 20px !important;
        text-align: center !important;
        color: #666 !important;
        transition: color 0.2s ease !important;
    }
    .dropdown-item span {
        flex: 1 !important;
    }
    .dropdown-item:hover,
    .dropdown-item:focus {
        background-color: #f8f9fa !important;
        color: #b51a1a !important;
    }
    .dropdown-item:hover i,
    .dropdown-item:focus i {
        color: #b51a1a !important;
    }
    .dropdown-item:active {
        background-color: #e9ecef !important;
        color: #b51a1a !important;
    }
    .dropdown-item:active i {
        color: #b51a1a !important;
    }
    .dropdown-divider {
        margin: 6px 0 !important;
        border-top: 1px solid #e9ecef !important;
    }
    /* Style dropdown toggle */
    .dropdown-toggle::after {
        margin-left: 8px !important;
        vertical-align: 0.2em !important;
    }
</style>
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
                           Tiến độ học tập
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/kho-luyen-tap" onclick="DisplayLoadingIcon()">
                          Bài kiểm tra
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/app-chung-chi" onclick="DisplayLoadingIcon()">
                           Chứng chỉ
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
                            <li><a class="dropdown-item" href="/app-thong-tin-ca-nhan" onclick="DisplayLoadingIcon()">
                                <i class="bi bi-person"></i>
                                <span>Tài khoản</span>
                            </a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item" href="/app-doi-mat-khau" onclick="DisplayLoadingIcon()">
                                <i class="bi bi-key"></i>
                                <span>Đổi mật khẩu</span>
                            </a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item" href="#" id="btnLogout" runat="server" onserverclick="btnLogout_ServerClick">
                                <i class="bi bi-box-arrow-right"></i>
                                <span>Đăng xuất</span>
                            </a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</header>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
