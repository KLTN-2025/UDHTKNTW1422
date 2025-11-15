<%@ Control Language="C#" AutoEventWireup="true" CodeFile="global_Popup.ascx.cs" Inherits="web_usercontrol_global_Popup" %>
<link href="../css/modalStyle.min.css" rel="stylesheet" />

<audio hidden="hidden" class="media" id="uadiowin" src="/Musics/win1.mp3" controls="controls"></audio>
<audio hidden="hidden" class="media" id="uadiolose" src="/Musics/lose.mp3" controls="controls"></audio>

<div id="modal-view">
    <div class="modal-result">
        <div class="modal-result-content">
            <img src="/images/bg-modal-main.png" class="modal-result-content__bg" alt="" />
            <%--<div class="modal-logo">
                <img src="/images/logo-popup-vietnhat.png" alt="Alternate Text" />

            </div>--%>
            <div class="modal-result-content__star">
                <img src="" class="--star" id="popup-img" />
                <img src="/images/star-effect.gif" class="--effect" alt="Alternate Text" />
            </div>

            <div class="modal-result-content__txt --txt-1">
                <%--BẠN ĐÃ LÀM ĐÚNG--%>
                ĐIỂM:
            </div>
            <div class="modal-result-content__txt --txt-2" id="txtresult"></div>
            <button type="button" id="submit-load" onclick="funcHome()" class="modal-result-content__btn --home">&nbsp;</button>
            <button type="button" id="submit-home" onclick="funcReload()" class="modal-result-content__btn --exit">&nbsp;</button>
        </div>
    </div>
</div>
<asp:UpdatePanel ID="upPopup" runat="server">
    <ContentTemplate>
        <div style="display: none">
            <a id="btnSatrt" runat="server" onserverclick="btnSatrt_ServerClick"></a>
            <input type="text" id="txtSao" runat="server" name="name" value="" />
            <input type="text" id="txtDiem" runat="server" name="name" value="" />
            <input type="text" id="txtKetQua" runat="server" name="name" value="" />
            <input type="text" id="txtTimeStartPopup" runat="server" name="name" value="" />
            <input type="text" id="txtOrderGamePopup" runat="server" name="name" value="" />
        </div>
    </ContentTemplate>
</asp:UpdatePanel>
<a id="btnHome" runat="server" onserverclick="btnHome_ServerClick"></a>
<script>
    function btnSubmit(sao, ketqua, timeStart, OrderGame) {
        //debugger 
        var solanbaihoc = $('#txtKQ').val();
        var sodiemlonnhat = $('#txtSoDiemLonNhat').val();
        console.log("solanbaihoc " + solanbaihoc);
        console.log("ketqua " + ketqua);
        console.log("sodiemlonnhat " + sodiemlonnhat);
        if (solanbaihoc == 1 && sodiemlonnhat >= 8) {
            console.log("1");
            $('#btnNextLesson').attr('style', '');
        }
        else if (solanbaihoc >= 3 && sodiemlonnhat >= 8) {
            console.log("3");
            $('#btnNextLesson').attr('style', '');
        }
        else {
            console.log("444");
        }
        $("#<%=txtSao.ClientID %>").val(sao);
        $("#<%=txtTimeStartPopup.ClientID %>").val(timeStart);
        $("#<%=txtDiem.ClientID %>").val(ketqua);
        $("#<%=txtOrderGamePopup.ClientID %>").val(OrderGame);
        $("#<%=txtKetQua.ClientID %>").val(ketqua);
        //console.log("OrderGamePopup " + OrderGame)
        uadiowin.load();
        if (sao == '3') {
            $('#popup-img').attr('src', '../../../images/game-3-star.png');
           

            //$('#popup-img-1').attr('src', '../../../images/anhgif/3_sao.gif');
            setTimeout(() => {
                uadiowin.play();
            }, "1500");
        }
        else if (sao == '2') {
            $('#popup-img').attr('src', '../../../images/game-2-star.png');
            //$('#popup-img-1').attr('src', '../../../images/anhgif/2_sao.gif');
            setTimeout(() => {
                uadiowin.play();
            }, "1500");
        }
        else {
            $('#popup-img').attr('src', '../../../images/game-1-star.png');
            //$('#popup-img-1').attr('src', '../../../images/anhgif/1_sao.gif');
            //uadiowin.play();
            setTimeout(() => {
                uadiolose.play();
            }, "1500");
            
        }
        $("#txtresult").text(ketqua + " / 10")
        /*document.getElementById("popup-submit").style.display = 'block';*/
        let modalSubmit = document.getElementById("modal-view");
        modalSubmit.classList.add("show");
        <%--document.getElementById("<%=btnSatrt.ClientID %>").click();--%>
        let btnElement = document.getElementById("<%=btnSatrt.ClientID %>");
        if (!btnElement) {
            console.error("btnSatrt not found!");
        } else {
            console.log("btnSatrt found:", btnElement);
            btnElement.click();
        }
        
    }
    function funcHome() {
        document.getElementById("btnHome").click();
    }
    function funcReload() {
        //var url = location.href;
        //window.location.href = url;
        let modalSubmit = document.getElementById("modal-view");
        modalSubmit.classList.remove("show");
        //document.getElementById("popup-submit").style.display = 'none';
        uadiowin.pause();

    }
    function funcNext() {
        document.getElementById("btnNextLesson").click();
    }
</script>