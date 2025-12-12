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
            font-family: Calibri, 'Calibri', sans-serif;
        }

        table {
            width: 60%;
            border-collapse: collapse;
            background: white;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            font-family: Calibri, 'Calibri', sans-serif;
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

        .badge-pass {
            background-color: #28a745;
            color: white;
            padding: 4px 12px;
            border-radius: 12px;
            font-size: 13px;
            font-weight: 600;
        }

        .badge-fail {
            background-color: #dc3545;
            color: white;
            padding: 4px 12px;
            border-radius: 12px;
            font-size: 13px;
            font-weight: 600;
        }

        .progress-container {
            width: 100%;
            background-color: #e9ecef;
            border-radius: 10px;
            height: 24px;
            position: relative;
            overflow: hidden;
        }

        .progress-bar-fill {
            background-color: #28a745;
            height: 100%;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 12px;
            font-weight: 600;
            transition: width 0.3s ease;
        }

        .progress-bar-fill.fail {
            background-color: #dc3545;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Menu" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="TopWrapper" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Wrapper" runat="Server">
    <uc1:global_LandingPage_Menu_1 runat="server" ID="global_LandingPage_Menu_1" />
    <h2 class="mt-3">TIẾN ĐỘ HỌC TẬP</h2>
    <div class="table-thongke">
        <table>
            <thead>
                <tr class="table-name">
                    <th>STT</th>
                    <th>BÀI HỌC</th>
                    <th>ĐIỂM</th>
                    <th>HOÀN THÀNH</th>
                    <th>MỨC ĐỘ HOÀN THÀNH</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>1</td>
                    <td>Bài 1: Hàng A - a, i, u, e, o</td>
                    <td>9.5</td>
                    <td><span class="badge-pass">Pass</span></td>
                    <td>
                        <div class="progress-container">
                            <div class="progress-bar-fill" style="width: 95%">95%</div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>Bài 2: Hàng KA - ka, ki, ku, ke, ko</td>
                    <td>8.0</td>
                    <td><span class="badge-pass">Pass</span></td>
                    <td>
                        <div class="progress-container">
                            <div class="progress-bar-fill" style="width: 80%">80%</div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>3</td>
                    <td>Bài 3: Hàng SA - sa, shi, su, se, so</td>
                    <td>5.5</td>
                    <td><span class="badge-fail">Không pass</span></td>
                    <td>
                        <div class="progress-container">
                            <div class="progress-bar-fill fail" style="width: 55%">55%</div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>4</td>
                    <td>Bài 4: Hàng TA - ta, chi, tsu, te, to</td>
                    <td>0</td>
                    <td><span class="badge-fail">Không pass</span></td>
                    <td>
                        <div class="progress-container">
                            <div class="progress-bar-fill fail" style="width: 0%">0%</div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>5</td>
                    <td>Bài 5: Hàng NA - na, ni, nu, ne, no</td>
                    <td>10</td>
                    <td><span class="badge-pass">Pass</span></td>
                    <td>
                        <div class="progress-container">
                            <div class="progress-bar-fill" style="width: 100%">100%</div>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="BottomWrapper" runat="Server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="Footer" runat="Server">
</asp:Content>

