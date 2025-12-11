<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageLandingPage.master" AutoEventWireup="true" CodeFile="module_DoiMatKhau2.aspx.cs" Inherits="web_module_module_THCS_module_DoiMatKhau2" %>

<%@ Register Src="~/web_usercontrol/global_LandingPage_Menu_1.ascx" TagPrefix="uc1" TagName="global_LandingPage_Menu_1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Header" Runat="Server">
    <style>
        .block-content{
            padding: 0 24rem !important;
            background-color: unset !important;
            box-shadow: unset !important;
        }
    </style>
    <link href="../../css/gameTieuHoc.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" xintegrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Menu" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="TopWrapper" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Wrapper" Runat="Server">
<uc1:global_LandingPage_Menu_1 runat="server" ID="global_LandingPage_Menu_1" />
    <div class="">
        <div class="block-content">
            <%--<a class="btn-exit hvr-grow" href="/app-quan-li-tai-khoan">
                <img src="/images/button/btn-exit-21.png">
            </a>--%>
            <div class="block-shadown">
                <div class="title-page">Đổi Mật Khẩu</div>
                <div class="info-user-row">
                    <div class="info-user-row__left  font-large green-text " for="">Mật khẩu cũ</div>
                    <div class="info-user-row__right">
                        <input name="" type="password" id="txtMatKhauCu" runat="server" class="form-control-1" placeholder="Mật Khẩu Cũ">
                    </div>
                </div>
                <div class="info-user-row">
                    <div class="info-user-row__left font-large green-text  " for="">Mật khẩu mới</div>
                    <div class="info-user-row__right">
                        <input name="" type="password" id="txtMatKhauMoi" runat="server" class="form-control-1" placeholder="Mật Khẩu Mới">
                    </div>
                </div>
                <div class="info-user-row">
                    <div class="info-user-row__left  font-large  green-text " for="">Nhập lại mật khẩu</div>
                    <div class="info-user-row__right">
                        <input name="" type="password" id="txtNhapLaiMatKhauMoi" runat="server" class="form-control-1" placeholder="Nhập Lại mật Khẩu Mới">
                    </div>
                </div>
                <div>
                    <div class="buttom-mix mt-3">
                        <a id="btnDoiMK" class="buttom-green hvr-pulse-grow" href="#" runat="server" onserverclick="btnDoiMK_ServerClick">ĐỔI MẬT KHẨU </a>
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

