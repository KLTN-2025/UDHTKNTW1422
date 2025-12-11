<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageLandingPage.master" AutoEventWireup="true" CodeFile="module_ThongKe2.aspx.cs" Inherits="web_module_module_ThongKe2" %>

<%@ Register Src="~/web_usercontrol/global_LandingPage_Menu_1.ascx" TagPrefix="uc1" TagName="global_LandingPage_Menu_1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="Server">
    <link href="../css/gameTieuHoc.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" xintegrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        h2 {
            color: #c40000;
            text-align: center;
            margin-bottom: 20px;
        }

        table {
            width: 60%;
            border-collapse: collapse;
            background: white;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }
        .table-name th{
            font-weight: 600;
        }
        thead {
            background: #d60000;
            color: white;
        }

            thead th {
                padding: 14px;
                font-size: 16px;
                letter-spacing: 0.5px;
            }

        tbody tr {
            border-bottom: 1px solid #eee;
            transition: 0.2s;
        }

            tbody tr:hover {
                background: #ffe4e4;
            }

        tbody td {
            padding: 12px 14px;
            font-size: 15px;
            color: #333;
        }

        .table-thongke {
            width: 100%;
            display: flex;
            justify-content: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Menu" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="TopWrapper" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Wrapper" runat="Server">
    <uc1:global_LandingPage_Menu_1 runat="server" ID="global_LandingPage_Menu_1" />
    <h2 class="mt-3">DANH SÁCH ĐIỂM</h2>
    <div class="table-thongke">
        <table>
            <thead>
                <tr class="table-name">
                    <th>STT</th>
                    <th>TÊN</th>
                    <th>NGÀY LÀM BÀI</th>
                    <th>ĐIỂM SỐ</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>1</td>
                    <td>Nguyễn Hoàng Nam</td>
                    <td>10/12/2025</td>
                    <td>9.5</td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>Thái Đăng Duy</td>
                    <td>11/12/2025</td>
                    <td>8.0</td>
                </tr>
                <tr>
                    <td>3</td>
                    <td>Trần Hoàng Hiếu</td>
                    <td>11/12/2025</td>
                    <td>10</td>
                </tr>
            </tbody>
        </table>
    </div>

</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="BottomWrapper" runat="Server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="Footer" runat="Server">
</asp:Content>

