<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageLandingPage.master" AutoEventWireup="true" CodeFile="module_ThongTinCaNhan2.aspx.cs" Inherits="web_module_module_ThongTinCaNhan2" %>

<%@ Register Src="~/web_usercontrol/global_LandingPage_Menu_1.ascx" TagPrefix="uc1" TagName="global_LandingPage_Menu_1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Header" Runat="Server">
    <style>
        .block-content{
            padding: 0 24rem !important;
            background-color: unset !important;
            box-shadow: unset !important;
        }

        .bg-ttcn {
            background-image: url(/images/bg-red-ttcn.png);
            background-size: cover;
            background-repeat: no-repeat;
            min-height: 100vh;
        }
    </style>
    <link href="../css/gameTieuHoc.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" xintegrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <script src="../admin_js/sweetalert.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Menu" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="TopWrapper" Runat="Server">
<uc1:global_LandingPage_Menu_1 runat="server" ID="global_LandingPage_Menu_1" />
    <div class="bg-ttcn">
        <div class="header-avatar-edit">
            <div class="user-avatar ">
                <div id="up1" class="user-avatar__image">
                    <asp:FileUpload CssClass="hidden-xs-up" ID="FileUpload1" runat="server" onchange="showPreview1(this)" Style="display: none" accept=".png,.jpeg,.jpg" />
                    <button type="button" class="change-avatar" onclick="clickavatar1()">
                        <img id="imgPreview1" ClientIDMode="Static" runat="server" src="../../images/user_noimage.jpg" class="user-avatar__image" />
                    </button>
                </div>
            </div>
        </div>

        <div class="block-content">
            <%--<a class="btn-exit hvr-grow" href="/app-quan-li-tai-khoan" onclick="DisplayLoadingIcon()">
                <img src="/images/button/btn-exit-21.png">
            </a>--%>
            <div class="block-shadown">
                <div class="title-page">THÔNG TIN CÁ NHÂN</div>
                <%--<div class="info-user-row ">
                    <div class="info-user-row__left text-success green-text ">Tên đăng nhập</div>
                    <div class="buttom-mix">
                        <span><%=tendangnhap %></span>
                    </div>
                </div>--%>
                <div class="info-user-row">
                    <div class="info-user-row__left green-text  ">
                        Số điện thoại
                        <br />
                        (Tên đăng nhập)
                    </div>
                    <div class="info-user-row__right">
                        <input id="txtSoDienThoai" runat="server" type="text" class="form-control-1" onkeypress="return onlyNumberKey(event)" placeholder="Số Điện Thoại" value="">
                    </div>
                </div>
                <div class="info-user-row">
                    Lưu ý: Thay đổi số điện thoại sẽ thay đổi tên đăng nhập mới
                </div>
                <div class="info-user-row">
                    <div class="info-user-row__left green-text  ">Họ và tên</div>
                    <div class="info-user-row__right">
                        <input id="txtHoTen" runat="server" name="" type="text" class="form-control-1" placeholder="Họ và tên" value="Họ và tên">
                    </div>
                </div>
                <div class="info-user-row">
                    <div class="info-user-row__left  green-text ">Lớp</div>
                    <div class="info-user-row__right">
                        <%--      <%=lop %>--%>
                        <input name="" type="text" id="txtLop" runat="server" class="form-control-1" placeholder="Lớp" value="" readonly="readonly" style="background-color: #f5f5f5; cursor: not-allowed;">
                    </div>
                </div>
                <div class="info-user-row">
                    <div class="info-user-row__left green-text  ">Ngày sinh</div>
                    <div class="info-user-row__right">
                        <input name="" type="date" id="dteNgaySinh" runat="server" class="form-control-1" onkeypress="return onlyNumberKey(event)" placeholder="Ngày sinh" value="">
                    </div>
                </div>

                <div class="info-user-row">
                    <div class="info-user-row__left green-text  ">Email</div>
                    <div class="info-user-row__right">
                        <input name="" type="text" id="txtEmail" runat="server" class="form-control-1" placeholder="Email">
                    </div>
                </div>

                <%--<div class="info-user-row">
                    <div class="info-user-row__left ">Giới tính</div>
                    <div class="info-user-row__right">
                        <div class="checkbox-sex">
                            <input type="radio" id="rdNam" runat="server" name="sex" value="male">
                            <label for="male">Nam</label>
                            <input type="radio" id="rdNu" runat="server" name="sex" value="female">
                            <label for="female">Nữ</label>
                        </div>
                    </div>
                </div>--%>

                <div>
                    <div class="buttom-mix mt-3">
                        <a class="buttom-green hvr-pulse-grow" id="btnSave" href="#" runat="server" onserverclick="btnSave_ServerClick">CẬP NHẬT</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Wrapper" Runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="BottomWrapper" Runat="Server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="Footer" Runat="Server">
     <script>
        function clickavatar1() {
            $("#up1 input[type=file]").click();
        }
        function showPreview1(input) {
            if (input.files && input.files[0]) {
                var filerdr = new FileReader();
                filerdr.onload = function (e) {
                    $('#imgPreview1').attr('src', e.target.result);
                }
                filerdr.readAsDataURL(input.files[0]);
            }
        }
        function showImg1(img) {
            $('#Wrapper_imgPreview1').attr('src', img);
        }
        function onlyNumberKey(evt) {
            // Lấy mã ASCII của ký tự được nhập vào
            var ASCIICode = (evt.which) ? evt.which : event.keyCode;
            // Kiểm tra nếu ký tự không phải là số hoặc không phải các phím điều khiển (control keys)
            if (ASCIICode > 31 && (ASCIICode < 48 || ASCIICode > 57)) {
                return false;
            }
            return true;
        }
     </script>
    <script>
        var activeMenu = document.getElementById("menu-user");
        activeMenu.classList.add("active");
    </script>
</asp:Content>

