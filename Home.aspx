<%@ Page Title="" Language="C#" MasterPageFile="~/Home_MasterPage.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<%@ Register Src="~/web_usercontrol/global_header_avatar.ascx" TagPrefix="uc1" TagName="global_header_avatar" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Header" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Menu" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="TopWrapper" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Wrapper" Runat="Server">
        <div class="home page-view ">
            <uc1:global_header_avatar runat="server" ID="global_header_avatar" />
        <div class="block-body">
            <div id="section-class">
                <a id="id_Lop1" runat="server" href="/app-danh-muc-khoi-tieu-hoc-1" onclick="DisplayLoadingIcon()" class="class-item color lock-button">
                    <div class="class-item__name green-text">Lớp 6</div>
                    <i class="fa fa-lock" aria-hidden="true" id="iconLock1" runat="server"></i>
                </a><a id="id_Lop2" runat="server" href="/app-danh-muc-khoi-tieu-hoc-2" onclick="DisplayLoadingIcon()" class="class-item color lock-button">
                    <div class="class-item__name green-text">Lớp 7</div>
                    <i class="fa fa-lock" aria-hidden="true" id="iconLock2" runat="server"></i>
                </a><a id="id_Lop3" runat="server" href="/app-danh-muc-khoi-tieu-hoc-3" onclick="DisplayLoadingIcon()" class="class-item color lock-button">
                    <div class="class-item__name green-text">Lớp 8</div>
                    <i class="fa fa-lock " aria-hidden="true" id="iconLock3" runat="server"></i>
                </a><a id="id_Lop4" runat="server" href="/app-danh-muc-khoi-tieu-hoc-4" onclick="DisplayLoadingIcon()" class="class-item color lock-button">
                    <div class="class-item__name green-text">Lớp 9</div>
                    <i class="fa fa-lock" aria-hidden="true" id="iconLock4" runat="server"></i>
                </a><%--<a id="id_Lop5" runat="server" href="/app-danh-muc-khoi-tieu-hoc-5" onclick="DisplayLoadingIcon()" class="class-item color lock-button">
                    <div class="class-item__name green-text">Lớp 5</div>
                    <i class="fa fa-lock" aria-hidden="true" id="iconLock5" runat="server"></i>
                </a>--%>

            </div>

            <div class="banner-block">
                <asp:Repeater ID="rpSoLLDT_ThongBao" runat="server">
                    <ItemTemplate>
                        <div class="frame-shadow">
                            <img class="ribbon-header" src="/images/tieu-hoc/ribbon-thong_bao.png" alt="Thông báo" />
                            <a href="#" class="btn-readmore">Xem thêm</a>
                            <img src="<%#Eval("thongbao_image") %>" alt="Overlay Image" class="banner" />

                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <%--<div class="banner-block">
                <div class="frame-shadow">
                    <img src="/images/tieu-hoc/banner-test.jpg" alt="" class="banner" />
                </div>
            </div>--%>
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

