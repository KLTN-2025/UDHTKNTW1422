<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageLandingPage.master" AutoEventWireup="true" CodeFile="app_Login.aspx.cs" Inherits="app_Login" %>

<%@ Register Src="~/web_usercontrol/global_LandingPage_Menu.ascx" TagPrefix="uc1" TagName="global_LandingPage_Menu" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="Server">
    <script src="admin_js/sweetalert.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Menu" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="TopWrapper" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Wrapper" runat="Server">
    <style>
        @keyframes autofill {
            from {
            }

            to {
            }
        }

        input:-webkit-autofill {
            animation-name: autofill;
            animation-duration: 0.1s;
        }
    </style>
    <uc1:global_LandingPage_Menu runat="server" ID="global_LandingPage_Menu" />
    <div class="custom-login-background shadow">
        <div class="login-container ">
            <div class="login-content-right ">
                <div class="logo">
                    <img src="../../images/koi_logo-3.png" class="dang" />
                </div>
                <div class="text-login">
                    <h1 class="">ĐĂNG NHẬP</h1>
                </div>
                <div class="">
                    <div class="input-group-animate">
                        <input name="txtUser" type="text" id="txtUser" runat="server" class="form-input" autocomplete="off" required />
                        <label for="" class="lb-input">Tên đăng nhập</label>
                    </div>
                    <div class="input-group-animate">
                        <input name="txtPassword" type="password" id="txtPassword" runat="server" class="form-input" required />
                        <label for="password" class="lb-input">Mật khẩu</label>
                    </div>
                    <div class="text-center">
                        <input id="btnLogin" runat="server" type="submit" class="buttom-green hvr-pulse-grow" onserverclick="btnLogin_ServerClick" value="Đăng Nhập" />
                    </div>
                    <div class="text-center">
                        <a id="btnQuenMK" href="/tieu-hoc-quen-mat-khau" class="<%--btn btn-logout btn-outline-primary--%>quen-mk hvr-pulse-grow mt-3">QUÊN MẬT KHẨU ?</a>
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
        document.addEventListener("animationstart", function (event) {
            if (event.animationName === "autofill") {
                setTimeout(() => {
                    document.querySelectorAll("input.form-input").forEach(input => {
                        if (input.matches(":-webkit-autofill") || input.value.trim() !== "") {
                            input.focus();
                        }
                    });
                }, 100); // Đợi 100ms để trình duyệt hoàn tất autofill
            }
        });
    </script>
</asp:Content>

