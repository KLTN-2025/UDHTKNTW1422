<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_MasterPage.master" AutoEventWireup="true" CodeFile="module_GameNoi.aspx.cs" Inherits="admin_page_module_function_module_NhapLieuGame_module_GameNoi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headlink" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="hihead" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="himenu" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="hibodyhead" runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="hibodywrapper" runat="Server">
    <link href="../../../../css/loading.css" rel="stylesheet" />
    <div class="loading" id="img-loading-icon" style="display: none">
        <div class="loading">Loading&#8230;</div>
    </div>
    <div class="card">
        <div class="container-fluid pt-1">
            <h3 style="text-align: center; font-size: 28px; font-weight: bold; color: blue">NỐI</h3>
            <div class="form-group row">
                <div class="col-sm-10">
                    <asp:UpdatePanel ID="udButton" runat="server">
                        <ContentTemplate>
                            <%--<asp:Button ID="btnThem" runat="server" Text="Thêm" CssClass="btn btn-primary" OnClientClick="popupTracNghiem.Show(); return false;" UseSubmitBehavior="false" />--%>
                            <asp:Button ID="btnThem" runat="server" Text="Thêm" CssClass="btn btn-primary" OnClick="btnThem_Click" OnClientClick="DisplayLoadingIcon();" />
                            <asp:Button ID="btnChiTiet" runat="server" Text="Chi tiết" CssClass="btn btn-primary" OnClick="btnChiTiet_Click" OnClientClick="DisplayLoadingIcon();" />
                            <asp:Button ID="btnXoa" runat="server" Text="Xóa" CssClass="btn btn-primary" OnClick="btnXoa_Click" OnClientClick="DisplayLoadingIcon();" />
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
            <div class="form-group table-responsive">
                <%--<div class="form-group col-sm-4" style="dis: flex">
                    <asp:DropDownList ID="ddlChonLop" CssClass="form-control" runat="server" OnSelectedIndexChanged="ddlChonLop_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                    <asp:DropDownList ID="ddlChonSach" CssClass="form-control" runat="server" OnSelectedIndexChanged="ddlChonSach_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                    <asp:DropDownList ID="ddlChonBai" CssClass="form-control" runat="server" OnSelectedIndexChanged="ddlChonBai_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                </div>--%>
                <dx:ASPxGridView ID="grvNoi" runat="server" ClientInstanceName="grvNoi" KeyFieldName="noi_id" Width="100%">
                    <Columns>
                        <dx:GridViewCommandColumn ShowSelectCheckbox="True" SelectAllCheckboxMode="Page" VisibleIndex="0" Width="0%">
                        </dx:GridViewCommandColumn>
                        <dx:GridViewDataColumn Caption="Sách" FieldName="sach_title" HeaderStyle-HorizontalAlign="Center" CellStyle-HorizontalAlign="Center" Width="10%"></dx:GridViewDataColumn>
                        <dx:GridViewDataColumn Caption="Bài học" FieldName="baihoc_title" HeaderStyle-HorizontalAlign="Center" CellStyle-HorizontalAlign="Center" Width="10%"></dx:GridViewDataColumn>
                        <dx:GridViewDataColumn Caption="Tiêu đề" FieldName="noi_noidung" HeaderStyle-HorizontalAlign="Center" CellStyle-HorizontalAlign="Center" Width="6%"></dx:GridViewDataColumn>
                    </Columns>
                    <%--<ClientSideEvents RowDblClick="btnChiTiet" />--%>
                    <SettingsSearchPanel Visible="true" />
                    <SettingsBehavior AllowFocusedRow="true" />
                    <SettingsText EmptyDataRow="Không có dữ liệu" SearchPanelEditorNullText="Nhập từ cần tìm kiếm..." />
                    <SettingsLoadingPanel Text="Đang tải..." />
                    <SettingsPager PageSize="8" Summary-Text="Trang {0} / {1} ({2} dòng)"></SettingsPager>
                </dx:ASPxGridView>
            </div>
        </div>
    </div>
    <dx:ASPxPopupControl ID="popupNoi" runat="server" Width="1000px"
        CloseAction="CloseButton" ShowCollapseButton="True" ShowMaximizeButton="True" ScrollBars="Auto"
        CloseOnEscape="true" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter"
        ClientInstanceName="popupNoi" ShowFooter="true" HeaderText="THÊM DỮ LIỆU NỐI" AllowDragging="True"
        PopupAnimationType="Fade" EnableViewState="False" AutoUpdatePosition="true">
        <ContentCollection>
            <dx:PopupControlContentControl runat="server">
                <%--  <div class="modal-dialog" role="document">--%>
                <asp:UpdatePanel ID="udPopup" runat="server">
                    <ContentTemplate>
                        <!-- Hàng 1: Sách và Bài học -->
                        <div class="row">
                            <div class="col-6 form-group">
                                <label>Chọn Sách:</label>
                                <dx:ASPxComboBox ID="ddlSach" runat="server" ValueType="System.Int32" TextField="sach_title" ValueField="sach_id" Width="50%" OnSelectedIndexChanged="ddlSach_SelectedIndexChanged" AutoPostBack="true" />
                            </div>
                            <div class="col-6 form-group">
                                <label>Chọn Bài học:</label>
                                <dx:ASPxComboBox ID="ddlBaiHoc" runat="server" ValueType="System.Int32" TextField="baihoc_title" ValueField="baihoc_id" Width="80%" />
                            </div>
                        </div>
                        <!-- Hàng 2: Tiêu đề và Câu hỏi -->
                        <div class="form-group">
                            <div style="display: flex; align-items: flex-start; gap: 20px; width: 100%;">
                                <div style="display: flex; flex-direction: column; width: 50%;">
                                    <label>Tiêu đề (1 bài nhập 1 lần):</label>
                                    <asp:TextBox ID="txtTieuDe" runat="server" CssClass="form-control" autocomplete="off" Width="70%" />
                                </div>
                            </div>

                            <br />
                        </div>
                        <div class="form-group">
                            <div style="display: flex; justify-content: space-between; gap: 30px;">
                                <!-- Bên trái: Hình ảnh 1, Nội dung 1, Âm thanh 1 -->
                                <div style="flex: 1;">
                                    <div class="mb-2">
                                        <label>Hình ảnh 1:</label>
                                        <div style="display: flex; align-items: center; gap: 10px;">
                                            <asp:FileUpload ID="FileUploadHinhAnh1" runat="server" accept="image/*" onchange="previewImage(this, 'imgPreview1')" />
                                            <img id="imgPreview1" src="" alt="Preview" style="max-height: 100px; max-width: 200px;" />
                                            <asp:HiddenField ID="HiddenFieldHinhAnh1" runat="server" />
                                        </div>
                                    </div>
                                    <div class="mb-2">
                                        <label>Nội dung 1:</label>
                                        <asp:TextBox ID="txtNoiDung1" runat="server" CssClass="form-control" Width="80%" autocomplete="off" />
                                    </div>
                                    <div class="mb-2">
                                        <label>Âm thanh 1:</label>
                                        <asp:FileUpload ID="FileUploadAmThanh1" runat="server" accept=".mp3" onchange="myAudioComplete(this, 'audioAmThanh1')" />
                                        <button type="button" class="btn btn-chang" onclick="document.getElementById('audioAmThanh1').play();"></button>
                                        <audio controls id="audioAmThanh1" style="max-width: 100%;">
                                            <source src="" type="audio/mp3" />
                                        </audio>
                                        <asp:HiddenField ID="HiddenFieldaudioAmThanh1" runat="server" />
                                    </div>
                                </div>

                                <!-- Bên phải: Hình ảnh 2, Nội dung 2, Âm thanh 2 -->
                                <div style="flex: 1;">
                                    <div class="mb-2">
                                        <label>Hình ảnh 2:</label>
                                        <div style="display: flex; align-items: center; gap: 10px;">
                                            <asp:FileUpload ID="FileUploadHinhAnh2" runat="server" accept="image/*" onchange="previewImage(this, 'imgPreview2')" />
                                            <img id="imgPreview2" src="" alt="Preview" style="max-height: 100px; max-width: 200px;" />
                                            <asp:HiddenField ID="HiddenFieldHinhAnh2" runat="server" />
                                        </div>
                                    </div>
                                    <div class="mb-2">
                                        <label>Nội dung 2:</label>
                                        <asp:TextBox ID="txtNoiDung2" runat="server" CssClass="form-control" Width="90%" autocomplete="off" />
                                    </div>
                                    <div class="mb-2">
                                        <label>Âm thanh 2:</label>
                                        <asp:FileUpload ID="FileUploadAmThanh2" runat="server" accept=".mp3" onchange="myAudioComplete(this, 'audioAmThanh2')" />
                                        <button type="button" class="btn btn-chang" onclick="document.getElementById('audioAmThanh2').play();"></button>
                                        <audio controls id="audioAmThanh2" style="max-width: 100%;">
                                            <source src="" type="audio/mp3" />
                                        </audio>
                                        <asp:HiddenField ID="HiddenFieldaudioAmThanh2" runat="server" />
                                    </div>
                                </div>
                            </div>
                        </div>

                    </ContentTemplate>
                </asp:UpdatePanel>
                <%-- </div>--%>
            </dx:PopupControlContentControl>
        </ContentCollection>
        <FooterContentTemplate>
            <%-- <asp:UpdatePanel ID="udPopup" runat="server">
                <ContentTemplate>--%>
            <div class="text-end">
                <asp:Button ID="btnLuuNoi" runat="server" ClientIDMode="Static" Text="Lưu nối" CssClass="btn btn-primary" OnClientClick="DisplayLoadingIcon();" OnClick="btnLuuNoi_Click" />
            </div>
            <%--  </ContentTemplate>
            </asp:UpdatePanel>--%>
        </FooterContentTemplate>
        <ContentStyle>
            <Paddings PaddingBottom="0px" />
        </ContentStyle>
    </dx:ASPxPopupControl>
    <script>
        function DisplayLoadingIcon() {
            $("#img-loading-icon").show();
        }
        function HiddenLoadingIcon() {
            console.log("aaa")
            $("#img-loading-icon").hide();
        }
        function myAudioComplete(fileUploadControl, audioElementId) {
            var file = fileUploadControl.files[0];
            if (file) {
                var url = URL.createObjectURL(file);
                var audio = document.getElementById(audioElementId);
                audio.src = url;
            }
        }
        function previewImage(input, imgId) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    document.getElementById(imgId).src = e.target.result;
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
        function showError(sach, baihoc, vitrigame) {
            var checkSach = document.getElementById("<%=ddlSach.ClientID%>").value = sach;
            var checkBaihoc = document.getElementById("<%=ddlBaiHoc.ClientID%>").value = baihoc;
            var vitri = vitrigame;
            if (checkSach == -1) {
                swal("Vui lòng chọn sách");
            }
            else if (checkBaihoc == -1) {
                swal("Vui lòng chọn bài học");
            }
            else if (vitri == "") {
                swal("Vui lòng nhập vị trí game");
            }
        }
        function showImg1_1(tieude, amthanh1, amthanh2, hinhanh1, hinhanh2) {
            $('#audioTieuDe').attr('src', tieude);
            $('#audioAmThanh1').attr('src', amthanh1);
            $('#audioAmThanh2').attr('src', amthanh2);
            $('#imgPreview1').attr('src', hinhanh1);
            $('#imgPreview2').attr('src', hinhanh2);
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
    <style>
        .loading {
            z-index: 12999;
        }
    </style>
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="hibodybottom" runat="Server">
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="hifooter" runat="Server">
</asp:Content>
<asp:Content ID="Content9" ContentPlaceHolderID="hifootersite" runat="Server">
</asp:Content>

