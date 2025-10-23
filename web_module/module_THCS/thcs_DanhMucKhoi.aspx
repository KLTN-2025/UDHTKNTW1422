<%@ Page Title="" Language="C#" MasterPageFile="~/Home_MasterPage.master" AutoEventWireup="true" CodeFile="thcs_DanhMucKhoi.aspx.cs" Inherits="web_module_module_THCS_thcs_DanhMucKhoi" %>

<%@ Register Src="~/web_usercontrol/global_header_avatar.ascx" TagPrefix="uc1" TagName="global_header_avatar" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="Server">
    <link href="../../css/listBooks.css" rel="stylesheet" />
    <style>
        .video-cate iframe {
            width: 100%;
            height: 20rem;
            border-radius: 20px;
        }

        .block-book {
            background: unset;
            min-height: unset;
            padding-bottom: unset;
        }

        .book-card:hover {
            color: #00763d;
        }

        .book-card__title {
            font-weight: 600;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Menu" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="TopWrapper" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Wrapper" runat="Server">
    <div class="page-view bg-color-1 m-bottom">
        <uc1:global_header_avatar runat="server" ID="global_header_avatar" />
        <div class="block-content">
            <a class="btn-exit hvr-grow" href="app-thcs" onclick="DisplayLoadingIcon()">
                <img src="/images/button/btn-exit-21.png">
            </a>
            <div class="green-text-up ">
                DANH SÁCH BÀI HỌC
            </div>
            <div class="block-book">
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
                <%--sách khối 7--%>
                <div class="books-list" id="div_DanhMucKhoi7" runat="server">
                    <div class="book-item">
                        <a href="<%= tiengnhat7 %>" class="book-card" onclick="DisplayLoadingIcon()" style="text-decoration: none;">
                            <div class="book-card__cover">
                                <div class="book-card__book">
                                    <div class="book-card__book-front">
                                        <img class="book-card__img" src="/images/img_beginner_understand01.gif">
                                    </div>
                                    <div class="book-card__book-back"></div>
                                    <div class="book-card__book-side"></div>
                                </div>
                            </div>
                            <div>
                                <div class="book-card__title">
                                    Sách khối 7
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
                <%--end sách khối 7--%>
                <%--sách khối 8--%>
                <div class="books-list" id="div_DanhMucKhoi8" runat="server">
                    <div class="book-item">
                        <a href="<%= tiengnhat8 %>" class="book-card" onclick="DisplayLoadingIcon()" style="text-decoration: none;">
                            <div class="book-card__cover">
                                <div class="book-card__book">
                                    <div class="book-card__book-front">
                                        <img class="book-card__img" src="/images/img_beginner_understand01.gif">
                                    </div>
                                    <div class="book-card__book-back"></div>
                                    <div class="book-card__book-side"></div>
                                </div>
                            </div>
                            <div>
                                <div class="book-card__title">
                                    Sách khối 8
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
                <%--end sách khối 8--%>
                <%--sách khối 9--%>
                <div class="books-list" id="div_DanhMucKhoi9" runat="server">
                    <div class="book-item">
                        <a href="<%= tiengnhat9 %>" class="book-card" onclick="DisplayLoadingIcon()" style="text-decoration: none;">
                            <div class="book-card__cover">
                                <div class="book-card__book">
                                    <div class="book-card__book-front">
                                        <img class="book-card__img" src="/images/img_beginner_understand01.gif">
                                    </div>
                                    <div class="book-card__book-back"></div>
                                    <div class="book-card__book-side"></div>
                                </div>
                            </div>
                            <div>
                                <div class="book-card__title">
                                    Sách khối 9
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
                <%--end sách khối 9--%>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="BottomWrapper" runat="Server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="Footer" runat="Server">
</asp:Content>

