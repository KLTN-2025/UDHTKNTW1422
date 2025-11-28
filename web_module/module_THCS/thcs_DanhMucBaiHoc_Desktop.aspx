<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageLandingPage.master" AutoEventWireup="true" CodeFile="thcs_DanhMucBaiHoc_Desktop.aspx.cs" Inherits="web_module_module_THCS_thcs_DanhMucBaiHoc_Desktop" %>

<%@ Register Src="~/web_usercontrol/global_LandingPage_Menu.ascx" TagPrefix="uc1" TagName="global_LandingPage_Menu" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="Server">
    <style>
        .step-contact .step-content .section-contact .form-contact__title {
            margin-top: 1rem;
        }

        .title_lesson_s {
            font-size: 30px;
            font-weight: bold;
            color: black;
        }
    </style>
    <link href="../../css/listBooks.css" rel="stylesheet" />
    <script src="admin_js/sweetalert.min.js"></script>
    <script type="text/javascript">

        function xembai(id) {
            DisplayLoadingIcon();
            document.getElementById("<%= txtIDBaiHoc.ClientID%>").value = id;
            //lưu id sach và id khoi vao local stroge
            localStorage.setItem("idsach", "3");
            localStorage.setItem("idkhoi", "7");

            document.getElementById("<%= btnXemBai.ClientID%>").click();
        }

        document.addEventListener("DOMContentLoaded", function () {
            DisplayLoadingIcon()
            var studentId = document.getElementById("hfStudentId").value;
            var sachId = document.getElementById("hfSachId").value;
            fetchLessons(studentId, sachId); // Thay 1 bằng studentId thực tế

        });
        function scrollToHash() {
            var hash = window.location.hash; // Lấy hash từ URL (ví dụ: #id_334)
            if (hash) {
                var targetElement = $(hash);
                if (targetElement.length) {
                    $("html, body").animate({
                        scrollTop: targetElement.offset().top
                    }, 0, function () {
                        targetElement.attr("tabindex", "-1").focus();
                    });
                }
            }
        }

        function fetchLessons(studentId, sachId) {
            fetch(`GetDataBaiHoc.ashx?action=lessonskhoihai&studentId=${studentId}&sachId=${sachId}`)
                .then(response => response.json())
                .then(data => {
                    const container = document.getElementById("lessonContainer");
                    container.innerHTML = "";
                    data.forEach(lesson => {

                        let lessonHtml = '<div class="row">';
                        lesson.listLessons.forEach(ls => {
                            let ratingHtml = "";
                            ls.lichSuLamBai.forEach(ls1 => {
                                ratingHtml += `
                                        <div class="rating-item" style="${ls1.mystyle2}">
                                            <label>${ls1.lichsulambai_vitribaitap}</label>
                                            <img src="${ls1.sao}" />
                                        </div>

                                         <div class="rating-item --point" style="${ls1.mystyle}">
                                            <label>Điểm tốt nhất: ${ls1.lichsulambai_diem}</label>
                                        </div>
                                        `;
                            });
                            lessonHtml += `
                                    <div class="col-4 col-sm-4 col-md-4">
                                        <div class="lesson-row">
                                            <a href="javascript:void(0)" class="lesson-item" id="id_${ls.baihoc_id}" onclick="xembai(${ls.baihoc_id})">
                                                <div class="lesson-item__avatar">
                                                    <img src="${ls.baihoc_avatar}" />
                                                </div>
                                                <div class="lesson-item__content">
                                                    <div class="lesson-item__content--title">
                                                        ${ls.baihoc_title}
                                                    </div>
                                                    <div class="lesson-item__content--view">
                                                        <i class="fa fa-eye"></i>&nbsp; ${ls.solan}
                                                    </div>
                                                    <div class="lesson-item__content--decription"></div>
                                                    <div class="rating-list">${ratingHtml}</div>
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                        `;
                        });
                        //<a href="${ls.link_in}" class="btn btn-print"><i class="fa fa-print" aria-hidden="true"></i></a>

                        const topicHtml = `
                         <div class="unit-list__title">${lesson.chudebaihoc_name}</div>
                            ${lessonHtml}
                        `;
                        container.innerHTML += topicHtml;
                        // Sau khi render xong, thực hiện scroll đến phần tử trên URL
                        scrollToHash();
                    });
                    HiddenLoadingIcon()
                })
                .catch(error => console.error("Lỗi khi fetch dữ liệu:", error));
        }
        function DisplayLoadingIcon() {
            $("#img-loading-icon").show();
        }
        function HiddenLoadingIcon() {
            $("#img-loading-icon").hide();
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Menu" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="TopWrapper" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Wrapper" runat="Server">
    <asp:HiddenField ID="hfStudentId" runat="server" />
    <asp:HiddenField ID="hfSachId" runat="server" />
    <uc1:global_LandingPage_Menu runat="server" ID="global_LandingPage_Menu" />
    <asp:ScriptManager runat="server" />
    <div id="" class="step-contact" style="justify-content: center; background-image: url(/images/back_bai.jpg)">
        <div><%=tenSach %></div>
        <div class="block-main pt-3 pb-5 mb-3 px-3">
            <div id="lessonContainer">
                <%-- <div class="unit-list__title">Học bảng chữ cái Hiragana</div>--%>
                <%--<div class="container-fluid">
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
                </div>--%>

                <%--<div class="container-fluid">
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
                </div>--%>
            </div>
             <a id="btnXemBai" runat="server" onserverclick="btnXemBai_ServerClick" style="display: none"></a>
           <input type="text" id="txtIDBaiHoc" runat="server" style="display: none" />
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="BottomWrapper" runat="Server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="Footer" runat="Server">
</asp:Content>

