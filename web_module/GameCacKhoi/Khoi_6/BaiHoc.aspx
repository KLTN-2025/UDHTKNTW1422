<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BaiHoc.aspx.cs" Inherits="web_module_GameCacKhoi_Khoi_6_BaiHoc" %>

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
                    <a class="header-content__home btn-menu" id="btnHome" href="/danh-muc-sach-<%=sach_id %>?khoi=<%=lop_id %>#<%=_id_lesson %>" data-id="<%=sach_id %>#<%=_id_lesson %>">
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

    
        <%--chữ cái--%>
        <div class="frame-game --math">
            <div class="container">
                <div class="frame-game-new --style-1">
                    <div class="title-page --style-3 _mt-34">
                        <asp:Repeater ID="rpDoc" runat="server">
                            <ItemTemplate>
                                <%#Eval("nhanbiet_content") %>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                    <div class="list-vocabulary --item-<%= itemchucai %>">
                        <asp:Repeater runat="server" ID="rpVocabulary">
                            <ItemTemplate>
                                <div class="item-vocabulary hvr-pulse" onclick="playSound(this.getAttribute('data-url'))" data-url="<%#Eval("nhanbiet_mp3") %>">
                                    <div class="item-vocabulary__img">
                                        <img src="<%#Eval("nhanbiet_image") %>" />
                                    </div>
                                    <div class="item-vocabulary__txt"><%#Eval("nhanbiet_title") %></div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </div>
        </div>
        <%--video chữ viết--%>
        <div class="frame-game --math">
            <div class="container">
                <div class="frame-game-new --style-1">
                    <div class="title-page --style-3 _mt-34">
                        <asp:Repeater ID="rptitle" runat="server">
                            <ItemTemplate>
                                <%#Eval("video_title") %>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                    <div class="write-guide">
                        <div class="list-characters">
                            <asp:Repeater ID="rpVideo" runat="server">
                                <ItemTemplate>
                                    <div class="character-item" id="character-item-<%#Eval("video_id") %>" data-id="<%#Eval("video_id") %>" onclick="viewGuide(this.getAttribute('data-id'))">
                                        <img class="" src="<%#Eval("video_image") %>" />
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                        <div class="list-videos">
                            <asp:Repeater ID="rpImage" runat="server">
                                <ItemTemplate>
                                    <div id="guide-video-<%#Eval("video_id") %>" class="guide-video-item --img" style="display: none;">
                                        <img src="<%#Eval("video_link") %>" />
                                    </div>

                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%----%>
        <%--game trắc nghiệm--%>
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
                        <div class="form-mutichoise ">
                            <asp:Repeater ID="rpCauTraLoi" runat="server" OnItemDataBound="rpCauTraLoi_ItemDataBound">
                                <ItemTemplate>
                                    <div class="mb-1 text-center">
                                        <div class="form-mutichoise__header--title --style-1">
                                            <%#Eval("cauhoi_titlecauhoi") %>
                                        </div>
                                    </div>
                                    <div class="form-mutichoise__question">
                                        <div class="question-item text-center">
                                            <audio controls="controls">
                                                <source src="<%#Eval("cauhoi_mp3") %>" type="audio/mpeg" />
                                                Your browser does not support the audio element.
                                            </audio>
                                            <%-- <a class="question-item__image" id="<%#Eval("cauhoi_id") %>" href="javascript:void(0)" onclick="playSound(this.getAttribute('data-url'))" data-url="<%#Eval("cauhoi_mp3") %>">
                                                <img src="<%#Eval("cauhoi_image") %>" />
                                            </a>--%>
                                        </div>
                                    </div>
                                    <div class="form-mutichoise__answer --item-3">
                                        <asp:Repeater ID="rpDapAn" runat="server">
                                            <ItemTemplate>
                                                <div class="answer-item tracnghiem" data-answer-tn="<%#Eval("cautraloi_dapandung") %>">
                                                    <a href="javascript:void(0)" class="answer-item__gather <%#Eval("style_class") %> hvr-push" data-id="<%#Eval("cautraloi_id") %>" onclick="myTraLoiMultiple('<%#Eval("cautraloi_id") %>','<%#Container.ItemIndex+1 %>','<%#Eval("cautraloi_dapandung") %>')">
                                                        <%#Eval("cautraloi_image") %>
                                                        <img class="btn btn-true" src="/images/button/btn-2.png" id="ic_Dung<%#Eval("cautraloi_id") %>" aria-hidden="true" style="display: none;" />
                                                        <img class="btn btn-false" src="/images/button/btn-6.png" id="ic_Sai<%#Eval("cautraloi_id") %>" aria-hidden="true" style="display: none;" />
                                                        <img class="btn btn-check" src="/images/button/btn-4.png" id="ic_Check<%#Eval("cautraloi_id") %>" aria-hidden="true" style="display: none;" />
                                                    </a>
                                                    <a href="javascript:void(0)" class="answer-item__sound" id="mp3_<%#Eval("cautraloi_id") %>" style="<%#Eval("style")%>"
                                                        onclick="audioDapAn(<%#Eval("cautraloi_id") %>)">
                                                        <img src="../../../images/button/loa-xanhdt-m.png" />
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
                                <img class="" src="/images/button/btn-2.png" onclick="btnSubmitTracNghiem()" alt="" />
                            </a>
                            <input type="text" id="txtTongTracNghiem" runat="server" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%--Nộp bài--%>
        <div class="button-submit" id="dv_Submit" runat="server">
            <a href="javascript:void(0)" id="submitTongBaiKiemTra" onclick="btnSubmitTracNghiem()">
                <img class="buttonCalculation" src="/images/btn-baikiemtra-submit.png" />
            </a>
            <audio hidden="hidden" class="media" id="audioselect" src="/Musics/audio_select.mp3" controls="controls" style="display: none"></audio>
            <a href="javascript:void(0)" id="btnLamLaiBaiTap" runat="server" onserverclick="btnLamLaiBaiTap_ServerClick" style="display: none"></a>
            <input type="text" id="txtTimeStart" runat="server" value="" style="display: none" />
            <input type="text" id="txtOrderGame" runat="server" value="" style="display: none" />
            <input type="text" id="txtKQ" runat="server" style="display: none" />
            <input type="text" id="txtSoDiemLonNhatDaCo" runat="server" style="display: none" />
            <input type="text" id="txtSoDiemLonNhat" style="display: none" />
            <div style="display: none;">
                <asp:HiddenField ID="hfFirstVideoID" runat="server" />
            </div>
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
    window.onload = function () {
        var firstVideoID = document.getElementById('<%= hfFirstVideoID.ClientID %>').value;
        if (firstVideoID) {
            viewGuide(firstVideoID);
        }
    };
    function next() {
        let btnElement = document.getElementById("<%=btnNext.ClientID %>");
        btnElement.click();
    }
    function back() {
        let btnElementback = document.getElementById("<%=btnBack.ClientID %>");
        btnElementback.click();
    }
    //viewGuide('1');
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
        let diem = 0;
        let tongdiem = 0;
        if (tongtracnghiem == 5) {
            diem = caudungtracnghiem * 2;
            tongdiem = tongtracnghiem * 2;
        }
        else {
            diem = caudungtracnghiem * 2.5;
            tongdiem = tongtracnghiem * 2.5;
        }
        setTimeout(function () {
            let sao;
            let ketqua;
            if (diem > 8) {
                sao = '3'
            }
            else if (diem > 5) {
                sao = '2'
            }
            else {
                sao = '1'
            }
            ketqua = diem;
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
            btnSubmit(sao, diem, timeStart, OrderGame);
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
