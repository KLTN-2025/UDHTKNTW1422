<%@ Page Title="" Language="C#" MasterPageFile="~/Home_MasterPage.master" AutoEventWireup="true" CodeFile="module_DoiMatKhau.aspx.cs" Inherits="web_module_module_DoiMatKhau" %>

<%@ Register Src="~/web_usercontrol/global_header_avatar.ascx" TagPrefix="uc1" TagName="global_header_avatar" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="Server">
    <script src="../admin_js/sweetalert.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Menu" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="TopWrapper" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Wrapper" runat="Server">
    <div class="page-view page-change-pass bg-color-1 m-bottom">
        <uc1:global_header_avatar runat="server" ID="global_header_avatar" />
        <div class="block-content">
            <a class="btn-exit hvr-grow" href="/app-quan-li-tai-khoan">
                <img src="/images/button/btn-exit-21.png">
            </a>
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
<asp:Content ID="Content5" ContentPlaceHolderID="BottomWrapper" runat="Server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="Footer" runat="Server">
    <script>
        var activeMenu = document.getElementById("menu-user");
        activeMenu.classList.add("active");
    </script>
</asp:Content>

