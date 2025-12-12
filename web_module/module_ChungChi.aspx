<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageLandingPage.master" AutoEventWireup="true" CodeFile="module_ChungChi.aspx.cs" Inherits="web_module_module_ChungChi" %>

<%@ Register Src="~/web_usercontrol/global_LandingPage_Menu_1.ascx" TagPrefix="uc1" TagName="global_LandingPage_Menu_1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="Server">
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" xintegrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        .chungchi-container {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 60vh;
            padding: 40px 20px;
        }

        .chungchi-wrapper {
            text-align: center;
            max-width: 1200px;
            width: 100%;
        }

        .chungchi-title {
            font-size: 28px;
            font-weight: 600;
            color: #333;
            margin-bottom: 30px;
     font-family: 'Times New Roman', Times, serif;

        }

        .chungchi-image {
            max-width: 100%;
            height: auto;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Menu" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="TopWrapper" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Wrapper" runat="Server">
    <uc1:global_LandingPage_Menu_1 runat="server" ID="global_LandingPage_Menu_1" />
    <div class="chungchi-container">
        <div class="chungchi-wrapper">
            <h2 class="chungchi-title">Chứng chỉ</h2>
            <img src="/images/chungchi.png" alt="Chứng chỉ" class="chungchi-image" />
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="BottomWrapper" runat="Server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="Footer" runat="Server">
</asp:Content>

