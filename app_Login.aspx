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
    <asp:ScriptManager runat="server" />
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
                        <label for="" class="lb-input">Số điện thoại</label>
                    </div>
                    <div class="input-group-animate">
                        <input name="txtPassword" type="password" id="txtPassword" runat="server" class="form-input" required />
                        <label for="password" class="lb-input">Mật khẩu</label>
                    </div>
                    <div class="text-center">
                        <input id="btnLogin" runat="server" type="submit" class="buttom-green hvr-pulse-grow" onserverclick="btnLogin_ServerClick" value="Đăng Nhập" />
                    </div>
                    <div class="text-center">
                        <a id="btnQuenMK" href="javascript:void(0)" onclick="openForgotPasswordModal()" class="<%--btn btn-logout btn-outline-primary--%>quen-mk hvr-pulse-grow mt-3">QUÊN MẬT KHẨU ?</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal Quên Mật Khẩu -->
    <div id="forgotPasswordModal" style="display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0,0,0,0.5); z-index: 9999; justify-content: center; align-items: center;">
        <div style="background: white; padding: 30px; border-radius: 10px; max-width: 500px; width: 90%; max-height: 90vh; overflow-y: auto;">
            <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px;">
                <h3 style="margin: 0; color: #1f6749;">QUÊN MẬT KHẨU</h3>
                <button onclick="closeForgotPasswordModal()" style="background: none; border: none; font-size: 24px; cursor: pointer; color: #999;">&times;</button>
            </div>
            
            <div id="forgotPasswordStep1">
                <p style="margin-bottom: 20px; color: #666;">Nhập email đăng ký để nhận mã OTP:</p>
                <div class="input-group-animate" style="margin-bottom: 15px;">
                    <input type="email" id="txtForgotEmail" class="form-input" autocomplete="off" placeholder="Email đăng ký" />
                    <label class="lb-input">Email đăng ký</label>
                </div>
                <div class="text-center">
                    <button type="button" onclick="sendOtpForgotPassword()" class="buttom-green hvr-pulse-grow" style="width: 100%;">GỬI MÃ OTP</button>
                </div>
            </div>

            <div id="forgotPasswordStep2" style="display: none;">
                <p style="margin-bottom: 20px; color: #666;">Mã OTP đã được gửi đến: <span id="lblForgotEmailShow" style="font-weight: bold; color: green;"></span></p>
                <div class="input-group-animate" style="margin-bottom: 15px;">
                    <input type="text" id="txtForgotOTP" class="form-input" autocomplete="off" placeholder="Nhập mã 6 số" maxlength="6" />
                    <label class="lb-input">Mã OTP</label>
                </div>
                <div class="text-center" style="margin-bottom: 15px;">
                    <button type="button" onclick="verifyOtpForgotPassword()" class="buttom-green hvr-pulse-grow" style="width: 100%;">XÁC NHẬN OTP</button>
                </div>
                <div class="text-center">
                    <a href="javascript:void(0)" onclick="resendOtpForgotPassword()" style="font-size: 14px; color: #1f6749;">Gửi lại mã?</a>
                </div>
            </div>

            <div id="forgotPasswordStep3" style="display: none;">
                <p style="margin-bottom: 20px; color: #666;">Nhập mật khẩu mới:</p>
                <div class="input-group-animate --password" style="margin-bottom: 15px;">
                    <input type="password" id="txtNewPassword" class="form-input" autocomplete="off" placeholder="Mật khẩu mới" />
                    <label class="lb-input">Mật khẩu mới *</label>
                    <i class="eye-icon bi bi-eye" data-target="txtNewPassword" onclick="togglePasswordVisibility(this)"></i>
                </div>
                <div class="input-group-animate --password" style="margin-bottom: 15px;">
                    <input type="password" id="txtConfirmNewPassword" class="form-input" autocomplete="off" placeholder="Xác nhận mật khẩu mới" />
                    <label class="lb-input">Xác nhận mật khẩu mới *</label>
                    <i class="eye-icon bi bi-eye" data-target="txtConfirmNewPassword" onclick="togglePasswordVisibility(this)"></i>
                </div>
                <div class="text-center">
                    <button type="button" onclick="resetPassword()" class="buttom-green hvr-pulse-grow" style="width: 100%;">ĐẶT LẠI MẬT KHẨU</button>
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

        // Quên mật khẩu functions
        function openForgotPasswordModal() {
            document.getElementById("forgotPasswordModal").style.display = "flex";
            resetForgotPasswordSteps();
        }

        function closeForgotPasswordModal() {
            document.getElementById("forgotPasswordModal").style.display = "none";
            resetForgotPasswordSteps();
        }

        function resetForgotPasswordSteps() {
            document.getElementById("forgotPasswordStep1").style.display = "block";
            document.getElementById("forgotPasswordStep2").style.display = "none";
            document.getElementById("forgotPasswordStep3").style.display = "none";
            document.getElementById("txtForgotEmail").value = "";
            document.getElementById("txtForgotOTP").value = "";
            document.getElementById("txtNewPassword").value = "";
            document.getElementById("txtConfirmNewPassword").value = "";
        }

        function sendOtpForgotPassword() {
            var email = document.getElementById("txtForgotEmail").value.trim();
            if (!email) {
                swal('Vui lòng nhập email đăng ký.', '', 'warning');
                return;
            }

            // Validate email format
            var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailRegex.test(email)) {
                swal('Email không đúng định dạng. Vui lòng kiểm tra lại.', '', 'warning');
                return;
            }

            $.ajax({
                type: "POST",
                url: "app_Login.aspx/SendOtpForgotPassword",
                data: JSON.stringify({ email: email }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var result = response.d;
                    if (result === "OK") {
                        document.getElementById("forgotPasswordStep1").style.display = "none";
                        document.getElementById("forgotPasswordStep2").style.display = "block";
                        document.getElementById("lblForgotEmailShow").textContent = email;
                        swal('Mã OTP đã được gửi đến email của bạn!', '', 'success');
                    } else if (result === "NOT_FOUND") {
                        swal('Không tìm thấy tài khoản với email này.', '', 'warning');
                    } else if (result === "NO_EMAIL") {
                        swal('Tài khoản này chưa có email. Vui lòng liên hệ bộ phận hỗ trợ.', '', 'warning');
                    } else if (result === "LIMIT_EXCEEDED") {
                        swal('Hệ thống đã vượt quá giới hạn gửi email hôm nay. Vui lòng thử lại sau 24 giờ hoặc liên hệ bộ phận hỗ trợ.', '', 'error');
                    } else if (result.indexOf("ERROR:") === 0) {
                        swal('Lỗi gửi email: ' + result.replace("ERROR: ", ""), '', 'error');
                    } else {
                        swal('Không gửi được OTP. Vui lòng thử lại.', '', 'error');
                    }
                },
                error: function (xhr, status, error) {
                    console.log("AJAX Error:", status, error);
                    swal('Lỗi máy chủ. Vui lòng thử lại.', '', 'error');
                }
            });
        }

        function verifyOtpForgotPassword() {
            var otp = document.getElementById("txtForgotOTP").value.trim();
            if (!otp) {
                swal('Vui lòng nhập mã OTP.', '', 'warning');
                return;
            }

            $.ajax({
                type: "POST",
                url: "app_Login.aspx/VerifyOtpForgotPassword",
                data: JSON.stringify({ otpClient: otp }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var result = response.d;
                    if (result === "OK") {
                        document.getElementById("forgotPasswordStep2").style.display = "none";
                        document.getElementById("forgotPasswordStep3").style.display = "block";
                        swal('OTP đúng!', '', 'success');
                    } else if (result === "INVALID") {
                        swal('OTP không đúng!', '', 'warning');
                    } else if (result === "EXPIRED") {
                        swal('OTP đã hết hạn, vui lòng gửi lại!', '', 'warning');
                    } else {
                        swal('Lỗi xác thực OTP.', '', 'error');
                    }
                },
                error: function () {
                    swal('Lỗi máy chủ. Vui lòng thử lại.', '', 'error');
                }
            });
        }

        function resendOtpForgotPassword() {
            var email = document.getElementById("txtForgotEmail").value.trim();
            if (!email) {
                swal('Vui lòng nhập email đăng ký.', '', 'warning');
                return;
            }
            sendOtpForgotPassword();
        }

        function resetPassword() {
            var newPassword = document.getElementById("txtNewPassword").value.trim();
            var confirmPassword = document.getElementById("txtConfirmNewPassword").value.trim();

            if (newPassword.length < 5) {
                swal('Mật khẩu phải có ít nhất 5 ký tự.', '', 'warning');
                return;
            }

            if (newPassword !== confirmPassword) {
                swal('Mật khẩu nhập lại không khớp.', '', 'warning');
                return;
            }

            $.ajax({
                type: "POST",
                url: "app_Login.aspx/ResetPassword",
                data: JSON.stringify({ newPassword: newPassword }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var result = response.d;
                    if (result === "OK") {
                        swal('Đặt lại mật khẩu thành công!', '', 'success').then(function () {
                            closeForgotPasswordModal();
                            window.location = '/app-login';
                        });
                    } else {
                        swal('Lỗi đặt lại mật khẩu. Vui lòng thử lại.', '', 'error');
                    }
                },
                error: function () {
                    swal('Lỗi máy chủ. Vui lòng thử lại.', '', 'error');
                }
            });
        }

        // Close modal when clicking outside
        document.getElementById("forgotPasswordModal").addEventListener("click", function (e) {
            if (e.target === this) {
                closeForgotPasswordModal();
            }
        });

        // Toggle password visibility for modal inputs
        function togglePasswordVisibility(iconElement) {
            const targetId = iconElement.getAttribute('data-target');
            const inputField = document.getElementById(targetId);

            if (!inputField) {
                console.error('Không tìm thấy trường input với ID: ' + targetId);
                return;
            }

            if (inputField.type === 'password') {
                inputField.type = 'text';
                iconElement.classList.remove('bi-eye');
                iconElement.classList.add('bi-eye-slash');
            } else {
                inputField.type = 'password';
                iconElement.classList.remove('bi-eye-slash');
                iconElement.classList.add('bi-eye');
            }
        }
    </script>
</asp:Content>

