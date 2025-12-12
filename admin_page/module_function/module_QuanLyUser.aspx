<%@ Page Title="" Language="VB" MasterPageFile="~/Admin_MasterPage.master" AutoEventWireup="false" CodeFile="module_QuanLyUser.aspx.vb" Inherits="admin_page_module_function_module_QuanLyUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headlink" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="hihead" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="himenu" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="hibodyhead" Runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="hibodywrapper" Runat="Server">
    <link href="../../css/loading.css" rel="stylesheet" />
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
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="hibodybottom" Runat="Server">
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="hifooter" Runat="Server">
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="hifootersite" Runat="Server">
</asp:Content>

