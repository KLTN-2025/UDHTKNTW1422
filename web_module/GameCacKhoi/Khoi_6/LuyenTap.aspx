<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LuyenTap.aspx.cs" Inherits="web_module_GameCacKhoi_Khoi_6_Luyen_Tap" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="/css/font-awesome.min.css" rel="stylesheet" />
    <link href="/css/books/globalBooks.css" rel="stylesheet" />
    <script src="/js/jquery-3.5.1.min.js"></script>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
    <meta name="format-detection" content="telephone=no" />
    <meta name="full-screen" content="yes" />
    <meta name="x5-full-screen" content="true" />
    <meta name="360-full-screen" content="true" />
    <meta name="mobile-web-app-capable" content="yes" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <style>
        .frame-game.--style-1 {
            min-height: calc(100vh - 40px);
            min-height: calc(100vh - 50px);
            display: -webkit-box;
            display: -ms-flexbox;
            display: flex;
        }

        @media (min-width: 992px) {
            .frame-game.--style-1 {
                min-height: calc(100vh - 112px);
            }
        }
    </style>
    <title><%= baihoc %></title>
</head>
<body class="page-contest --bg-body-2">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager" runat="server"></asp:ScriptManager>
        <div class="header-page">
            <div class="container">
                <div class="header-content">
                    <a class="header-content__home btn-menu" id="btnHome" href="/danh-muc-sach-<%=sach_id %>#<%=_id_lesson %>" data-id="<%=sach_id %>#<%=_id_lesson %>">
                        <i class="fa fa-home"></i>
                    </a>
                    <div class="header-content__title"><%=lesson_name %></div>
                    <div class="button-nav">
                        <a class="btn-menu btn-prev" id="btnPrevLesson" data-href="<%=link_prev %>" onclick="back()">
                            <i class="fa fa-angle-left"></i>
                        </a>
                        <a class="btn-menu btn-next" id="btnNextLesson" data-href="<%=link_next %>" style="<%= tinhtrangnext%>" onclick="next()">
                            <i class="fa fa-angle-right"></i></a>
                        <a class="btn-menu btn-next" href="#" id="btnNext" runat="server" onserverclick="btnNext_ServerClick"><i class="fa fa-angle-right" style="display: none"></i></a>
                        <a class="btn-menu btn-next" href="#" id="btnBack" runat="server" onserverclick="btnBack_ServerClick"><i class="fa fa-angle-right" style="display: none"></i></a>
                    </div>
                </div>
            </div>
        </div>

        <%--Game nối--%>
        <div id="dv_Noi" runat="server">
            <div class="frame-game --math">
                <div class="container">
                    <div class="frame-game-new --style-1">
                        <div class="">
                            <div class="title-page --style-3 _mt-34">
                                <asp:Repeater ID="rpnoidunggamenoi" runat="server">
                                    <ItemTemplate>
                                        <%#Eval("noi_noidung") %>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                            <div class="game-connect">

                                <div class="pair-horizontal --style-1 pair-horizontal--item-<%= noi %> mt-2">
                                    <div class="pair-horizontal__row --top">
                                        <asp:Repeater ID="rpTop" runat="server">
                                            <ItemTemplate>
                                                <a id="btn_img_<%#Eval("noi_id") %>" class="pair-horizontal__row--item --image item--top" onclick="myfunctionNumber('<%#Eval("noi_id") %>')">
                                                    <img src="<%#Eval("noi_img1") %>" />
                                                </a>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </div>
                                    <div class="pair-horizontal__row --bottom">
                                        <asp:Repeater ID="rpBottom" runat="server">
                                            <ItemTemplate>
                                                <a class="pair-horizontal__row--item --image item--bottom" id="img2_<%#Eval("noi_dapan") %>" onclick="myfunctionImage('<%#Eval("noi_dapan") %>')">
                                                    <img src="<%#Eval("noi_img2") %>" />
                                                </a>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </div>
                                </div>
                                <div style="display: none">
                                    <a class="ml-1 ml-md-3" href="javascript:void(0)" onclick="btnSubmitGameNoi()">
                                        <img class="" src="/images/images_button/btn-2.png" id="" alt="" />
                                    </a>

                                    <input id="id1" type="text" />
                                    <input id="id2" type="text" />
                                    <input id="txtHinh1" type="text" />
                                    <input id="txtHinh2" type="text" />
                                    <input type="text" id="txtTongNoi" runat="server" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%--Game trắc nghiệm--%>
        <div id="dv_TracNghiem" runat="server">
            <div class="frame-game --math">
                <div class="container">
                    <div class="frame-game-new --style-1">
                        <div class="">
                            <div class="title-page --style-3 _mt-34">
                                <asp:Repeater ID="rpnoidungtracnghiem" runat="server">
                                    <ItemTemplate>
                                        <%#Eval("cauhoi_content") %>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                            <div class="">
                                <div class="form-mutichoise mb-3 mb-md-4">
                                    <asp:Repeater ID="rpCauTraLoi" runat="server" OnItemDataBound="rpCauTraLoi_ItemDataBound">
                                        <ItemTemplate>
                                            <div class="mb-1 text-center">
                                                <div class="form-mutichoise__header--title --style-1">
                                                    <%#Eval("cauhoi_titlecauhoi") %>
                                                </div>
                                                <%-- <a class="btn-sound-question" href="javascript:void(0)" onclick="playSound(this.getAttribute('data-url'))" data-url="<%#Eval("cauhoi_mp3") %>">
                                                <img src="/images/images_button/loa-xanhdt-m.png" alt="Alternate Text" />
                                            </a>--%>
                                            </div>
                                            <div class="form-mutichoise__question">
                                                <div class="question-item">
                                                    <a class="question-item__image" id="<%#Eval("cauhoi_id") %>" href="javascript:void(0)" onclick="playSound(this.getAttribute('data-url'))" data-url="<%#Eval("cauhoi_mp3") %>">
                                                        <img src="<%#Eval("cauhoi_image") %>" />
                                                    </a>
                                                </div>
                                            </div>
                                            <div class="form-mutichoise__answer --item-3">
                                                <asp:Repeater ID="rpDapAn" runat="server">
                                                    <ItemTemplate>
                                                        <div class="answer-item tracnghiem" data-answer-tn="<%#Eval("cautraloi_dapandung") %>">
                                                            <a href="javascript:void(0)" class="answer-item__gather <%#Eval("style_class") %> hvr-push" data-id="<%#Eval("cautraloi_id") %>" onclick="myTraLoiMultiple('<%#Eval("cautraloi_id") %>','<%#Container.ItemIndex+1 %>','<%#Eval("cautraloi_dapandung") %>')">
                                                                <%#Eval("cautraloi_image") %>
                                                                <img class="btn btn-true" src="/images/images_button/btn-2.png" id="ic_Dung<%#Eval("cautraloi_id") %>" aria-hidden="true" style="display: none;" />
                                                                <img class="btn btn-false" src="/images/images_button/btn-6.png" id="ic_Sai<%#Eval("cautraloi_id") %>" aria-hidden="true" style="display: none;" />
                                                                <img class="btn btn-check" src="/images/images_button/btn-4.png" id="ic_Check<%#Eval("cautraloi_id") %>" aria-hidden="true" style="display: none;" />
                                                            </a>
                                                            <a href="javascript:void(0)" class="answer-item__sound" id="mp3_<%#Eval("cautraloi_id") %>" style="<%#Eval("style")%>"
                                                                onclick="audioDapAn(<%#Eval("cautraloi_id") %>)">
                                                                <img src="../../../images/images_button/loa-xanhdt-m.png" />
                                                            </a>
                                                            <audio hidden="hidden" id="audioDapAn_<%#Eval("cautraloi_id") %>" src="../../<%#Eval("cautraloi_mp3") %>" controls="controls" />
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </div>
                                            <div class="br-bottom"></div>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>
                                <div style="display: none">
                                    <a href="javascript:void(0)">
                                        <img class="" src="/images/images_button/btn-2.png" onclick="btnSubmitTracNghiem()" alt="" />
                                    </a>
                                    <input type="text" id="txtTongTracNghiem" runat="server" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%--Game lật hình--%>
        <div id="dv_LapHinh" runat="server">
            <div class="frame-game --math">
                <div class="container">
                    <div class="frame-game-new --style-1">
                        <div class="title-page --style-3 _mt-34">
                            <asp:Repeater ID="rpnoidunglathinh" runat="server">
                                <ItemTemplate>
                                    <%#Eval("lathinh_noidung") %>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                        <div class="mb-1 text-center">
                            <div class="form-mutichoise__header--title --style-1">
                                Lật hình để tìm hình giống nhau thành từng cặp
                            </div>
                        </div>
                        <div class="game-flip-picture">
                            <div class="list-flip --item-<%= socap %>">
                                <asp:Repeater ID="rpListHinhAnh" runat="server">
                                    <ItemTemplate>
                                        <div class="flip-item" id="btnHinh<%#Eval("lathinh_id") %>" data-anser="<%#Eval("lathinh_code") %>" onclick="funcFlipimages(<%#Eval("lathinh_id") %>)">
                                            <div class="flipper">
                                                <img src="/images/bang-null.png" alt="" />
                                                <div class="front">
                                                    <img src="/images/lat-hinh3.png" alt="" />
                                                </div>
                                                <div class="back">
                                                    <img src="<%#Eval("lathinh_image") %>" />
                                                </div>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </div>
                    </div>
                    <div style="display: none">
                        <input type="text" id="txtTongLatHinh" runat="server" />
                        <a href="javascript:void(0)">
                            <img class="" src="/images/images_button/btn-2.png" onclick="btnSubmitLatHinh()" alt="" />
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <%--Nộp bài--%>
        <div class="button-submit" id="dv_Submit" runat="server" style="display: block">
            <a href="javascript:void(0)" id="submitTongBaiKiemTra" onclick="checkSubmitNopBai()">
                <img class="buttonCalculation" src="/images/btn-baikiemtra-submit.png" />
            </a>
            <input type="text" id="txtKQ" runat="server" style="display: none" />
            <input type="text" id="txtSoDiemLonNhatDaCo" runat="server" style="display: none" />
            <input type="text" id="txtSoDiemLonNhat" style="display: none" />
            <input type="text" id="txtTimeStart" runat="server" value="" style="display: none" />
            <input type="text" id="txtOrderGame" runat="server" value="" style="display: none" />
            <a href="javascript:void(0)" id="btnLamLaiBaiTap" runat="server" onserverclick="btnLamLaiBaiTap_ServerClick" style="display: none"></a>
            <audio hidden="hidden" class="media" id="audioselect" src="/Musics/audio_select.mp3" controls="controls" style="display: none"></audio>
            <audio hidden="hidden" class="media" id="audioright" src="/Musics/audio_right.mp3" controls="controls"></audio>
            <audio hidden="hidden" class="media" id="audiofalse" src="/Musics/audio_false.mp3" controls="controls"></audio>
            <input type="text" id="txtID_LoaiGame" runat="server" style="display: none" />
        </div>
        <div class="button-submit" id="dv_reset" style="display: none">
            <a href="javascript:void(0)" onclick="lambai()">
                <img class="buttonCalculation" src="/images/btn-baikiemtra-reset.png" />
            </a>
        </div>
    </form>
</body>
<script>
    let audio;
    function pauseAudio() {
        if (audio && !audio.paused) {
            audio.pause();
            audio.currentTime = 0;
        }
    }
    const playSound = (url) => {
        pauseAudio();
        audio = new Audio(url);
        audio.play();
    }
    function next() {
        let btnElement = document.getElementById("<%=btnNext.ClientID %>");
        btnElement.click();
    }
    function back() {
        let btnElementback = document.getElementById("<%=btnBack.ClientID %>");
        btnElementback.click();
    }
    //Nối
    var ListLine = [];
    var arr_item = [];
    let demm = 0;
    let tongconnect = 0;
    function myfunctionNumber(id) {
        if (ListLine != "") {
            let _id = "btn_img_" + id;
            var item = [];
            for (i = 0; i < ListLine.length; i++) {
                item = arr_item[i].split(',')
                if (item[0] == _id || item[1] == _id) {
                    document.getElementById(ListLine[i]).parentNode.removeChild(document.getElementById(ListLine[i]));
                    document.getElementById(item[0]).classList.contains('select') ? document.getElementById(item[0]).classList.remove('select') : null;
                    document.getElementById(item[1]).classList.contains('select') ? document.getElementById(item[1]).classList.remove('select') : null;
                    ListLine.splice(i, 1);
                    arr_item.splice(i, 1);
                }
            }
        }
        $('#audioselect').get(0).play();
        if (document.getElementById("txtHinh1").value == "" || document.getElementById("txtHinh2").value == "") {
            document.getElementById("btn_img_" + id).classList.add('select');
            if (document.getElementById("txtHinh1").value == "") {
                document.getElementById("id1").value = id;
                document.getElementById("txtHinh1").value = "btn_img_" + id;
            }
            else {
                document.getElementById("id2").value = id;
                document.getElementById("txtHinh2").value = "btn_img_" + id;
                demo(document.getElementById("id1").value, document.getElementById("id2").value, document.getElementById("txtHinh1").value, document.getElementById("txtHinh2").value)
            }
        }
    }
    function myfunctionImage(id) {
        if (ListLine != "") {
            let _id = "img2_" + id;
            var item = [];
            for (i = 0; i < ListLine.length; i++) {
                item = arr_item[i].split(',')
                if (item[0] == _id || item[1] == _id) {
                    document.getElementById(ListLine[i]).parentNode.removeChild(document.getElementById(ListLine[i]));
                    document.getElementById(item[0]).classList.contains('select') ? document.getElementById(item[0]).classList.remove('select') : null;
                    document.getElementById(item[1]).classList.contains('select') ? document.getElementById(item[1]).classList.remove('select') : null;
                    ListLine.splice(i, 1);
                    arr_item.splice(i, 1);
                }
            }
        }
        $('#audioselect').get(0).play();
        if (document.getElementById("txtHinh1").value == "" || document.getElementById("txtHinh2").value == "") {
            document.getElementById("img2_" + id).classList.add('select');
            if (document.getElementById("txtHinh1").value == "") {
                document.getElementById("id1").value = id;
                document.getElementById("txtHinh1").value = "img2_" + id;
            }
            else {
                document.getElementById("id2").value = id;
                document.getElementById("txtHinh2").value = "img2_" + id;
                demo(document.getElementById("id1").value, document.getElementById("id2").value, document.getElementById("txtHinh1").value, document.getElementById("txtHinh2").value)
            }
        }
    }
    async function demo(id1, id2, hinh1, hinh2) {
        await sleep(1000);
        let _elemFirst = document.getElementById(hinh1);
        let _elemSecond = document.getElementById(hinh2);
        if (_elemFirst.classList.contains("item--top") && _elemSecond.classList.contains("item--top") || _elemFirst.classList.contains("item--bottom") && _elemSecond.classList.contains("item--bottom")) {
            document.getElementById(hinh1).classList.remove('select');
            document.getElementById(hinh2).classList.remove('select');
            document.getElementById(hinh1).style.pointerEvents = "auto";
            document.getElementById(hinh2).style.pointerEvents = "auto";
        }
        else {
            arr_item.push(hinh1 + ',' + hinh2);
            if (_elemFirst.classList.contains("item--top")) {
                let x1 = _elemFirst.offsetLeft + (_elemFirst.offsetWidth / 2);
                let y1 = _elemFirst.offsetTop + _elemFirst.offsetHeight;
                let x2 = _elemSecond.offsetLeft + (_elemSecond.offsetWidth / 2);
                let y2 = _elemSecond.offsetTop;
                if (id1 === id2) {
                    document.body.appendChild(createLine(x1, y1, x2, y2, "dung"));
                }
                else {
                    document.body.appendChild(createLine(x1, y1, x2, y2, "sai"));
                }
            }
            else {
                let x1 = _elemFirst.offsetLeft + (_elemFirst.offsetWidth / 2);
                let y1 = _elemFirst.offsetTop;
                let x2 = _elemSecond.offsetLeft + (_elemSecond.offsetWidth / 2);
                let y2 = _elemSecond.offsetTop + _elemSecond.offsetHeight;
                if (id1 === id2) {
                    document.body.appendChild(createLine(x1, y1, x2, y2, "dung"));
                }
                else {
                    document.body.appendChild(createLine(x1, y1, x2, y2, "sai"));
                }
            }
            document.getElementById(hinh1).classList.add("active");
            document.getElementById(hinh2).classList.add("active");
            demm++;
        }
        document.getElementById("id1").value = "";
        document.getElementById("id2").value = "";
        document.getElementById("txtHinh1").value = "";
        document.getElementById("txtHinh2").value = "";
    }
    function sleep(ms) {
        return new Promise(resolve => setTimeout(resolve, ms));
    }
    function createLine(x1, y1, x2, y2, giatri) {
        let length = Math.sqrt(((x2 - x1) * (x2 - x1)) + ((y2 - y1) * (y2 - y1)));
        let cx = ((x1 + x2) / 2) - (length / 2);
        let cy = ((y1 + y2) / 2) - (1 / 2);
        let deg = Math.atan2((y1 - y2), (x1 - x2)) * (180 / Math.PI);
        var line = document.createElement("div");
        line.className = 'div--line';
        line.id = "line-" + ++tongconnect;
        line.setAttribute("data-value", giatri);
        var styles = 'border: 1px solid black; position: absolute; '
        line.setAttribute('style', styles);
        line.style.left = cx + "px";
        line.style.top = cy + "px";
        line.style.width = length + "px";
        line.style.transform = "rotate(" + deg + "deg)";
        this.line = line;
        ListLine.push(line.id);
        return line;
    }
    window.addEventListener('resize', function (event) {
        $(".div--line").remove();
        for (var i = 0; i < arr_item.length; i++) {
            const _first = arr_item[i].split(',');
            let _elemFirst = document.getElementById(_first[0]);
            let _elemSecond = document.getElementById(_first[1]);
            if (_elemFirst.classList.contains("pair-horizontal__row--item")) {
                let x1 = _elemFirst.offsetLeft + (_elemFirst.offsetWidth / 2);
                let y1 = _elemFirst.offsetTop + _elemFirst.offsetHeight;
                let x2 = _elemSecond.offsetLeft + (_elemSecond.offsetWidth / 2);
                let y2 = _elemSecond.offsetTop;
                document.body.appendChild(createLine(x1, y1, x2, y2));
            }
            else {
                let x1 = _elemFirst.offsetLeft + (_elemFirst.offsetWidth / 2);
                let y1 = _elemFirst.offsetTop;
                let x2 = _elemSecond.offsetLeft + (_elemSecond.offsetWidth / 2);
                let y2 = _elemSecond.offsetTop + _elemSecond.offsetHeight;
                document.body.appendChild(createLine(x1, y1, x2, y2));
            }
        }
    });
    var caudungnoi = 0, causainoi = 0, tongnoi = 0;
    const btnSubmitGameNoi = () => {
        $(".pair-horizontal__row--item").css("pointer-events", "none");
        var elementtongnoi = document.getElementById('<%= txtTongNoi.ClientID%>');
        if (elementtongnoi == null || elementtongnoi.value == null || elementtongnoi.value == "") {
            tongnoi = 0;
        } else {
            tongnoi = parseInt(elementtongnoi.value, 10);
        }
        const divLine = document.querySelectorAll('.div--line');
        divLine.forEach(function (ele) {
            if (ele.getAttribute("data-value") == "dung") {
                ele.style.borderColor = "green";
                caudungnoi++;
            }
            else {
                ele.style.borderColor = "red";
                causainoi++;
            }
        });

    }
    //Game trắc nghiệm
    async function myTraLoiMultiple(id, vitri, dapan) {
        $('#audioselect').get(0).play();
        var currentAnswer = document.querySelector(`a[data-id="${id}"]`);
        var parentElement = currentAnswer.closest('.form-mutichoise__answer');
        var allAnswers = parentElement.querySelectorAll('.answer-item__gather');
        allAnswers.forEach(answer => {
            var answerId = answer.getAttribute('data-id');
            var ic_Dung = document.getElementById("ic_Dung" + answerId);
            var ic_Sai = document.getElementById("ic_Sai" + answerId);
            var ic_Check = document.getElementById("ic_Check" + answerId);
            if (ic_Dung) {
                ic_Dung.style.display = "none";
            }
            if (ic_Sai) {
                ic_Sai.style.display = "none";
            }
            if (ic_Check) {
                ic_Check.style.display = "none";
            }
        });
        var ic_Sai = document.getElementById("ic_Sai" + id);
        var ic_Dung = document.getElementById("ic_Dung" + id);
        var ic_Check = document.getElementById("ic_Check" + id);
        var kiemtraaddclass = ic_Dung.closest('.tracnghiem');
        ic_Check.style.display = "block";
        var container = kiemtraaddclass.closest('.form-mutichoise__answer');
        container.querySelectorAll('.tracnghiem').forEach(item => {
            item.classList.remove('dung');
        });
        if (ic_Check.style.display = "block" && dapan == "True") {
            kiemtraaddclass.classList.add('dung');
        }
    }
    var caudungtracnghiem = 0, tongtracnghiem = 0;
    function btnSubmitTracNghiem() {
        var elementtongtracnghiem = document.getElementById('<%= txtTongTracNghiem.ClientID%>');
        if (elementtongtracnghiem == null || elementtongtracnghiem.value == null || elementtongtracnghiem.value == "") {
            tongtracnghiem = 0;
        } else {
            tongtracnghiem = parseInt(elementtongtracnghiem.value, 10);
        }
        var answerItems = document.querySelectorAll('.tracnghiem.dung');
        caudungtracnghiem = answerItems.length;
        const answerItem = document.querySelectorAll('.tracnghiem');

        answerItem.forEach(item => {
            item.style.pointerEvents = 'none';
            const icCheck = item.querySelector('.btn-check');
            const icDung = item.querySelector('.btn-true');
            const icSai = item.querySelector('.btn-false');
            const dapAn = item.getAttribute('data-answer-tn');
            if (icCheck.style.display === 'block') {
                if (dapAn === 'True') {
                    icDung.style.display = 'block';
                    icCheck.style.display = "none";
                } else {
                    icSai.style.display = 'block';
                    icCheck.style.display = "none";
                }
            }

        });

    }
    //Game lật hình
    // Biến lưu ID trước đó
    let previousId = null;
    var caudunglathinh = 0, tonglathinh = 0;
    function funcFlipimages(id) {
        $('#audioselect').get(0).play();
        const currentElement = $('#btnHinh' + id); // Phần tử hiện tại được nhấp
        // Thêm lớp hover cho phần tử hiện tại
        currentElement.addClass('hover');
        currentElement.css('pointer-events', 'none'); // dùng jQuery
        //currentElement[0].style.pointerEvents = "none"; // JavaScript thuần
        if (previousId === null) {
            // Nếu đây là lần nhấp đầu tiên
            previousId = id; // Lưu lại ID của lần nhấp đầu tiên
        } else {
            // Nếu đây là lần nhấp thứ hai
            const previousElement = $('#btnHinh' + previousId); // Phần tử của lần nhấp trước
            previousElement.css('pointer-events', 'none');
            // Đợi một chút để đảm bảo cả hai phần tử đã được thêm hover trước khi xử lý
            setTimeout(() => {
                const previousAnswer = previousElement.data('anser');
                const currentAnswer = currentElement.data('anser');
                // So sánh data-anser của hai phần tử
                if (previousAnswer === currentAnswer) {
                    //caudunglathinh++;
                    setTimeout(() => {
                        $('#audioright').get(0).play();
                        //previousElement.removeClass('hover').addClass('hide'); // Xóa hover và thêm lớp hide
                        //currentElement.removeClass('hover').addClass('hide'); // Xóa hover và thêm lớp hide
                    }, 500); // Giữ trạng thái hover tạm thời để người dùng nhìn thấy
                } else {
                    setTimeout(() => {
                        $('#audiofalse').get(0).play();
                        previousElement.removeClass('hover'); // Xóa hover phần tử trước
                        currentElement.removeClass('hover'); // Xóa hover phần tử hiện tại
                        previousElement.css('pointer-events', 'auto');
                        currentElement.css('pointer-events', 'auto');
                    }, 500); // Giữ trạng thái hover tạm thời để người dùng nhìn thấy
                }
                // Đặt lại previousId để chuẩn bị cho lần nhấp mới
                previousId = null;
            }, 100); // Đợi 100ms để đảm bảo DOM cập nhật và lớp hover hiện đủ
        }
    }
    function btnSubmitLatHinh() {
        var elementtonglathinh = document.getElementById('<%= txtTongLatHinh.ClientID%>');
        if (elementtonglathinh == null || elementtonglathinh.value == null || elementtonglathinh.value == "") {
            tonglathinh = 0;
        } else {
            tonglathinh = parseInt(elementtonglathinh.value, 10);
        }

    }
    //Nộp bài
    function checkSubmitNopBai() {
        //debugger
        var idloaigame = document.getElementById("txtID_LoaiGame").value;
        var arrayValues = idloaigame.split(",");

        let diemN = 0;
        let tongdiemN = 0;
        if (arrayValues.includes("1")) {
            btnSubmitGameNoi();
            diemN = caudungnoi;
            tongdiemN = tongnoi;
            console.log("điểm N : " + diemN)
            console.log("tổng điểm N : " + tongdiemN)
        }
        else {
            console.log("điểm N : " + diemN)
            console.log("tổng điểm N : " + tongdiemN)
        }
        let diemTN = 0;
        let tongdiemTN = 0;
        if (arrayValues.includes("2")) {
            btnSubmitTracNghiem();
            diemTN = caudungtracnghiem;
            tongdiemTN = tongtracnghiem;
            console.log("điểm TN : " + diemTN)
            console.log("tổng điểm TN : " + tongdiemTN)
        }
        let diemLH = 0;
        let tongdiemLH = 0;
        if (arrayValues.includes("3")) {
            btnSubmitLatHinh();
            if (diemN == 0 && diemTN == 0) {
                diemLH = 0;
                tongdiemLH = 0;
                console.log("điểm LH : " + diemLH);
                console.log("tổng điểm LH : " + tongdiemLH);
            }
            else if (diemN == 0 && tongdiemN == 0) {
                diemLH = 5;
                tongdiemLH = 5;
                console.log("điểm LH : " + diemLH);
                console.log("tổng điểm LH : " + tongdiemLH);
            }
            else {
                diemLH = 10 - diemN - diemTN;
                tongdiemLH = 10 - tongdiemN - tongdiemTN;
                console.log("điểm LH : " + diemLH);
                console.log("tổng điểm LH : " + tongdiemLH);
            }
        }
        let tongsocaudung = 0;
        let tongsocau = 0;
        if (diemN == 0 && tongdiemN == 0) {
            tongsocaudung = diemN + diemTN * 2.5 + diemLH
            tongsocau = tongdiemN + tongdiemTN * 2.5 + tongdiemLH
        }
        else {
            tongsocaudung = diemN + diemTN + diemLH
            tongsocau = tongdiemN + tongdiemTN + tongdiemLH
        }
        console.log("điểm " + tongsocaudung);
        console.log("tổng điểm " + tongsocau);
        setTimeout(function () {
            let sao;
            let ketqua;
            if (tongsocaudung > 8) {
                sao = '3'
            }
            else if (tongsocaudung > 5) {
                sao = '2'
            }
            else {
                sao = '1'
            }
            ketqua = tongsocaudung;

            let timeStart = $("#<%=txtTimeStart.ClientID %>").val();
            let sodiemlonnhatdaco = $("#<%=txtSoDiemLonNhatDaCo.ClientID %>").val();
            let solanlambai = $("#<%=txtKQ.ClientID %>").val();
            if (solanlambai >= 3) {
                if (sodiemlonnhatdaco < ketqua) {
                    document.getElementById("txtSoDiemLonNhat").value = ketqua;
                }
                else {
                    document.getElementById("txtSoDiemLonNhat").value = sodiemlonnhatdaco;
                }
            }
            else {
                document.getElementById("txtSoDiemLonNhat").value = ketqua;
            }
            let OrderGame = 1;
            var submitNopBai = document.getElementById('dv_Submit');
            if (submitNopBai) {
                submitNopBai.style.display = "none";
            }
            btnSubmit(sao, tongsocaudung, timeStart, OrderGame);
            var submitNopBai = document.getElementById('dv_Submit');
            if (submitNopBai) {
                submitNopBai.style.display = "none";
            }
            var submitLamLai = document.getElementById('dv_reset');
            if (submitLamLai) {
                submitLamLai.style.display = "block";
            }
        }, 3000);
    }
    function lambai() {
        document.getElementById('<%= btnLamLaiBaiTap.ClientID%>').click();
    }
</script>
</html>
