<%@ Page Language="C#" AutoEventWireup="true" CodeFile="thcs_DanhMucBaiHoc.aspx.cs" Inherits="web_module_module_THCS_thcs_DanhMucBaiHoc" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
    <meta name="format-detection" content="telephone=no" />
    <meta name="full-screen" content="yes" />
    <meta name="x5-full-screen" content="true" />
    <meta name="360-full-screen" content="true" />
    <meta name="mobile-web-app-capable" content="yes" />
    <link rel="apple-touch-icon" href="/images/koi-logo_2.png" />
    <link rel="shortcut icon" href="/images/koi-logo_2.png" />
    <title><%=tenSach %></title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="/css/books/globalBooks.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="/js/current-device.min.js"></script>
    <link href="../../css/loading.css" rel="stylesheet" />
    <script type="text/javascript">
        window.ladi_viewport = function () {
            var width =
                window.outerWidth > 0 ? window.outerWidth : window.screen.width;
            var widthDevice = width;
            var is_desktop = width >= 768;
            var content = "";
            if (
                typeof window.ladi_is_desktop == "undefined" ||
                window.ladi_is_desktop == undefined
            ) {
                window.ladi_is_desktop = is_desktop;
            }
            if (!is_desktop) {
                widthDevice = 520;
            } else {
                widthDevice = "device-width";
                //widthDevice = 960;
            }
            content = "width=" + widthDevice + ", user-scalable=no";
            var scale = 1;
            if (
                !is_desktop &&
                widthDevice != window.screen.width &&
                window.screen.width > 0
            ) {
                scale = window.screen.width / widthDevice;
            }
            if (scale != 1) {
                content +=
                    ", initial-scale=" +
                    scale +
                    ", minimum-scale=" +
                    scale +
                    ", maximum-scale=" +
                    scale;
            }
            var docViewport = document.getElementById("viewport");
            if (!docViewport) {
                docViewport = document.createElement("meta");
                docViewport.setAttribute("id", "viewport");
                docViewport.setAttribute("name", "viewport");
                document.head.appendChild(docViewport);
            }
            docViewport.setAttribute("content", content);
        };
        window.ladi_viewport();
        function xembai(id) {
            DisplayLoadingIcon();
            document.getElementById("<%= txtIDBaiHoc.ClientID%>").value = id;
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

                        let lessonHtml = "";
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
</head>
<body class="body-mobi">
    <div class="loading" id="img-loading-icon" style="display: none">
        <div class="loading">Loading&#8230;</div>
    </div>
    <form id="form1" runat="server">
        <asp:HiddenField ID="hfStudentId" runat="server" />
        <asp:HiddenField ID="hfSachId" runat="server" />
        <div class="header-top --bg-tieuhoc">
            <a href="/app-danh-muc-khoi-tieu-hoc-1" onclick="DisplayLoadingIcon()" class="btn-back" id="btnBack" runat="server"><i class="fa fa-angle-left"></i></a>
            <h5><%=tenSach %></h5>
        </div>
        <div class="block-main pt-3 pb-5 mb-3 px-3">
            <div id="lessonContainer"></div>
            <a id="btnXemBai" runat="server" onserverclick="btnXemBai_ServerClick" style="display: none"></a>
            <input type="text" id="txtIDBaiHoc" runat="server" style="display: none" />

        </div>

    </form>
</body>
</html>
