<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="testJP.aspx.cs" Inherits="testJP" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Header" Runat="Server">
    <script src="admin_js/sweetalert.min.js"></script>
    <link href="https://dinotech.vn/css/listBooks.css" rel="stylesheet" />
    <script src="/js/owl.carousel.js"></script>
    <style>
        .subject-hide {
            display: none
        }

        .event__title {
            font-size: 1.3rem !important;
        }

        .block-book {
            background: unset;
        }

        .book-card:hover {
            color: #00763d;
        }

        .book-card__title {
            font-weight: 600;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Menu" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="TopWrapper" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Wrapper" Runat="Server">
    <div id="section-courses">
        <div class="container-fluid" id="blockHocSinh" runat="server">
            <div class="card-view">
                <ul class="nav nav-pills nav-monhoc" id="pills-tab" role="tablist">
                    <li class="nav-item" role="presentation">
                        <button class="nav-link active" id="pills-home-tab" data-toggle="pill" data-target="#pills-home" type="button" role="tab" aria-controls="pills-home" aria-selected="true">Khối 6</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="pills-profile-tab" data-toggle="pill" data-target="#pills-profile" type="button" role="tab" aria-controls="pills-profile" aria-selected="false">Khối 7</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="pills-contact-tab" data-toggle="pill" data-target="#pills-contact" type="button" role="tab" aria-controls="pills-contact" aria-selected="false">Khối 8</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="khoi9-tab" data-toggle="pill" data-target="#khoi9" type="button" role="tab" aria-controls="khoi9" aria-selected="false">Khối 9</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <a href="/slldt-luyen-tap" class="nav-link">Kho luyện tập</a>
                    </li>
                </ul>
                <div class="tab-content" id="pills-tabContent">
                    <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
                        <div class="block-main pt-3 pb-5 mb-3 px-3">
                            <div class="block-book">
                                <div class="books-list">
                                    <div class="book-item">
                                        <a href="<%= hiragana %>" class="book-card" onclick="DisplayLoadingIcon()" style="text-decoration: none;">
                                            <div class="book-card__cover">
                                                <div class="book-card__book">
                                                    <div class="book-card__book-front">
                                                        <img class="book-card__img" src="images/Bang_chu_cai_Hiragana/Hiragana.jpg">
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
                                                        <img class="book-card__img" src="images/Bang_chu_cai_Katakana/Katakana.jpg">
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
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab">
                        <div class="block-main pt-3 pb-5 mb-3 px-3">
                            <div class="block-book">
                                <div class="books-list">
                                    <div class="book-item">
                                        <a href="danh-muc-sach-3" class="book-card" onclick="DisplayLoadingIcon()" style="text-decoration: none;">
                                            <div class="book-card__cover">
                                                <div class="book-card__book">
                                                    <div class="book-card__book-front">
                                                        <img class="book-card__img" src="images/img_beginner_understand01.gif">
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
                            </div>

                        </div>
                    </div>
                    <div class="tab-pane fade" id="pills-contact" role="tabpanel" aria-labelledby="pills-contact-tab">
                        <div class="block-main pt-3 pb-5 mb-3 px-3">
                            <div class="block-book">
                                <div class="books-list">
                                    <div class="book-item">
                                        <a href="danh-muc-sach-4" class="book-card" onclick="DisplayLoadingIcon()" style="text-decoration: none;">
                                            <div class="book-card__cover">
                                                <div class="book-card__book">
                                                    <div class="book-card__book-front">
                                                        <img class="book-card__img" src="images/img_beginner_understand01.gif">
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
                            </div>

                        </div>
                    </div>
                    <div class="tab-pane fade" id="khoi9" role="tabpanel" aria-labelledby="khoi9">
                        <div class="block-main pt-3 pb-5 mb-3 px-3">
                            <div class="block-book">
                                <div class="books-list">
                                    <div class="book-item">
                                        <a href="danh-muc-sach-5" class="book-card" onclick="DisplayLoadingIcon()" style="text-decoration: none;">
                                            <div class="book-card__cover">
                                                <div class="book-card__book">
                                                    <div class="book-card__book-front">
                                                        <img class="book-card__img" src="images/img_beginner_understand01.gif">
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
                            </div>

                        </div>
                    </div>
                    <input type="text" id="txtIDBaiHoc" runat="server" style="display: none" />
                    <input type="text" id="txtIDBaiHocChuDe" runat="server" style="display: none" />
                </div>
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
            dots: true,
            margin: 0,
            nav: false,
        });

        jQuery('#slide-alert-class').owlCarousel({
            autoWidth: true,
            items: 4,
            loop: false,
            rewind: false,
            margin: 10,
            dots: false,

        });
        jQuery('#slide-alert-school').owlCarousel({
            autoWidth: true,
            items: 4,
            loop: false,
            rewind: false,
            margin: 10,
            dots: false,

        });
        $(function () {
            //item-subject
            $(".item-subject.subject-hide").each(function () {
                console.log($(this))
                $(this).parent().remove('.owl-item')
            })
            //console.log("subject",$(".item-subject.subject-hide"))

        })
        jQuery('#slide-course').owlCarousel({
            autoWidth: true,
            items: 4,
            loop: false,
            rewind: false,
            margin: 10,
            dots: false,

        });
    </script>

</asp:Content>

