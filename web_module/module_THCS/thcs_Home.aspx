<%@ Page Title="" Language="C#" MasterPageFile="~/Home_MasterPage.master" AutoEventWireup="true" CodeFile="thcs_Home.aspx.cs" Inherits="web_module_module_THCS_thcs_Home" %>

<%@ Register Src="~/web_usercontrol/global_header_avatar.ascx" TagPrefix="uc1" TagName="global_header_avatar" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Menu" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="TopWrapper" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Wrapper" runat="Server">
    <div class="home page-view ">
        <uc1:global_header_avatar runat="server" ID="global_header_avatar" />
        <div class="block-body">
            <div id="section-class">
                <a id="id_Lop6" runat="server" href="/app-danh-muc-khoi-thcs-6" onclick="DisplayLoadingIcon()" class="class-item color lock-button">
                    <img src="/images/minh-hoa-danh-muc.png" alt="Alternate Text" />
                    <div class="class-item__name green-text">Lớp 6</div>
                    <%--<i class="fa fa-lock" aria-hidden="true" id="iconLock1" runat="server"></i>--%>
                </a><a id="id_Lop7" runat="server" href="/app-danh-muc-khoi-thcs-7" onclick="DisplayLoadingIcon()" class="class-item color lock-button">
                    <img src="/images/minh-hoa-danh-muc.png" alt="Alternate Text" />
                    <div class="class-item__name green-text">Lớp 7</div>
                    <%--<i class="fa fa-lock" aria-hidden="true" id="iconLock2" runat="server"></i>--%>
                </a><a id="id_Lop8" runat="server" href="/app-danh-muc-khoi-thcs-8" onclick="DisplayLoadingIcon()" class="class-item color lock-button">
                    <img src="/images/minh-hoa-danh-muc.png" alt="Alternate Text" />
                    <div class="class-item__name green-text">Lớp 8</div>
                    <%--<i class="fa fa-lock " aria-hidden="true" id="iconLock3" runat="server"></i>--%>
                </a><a id="id_Lop9" runat="server" href="/app-danh-muc-khoi-thcs-9" onclick="DisplayLoadingIcon()" class="class-item color lock-button">
                    <img src="/images/minh-hoa-danh-muc.png" alt="Alternate Text" />
                    <div class="class-item__name green-text">Lớp 9</div>
                    <%--<i class="fa fa-lock" aria-hidden="true" id="iconLock4" runat="server"></i>--%>
                </a><a id="KhoLuyenTap" runat="server" href="/kho-luyen-tap" onclick="DisplayLoadingIcon()" class="class-item color lock-button">
                    <img src="/images/minh-hoa-kiem-tra.png" alt="Alternate Text" />
                    <div class="class-item__name green-text">Test</div>
                </a>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="BottomWrapper" runat="Server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="Footer" runat="Server">
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

