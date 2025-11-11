<%@ Page Title="" Language="C#" MasterPageFile="~/Home_MasterPage.master" AutoEventWireup="true" CodeFile="module_ThongKe.aspx.cs" Inherits="web_module_module_ThongKe" %>

<%@ Register Src="~/web_usercontrol/global_header_avatar.ascx" TagPrefix="uc1" TagName="global_header_avatar" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="Server">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Menu" runat="Server">
    <style>
        #myChart {
            font-family: "Baloo 2","Segoe UI",Roboto,"Helvetica Neue","Noto Sans",-apple-system,"Apple Color Emoji","Segoe UI Emoji";
        }

        .custom-select {
            width: 150px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="TopWrapper" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Wrapper" runat="Server">
    <div class="page-view bg-color-1 m-bottom">
        <uc1:global_header_avatar runat="server" ID="global_header_avatar" />
        <div class="block-content">
            <div class="nav-tabs-button py-4">
                <ul class="nav nav-tabs" id="myTab" role="tablist">
                    <li class="nav-item mr-3">
                        <a class="nav-link active hvr-pulse-grow" id="tab1-tab" data-toggle="tab" href="#tab1" role="tab" aria-controls="tab1" aria-selected="true">THỜI GIAN</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link hvr-pulse-grow" id="tab2-tab" data-toggle="tab" href="#tab2" role="tab" aria-controls="tab2" aria-selected="false">BẢNG ĐIỂM</a>
                    </li>
                </ul>
                <div class="tab-content" id="myTabContent">
                    <div class="tab-pane fade show active" id="tab1" role="tabpanel" aria-labelledby="tab1-tab">
                        <div class="statistics-content --times ">
                            <div class="">
                                <div class="title-page">Thống kê thời gian học</div>
                                <div class="block-shadown">
                                    <div class="text-center text-uppercase font-weight-bold">Thống kê số lượng thời gian truy cập</div>
                                    <div>
                                        <div class="d-flex justify-content-center align-items-center text-uppercase mt-2 mb-2">
                                            <div class="mr-1 green-text font-weight-bold">Chọn tháng:</div>
                                            <div class="custom-select">
                                                <select>
                                                    <option value="" disabled selected>Chọn tháng</option>
                                                    <option value="1">Option 1</option>
                                                    <option value="2">Option 2</option>
                                                    <option value="3">Option 3</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="text-center font-weight-bold text-uppercase p-1" style="background-color: #ffd4d4">
                                            <span class="mr-1">Tháng</span>
                                            <span>11</span>
                                        </div>
                                        <div class="row text-uppercase text-left p-1" style="color: black; line-height: initial">
                                            <div class="col-6">
                                                <p>Thời gian sử dụng:</p>
                                                <p>Trung bình 1 ngày:</p>
                                                <p>Kết luận</p>
                                            </div>
                                            <div class="col-6" style="border-left: 2px solid #00763d">
                                                <p>40h</p>
                                                <p>1.5h/1 ngày</p>
                                                <p>
                                                    <i class="bi bi-x-octagon-fill mr-2" style="color: red"></i>chưa đạt chỉ tiêu
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <canvas id="myChart" style="width: 100%; margin: auto" class="mt-4"></canvas>
                        </div>
                    </div>
                    <%--<div class="tab-pane fade" id="tab2" role="tabpanel" aria-labelledby="tab2-tab">
                        <div class="statistics-content">
                            <div class="title-page">Thống kê bảng điểm</div>
                            <div class="">
                                <!-- Buttons for subjects -->
                                <div class="subject-buttons text-center mb-3">
                                    <button type="button" class="btn-subject active">TOÁN</button>
                                    <button type="button" class="btn-subject">TIẾNG VIỆT</button>
                                    <button type="button" class="btn-subject">TIẾNG ANH</button>
                                </div>

                                <!-- Table for lessons -->
                                <div class="table-container">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>STT</th>
                                                <th>TÊN SÁCH</th>
                                                <th>TÊN BÀI HỌC</th>
                                                <th>SỐ LẦN</th>
                                                <th>SỐ SAO</th>
                                                <th>CHI TIẾT</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <asp:Repeater ID="rpThongKe" runat="server">
                                                <ItemTemplate>
                                                    <tr>
                                                        <td><%# Container.ItemIndex + 1 %></td>
                                                        <td><%# Eval("sach_title") %></td>
                                                        <td><%# Eval("baihoc_title") %></td>
                                                        <td><%# Eval("solan")  %></td>
                                                        <td><%# Eval("sosao")  %> / <%# Eval("tongsao")  %></td>
                                                        <td>
                                                            <button type="button" id="<%#Eval("baihoc_id") %>" class="btn-details" data-toggle="modal" data-target="#modalDetail-<%#Eval("baihoc_id") %>">XEM</button></td>
                                                    </tr>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                        <asp:Repeater runat="server" ID="rpChiTiet" OnItemDataBound="rpChiTiet_ItemDataBound">
                            <ItemTemplate>
                                <!-- Modal -->
                                <div class="modal fade modal-style" id="modalDetail-<%#Eval("baihoc_id") %>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                        <div class="modal-content">
                                            <!-- Modal Header -->
                                            <div class="modal-header bg-success text-white">
                                                <h4 class="modal-title" id="exampleModalLabel"><%# Eval("baihoc_title") %></h4>
                                                <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <!-- Modal Body -->
                                            <div class="modal-body">

                                                <table class="table table-sm table-green text-center mb-0">
                                                    <thead>
                                                        <tr>
                                                            <th>NGÀY</th>
                                                            <th>TÊN BÀI HỌC</th>
                                                            <th>KẾT QUẢ</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <asp:Repeater ID="rpChiTietTungGame" runat="server">
                                                            <ItemTemplate>
                                                                <tr>
                                                                    <td rowspan="<%# ((List<object>)Eval("BaiHoc")).Count %>">
                                                                        <%# Eval("Ngay", "{0:dd/MM/yyyy}") %>
                                                                    </td>
                                                                    <td><%# ((List<dynamic>)Eval("BaiHoc"))[0].baihoc_title %></td>
                                                                    <td><%# ((List<dynamic>)Eval("BaiHoc"))[0].ketqua %></td>
                                                                </tr>

                                                                <!-- Sử dụng Repeater lồng để hiển thị các dòng tiếp theo -->
                                                                <asp:Repeater ID="rpSubChiTiet" runat="server" DataSource='<%# ((List<dynamic>)Eval("BaiHoc")).Skip(1) %>'>
                                                                    <ItemTemplate>
                                                                        <tr>
                                                                            <td><%# Eval("baihoc_title") %></td>
                                                                            <td><%# Eval("ketqua") %></td>
                                                                        </tr>
                                                                    </ItemTemplate>
                                                                </asp:Repeater>
                                                            </ItemTemplate>
                                                        </asp:Repeater>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>--%>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="BottomWrapper" runat="Server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="Footer" runat="Server">
</asp:Content>

