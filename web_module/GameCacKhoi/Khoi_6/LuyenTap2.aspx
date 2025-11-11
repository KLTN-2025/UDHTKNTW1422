<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LuyenTap2.aspx.cs" Inherits="web_module_GameCacKhoi_Khoi_6_LuyenTap2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="/css/icofont.css" rel="stylesheet" />
    <link href="/css/font-awesome.min.css" rel="stylesheet" />
    <link href="/css/books/globalBooks.css" rel="stylesheet" />
    <style>
        .button-submit {
            text-align: center;
            padding-bottom: 4rem;
        }

            .button-submit a {
                display: inline-block;
                transition: linear 0.3s;
                width: 170px;
            }
    </style>
    <script src="/js/jquery-3.5.1.min.js"></script>
    <title><%= baihoc %></title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
    <meta name="format-detection" content="telephone=no" />
    <meta name="full-screen" content="yes" />
    <meta name="x5-full-screen" content="true" />
    <meta name="360-full-screen" content="true" />
    <meta name="mobile-web-app-capable" content="yes" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
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

        <%--video bài học--%>
        <div id="dv_Video" runat="server">
            <div class="frame-game --math">
                <div class="container">
                    <div class="text-center">
                        <div class="frame-game-new --style-1">
                            <div class="title-page --style-3 _mt-34">
                                <asp:Repeater ID="rpTieuDe" runat="server">
                                    <ItemTemplate>
                                        <%#Eval("video_title") %>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                            <div class="speak-listen">
                                <div class="video-view">
                                    <div class="embed-responsive embed-responsive-21by9">
                                        <iframe width="420" height="315" id="VideoList" runat="server"></iframe>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%--Đọc từ vựng--%>
        <div id="dv_DocTuVung" runat="server">
            <div class="frame-game --math">
                <div class="container">
                    <div class="frame-game-new --style-1">
                        <div class="title-page --style-3 _mt-34">
                            <asp:Repeater ID="rpTieuDeTuVung" runat="server">
                                <ItemTemplate>
                                    <%#Eval("tuvung_title") %>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                        <div class="table-vocabulary mt-2">
                            <table class="table table-borderless">
                                <thead>
                                    <tr>
                                        <th>Tiếng nhật</th>
                                        <th>Phiên âm</th>
                                        <th>Phiên dịch </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater ID="rpTuVung" runat="server" OnItemDataBound="rpTuVung_ItemDataBound">
                                        <ItemTemplate>
                                            <tr>
                                                <td>
                                                    <div class="combine-vocabulary">
                                                        <div class="single-word" id="<%#Eval("tuvung_group") %>">
                                                            <asp:Repeater ID="rpTuTuVung" runat="server">
                                                                <ItemTemplate>
                                                                    <div class="txt-japan hvr-ripple-out" onclick="playSound(this.getAttribute('data-url'))" data-url="<%#Eval("tuvung_mp3") %>"><%#Eval("tuvung_noidung") %></div>
                                                                </ItemTemplate>
                                                            </asp:Repeater>
                                                        </div>
                                                        <div class="combine-words">
                                                            <div class="txt-japan hvr-ripple-out" onclick="playSound(this.getAttribute('data-url'))" data-url="<%#Eval("tuvung_mp3") %>"><%#Eval("tuvung_noidung") %></div>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="txt-transcription"><%#Eval("tuvung_phienam") %></div>
                                                </td>
                                                <td>
                                                    <div class="txt-meaning"><%#Eval("tuvung_phiendich") %></div>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%--ghép chữ--%>
        <div id="dv_GhepChu" runat="server">
            <div class="frame-game --math">
                <div class="container">
                    <div class="frame-game-new --style-1">
                        <div class="title-page --style-3 _mt-34">

                            <asp:Repeater ID="rpTieuDeGhepChu" runat="server">
                                <ItemTemplate>
                                    <%#Eval("ghepchu_title") %>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                        <div class="words-combine mt-2">
                            <div class="words-combine-list">
                                <asp:Repeater ID="rpGhepChu" runat="server">
                                    <ItemTemplate>
                                        <div class="words-combine-item">
                                            <div class="txt-japan" onclick="playSound(this.getAttribute('data-url'))" data-url="<%#Eval("ghepchu_mp3") %>"><%#Eval("ghepchu_noidung") %></div>
                                            <div class="txt-meaning"><%#Eval("ghepchu_phiendich") %></div>
                                            <div class="words-input">
                                                <input type="text" class="form-control" id="<%#Eval("ghepchu_id") %>" data-answer="<%#Eval("ghepchu_phienam") %>" autocomplete="off" name="name" placeholder="Điền phiên âm" />
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </div>
                        <div style="display: none">
                            <a href="javascript:void(0)">
                                <img class="" src="/images/images_button/btn-2.png" onclick="btnSubmitGhepChu()" alt="" />
                            </a>
                            <input type="text" id="txtTongGhepChu" runat="server" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%--game trắc nghiệm--%>
        <div id="dv_TracNghiem" runat="server">
            <div class="frame-game --math">
                <div class="container">
                    <div class="frame-game-new --style-1">
                        <div class="title-page --style-3 _mt-34">
                            <asp:Repeater ID="rpnoidungtracnghiem" runat="server">
                                <ItemTemplate>
                                    <%#Eval("cauhoi_content") %>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                        <div class="">
                            <div class="form-mutichoise mb-4">
                                <asp:Repeater ID="rpCauTraLoi" runat="server" OnItemDataBound="rpCauTraLoi_ItemDataBound">
                                    <ItemTemplate>
                                        <div class="mb-1 text-center">
                                            <div class="form-mutichoise__header--title --style-1">
                                                <%#Eval("cauhoi_titlecauhoi") %>
                                                <a class="btn-sound-question" href="javascript:void(0)" onclick="playSound(this.getAttribute('data-url'))" data-url="<%#Eval("cauhoi_mp3") %>">
                                                    <img src="/images/btn-game-sound.png" alt="Alternate Text" />
                                                </a>
                                            </div>
                                        </div>
                                        <div class="form-mutichoise__question">
                                            <div class="question-item text-center">
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
                                điểm<input id="txtDiemSo" type="text" style="" placeholder="diem so" runat="server" />
                                tổng:<input type="text" id="txtTongSoCau" runat="server" />
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
        <%--Nộp bài--%>
        <div class="button-submit" id="dv_Submit" runat="server">
            <a href="javascript:void(0)" id="submitTongBaiKiemTra" onclick="checkSubmitNopBai()">
                <img class="buttonCalculation" src="/images/btn-baikiemtra-submit.png" />
            </a>
            <audio hidden="hidden" class="media" id="audioselect" src="/Musics/audio_select.mp3" controls="controls" style="display: none"></audio>
            <a href="javascript:void(0)" id="btnLamLaiBaiTap" runat="server" onserverclick="btnLamLaiBaiTap_ServerClick" style="display: none"></a>
            <input type="text" id="txtTimeStart" runat="server" value="" style="display: none" />
            <input type="text" id="txtOrderGame" runat="server" value="" style="display: none" />
            <input type="text" id="txtID_LoaiGame" runat="server" style="display: none" />
            <input type="text" id="txtKQ" runat="server" style="display: none" />
            <input type="text" id="txtSoDiemLonNhatDaCo" runat="server" style="display: none" />
            <input type="text" id="txtSoDiemLonNhat" style="display: none" />
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
    const viewGuide = (idShow) => {
        jQuery('.guide-video-item').hide();
        jQuery('#guide-video-' + idShow).fadeIn();
        jQuery('.character-item').removeClass('active');
        jQuery('#character-item-' + idShow).addClass('active');
    }
    viewGuide('1');
    function next() {
        let btnElement = document.getElementById("<%=btnNext.ClientID %>");
        btnElement.click();
    }
    function back() {
        let btnElementback = document.getElementById("<%=btnBack.ClientID %>");
        btnElementback.click();
    }
    //Game ghép chữ
    var caudungghepchu = 0, tongghepchu = 0;
    function btnSubmitGhepChu() {
        var elementtongghepchu = document.getElementById('<%= txtTongGhepChu.ClientID%>');
        if (elementtongghepchu == null || elementtongghepchu.value == null || elementtongghepchu.value == "") {
            tongghepchu = 0;
        } else {
            tongghepchu = parseInt(elementtongghepchu.value, 10);
        }
        let inputs = document.querySelectorAll(".words-input input");
        let allCorrect = true;
        inputs.forEach(input => {
            let userAnswer = input.value.trim().toLowerCase();
            let correctAnswer = input.getAttribute("data-answer").trim().toLowerCase();
            if (userAnswer === correctAnswer) {
                input.style.border = "2px solid green";
                caudungghepchu++;
            } else {
                input.style.border = "2px solid red";
                allCorrect = false;
            }
            input.style.pointerEvents = "none"; // Chặn tương tác chuột
            input.setAttribute("readonly", true); // Không cho nhập tiếp
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
        //console.log("đúng :" + caudungtracnghiem)
        //console.log("tổng :" + tongtracnghiem)
    }
    //Nộp bài
    function checkSubmitNopBai() {
        var idloaigame = document.getElementById("txtID_LoaiGame").value;
        var arrayValues = idloaigame.split(",");
        let diemGC = 0;
        let tongdiemGC = 0;
        if (arrayValues.includes("6")) {
            btnSubmitGhepChu();
            diemGC = caudungghepchu;
            tongdiemGC = tongghepchu;
            console.log("điểm GC : " + diemGC)
            console.log("tổng điểm GC : " + tongdiemGC)
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
        let tongsocaudung = 0;
        let tongsocau = 0;
        tongsocaudung = diemGC + diemTN
        tongsocau = tongdiemGC + tongdiemTN
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
