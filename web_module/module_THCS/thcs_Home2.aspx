<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageLandingPage.master" AutoEventWireup="true" CodeFile="thcs_Home2.aspx.cs" Inherits="web_module_module_THCS_thcs_Home2" %>

<%@ Register Src="~/web_usercontrol/global_LandingPage_Menu_1.ascx" TagPrefix="uc1" TagName="global_LandingPage_Menu_1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Header" Runat="Server">
    <link href="../../css/gameTieuHoc.min.css" rel="stylesheet" />
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
       <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" xintegrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        .step-contact .step-content .section-contact .form-contact__title {
            margin-top: 1rem;
        }

        .title_lesson_s {
            font-size: 30px;
            font-weight: bold;
            color: black;
        }
        .block-body #section-class{
            padding: 8rem;
        }
        .block-body #section-class .class-item{
            width: calc(23% - 1rem);
        }
        .block-body #section-class .class-item{
            height: 16rem;
        }
    </style>
    <link href="../../css/listBooks.css" rel="stylesheet" />
    <script src="admin_js/sweetalert.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Menu" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="TopWrapper" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Wrapper" Runat="Server">
    <uc1:global_LandingPage_Menu_1 runat="server" ID="global_LandingPage_Menu_1" />
    <div class="home page-view ">
        <%--<uc1:global_header_avatar runat="server" ID="global_header_avatar" />--%>
        <div class="block-body">
            <div id="section-class">
                <a id="id_Lop6" runat="server" href="/app-danh-muc-khoi-thcs-6" onclick="DisplayLoadingIcon()" class="class-item color lock-button">
                    <img src="/images/images-nhatban.png" alt="Alternate Text" />
                    <div class="class-item__name green-text">Lớp 6</div>
                    <%--<i class="fa fa-lock" aria-hidden="true" id="iconLock1" runat="server"></i>--%>
                </a><a id="id_Lop7" runat="server" href="/app-danh-muc-khoi-thcs-7" onclick="DisplayLoadingIcon()" class="class-item color lock-button">
                    <img src="/images/images-nhatban.png" alt="Alternate Text" />
                    <div class="class-item__name green-text">Lớp 7</div>
                    <%--<i class="fa fa-lock" aria-hidden="true" id="iconLock2" runat="server"></i>--%>
                </a><a id="id_Lop8" runat="server" href="/app-danh-muc-khoi-thcs-8" onclick="DisplayLoadingIcon()" class="class-item color lock-button">
                    <img src="/images/images-nhatban.png" alt="Alternate Text" />
                    <div class="class-item__name green-text">Lớp 8</div>
                    <%--<i class="fa fa-lock " aria-hidden="true" id="iconLock3" runat="server"></i>--%>
                </a><a id="id_Lop9" runat="server" href="/app-danh-muc-khoi-thcs-9" onclick="DisplayLoadingIcon()" class="class-item color lock-button">
                    <img src="/images/images-nhatban.png" alt="Alternate Text" />
                    <div class="class-item__name green-text">Lớp 9</div>
                    <%--<i class="fa fa-lock" aria-hidden="true" id="iconLock4" runat="server"></i>--%>
                </a><%--<a id="KhoLuyenTap" runat="server" href="/kho-luyen-tap" onclick="DisplayLoadingIcon()" class="class-item color lock-button">
                    <img src="/images/images-nhatban.png" alt="Alternate Text" />
                    <div class="class-item__name green-text">Test</div>
                </a>--%>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="BottomWrapper" Runat="Server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="Footer" Runat="Server">
    <script>
        jQuery("#slide-main").owlCarousel({
            animateOut: "slideOutDown",
            animateIn: "flipInX",
            items: 1,
            loop: false,
            dots: false,
            margin: 0,
            nav: false,
            //navText: [
            //    '<i class="fa fa-angle-left" aria-hidden="true"></i>',
            //    '<i class="fa fa-angle-right" aria-hidden="true"></i>',
            //],
        });
        //jQuery('#slide-class').owlCarousel({
        //    autoWidth: true,
        //    items: 4,
        //    loop: false,
        //    rewind: false,
        //    margin: 30,
        //    dots: false,

        //});
        jQuery('#slide-alert').owlCarousel({
            animateOut: "slideOutDown",
            animateIn: "flipInX",
            items: 1,
            loop: false,
            dots: false,
            margin: 0,
            nav: true,

        });
        jQuery('#slide-ads').owlCarousel({
            animateOut: "slideOutDown",
            animateIn: "flipInX",
            items: 1,
            loop: false,
            dots: false,
            margin: 0,
            nav: true,

        });
        var activeMenu = document.getElementById("menu-home");
        activeMenu.classList.add("active");
    </script>
</asp:Content>

