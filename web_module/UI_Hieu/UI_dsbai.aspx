<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageLandingPage.master" AutoEventWireup="true" CodeFile="UI_dsbai.aspx.cs" Inherits="web_module_UI_Hieu_UI_dsbai" %>

<%@ Register Src="~/web_usercontrol/global_LandingPage_Menu.ascx" TagPrefix="uc1" TagName="global_LandingPage_Menu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="Server">
    <style>
        .step-contact .step-content .section-contact .form-contact__title {
            margin-top: 1rem;
        }

        .title_lesson_s {
            font-size:30px;
            font-weight:bold;
            color:black;
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
    <div id="" class="step-contact" style="justify-content: center; background-image: url(/images/back_bai.jpg)";>
        <div class="block-main pt-3 pb-5 mb-3 px-3">
            <div id="lessonContainer">
                <div class="unit-list__title">Học bảng chữ cái Hiragana</div>
                <div class="container-fluid">
                    <div class="title_lesson_s">Nội dung bài 1: </div>
                    <div class="row">
                        <div class="col-4 col-sm-4 col-md-4">
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
                        </div>
                        <div class="col-4 col-sm-4 col-md-4">
                            <div class="lesson-row">
                                <a href="javascript:void(0)" class="lesson-item" id="id_256" onclick="xembai(256)">
                                    <div class="lesson-item__avatar">
                                        <img src="/imageGame/Bang_chu_cai_Hiragana/hinh-chu-a.png">
                                    </div>
                                    <div class="lesson-item__content">
                                        <div class="lesson-item__content--title">
                                            Bài 1 : Luyện tập 1
                                        </div>
                                        <div class="lesson-item__content--view">
                                            <i class="fa fa-eye"></i>&nbsp; 0
                                        </div>
                                        <div class="lesson-item__content--decription"></div>
                                        <div class="rating-list"></div>
                                    </div>
                                </a>
                            </div>
                        </div>
                        <div class="col-4 col-sm-4 col-md-4">
                            <div class="lesson-row">
                                <a href="javascript:void(0)" class="lesson-item" id="id_257" onclick="xembai(257)">
                                    <div class="lesson-item__avatar">
                                        <img src="/imageGame/Bang_chu_cai_Hiragana/viet-chu-a.png">
                                    </div>
                                    <div class="lesson-item__content">
                                        <div class="lesson-item__content--title">
                                            Bài 1 : Luyện tập 2
                                        </div>
                                        <div class="lesson-item__content--view">
                                            <i class="fa fa-eye"></i>&nbsp; 0
                                        </div>
                                        <div class="lesson-item__content--decription"></div>
                                        <div class="rating-list"></div>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="title_lesson_s">Nội dung bài 2: </div>
                    <div class="row">
                        <div class="col-4 col-sm-4 col-md-4">
                            <div class="lesson-row">
                                <a href="javascript:void(0)" class="lesson-item" id="id_258" onclick="xembai(258)">
                                    <div class="lesson-item__avatar">
                                        <img src="/imageGame/Bang_chu_cai_Hiragana/chu-ka.png">
                                    </div>
                                    <div class="lesson-item__content">
                                        <div class="lesson-item__content--title">
                                            Bài 2 : Hàng Ka : ka, ki, ku, ke, ko
                                        </div>
                                        <div class="lesson-item__content--view">
                                            <i class="fa fa-eye"></i>&nbsp; 0
                                        </div>
                                        <div class="lesson-item__content--decription"></div>
                                        <div class="rating-list"></div>
                                    </div>
                                </a>
                            </div>
                        </div>
                        <div class="col-4 col-sm-4 col-md-4">
                            <div class="lesson-row">
                                <a href="javascript:void(0)" class="lesson-item" id="id_259" onclick="xembai(259)">
                                    <div class="lesson-item__avatar">
                                        <img src="/imageGame/Bang_chu_cai_Hiragana/hinh-chu-ka.png">
                                    </div>
                                    <div class="lesson-item__content">
                                        <div class="lesson-item__content--title">
                                            Bài 2 : Luyện tập 1
                                        </div>
                                        <div class="lesson-item__content--view">
                                            <i class="fa fa-eye"></i>&nbsp; 0
                                        </div>
                                        <div class="lesson-item__content--decription"></div>
                                        <div class="rating-list"></div>
                                    </div>
                                </a>
                            </div>
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

