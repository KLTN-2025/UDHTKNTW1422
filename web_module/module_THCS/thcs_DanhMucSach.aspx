<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageLandingPage.master" AutoEventWireup="true" CodeFile="thcs_DanhMucSach.aspx.cs" Inherits="web_module_module_THCS_thcs_DanhMucSach" %>

<%@ Register Src="~/web_usercontrol/global_LandingPage_Menu.ascx" TagPrefix="uc1" TagName="global_LandingPage_Menu" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="Server">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" xintegrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        .step-contact .step-content .section-contact .form-contact__title {
            margin-top: 1rem;
        }

        .back_ui {
            background-color: #f3cd8b;
            padding: 40px;
            border-radius: 9%;
            position: relative;
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 50px;
            -webkit-box-shadow: 0 3px 6px rgba(0, 0, 0, 0.16), 0 3px 6px rgba(0, 0, 0, 0.23);
            box-shadow: 0 3px 6px rgba(0, 0, 0, 0.16), 0 3px 6px rgba(0, 0, 0, 0.23);
        }
    </style>

    <link href="../../css/listBooks.css" rel="stylesheet" />
    <script src="admin_js/sweetalert.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Menu" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="TopWrapper" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Wrapper" runat="Server">
    <uc1:global_LandingPage_Menu runat="server" ID="global_LandingPage_Menu" />
    <asp:ScriptManager runat="server" />
    <div id="" class="step-contact" style="justify-content: center; background-image: url(/images/back_bai.jpg); background-position: center; background-size: cover; background-repeat: no-repeat;">
        <div class="back_ui">
            <%--sách khối 6--%>
            <div class="books-list" id="div_DanhMucKhoi6" runat="server">
                <div class="book-item">
                    <a href="<%= hiragana %>" class="book-card" onclick="DisplayLoadingIcon()" style="text-decoration: none;">
                        <div class="book-card__cover">
                            <div class="book-card__book">
                                <div class="book-card__book-front">
                                    <img class="book-card__img" src="/images/Bang_chu_cai_Hiragana/Hiragana.jpg">
                                </div>
                                <div class="book-card__book-back"></div>
                                <div class="book-card__book-side"></div>
                            </div>
                        </div>
                        <div>
                            <div class="book-card__title">
                                Bảng chữ cái Hiragana
                            </div>
                        </div>
                    </a>
                </div>
                <div class="book-item">
                    <a href="<%= katakana %>" class="book-card" onclick="DisplayLoadingIcon()" style="text-decoration: none;">
                        <div class="book-card__cover">
                            <div class="book-card__book">
                                <div class="book-card__book-front">
                                    <img class="book-card__img" src="/images/Bang_chu_cai_Katakana/Katakana.jpg">
                                </div>
                                <div class="book-card__book-back"></div>
                                <div class="book-card__book-side"></div>
                            </div>
                        </div>
                        <div>
                            <div class="book-card__title">
                                Bảng chữ cái Katakana
                            </div>
                        </div>
                    </a>
                </div>
            </div>
            <%--end sách khối 6--%>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="BottomWrapper" runat="Server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="Footer" runat="Server">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" xintegrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eE7N6jIeHz" crossorigin="anonymous"></script>



</asp:Content>

