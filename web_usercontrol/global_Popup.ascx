<%@ Control Language="C#" AutoEventWireup="true" CodeFile="global_Popup.ascx.cs" Inherits="web_usercontrol_global_Popup" %>
<link href="../css/categoryTieuHoc.min.css" rel="stylesheet" />
<audio hidden="hidden" class="media" id="uadiowin" src="/mp3Game/win1.mp3" controls="controls"></audio>
<audio hidden="hidden" class="media" id="uadiolose" src="/mp3Game/lose.mp3" controls="controls"></audio>
<div id="popup-submit" style="display: none">
    <div class="bg-modal-view">
        <div class="box-modal">
            <span class="btn-close" onclick="closePopup()">
                <img src="/images/btn-close-modal.png" alt="Alternate Text" /></span>
            <div class="box-modal__title">
                <div class="box-modal__content">
                    <p>Hoàn thành</p>
                </div>
                <h2 id="nameBaiTapModal" runat="server" style="text-align: center"></h2>
            </div>
            <div class="box-modal__star">
                <img src="" id="imgSao" />
            </div>
            <div class="box-modal__button">
                <a id="playGame" class="btn-play" href="javascript:void(0);" onclick="startGame()">
                    <img src="/images/btn-play.png" /></a>
            </div>
        </div>
        <input type="text" id="txtLink" runat="server" name="name" value="" style="display: none" />
        <input type="hidden" id="txtbaitapid" runat="server" />
    </div>
</div>
<asp:UpdatePanel ID="upPopup" runat="server">
    <ContentTemplate>
        <div style="display: none">
            <%--<a id="btnSatrt" runat="server" onserverclick="btnSatrt_ServerClick"></a>--%>
            <input type="text" id="txtSao" runat="server" name="name" value="" />
            <%--<input type="text" id="txtTimeStartPopup" runat="server" name="name" value="" />--%>
            <a id="loadServerPopup" runat="server" onserverclick="loadServerPopup_ServerClick"></a>
            <a id="returnTrangChu" runat="server" onserverclick="returnTrangChu_ServerClick"></a>
            <%--<input type="text" id="txtOrderGamePopup" runat="server" name="name" value="" />--%>
        </div>
    </ContentTemplate>
</asp:UpdatePanel>
<script>
    function showPopup(sao) {
        //debugger
        document.getElementById("popup-submit").style.display = "block";
        document.getElementById('imgSao').src = "/images/icon-" + sao + "-star.png";
        document.getElementById('<%=txtSao.ClientID%>').value = sao;
        document.getElementById('<%=loadServerPopup.ClientID%>').click();
    }

    function closePopup() {
        document.getElementById("<%=returnTrangChu.ClientID%>").click();
    }
    function startGame() {
        window.location.href = "/app-tieu-hoc-trang-chu";
    }

    // Sử dụng hàm để tạo cookie với tên là "myCookie" và giá trị là "Hello, this is my cookie value."
    //function deleteCookie(cookieName) {
    //    document.cookie = cookieName + "=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
    //}

</script>
