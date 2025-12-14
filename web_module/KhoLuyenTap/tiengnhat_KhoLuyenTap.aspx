<%@ Page Title="" Language="C#" MasterPageFile="~/Home_MasterPage.master" AutoEventWireup="true" CodeFile="tiengnhat_KhoLuyenTap.aspx.cs" Inherits="web_module_KhoLuyenTap_tiengnhat_KhoLuyenTap" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Header" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Menu" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="TopWrapper" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Wrapper" Runat="Server">
    <div class="page-view bg-color-1 m-bottom">
      <%--<uc1:global_header_avatar runat="server" ID="global_header_avatar" />--%>
        <div class="block-content no-pd">

            <%--<div class="block-content__header">
                <img class="--title" src="/images/bg-luyentap.png" alt="Alternate Text" />
                <a runat="server" id="btnBack" class="btn-exit">
                    <img src="/images/btn-exit-2.png" />
                </a>
            </div>
            <div class="practice-list max-height-1 p-3">
                <div id="slide-subjects" class="owl-carousel owl-theme">
                    <asp:Repeater ID="rpMonHoc" runat="server">
                        <ItemTemplate>
                            <div class="item">
                                <div class="subject-item <%#Eval("mon_class")%>" <%#Eval("mon_active") %> data-index="<%#Container.ItemIndex+1 %>">
                                    <a href="javascript:void(0)" class="subject-item__img" onclick="xemMon( <%#Eval("mon_id") %>)">
                                        <img src="<%#Eval("mon_image") %>" alt="Alternate Text" />
                                    </a>
                                    <div class="subject-item__name">
                                        <%#Eval("mon_name") %>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
                <asp:ScriptManager ID="scrList" runat="server"></asp:ScriptManager>
                <asp:UpdatePanel ID="upList" runat="server">
                    <ContentTemplate>
                        <asp:Repeater ID="rpList_BaiLuyenTap" runat="server">
                            <ItemTemplate>
                                <div class="practice-item">
                                    <div class="practice-item__left">
                                        <img src="../../images/thcs-avt-test.png">
                                    </div>
                                    <div class="practice-item__right">
                                        <div class="--info">
                                            <div class="title">
                                                <%#Eval("luyentap_name") %>
                                            </div>
                                            <div class="other">
                                                <a href="/app-lich-su-bai-luyen-tap-thcs-<%#Eval("khoi_id") %>-<%#Eval("mon_id") %>-<%#Eval("luyentap_id") %>" class="icon history"><i class="fa fa-pencil"></i>&nbsp;<%#Eval("count_view") %></a>
                                                <a class="icon important" href="javascript:void(0)"><i class="<%#Eval("luyentap_star_class") %>"></i></a>
                                                <a href="javascript:void(0)" id="btnHeart<%#Eval("luyentap_id") %>" onclick="myHeart(<%#Eval("test_id") %>)" class="icon favorite"><i class="<%#Eval("luyentap_heart_class") %>"></i></a>
                                                <a href="/<%#Eval("test_link") %>" class="play">
                                                    <img src="/images/btn-lambai.png" alt="Alternate Text">
                                                </a>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>--%>

            <div class="card-view">
                <ul class="nav nav-pills nav-monhoc" id="pills-tab" role="tablist">
                    <li class="nav-item" role="presentation">
                        <button class="nav-link active" id="pills-home-tab" data-toggle="pill" data-target="#pills-home" type="button" role="tab" aria-controls="pills-home" aria-selected="true">Khối 6</button>
                    </li>
                    <%--<li class="nav-item" role="presentation">
                        <button class="nav-link" id="pills-profile-tab" data-toggle="pill" data-target="#pills-profile" type="button" role="tab" aria-controls="pills-profile" aria-selected="false">Khối 7</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="pills-contact-tab" data-toggle="pill" data-target="#pills-contact" type="button" role="tab" aria-controls="pills-contact" aria-selected="false">Khối 8</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="khoi9-tab" data-toggle="pill" data-target="#khoi9" type="button" role="tab" aria-controls="khoi9" aria-selected="false">Khối 9</button>
                    </li>--%>
                </ul>
                <div class="practice-list max-height-1 p-3">
                    <div class="tab-content" id="pills-tabContent">
                        <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
                            <div class="block-main pt-3 pb-5 mb-3 px-3">
                                <asp:Repeater ID="rpDanhSachLuyenTapKhoi6" runat="server">
                                    <ItemTemplate>
                                        <div class="practice-item">
                                            <div class="practice-item__left">
                                                <img src="../../images/thcs-avt-test.png">
                                            </div>
                                            <div class="practice-item__right">
                                                <div class="--info">
                                                    <div class="title">
                                                        <%#Eval("luyentap_name") %>
                                                    </div>
                                                    <div class="other">
                                                        <a href="/app-lich-su-bai-luyen-tap-thcs-<%#Eval("khoi_id") %>-<%#Eval("mon_id") %>-<%#Eval("luyentap_id") %>" class="icon history"><i class="fa fa-pencil"></i>&nbsp;<%#Eval("count_view") %></a>
                                                        <a class="icon important" href="javascript:void(0)"><i class="<%#Eval("luyentap_star_class") %>"></i></a>
                                                        <a href="javascript:void(0)" id="btnHeart<%#Eval("luyentap_id") %>" onclick="myHeart(<%#Eval("test_id") %>)" class="icon favorite"><i class="<%#Eval("luyentap_heart_class") %>"></i></a>
                                                        <a href="/<%#Eval("test_link") %>" class="play">
                                                            <img src="/images/btn-lambai.png" alt="Alternate Text">
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </div>
                      <%--  <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab">
                            <div class="block-main pt-3 pb-5 mb-3 px-3">
                                <asp:Repeater ID="rpDanhSachLuyenTapKhoi7" runat="server">
                                    <ItemTemplate>
                                        <div class="practice-item">
                                            <div class="practice-item__left">
                                                <img src="../../images/thcs-avt-test.png">
                                            </div>
                                            <div class="practice-item__right">
                                                <div class="--info">
                                                    <div class="title">
                                                        <%#Eval("luyentap_name") %>
                                                    </div>
                                                    <div class="other">
                                                        <a href="/app-lich-su-bai-luyen-tap-thcs-<%#Eval("khoi_id") %>-<%#Eval("mon_id") %>-<%#Eval("luyentap_id") %>" class="icon history"><i class="fa fa-pencil"></i>&nbsp;<%#Eval("count_view") %></a>
                                                        <a class="icon important" href="javascript:void(0)"><i class="<%#Eval("luyentap_star_class") %>"></i></a>
                                                        <a href="javascript:void(0)" id="btnHeart<%#Eval("luyentap_id") %>" onclick="myHeart(<%#Eval("test_id") %>)" class="icon favorite"><i class="<%#Eval("luyentap_heart_class") %>"></i></a>
                                                        <a href="/<%#Eval("test_link") %>" class="play">
                                                            <img src="/images/btn-lambai.png" alt="Alternate Text">
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="pills-contact" role="tabpanel" aria-labelledby="pills-contact-tab">
                            <div class="block-main pt-3 pb-5 mb-3 px-3">
                                <asp:Repeater ID="rpDanhSachLuyenTapKhoi8" runat="server">
                                    <ItemTemplate>
                                        <div class="practice-item">
                                            <div class="practice-item__left">
                                                <img src="../../images/thcs-avt-test.png">
                                            </div>
                                            <div class="practice-item__right">
                                                <div class="--info">
                                                    <div class="title">
                                                        <%#Eval("luyentap_name") %>
                                                    </div>
                                                    <div class="other">
                                                        <a href="/app-lich-su-bai-luyen-tap-thcs-<%#Eval("khoi_id") %>-<%#Eval("mon_id") %>-<%#Eval("luyentap_id") %>" class="icon history"><i class="fa fa-pencil"></i>&nbsp;<%#Eval("count_view") %></a>
                                                        <a class="icon important" href="javascript:void(0)"><i class="<%#Eval("luyentap_star_class") %>"></i></a>
                                                        <a href="javascript:void(0)" id="btnHeart<%#Eval("luyentap_id") %>" onclick="myHeart(<%#Eval("test_id") %>)" class="icon favorite"><i class="<%#Eval("luyentap_heart_class") %>"></i></a>
                                                        <a href="/<%#Eval("test_link") %>" class="play">
                                                            <img src="/images/btn-lambai.png" alt="Alternate Text">
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="khoi9" role="tabpanel" aria-labelledby="khoi9">
                            <div class="block-main pt-3 pb-5 mb-3 px-3">
                                <asp:Repeater ID="rpDanhSachLuyenTapKhoi9" runat="server">
                                    <ItemTemplate>
                                        <div class="practice-item">
                                            <div class="practice-item__left">
                                                <img src="../../images/thcs-avt-test.png">
                                            </div>
                                            <div class="practice-item__right">
                                                <div class="--info">
                                                    <div class="title">
                                                        <%#Eval("luyentap_name") %>
                                                    </div>
                                                    <div class="other">
                                                        <a href="/app-lich-su-bai-luyen-tap-thcs-<%#Eval("khoi_id") %>-<%#Eval("mon_id") %>-<%#Eval("luyentap_id") %>" class="icon history"><i class="fa fa-pencil"></i>&nbsp;<%#Eval("count_view") %></a>
                                                        <a class="icon important" href="javascript:void(0)"><i class="<%#Eval("luyentap_star_class") %>"></i></a>
                                                        <a href="javascript:void(0)" id="btnHeart<%#Eval("luyentap_id") %>" onclick="myHeart(<%#Eval("test_id") %>)" class="icon favorite"><i class="<%#Eval("luyentap_heart_class") %>"></i></a>
                                                        <a href="/<%#Eval("test_link") %>" class="play">
                                                            <img src="/images/btn-lambai.png" alt="Alternate Text">
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </div>--%>
                    </div>
                </div>
            </div>

            <div style="display: none;">
                <input id="txtLuyenTap_id" type="text" runat="server" />
                <a href="javascript:void(0)" id="btnMyHeart" runat="server" onserverclick="btnMyHeart_ServerClick"></a>
            </div>
        </div>
    </div>
    <script>
        function myHeart(id) {
            document.getElementById("<%=txtLuyenTap_id.ClientID%>").value = id;
            document.getElementById("<%=btnMyHeart.ClientID%>").click();
        }
    </script>

</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="BottomWrapper" Runat="Server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="Footer" Runat="Server">
</asp:Content>

