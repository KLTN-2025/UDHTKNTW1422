<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageLandingPage.master" AutoEventWireup="true" CodeFile="thcs_DanhMucBaiHoc_Desktop.aspx.cs" Inherits="web_module_module_THCS_thcs_DanhMucBaiHoc_Desktop" %>

<%@ Register Src="~/web_usercontrol/global_LandingPage_Menu.ascx" TagPrefix="uc1" TagName="global_LandingPage_Menu" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="Server">
    <style>
        .step-contact .step-content .section-contact .form-contact__title {
            margin-top: 1rem;
        }

        .title_lesson_s {
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
    <div id="" class="step-contact" style="justify-content: center;">
        <div class="block-main pt-3 pb-5 mb-3 px-3">
            <div id="lessonContainer">
                <div class="unit-list__title">Học bảng chữ cái Hiragana</div>
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-4 col-sm-4 col-md-4">
                            <asp:Repeater ID="rpLesson" runat="server">
                                <ItemTemplate>
                                    <div class="lesson-row">
                                        <a href="javascript:void(0)" class="lesson-item" id="id_255" onclick="xembai(255)" tabindex="-1">
                                            <div class="lesson-item__avatar">
                                                <img src="/imageGame/Bang_chu_cai_Hiragana/chu-a.png">
                                            </div>
                                            <div class="lesson-item__content">
                                                <div class="lesson-item__content--title">
                                                    Bài 1 : Hàng A : a, i, u, e, o
                                                </div>
                                                <div class="lesson-item__content--view">
                                                    <i class="fa fa-eye"></i>&nbsp; 1
                                                </div>
                                                <div class="lesson-item__content--decription"></div>
                                                <div class="rating-list"></div>
                                            </div>
                                        </a>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                </div>
            </div>
            <a id="btnXemBai" style="display: none" href="javascript:__doPostBack('btnXemBai','')"></a>
            <input name="txtIDBaiHoc" type="text" id="txtIDBaiHoc" style="display: none">
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="BottomWrapper" runat="Server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="Footer" runat="Server">
</asp:Content>

