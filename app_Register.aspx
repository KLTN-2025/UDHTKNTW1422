<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageLandingPage.master" AutoEventWireup="true" CodeFile="app_Register.aspx.cs" Inherits="app_Register" %>

<%@ Register Src="~/web_usercontrol/global_LandingPage_Menu.ascx" TagPrefix="uc1" TagName="global_LandingPage_Menu" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Header" Runat="Server">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <style>
        .step-contact .step-content .section-contact .form-contact__title {
            margin-top: 1rem;
        }
    </style>
    <script src="admin_js/sweetalert.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Menu" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="TopWrapper" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Wrapper" Runat="Server">
    <uc1:global_LandingPage_Menu runat="server" ID="global_LandingPage_Menu" />
    <asp:ScriptManager runat="server" />
    <div id="" class="step-contact">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-xl-5 col-lg-6 col-md-8 col-sm-11">
                    <div class="step-header">
                        <div class="progress px-1" style="height: 3px;">
                            <div class="progress-bar" role="progressbar" style="width: 0%;" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                        <div class="step-container d-flex justify-content-between">
                            <div class="step-circle step-one">1</div>
                            <div class="step-circle step-two">2</div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="multi-step-form" class="step-content">
                <asp:UpdatePanel ID="update" runat="server">
                    <ContentTemplate>
                        <div class="step step-1" style="<%= style1 %>">
                            <div class="row justify-content-center">
                                <div class="col-xl-5 col-lg-6 col-md-8 col-sm-11">
                                    <div class="step-block">
                                        <div class="section-contact">
                                            <div class="form-contact">
                                                <h3 class="form-contact__title">Nhập thông tin</h3>
                                                <div class="input-group-animate">

                                                    <input id="txtHoTen" type="text" class="form-input validateForm" runat="server" name="txtName" value="" autocomplete="off" required />
                                                    <label for="" class="lb-input">Họ tên bé *</label>
                                                </div>
                                                <div class="input-group-animate">

                                                    <input id="txtSoDienThoai" type="text" class="form-input validateForm" runat="server" name="txtPhone" value="" onkeypress="return onlyNumberKey(event)" autocomplete="off" required />
                                                    <label for="" class="lb-input">Điện thoại (Zalo) *</label>
                                                </div>
                                                <div class="input-group-animate">

                                                    <input id="txtEmail" type="text" class="form-input" runat="server" name="txtPhone" value="" autocomplete="off" />
                                                    <label for="" class="lb-input">Gmail </label>
                                                </div>
                                                <div class="form-contact__input-2">
                                                    <asp:DropDownList ID="ddlLop" CssClass="form-control-select" runat="server"></asp:DropDownList>
                                                </div>

                                                <div class="text-center">
                                                    <button type="button" id="btnTiepTheo" class="buttom-green next-step hvr-pulse-grow ">TIẾP THEO</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="step step-2" style="<%= style2 %>">
                            <div class="row justify-content-center">
                                <div class="col-xl-5 col-lg-6 col-md-8 col-sm-11">
                                    <div class="step-block">
                                        <div class="section-contact">
                                            <div class="form-contact">
                                                <h3 class="form-contact__title">Thiết lập mật khẩu</h3>
                                                <div class="input-group-animate">
                                                    <input id="txtTaiKhoan" type="text" class="form-input --focus" disabled="disabled" />
                                                    <label for="" class="lb-input">Tài khoản:</label>
                                                </div>
                                                <div class="input-group-animate --password">
                                                    <input id="txtPassWord" type="password" class="form-input" runat="server" autocomplete="off" required />
                                                    <label for="" class="lb-input">Mật khẩu *</label>
                                                    <i class="eye-icon bi bi-eye" data-target="Wrapper_txtPassWord"></i>
                                                </div>
                                                <div class="input-group-animate --password">
                                                    <input id="txtPassWordConfirm" type="password" class="form-input" runat="server" autocomplete="off" required />
                                                    <label for="" class="lb-input">Xác nhận mật khẩu *</label>
                                                    <i class="eye-icon bi bi-eye" data-target="Wrapper_txtPassWordConfirm"></i>
                                                </div>
                                                <div class="text-center">
                                                    <asp:Button Text="Lưu" CssClass="buttom-green hvr-pulse-grow" runat="server" ID="btnLuu" OnClientClick="return checkPass()" OnClick="btnLuu_Click" />
                                                    <%--<asp:Button Text="Lưu" CssClass="buttom-green hvr-pulse-grow" runat="server" ID="btnLuu" />--%>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>
    <script>
        // HÀM XỬ LÝ ẨN/HIỆN MẬT KHẨU
        function togglePasswordVisibility(iconElement) {
            // 1. Lấy ID của input liên quan từ thuộc tính data-target
            const targetId = iconElement.getAttribute('data-target');
            const inputField = document.getElementById(targetId);

            if (!inputField) {
                console.error('Không tìm thấy trường input với ID: ' + targetId);
                return;
            }

            // 2. Chuyển đổi loại input và icon (Sử dụng class của Bootstrap Icons)
            if (inputField.type === 'password') {
                inputField.type = 'text';
                iconElement.classList.remove('bi-eye');
                iconElement.classList.add('bi-eye-slash'); // Icon mắt gạch ngang
            } else {
                inputField.type = 'password';
                iconElement.classList.remove('bi-eye-slash');
                iconElement.classList.add('bi-eye'); // Icon mắt mở
            }
        }

        // GẮN SỰ KIỆN LẮNG NGHE CHO TẤT CẢ ICON
        document.addEventListener('DOMContentLoaded', () => {
            const eyeIcons = document.querySelectorAll('.eye-icon');

            eyeIcons.forEach(icon => {
                // Gán hàm togglePasswordVisibility khi icon được click
                icon.addEventListener('click', () => {
                    togglePasswordVisibility(icon);
                });
            });

            // Xử lý class --focus cho label nếu input đã có giá trị khi tải trang
            const formInputs = document.querySelectorAll('.form-input');
            formInputs.forEach(input => {
                // Đảm bảo label for khớp với input id
                const label = input.nextElementSibling;
                if (label && input.id) {
                    label.setAttribute('for', input.id);
                }

                if (input.value !== "") {
                    input.classList.add('--focus');
                }

                // Thêm/bỏ class --focus khi gõ (cho trường hợp người dùng xóa hết nội dung)
                input.addEventListener('input', () => {
                    if (input.value !== "") {
                        input.classList.add('--focus');
                    } else {
                        input.classList.remove('--focus');
                    }
                });
            });
        });
    </script>
    <script>
        document.querySelectorAll(".copyButton").forEach(button => {
            button.addEventListener("click", () => {
                const targetId = button.getAttribute("data-target");
                const text = document.getElementById(targetId).textContent;
                navigator.clipboard.writeText(text).then(() => {
                    alert("Đã sao chép!");
                }, err => {
                    console.error('Không thể sao chép: ', err);
                });
            });
        });
        function onlyNumberKey(evt) {
            // Lấy mã ASCII của ký tự được nhập vào
            var ASCIICode = (evt.which) ? evt.which : event.keyCode;
            // Kiểm tra nếu ký tự không phải là số hoặc không phải các phím điều khiển (control keys)
            if (ASCIICode > 31 && (ASCIICode < 48 || ASCIICode > 57)) {
                return false;
            }
            return true;
        }
        var currentStep = 1;
        var updateProgressBar;

        function displayStep(stepNumber) {
            if (stepNumber >= 1 && stepNumber <= 2) {
                $(".step-" + currentStep).hide();
                $(".step-" + stepNumber).show();
                currentStep = stepNumber;
                updateProgressBar();
            }
        }

        $(document).ready(function () {
            $("#multi-step-form").find(".step").slice(1).hide();


            $(".next-step").click(function () {
                if (currentStep < 2) {
                    valid = true;
                    isValidPhone = true;
                    y = $("input.form-input, select"); //get input and select option
                    _validate = $("input.validateForm"); //input required
                    for (i = 0; i < y.length; i++) {
                        if (y[i].value == "Chọn lớp") {
                            valid = false;
                        }
                    }
                    for (i = 0; i < _validate.length; i++) {
                        if (_validate[i].value == "") {
                            valid = false;
                        }
                    }
                    //check validate input number phone
                    const phoneInput = document.getElementById("Wrapper_txtSoDienThoai").value.trim();
                    // Biểu thức regex kiểm tra số điện thoại Việt Nam (10 số, bắt đầu bằng 03,05,07,08,09)
                    const phoneRegex = /^(0[3|5|7|8|9])[0-9]{8}$/;

                    if (!phoneRegex.test(phoneInput)) {
                        isValidPhone = false;
                    }

                    if (valid == false) {
                        swal('Vui lòng nhập đầy đủ thông tin trước khi qua bước tiếp theo', '', 'warning');
                        return;
                    }
                    if (isValidPhone == false) {
                        swal('Vui lòng nhập đúng số điện thoại Việt Nam (10 số, bắt đầu bằng 03, 05, 07, 08 hoặc 09).', '', 'warning').then(function () { document.getElementById("Wrapper_txtSoDienThoai").focus(); })
                        return;
                    }
                    // Check trùng SĐT qua AJAX (gọi nhanh đến server)
                    $.ajax({
                        url: '/Handler/checkPhone_Register.ashx',
                        type: 'GET',
                        data: { phone: phoneInput },
                        success: function (response) {
                            if (response === "exists") {
                                swal('Số điện thoại này đã được đăng ký trước đó.', '', 'warning');
                            } else if (response === "ok") {
                                // → Cho qua bước tiếp theo
                                $(".step-" + currentStep).addClass("animate__animated animate__fadeOutLeft");
                                //gán lại sđt cho input tài khoản
                                $("#txtTaiKhoan").val(phoneInput);
                                currentStep++;
                                setTimeout(function () {
                                    $(".step").removeClass("animate__animated animate__fadeOutLeft").hide();
                                    $(".step-" + currentStep)
                                        .show()
                                        .addClass("animate__animated animate__fadeInRight");
                                    updateProgressBar();
                                }, 500);
                            } else {
                                swal('Lỗi kiểm tra số điện thoại. Vui lòng thử lại.', '', 'error');
                            }
                        },
                        error: function () {
                            swal('Không thể kết nối đến máy chủ để kiểm tra số điện thoại.', '', 'error');
                        }
                    });
                    //else {
                    //    $(".step-" + currentStep).addClass(
                    //        "animate__animated animate__fadeOutLeft"
                    //    );
                    //    currentStep++;
                    //    setTimeout(function () {
                    //        $(".step").removeClass("animate__animated animate__fadeOutLeft").hide();
                    //        $(".step-" + currentStep)
                    //            .show()
                    //            .addClass("animate__animated animate__fadeInRight");
                    //        updateProgressBar();
                    //    }, 500);
                    //}
                }
            });

            $(".prev-step").click(function () {
                if (currentStep > 1) {
                    $(".step-" + currentStep).addClass(
                        "animate__animated animate__fadeOutRight"
                    );
                    currentStep--;
                    setTimeout(function () {
                        $(".step")
                            .removeClass("animate__animated animate__fadeOutRight")
                            .hide();
                        $(".step-" + currentStep)
                            .show()
                            .addClass("animate__animated animate__fadeInLeft");
                        updateProgressBar();
                    }, 500);
                }
            });

            updateProgressBar = function () {
                var progressPercentage = ((currentStep - 1)) * 100;
                if (progressPercentage == 50) {
                    $('.step-two').addClass('active');
                    $('.step-three').removeClass('active');
                }
                else if (progressPercentage == 100) {
                    $('.step-three').addClass('active');
                }
                else {
                    $('.step-circle').removeClass('active');
                }
                $(".progress-bar").css("width", progressPercentage + "%");
            };
        });
        function checkPass() {
            const password = document.getElementById("Wrapper_txtPassWord").value.trim();
            const confirmPassword = document.getElementById("Wrapper_txtPassWordConfirm").value.trim();

            if (password.length < 5) {
                swal('Mật khẩu phải có ít nhất 5 ký tự.', '', 'warning').then(function () { document.getElementById("Wrapper_txtPassWord").focus(); })
                return false;
            }
            // Kiểm tra nhập lại mật khẩu
            if (password !== confirmPassword) {
                swal('Mật khẩu nhập lại không khớp.', '', 'warning').then(function () { document.getElementById("Wrapper_txtPassWordConfirm").focus(); })
                return false;
            }

            return true;
        }
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="BottomWrapper" Runat="Server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="Footer" Runat="Server">
</asp:Content>

