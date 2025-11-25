<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_MasterPage.master" AutoEventWireup="true" CodeFile="module_GameTracNghiem.aspx.cs" Inherits="admin_page_module_function_module_NhapLieuGame_module_GameTracNghiem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headlink" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="hihead" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="himenu" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="hibodyhead" runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="hibodywrapper" runat="Server">
    <link href="../../../../../css/loading.css" rel="stylesheet" />
    <div class="loading" id="img-loading-icon" style="display: none">
        <div class="loading">Loading&#8230;</div>
    </div>
    <div class="card">
        <div class="container-fluid pt-1">
            <h3 style="text-align: center; font-size: 28px; font-weight: bold; color: blue">TRẮC NGHIỆM</h3>
            <div class="form-group row">
                <div class="col-sm-10">
                    <asp:UpdatePanel ID="udButton" runat="server">
                        <ContentTemplate>
                            <asp:Button ID="btnThem" runat="server" Text="Thêm" CssClass="btn btn-primary" OnClick="btnThem_Click" OnClientClick="DisplayLoadingIcon();" />
                            <asp:Button ID="btnChiTiet" runat="server" Text="Chi tiết" CssClass="btn btn-primary" OnClick="btnChiTiet_Click" OnClientClick="DisplayLoadingIcon();" />
                            <asp:Button ID="btnXoa" runat="server" Text="Xóa" CssClass="btn btn-primary" OnClick="btnXoa_Click" OnClientClick="DisplayLoadingIcon();" />
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
            <div class="form-group table-responsive">
                <dx:ASPxGridView ID="grvTracNghiem" runat="server" ClientInstanceName="grvTracNghiem" KeyFieldName="cauhoi_id" Width="100%">
                    <Columns>
                        <dx:GridViewCommandColumn ShowSelectCheckbox="True" SelectAllCheckboxMode="Page" VisibleIndex="0" Width="0%">
                        </dx:GridViewCommandColumn>
                        <dx:GridViewDataColumn Caption="Sách" FieldName="sach_title" HeaderStyle-HorizontalAlign="Center" CellStyle-HorizontalAlign="Center" Width="8%"></dx:GridViewDataColumn>
                        <dx:GridViewDataColumn Caption="Bài học" FieldName="baihoc_title" HeaderStyle-HorizontalAlign="Center" CellStyle-HorizontalAlign="Center" Width="8%"></dx:GridViewDataColumn>
                        <dx:GridViewDataColumn Caption="Tiêu đề bài học" FieldName="cauhoi_content" HeaderStyle-HorizontalAlign="Center" CellStyle-HorizontalAlign="Center" Width="5%"></dx:GridViewDataColumn>
                        <dx:GridViewDataColumn Caption="Câu hỏi" FieldName="cauhoi_titlecauhoi" HeaderStyle-HorizontalAlign="Center" CellStyle-HorizontalAlign="Center" Width="15%"></dx:GridViewDataColumn>
                        <dx:GridViewDataColumn Caption="Âm thanh câu hỏi" HeaderStyle-HorizontalAlign="Center" Width="16%">
                            <DataItemTemplate>
                                <%# !string.IsNullOrEmpty(Eval("cauhoi_mp3").ToString()) 
                                        ? "<audio controls='controls' style='max-width: 100%;'><source src='" + Eval("cauhoi_mp3") + "' type='audio/mp3' /></audio>" 
                                 : "" %>
                            </DataItemTemplate>
                        </dx:GridViewDataColumn>
                        <dx:GridViewDataColumn Caption="Hình ảnh" HeaderStyle-HorizontalAlign="Center" Width="15%">
                            <DataItemTemplate>
                                <img src='<%# Eval("cauhoi_image") %>' style="width: 100%; height: auto;" />
                            </DataItemTemplate>
                        </dx:GridViewDataColumn>
                    </Columns>
                    <SettingsSearchPanel Visible="true" />
                    <SettingsBehavior AllowFocusedRow="true" />
                    <SettingsText EmptyDataRow="Không có dữ liệu" SearchPanelEditorNullText="Nhập từ cần tìm kiếm..." />
                    <SettingsLoadingPanel Text="Đang tải..." />
                    <SettingsPager PageSize="15" Summary-Text="Trang {0} / {1} ({2} dòng)"></SettingsPager>
                </dx:ASPxGridView>
            </div>
        </div>
    </div>

    <dx:ASPxPopupControl ID="popupTracNghiem" runat="server" Width="1000px"
        CloseAction="CloseButton" ShowCollapseButton="True" ShowMaximizeButton="True" ScrollBars="Auto"
        CloseOnEscape="true" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter"
        ClientInstanceName="popupTracNghiem" ShowFooter="true" HeaderText="THÊM DỮ LIỆU" AllowDragging="True"
        PopupAnimationType="Fade" EnableViewState="False" AutoUpdatePosition="true">
        <ContentCollection>
            <dx:PopupControlContentControl runat="server">
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
                        <div class="form-group">
                            <label>Tiêu đề ( 1 bài nhập 1 lần ):</label>
                            <asp:TextBox ID="txtTieuDe" runat="server" CssClass="form-control" Width="80%" autocomplete="off" />
                            <br />
                            <label>Âm thanh tiêu đề:</label>
                            <div style="display: flex; align-items: center; gap: 10px;">
                                <asp:FileUpload ID="FileUploadTieuDe" runat="server" accept=".mp3" onchange="myAudioComplete(this, 'audioTieuDe')" />
                                <br />
                                <button type="button" class="btn btn-chang" onclick="document.getElementById('audioTieuDe').play();"></button>
                                <audio controls="controls" id="audioTieuDe" style="max-width: 80%;">
                                    <source src="" type="audio/mp3" />
                                </audio>
                                <asp:HiddenField ID="hdTieuDeAudioTieuDe" runat="server" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label>Nội dung câu hỏi:</label>
                            <asp:TextBox ID="txtCauHoi" runat="server" CssClass="form-control" Width="80%" autocomplete="off" />
                            <br />
                            <label>Hình ảnh câu hỏi:</label>
                            <div style="display: flex; align-items: center; gap: 10px;">
                                <asp:FileUpload ID="FileUploadHinhAnh" runat="server" accept="image/*" onchange="previewImage(this, 'imgPreview')" />
                                <br />
                                <img id="imgPreview" src="" alt="Preview" style="max-height: 100px; max-width: 200px;" />
                                <asp:HiddenField ID="HiddenFieldHinhAnh" runat="server" />
                            </div>
                            <br />
                            <label>Âm thanh câu hỏi:</label>
                            <div style="display: flex; align-items: center; gap: 10px;">
                                <asp:FileUpload ID="FileUploadCauHoi" runat="server" accept=".mp3" onchange="myAudioComplete(this, 'audioCauHoi')" />
                                <br />
                                <button type="button" class="btn btn-chang" onclick="document.getElementById('audioCauHoi').play();"></button>
                                <audio controls="controls" id="audioCauHoi" style="max-width: 100%;">
                                    <source src="" type="audio/mp3" />
                                </audio>
                                <asp:HiddenField ID="HiddenFieldCauHoi" runat="server" />
                            </div>
                        </div>
                        <!-- Đáp án -->
                        <div class="form-group">
                            <label><i><b>Lưu ý: Một câu hỏi chỉ được nhập đáp án là text hoặc là hình ảnh. Nếu đã nhập đáp án là text thì không cần nhập đáp án hình ảnh và ngược lại.</b></i></label>
                            <label>Nội dung đáp án 1 (Đúng):</label>
                            <asp:TextBox ID="txtDapAn1" runat="server" CssClass="form-control" Width="80%" autocomplete="off" />
                            <br />
                            <label>Hình ảnh đáp án 1 (Đúng):</label>
                            <div style="display: flex; align-items: center; gap: 10px;">
                                <asp:FileUpload ID="FileUploadHinhAnhDapAn1" runat="server" accept="image/*" onchange="previewImage(this, 'imgPreview1')" />
                                <br />
                                <img id="imgPreview1" src="" alt="Preview" style="max-height: 100px; max-width: 200px;" />
                                <asp:HiddenField ID="HiddenFieldHinhAnhDapAn1" runat="server" />
                            </div>
                            <br />
                            <label>Âm thanh đáp án 1 (Đúng):</label>
                            <div style="display: flex; align-items: center; gap: 10px;">
                                <asp:FileUpload ID="FileUploadDapAn1" runat="server" accept=".mp3" onchange="myAudioComplete(this, 'audioDapAn1')" />
                                <br />
                                <button type="button" class="btn btn-chang" onclick="document.getElementById('audioDapAn1').play();"></button>
                                <audio controls="controls" id="audioDapAn1" style="max-width: 100%;">
                                    <source src="" type="audio/mp3" />
                                </audio>
                                <asp:HiddenField ID="HiddenFieldDapAn1" runat="server" />
                            </div>
                        </div>
                        <hr class="divider" style="border-top: 2px solid #aaa; margin: 25px 0;"/>
                        <div class="form-group">
                            <label>Nội dung đáp án 2 (Sai):</label>
                            <asp:TextBox ID="txtDapAn2" runat="server" CssClass="form-control" Width="80%" autocomplete="off" />
                            <br />
                            <label>Hình ảnh đáp án 2 (Sai):</label>
                            <div style="display: flex; align-items: center; gap: 10px;">
                                <asp:FileUpload ID="FileUploadHinhAnhDapAn2" runat="server" accept="image/*" onchange="previewImage(this, 'imgPreview2')" />
                                <br />
                                <img id="imgPreview2" src="" alt="Preview" style="max-height: 100px; max-width: 200px;" />
                                <asp:HiddenField ID="HiddenFieldHinhAnhDapAn2" runat="server" />
                            </div>
                            <br />
                            <label>Âm thanh đáp án 2 (Sai):</label>
                            <div style="display: flex; align-items: center; gap: 10px;">
                                <asp:FileUpload ID="FileUploadDapAn2" runat="server" accept=".mp3" onchange="myAudioComplete(this, 'audioDapAn2')" />
                                <br />
                                <button type="button" class="btn btn-chang" onclick="document.getElementById('audioDapAn2').play();"></button>
                                <audio controls="controls" id="audioDapAn2" style="max-width: 100%;">
                                    <source src="" type="audio/mp3" />
                                </audio>
                                <asp:HiddenField ID="HiddenFieldDapAn2" runat="server" />
                            </div>
                        </div>
                        <hr class="divider" style="border-top: 2px solid #aaa; margin: 25px 0;"/>
                        <div class="form-group">
                            <label>Nội dung đáp án 3 (Sai):</label>
                            <asp:TextBox ID="txtDapAn3" runat="server" CssClass="form-control" Width="80%" autocomplete="off" />
                            <br />
                            <label>Hình ảnh đáp án 3 (Sai):</label>
                            <div style="display: flex; align-items: center; gap: 10px;">
                                <asp:FileUpload ID="FileUploadHinhAnhDapAn3" runat="server" accept="image/*" onchange="previewImage(this, 'imgPreview3')" />
                                <br />
                                <img id="imgPreview3" src="" alt="Preview" style="max-height: 100px; max-width: 200px;" />
                                <asp:HiddenField ID="HiddenFieldHinhAnhDapAn3" runat="server" />
                            </div>
                            <br />
                            <label>Âm thanh đáp án 3 (Sai):</label>
                            <div style="display: flex; align-items: center; gap: 10px;">
                                <asp:FileUpload ID="FileUploadDapAn3" runat="server" accept=".mp3" onchange="myAudioComplete(this, 'audioDapAn3')" />
                                <br />
                                <button type="button" class="btn btn-chang" onclick="document.getElementById('audioDapAn3').play();"></button>
                                <audio controls="controls" id="audioDapAn3" style="max-width: 100%;">
                                    <source src="" type="audio/mp3" />
                                </audio>
                                <asp:HiddenField ID="HiddenFieldDapAn3" runat="server" />
                            </div>
                        </div>
                        <hr class="divider" style="border-top: 2px solid #aaa; margin: 25px 0;"/>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </dx:PopupControlContentControl>
        </ContentCollection>
        <FooterContentTemplate>
            <div class="text-end">
                <asp:Button ID="btnLuuTracNghiem" runat="server" ClientIDMode="Static" Text="Lưu" CssClass="btn btn-primary" OnClick="btnLuuTracNghiem_Click" OnClientClick="DisplayLoadingIcon();" />
            </div>
        </FooterContentTemplate>
        <ContentStyle>
            <Paddings PaddingBottom="0px" />
        </ContentStyle>
    </dx:ASPxPopupControl>
    <script type="text/javascript">
        function DisplayLoadingIcon() {
            $("#img-loading-icon").show();
        }
        function HiddenLoadingIcon() {
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
        function previewImage(fileInput, previewId) {
            const file = fileInput.files[0];
            if (file && file.type.startsWith('image/')) {
                const reader = new FileReader();
                reader.onload = function (e) {
                    document.getElementById(previewId).src = e.target.result;
                };
                reader.readAsDataURL(file);
            } else {
                alert("Vui lòng chọn tệp hình ảnh hợp lệ (jpg, png...)");
            }
        }
        function showError(sach, baihoc) {
            var checkSach = document.getElementById("<%=ddlSach.ClientID%>").value = sach;
            var checkBaihoc = document.getElementById("<%=ddlBaiHoc.ClientID%>").value = baihoc;
            if (checkSach == -1) {
                swal("Vui lòng chọn sách");
            }
            else if (checkBaihoc == -1) {
                swal("Vui lòng chọn bài học");
            }
        }
        function showErrorAnh(message) {
            swal(message);
        }
        //function showImg1_1(tieude, hinhanh) {
        //    $('#audioTieuDe').attr('src', tieude);
        //    $('#imgPreview').attr('src', hinhanh);
        //}
        function showImg1_1(tieude, hinhanh, imgdapan1, imgdapan2, imgdapan3, dapan1, dapan2, dapan3) {
            $('#audioTieuDe').attr('src', tieude);
            $('#imgPreview').attr('src', hinhanh);
            $('#imgPreview1').attr('src', imgdapan1);
            $('#imgPreview2').attr('src', imgdapan2);
            $('#imgPreview3').attr('src', imgdapan3);
            $('#audioDapAn1').attr('src', dapan1);
            $('#audioDapAn2').attr('src', dapan2);
            $('#audioDapAn3').attr('src', dapan3);
        }
    </script>
    <style>
        .loading {
            z-index: 12999;
        }
    </style>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="hibodybottom" runat="Server">
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="hifooter" runat="Server">
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="hifootersite" runat="Server">
</asp:Content>

