<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageLandingPage.master" AutoEventWireup="true" CodeFile="UI_dsbai_2.aspx.cs" Inherits="web_module_UI_Hieu_UI_dsbai_2" %>


<%@ Register Src="~/web_usercontrol/global_LandingPage_Menu_1.ascx" TagPrefix="uc1" TagName="global_LandingPage_Menu_1" %>


<%--<%@ Register Src="~/web_usercontrol/global_LandingPage_Menu1.ascx" TagPrefix="uc1" TagName="global_LandingPage_Menu1" %>--%>
<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="Server">
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
    </style>
    <link href="../../css/listBooks.css" rel="stylesheet" />
    <script src="admin_js/sweetalert.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Menu" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="TopWrapper" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Wrapper" runat="Server">
<%--    <uc1:global_LandingPage_Menu1 runat="server" ID="global_LandingPage_Menu1" />--%>
    <uc1:global_LandingPage_Menu_1 runat="server" ID="global_LandingPage_Menu_1" />
    <asp:ScriptManager runat="server" />
    <div class="step-contact" style="justify-content:center; background-image: url(/images/bg-red-dangki_nhap-1.png)";>
    <div class="block-main pt-3 pb-5 mb-3 px-3">
        <div id="lessonContainer">
            <div class="unit-list__title">Học bảng chữ cái Katakana</div>
            <div class="container-fluid">
                <%--<div id="lesson_thing"></div>--%>
               <div class="title_lesson_s"> Bài 1 : Hàng A : a, i, u, e, o </div>
                <div class="row">
                    <div class="col-4 col-sm-4 col-md-4">
                        <div class="lesson-row">
                            <a href="javascript:void(0)" class="lesson-item" id="id_285" onclick="xembai(285)" tabindex="-1">
                                <div class="lesson-item__avatar">
                                    <img src="/imageGame/Bang_chu_cai_Katakana/chu-a.png">
                                </div>
                                <div class="lesson-item__content">
                                    <div class="lesson-item__content--title">
                                       Lý thuyết
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
                            <a href="javascript:void(0)" class="lesson-item" id="id_286" onclick="xembai(286)">
                                <div class="lesson-item__avatar">
                                    <img src="/imageGame/Bang_chu_cai_Hiragana/hinh-chu-a.png">
                                </div>
                                <div class="lesson-item__content">
                                    <div class="lesson-item__content--title">
                                        Luyện tập
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
                            <a href="javascript:void(0)" class="lesson-item" id="id_287" onclick="xembai(287)">
                                <div class="lesson-item__avatar">
                                    <img src="/imageGame/Bang_chu_cai_Katakana/viet-chu-a.png">
                                </div>
                                <div class="lesson-item__content">
                                    <div class="lesson-item__content--title">
                                        Luyện tập (nâng cao)
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
                <div class="title_lesson_s">Bài 2 : Hàng Ka : ka, ki, ku, ke, ko </div>
                <div class="row">
                    <div class="col-4 col-sm-4 col-md-4">
                        <div class="lesson-row">
                            <a href="javascript:void(0)" class="lesson-item" id="id_258" onclick="xembai(288)">
                                <div class="lesson-item__avatar">
                                    <img src="/imageGame/Bang_chu_cai_Katakana/chu-ka.png">
                                </div>
                                <div class="lesson-item__content">
                                    <div class="lesson-item__content--title">
                                        Lý thuyết
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
                            <a href="javascript:void(0)" class="lesson-item" id="id_259" onclick="xembai(289)">
                                <div class="lesson-item__avatar">
                                    <img src="/imageGame/Bang_chu_cai_Katakana/hinh-chu-ka.png">
                                </div>
                                <div class="lesson-item__content">
                                    <div class="lesson-item__content--title">
                                        Luyện tập
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
       <a id="btnXemBai" runat="server" onserverclick="btnXemBai_ServerClick" style="display: none"></a>
            <input type="text" id="txtIDBaiHoc" runat="server" style="display: none" />
    </div>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="BottomWrapper" runat="Server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="Footer" runat="Server">
        <script>
            function DisplayLoadingIcon() {
                $("#img-loading-icon").show();
        }
            function HiddenLoadingIcon() {
                $("#img-loading-icon").hide();
        }
            document.addEventListener("DOMContentLoaded", function () {
                DisplayLoadingIcon()
            //debugger
            var studentId = 11;// document.getElementById("hfStudentId").value;
            var sachId = 1;//document.getElementById("hfSachId").value;
            //fetchLessons(studentId, sachId); // Thay 1 bằng studentId thực tế

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
                fetch(`/GetDataBaiHoc.ashx?action=lessonskhoihai&studentId=${studentId}&sachId=${sachId}`)
                    .then(response => response.json())
                    .then(data => {
                        console.log(data);
                        const container = document.getElementById("lessonContainer");
                        container.innerHTML = "";
                        data.forEach(lesson => {

                            let lessonHtml = "";
                            lesson.listLessons.forEach(ls => {
                                let ratingHtml = "";
                                ls.lichSuLamBai.forEach(ls1 => {
                                    ratingHtml += `
                                        <div class="rating-item" >
                                            <label>${ls1.lichsulambai_vitribaitap}</label>
                                            <img src="${ls1.sao}" />
                                        </div>
                                        `;
                                });
                                lessonHtml += `
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
                                        `;
                            });
                            /*  <a href="${ls.link_in}" class="btn btn-print"><i class="fa fa-print" aria-hidden="true"></i></a>*/

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
            function xembai(id) {
                DisplayLoadingIcon();
            document.getElementById("<%= txtIDBaiHoc.ClientID%>").value = id;
            document.getElementById("<%= btnXemBai.ClientID%>").click();
        }

    </script>
   <%-- <script>
        document.addEventListener("DOMContentLoaded", function () {
            const lessons = [
                // Bài 1: a
                {
                    bai: 1,
                    group: "Bài 1: a",
                    items: [
                        { id: 255, img: "/imageGame/Bang_chu_cai_Hiragana/chu-a.png", title: "Lý thuyết", view: 1 },
                        { id: 256, img: "/imageGame/Bang_chu_cai_Hiragana/hinh-chu-a.png", title: "Ôn tập", view: 0 },
                        { id: 257, img: "/imageGame/Bang_chu_cai_Hiragana/viet-chu-a.png", title: "Ôn tập (Nâng cao)", view: 0 }
                    ]
                },

                // Bài 2: i
                {
                    bai: 2,
                    group: "Bài 2: i",
                    items: [
                        { id: 300, img: "/imageGame/Bang_chu_cai_Hiragana/chu-i.png", title: "Lý thuyết", view: 2 },
                        { id: 301, img: "/imageGame/Bang_chu_cai_Hiragana/hinh-chu-i.png", title: "Ôn tập", view: 1 },
                        { id: 302, img: "/imageGame/Bang_chu_cai_Hiragana/viet-chu-i.png", title: "Ôn tập (Nâng cao)", view: 0 }
                    ]
                },

                // Bài 3: u
                {
                    bai: 3,
                    group: "Bài 3: u",
                    items: [
                        { id: 310, img: "/imageGame/Bang_chu_cai_Hiragana/chu-u.png", title: "Lý thuyết", view: 0 },
                        { id: 311, img: "/imageGame/Bang_chu_cai_Hiragana/hinh-chu-u.png", title: "Ôn tập", view: 0 },
                        { id: 312, img: "/imageGame/Bang_chu_cai_Hiragana/viet-chu-u.png", title: "Ôn tập (Nâng cao)", view: 0 }
                    ]
                },

                // Bài 4: e
                {
                    bai: 4,
                    group: "Bài 4: e",
                    items: [
                        { id: 320, img: "/imageGame/Bang_chu_cai_Hiragana/chu-e.png", title: "Lý thuyết", view: 0 },
                        { id: 321, img: "/imageGame/Bang_chu_cai_Hiragana/hinh-chu-e.png", title: "Ôn tập", view: 0 },
                        { id: 322, img: "/imageGame/Bang_chu_cai_Hiragana/viet-chu-e.png", title: "Ôn tập (Nâng cao)", view: 0 }
                    ]
                },

                // Bài 5: o
                {
                    bai: 5
                    group: "Bài 5: o",
                    items: [
                        { id: 330, img: "/imageGame/Bang_chu_cai_Hiragana/chu-o.png", title: "Lý thuyết", view: 0 },
                        { id: 331, img: "/imageGame/Bang_chu_cai_Hiragana/hinh-chu-o.png", title: "Ôn tập", view: 0 },
                        { id: 332, img: "/imageGame/Bang_chu_cai_Hiragana/viet-chu-o.png", title: "Ôn tập (Nâng cao)", view: 0 }
                    ]
                },

                // Bài 6: ka
                {
                    bai: 6,
                    group: "Bài 6: ka",
                    items: [
                        { id: 340, img: "/imageGame/Bang_chu_cai_Hiragana/chu-ka.png", title: "Lý thuyết", view: 0 },
                        { id: 341, img: "/imageGame/Bang_chu_cai_Hiragana/hinh-chu-ka.png", title: "Ôn tập", view: 0 },
                        { id: 342, img: "/imageGame/Bang_chu_cai_Hiragana/viet-chu-ka.png", title: "Ôn tập (Nâng cao)", view: 0 }
                    ]
                },

                // Bài 7: ki
                {
                    bai: 7,
                    group: "Bài 7: ki",
                    items: [
                        { id: 350, img: "/imageGame/Bang_chu_cai_Hiragana/chu-ki.png", title: "Lý thuyết", view: 0 },
                        { id: 351, img: "/imageGame/Bang_chu_cai_Hiragana/hinh-chu-ki.png", title: "Ôn tập", view: 0 },
                        { id: 352, img: "/imageGame/Bang_chu_cai_Hiragana/viet-chu-ki.png", title: "Ôn tập (Nâng cao)", view: 0 }
                    ]
                },

                // Bài 8: ku
                {
                    bai:8,
                    group: "Bài 8: ku",
                    items: [
                        { id: 360, img: "/imageGame/Bang_chu_cai_Hiragana/chu-ku.png", title: "Lý thuyết", view: 0 },
                        { id: 361, img: "/imageGame/Bang_chu_cai_Hiragana/hinh-chu-ku.png", title: "Ôn tập", view: 0 },
                        { id: 362, img: "/imageGame/Bang_chu_cai_Hiragana/viet-chu-ku.png", title: "Ôn tập (Nâng cao)", view: 0 }
                    ]
                },

                // Bài 9: ke
                {
                    bai:9,
                    group: "Bài 9: ke",
                    items: [
                        { id: 370, img: "/imageGame/Bang_chu_cai_Hiragana/chu-ke.png", title: "Lý thuyết", view: 0 },
                        { id: 371, img: "/imageGame/Bang_chu_cai_Hiragana/hinh-chu-ke.png", title: "Ôn tập", view: 0 },
                        { id: 372, img: "/imageGame/Bang_chu_cai_Hiragana/viet-chu-ke.png", title: "Ôn tập (Nâng cao)", view: 0 }
                    ]
                },

                // Bài 10: ko
                {
                    bai: 10,
                    groupTitle: "Bài 10: ko",
                    items: [
                        { id: 380, img: "/imageGame/Bang_chu_cai_Hiragana/chu-ko.png", title: "Lý thuyết", view: 0 },
                        { id: 381, img: "/imageGame/Bang_chu_cai_Hiragana/hinh-chu-ko.png", title: "Ôn tập", view: 0 },
                        { id: 382, img: "/imageGame/Bang_chu_cai_Hiragana/viet-chu-ko.png", title: "Ôn tập (Nâng cao)", view: 0 }
                    ]
                }
            ];
            const container = document.getElementById("lesson_thing");

            lessons.forEach(bai => {
                // thêm tiêu đề bài
                container.innerHTML += `<div class="title_lesson_s">${bai.group}</div><div class="row">`;

                bai.items.forEach(item => {
                    container.innerHTML +=`
            <div class="title_lesson_s">${bai.groupTitle}</div>
            <div class="row">
        `;

        bai.items.forEach(item => {
            container.innerHTML += `
                <div class="col-4 col-sm-4 col-md-4">
                    <div class="lesson-row">
                        <a href="javascript:void(0)" class="lesson-item" id="id_${item.id}" onclick="xembai(${item.id})">
                            <div class="lesson-item__avatar">
                                <img src="${item.img}">
                            </div>
                            <div class="lesson-item__content">
                                <div class="lesson-item__content--title">${item.title}</div>
                                <div class="lesson-item__content--view">
                                    <i class="fa fa-eye"></i>&nbsp; ${item.view}
                                </div>
                                <div class="lesson-item__content--decription"></div>
                                <div class="rating-list"></div>
                            </div>
                        </a>
                    </div>
                </div>
            `;
                });

                container.innerHTML += `</div>`; // đóng .row
            });
        });
    </script>--%>
</asp:Content>

