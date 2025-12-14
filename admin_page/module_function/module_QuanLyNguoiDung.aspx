<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_MasterPage.master" AutoEventWireup="true" CodeFile="module_QuanLyNguoiDung.aspx.cs" Inherits="admin_page_module_function_module_QuanLyNguoiDung" %>

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
            <h3 style="text-align: center; font-size: 28px; font-weight: bold; color: blue">TÀI KHOẢN</h3>
            <div class="form-group row">
                <div class="col-sm-10">
                    <asp:UpdatePanel ID="udButton" runat="server">
                        <ContentTemplate>
                            <%--<asp:Button ID="btnChiTiet" runat="server" Text="Chi tiết" CssClass="btn btn-primary"  OnClientClick="DisplayLoadingIcon();" />--%>
                            <asp:Button ID="btnXoa" runat="server" Text="Chặn" CssClass="btn btn-primary" OnClick="btnXoa_Click" OnClientClick="DisplayLoadingIcon();" />
                            <asp:Button ID="btnBoChan" runat="server" Text="Bỏ chặn" CssClass="btn btn-primary" OnClick="btnBoChan_Click" OnClientClick="DisplayLoadingIcon();" />
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
            <div class="form-group table-responsive">
                <dx:ASPxGridView ID="grvUser" runat="server" ClientInstanceName="grvUser" KeyFieldName="account_id" Width="100%">
                    <Columns>
                        <dx:GridViewCommandColumn ShowSelectCheckbox="True" SelectAllCheckboxMode="Page" VisibleIndex="0" Width="0%">
                        </dx:GridViewCommandColumn>
                        <dx:GridViewDataColumn Caption="Số điện thoại" FieldName="account_sodienthoai" HeaderStyle-HorizontalAlign="Center" CellStyle-HorizontalAlign="Center" Width="8%"></dx:GridViewDataColumn>
                        <dx:GridViewDataColumn Caption="Họ và tên" FieldName="account_children_fullname" HeaderStyle-HorizontalAlign="Center" CellStyle-HorizontalAlign="Center" Width="8%"></dx:GridViewDataColumn>
                        <dx:GridViewDataColumn Caption="Email" FieldName="account_email" HeaderStyle-HorizontalAlign="Center" CellStyle-HorizontalAlign="Center" Width="15%"></dx:GridViewDataColumn>
                        <dx:GridViewDataColumn Caption="Ngày sinh" FieldName="account_children_ngaysinh" HeaderStyle-HorizontalAlign="Center" CellStyle-HorizontalAlign="Center" Width="10%"></dx:GridViewDataColumn>
                        <dx:GridViewDataColumn Caption="Lớp" FieldName="lop_id" HeaderStyle-HorizontalAlign="Center" CellStyle-HorizontalAlign="Center" Width="5%"></dx:GridViewDataColumn>
                        <dx:GridViewDataColumn Caption="Avatar" HeaderStyle-HorizontalAlign="Center" Width="12%">
                            <DataItemTemplate>
                                <img src='<%# Eval("account_children_image") %>' style="width: 100%; height: auto;" />
                            </DataItemTemplate>
                        </dx:GridViewDataColumn>
                        <dx:GridViewDataColumn Caption="Tình trạng" FieldName="account_active" HeaderStyle-HorizontalAlign="Center" CellStyle-HorizontalAlign="Center" Width="5%">
                            <DataItemTemplate>
                                <asp:Label runat="server"
                                    Text='<%# (Eval("account_active") != null && (bool)Eval("account_active"))
                                            ? "🟢"
                                            : "🔴" %>'>
                                </asp:Label>
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
    <script type="text/javascript">
        function DisplayLoadingIcon() {
            $("#img-loading-icon").show();
        }
        function HiddenLoadingIcon() {
            $("#img-loading-icon").hide();
        }
    </script>
    <style>
        .loading {
            z-index: 12999;
        }
    </style>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="hibodybottom" Runat="Server">
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="hifooter" Runat="Server">
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="hifootersite" Runat="Server">
</asp:Content>

