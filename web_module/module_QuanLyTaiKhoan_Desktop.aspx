<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageLandingPage.master" AutoEventWireup="true" CodeFile="module_QuanLyTaiKhoan_Desktop.aspx.cs" Inherits="web_module_module_QuanLyTaiKhoan_Desktop" %>

<%@ Register Src="~/web_usercontrol/global_LandingPage_Menu.ascx" TagPrefix="uc1" TagName="global_LandingPage_Menu" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Header" Runat="Server">
    <style>
        .card-menu-logout {
            display: block;
            border-radius: .5rem;
            width: 25%;
            margin: -0.5rem auto;
            padding: 7px .85rem;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Menu" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="TopWrapper" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Wrapper" Runat="Server">
    <uc1:global_LandingPage_Menu runat="server" ID="global_LandingPage_Menu" />
    <div class="page-view page-user bg-color-1 m-bottom">
        <div class="block-content">
            <%-- <a href="../../app-thcs" runat="server" id="backSeverClick" class="btn-exit">
                <img src="/images/btn-exit-2.png" />
            </a>--%>
            <div class="frame-page page-style-2">
                <div class="card-manager-account">
                    <%--<div class="header-info-list">
                        <div class="info-item">
                            <div class="info-item__title ">THỜI HẠN</div>
                            <div class="info-item__text"><%=conlai_songay %> ngày</div>
                            <div class="info-item__status"><small class="badge badge-pill badge-warning"><%=canhbao_hethan %> </small></div>
                        </div>
                        <div class="info-item">
                            <div class="info-item__title ">GÓI SỬ DỤNG</div>
                            <div class="info-item__text"><%=goi_sudung %></div>
                            <div class="buttom-mix">
                                <div class="buttom-green hvr-pulse-grow">
                                    <a href="/app-gia-han-goi-thcs">GIA HẠN NGAY
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>--%>
                    <div class="card-menu info-user shadow ">
                        <a href="/app-thong-tin-ca-nhan" class="menu-row">
                            <div class="menu-row__left" for="">Thông tin cá nhân tài khoản</div>
                            <div class="menu-row__right" for=""><i class="bi bi-chevron-right"></i></div>
                        </a>
                        <a href="/app-doi-mat-khau" class="menu-row">
                            <div class="menu-row__left" for="">Đổi mật khẩu</div>
                            <div class="menu-row__right" for=""><i class="bi bi-chevron-right"></i></div>
                        </a>
                        <a href="/app-danh-sach-thong-bao" class="menu-row">
                            <div class="menu-row__left" for="">Thông Báo</div>
                            <div class="menu-row__right" for=""><i class="bi bi-chevron-right"></i></div>
                        </a>
                    </div>
                    <div class="buttom-mix">
                        <a id="btnDangXuat" href="#" runat="server" class="buttom-green hvr-pulse-grow" onserverclick="btnDangXuat_ServerClick">ĐĂNG XUẤT</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="BottomWrapper" Runat="Server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="Footer" Runat="Server">
    <script>
        var activeMenu = document.getElementById("menu-user");
        activeMenu.classList.add("active");
    </script>
</asp:Content>

