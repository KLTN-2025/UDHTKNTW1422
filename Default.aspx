<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />

    <link rel="apple-touch-icon" href="/images/koi-logo_2.png" />
    <link rel="shortcut icon" href="/images/koi-logo_2.png" />

    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <title>Home KoiGo!</title>
    <meta name="keywords" content="TỰ DO , CHỦ ĐỘNG , UY TÍN" />
    <meta name="description" content="---- mang đến sự linh hoạt cho học sinh, cho phép các em học theo tốc độ của riêng mình, bất kể thời gian và không gian." />

    <link href="css/animate.min.css" rel="stylesheet" />
    <link href="css/bootstrap4.6.2.css" rel="stylesheet" />

    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap462/bootstrap.bundle.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400;600&display=swap" rel="stylesheet" />

    <link href="css/styleDinotech.css" rel="stylesheet" />
    <script src="admin_js/sweetalert.min.js"></script>
    <script type="text/javascript">
        window.check_viewport = function () {
            const screenWidth = window.outerWidth > 0 ? window.outerWidth : window.screen.width;
            let content = "";

            if (screenWidth > 520) {
                // Viewport cho màn hình > 520px
                content = "width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no";
            } else {
                // Viewport cho màn hình ≤ 520px
                const scale = screenWidth / 520;
                content = `width=520, user-scalable=no, initial-scale=${scale}, minimum-scale=${scale}, maximum-scale=${scale}`;
            }

            // Tìm hoặc cập nhật thẻ <meta name="viewport">
            let docViewport = document.head.querySelector('meta[name="viewport"]');

            if (docViewport) {
                if (docViewport.getAttribute("content") !== content) {
                    docViewport.setAttribute("content", content);
                }
            } else {
                docViewport = document.createElement("meta");
                docViewport.setAttribute("name", "viewport");
                docViewport.setAttribute("content", content);
                document.head.appendChild(docViewport);
            }
        };

        // Gọi ngay khi trang load
        window.check_viewport();

        // Lắng nghe sự kiện resize để cập nhật viewport
        window.addEventListener("resize", function () {
            clearTimeout(window.check_viewport_timer);
            window.check_viewport_timer = setTimeout(window.check_viewport, 200);
        });

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="page-view --home ">
            <header class="header-page wow bounceIn">
                <nav class="navbar navbar-expand navbar-light">
                    <div class="container">
                        <a class="navbar-brand" href="/dinotech-trang-chu">
                            <img src="/images/logo_page.png" alt="" srcset="" /></a>
                        <div class="collapse navbar-collapse justify-content-md-between">
                            <ul class="navbar-nav">
                                <li class="nav-item">
                                    <a class="nav-link" href="../tieu-hoc-bang-gia">BẢNG GIÁ</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="../tieu-hoc-huong-dan-bai-tap">HƯỚNG DẪN </a>
                                </li>
                                <%--<li class="nav-item">
                                    <a class="nav-link" href="/dinotech-tin-tuc">GÓC PHỤ HUYNH </a>
                                </li>--%>
                                <li class="nav-item d-md-none">
                                    <a class="nav-link" href="../app-register">ĐĂNG KÍ </a>
                                </li>
                                <li class="nav-item d-md-none">
                                    <a href="../app-login" class="nav-link">ĐĂNG NHẬP</a>
                                </li>
                            </ul>
                            <ul class="navbar-nav d-none d-md-flex">

                                <li class="nav-item">
                                    <a class="nav-link" href="../app-register">ĐĂNG KÍ </a>
                                </li>
                                <li class="nav-item">
                                    <a href="../app-login" class="nav-link">ĐĂNG NHẬP</a>
                                </li>
                            </ul>
                        </div>
                        <%-- <div class="menu-main">
                            
                        </div>--%>
                    </div>
                </nav>
            </header>
            <%--<section class="flower">
                <div class="container">
                    <div class="flower-view wow bounceInDown">
                        <img class="bg-flower" src="/images/flower-nontext.png" alt="" srcset="" />
                        <a href="#" class="flower-click --position-1 text --disable">
                            <div class="flower-content">
                                <img src="/images/icon-lock-home.png" class="img-lock" alt="lock" />
                                APP
                            <br />
                                LIÊN LẠC
                            <br />
                                ĐIỆN TỬ
                            </div>
                        </a>
                        <a href="#" class="flower-click --position-2 text --disable">
                            <div class="flower-content">
                                <img src="/images/icon-lock-home.png" class="img-lock" alt="lock" />MẦM NON
                            </div>
                        </a>
                        <a href="/tieu-hoc-trang-chu" class="flower-click --position-3 text ">
                            <div class="flower-content">
                                <img src="/images/icon-lock-home.png" class="img-lock" alt="lock" />TIỂU HỌC
                            </div>
                        </a>
                        <a href="#" class="flower-click --position-4 text --disable">
                            <div class="flower-content">
                                <img src="/images/icon-lock-home.png" class="img-lock" alt="lock" />THCS
                            </div>
                        </a>

                        <a href="#" class="flower-click --position-5 text --disable">
                            <div class="flower-content">
                                <img src="/images/icon-lock-home.png" class="img-lock" alt="lock" />THPT
                            </div>
                        </a>
                        <a href="#" class="flower-click --position-6 text --disable">
                            <div class="flower-content">
                                <img src="/images/icon-lock-home.png" class="img-lock" alt="lock" />THÁCH ĐẤU
                            </div>
                        </a>

                        <a href="../web-vui-hoc" class="flower-click --position-7 text --disable">
                            <div class="flower-content">
                                <img src="/images/icon-lock-home.png" class="img-lock" alt="lock" />
                                GAME<br />
                                TƯ DUY
                            </div>
                        </a>
                    </div>
                </div>
            </section>--%>
            <section class="block-1">
                <div class="banner-img  wow bounceIn">
                    <img class="img-bg" src="/images/image_THCS/banner-block-2.jpg" alt="hoc sinh" />
                </div>

                <%--<div class="container">
                    <div class="content">
                        <h2 class="highlight-text gold-text">Nỗ lực học tập<br />
                            Xây dựng ước mơ!</h2>
                        <div class="text-container shadow--red">
                            <p>
                                <strong>Website</strong> cung cấp môi trường học tập toàn diện các môn.
                                Từ video bài giảng cho tới luyện tập trắc nghiệm và bài kiểm tra định kì.
            Các em hãy nỗ lực để xây dựng ước mơ.
                           
                            </p>
                        </div>
                    </div>
                </div>--%>
            </section>
            <section class="block-2">
                <%--<img class="img-silk" src="/images/image_THCS/silk-block-2.png" alt="hoc sinh" />--%>
                <%-- <div class="arrow-item wow bounceIn">
                    <img src="/images/image_THCS/bg-arrow1.png" alt="Alternate Text" />
                </div>--%>



                <div class="container">
                    <ul class="nav nav-pills nav-diamond wow bounceIn" id="pills-tab" role="tablist">
                        <li class="nav-item" role="presentation">
                            <button class="nav-link active" id="pills-diamond-1" data-toggle="pill" data-target="#pills-home" type="button" role="tab" aria-controls="pills-home" aria-selected="true">
                            </button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button class="nav-link" id="pills-diamond-2" data-toggle="pill" data-target="#pills-profile" type="button" role="tab" aria-controls="pills-profile" aria-selected="false">
                            </button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button class="nav-link" id="pills-diamond-3" data-toggle="pill" data-target="#pills-contact" type="button" role="tab" aria-controls="pills-contact" aria-selected="false">
                            </button>
                        </li>
                    </ul>
                    <div class="tab-content wow bounceInDown" id="tabs-diamond">
                        <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
                            <div class="diamond-content">
                                <div class="row align-items-center">
                                    <div class="col-md-6 col-lg-7">

                                        <div class="-video">
                                            <%--<img class="img-avatar" id="img-avatar-1" src="/images/image_THCS/img-youtube-01.png" alt="Alternate Text" />
                                            <button class="-video__btn" id="btnPlayVideo-1" type="button" onclick="funcShowVideo(this.getAttribute('data-id'),this.getAttribute('data-url'))" data-id="1" data-url="https://www.youtube.com/embed/aKTLTwYoZyI?si=0P0cyZFkQRXUBABE&autoplay=1"><span></span></button>--%>
                                            <div id="video-1" class="embed-responsive embed-responsive-16by9">
                                                .
                                                <%--<iframe id="iframe-video-1" class="embed-responsive-item" src="<%= linkvideotrietli %>" allowfullscreen=""></iframe>--%>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="col-md-6 col-lg-5">
                                        <div class="-txt-main">
                                            <h2 style="font-weight: bold; font-family: 'Open Sans', sans-serif; color: #b51a1a ;">TỰ DO – CHỦ ĐỘNG – UY TÍN</h2>
                                            <p><b style="color: red;">Tự do:</b> <b style="color: #b51a1a ;">KOIGO</b> mang đến sự linh hoạt, giúp học sinh học theo tốc độ và thời gian của riêng mình.</p>
                                            <p><b style="color: red;">Chủ động:</b> Ứng dụng khơi dậy niềm hứng thú, khuyến khích học sinh chủ động chinh phục mục tiêu học tập.</p>
                                            <p><b style="color: red;">Uy tín:</b> <b style="color: #b51a1a ;">KOIGO</b> cam kết chất lượng qua kết quả rõ ràng, giúp học sinh nắm vững kiến thức nhanh và hiệu quả.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab">
                            <div class="diamond-content">
                                <div class="row align-items-center">
                                    <div class="col-md-6 col-lg-7">
                                        <div class="-video">
                                            <%-- <img class="img-avatar" id="img-avatar-2" src="/images/image_THCS/img-youtube-02.png" alt="Alternate Text" />
                                            <button class="-video__btn" id="btnPlayVideo-2" type="button" onclick="funcShowVideo(this.getAttribute('data-id'),this.getAttribute('data-url'))" data-id="2" data-url="https://www.youtube.com/embed/8NBHtZEaUME?si=igMPKZH7KEXnGhTE&autoplay=1"><span></span></button>--%>
                                            <div id="video-2" class="embed-responsive embed-responsive-16by9">
                                                <%--<iframe id="iframe-video-2" class="embed-responsive-item" src="<%= linkvideosumenh %>" allowfullscreen=""></iframe>--%>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="col-md-6 col-lg-5">
                                        <div class="-txt-main">
                                            <%--<%= noidungsumenh %>--%>

                                            <%--<h2 style="font-weight: bold; font-family: 'Open Sans', sans-serif; color: #216b0c;">KẾT NỐI - ĐỒNG HÀNH - LINH HOẠT</h2>
                                            <p><b style="color: red;">Kết nối:</b> Minh bạch giúp phụ huynh theo dõi tiến trình học tập và đồng hành cùng con hiệu quả.</p>
                                            <p><b style="color: red;">Đồng hành:</b> <b style="color: #216b0c;">DINOTECH</b> là người bạn tin cậy, cùng học sinh và phụ huynh hướng tới mục tiêu giáo dục lâu dài.</p>
                                            <p><b style="color: red;">Linh hoạt:</b> Tự do lựa chọn cách và thời gian học, phù hợp với nhịp sống và nhu cầu của từng gia đình.</p>--%>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="pills-contact" role="tabpanel" aria-labelledby="pills-contact-tab">
                            <div class="diamond-content">
                                <div class="row align-items-center">
                                    <div class="col-md-6 col-lg-7">
                                        <div class="-video">
                                            <%--<img class="img-avatar" id="img-avatar-3" src="/images/image_THCS/img-youtube-03.png" alt="Alternate Text" />
                                            <button class="-video__btn" id="btnPlayVideo-3" type="button" onclick="funcShowVideo(this.getAttribute('data-id'),this.getAttribute('data-url'))" data-id="3" data-url="https://www.youtube.com/embed/1qJHUz243NY?si=j7uSHvvoFTGCnc6N&autoplay=1"><span></span></button>--%>
                                            <div id="video-3" class="embed-responsive embed-responsive-16by9">
                                                <%--<iframe id="iframe-video-3" class="embed-responsive-item" src="<%= linkvideogiatricotloi %>" allowfullscreen=""></iframe>--%>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="col-md-6 col-lg-5">
                                        <div class="-txt-main">
                                            <%--<%= noidunggiatricotloi %>--%>

                                            <%--<h2 style="font-weight: bold; font-family: 'Open Sans', sans-serif; color: #216b0c;">HỌC TẬP – TRÁCH NHIỆM – TẬN TÂM</h2>
                                            <p>
                                                <b style="color: red;">Học tập:</b> <b style="color: #216b0c;">DINOTECH</b> mang đến môi trường học tập hiện đại, giúp học sinh tiếp thu kiến thức hiệu quả và phát triển toàn diện.
                                            </p>
                                            <p><b style="color: red;">Trách nhiệm:</b> Chúng tôi đặt sự tiến bộ của học sinh làm trung tâm, giúp phụ huynh dễ dàng theo dõi và khuyến khích tinh thần tự giác, nỗ lực của con.</p>
                                            <p><b style="color: red;">Tận tâm: </b><b style="color: #216b0c;">DINOTECH</b> đồng hành trong từng bước trưởng thành, mang đến lộ trình học cá nhân hóa và hỗ trợ tận tình cho cả học sinh lẫn phụ huynh.</p>--%>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%--<img class="img-footer" src="/images/image_THCS/block-2-footer.png" alt="" />--%>
            </section>
            <section class="block-3">
                <div class="header-main wow bounceIn">
                    <h2 class="">Cùng khám phá quy trình học tập khi<br />
                        đăng kí khoá học tại KoiGo</h2>
                </div>
                <div class="wow bounceIn">
                    <img width="100%" class="d-none d-md-block" src="images/image_THCS/block-4.png" alt="khám phá" />
                    <img width="100%" class="d-md-none" src="images/image_THCS/block-4-phone.jpg" alt="khám phá" />
                </div>


                <%--<div class="container">
                    
                    <div class="content-list">
                        <div class="content-item wow bounceInDown">
                            <div class="content-item__img">
                                <img src="/images/image_THCS/bg-landingpage-thcs-lt.png" alt="Alternate Text" />
                            </div>
                            <div class="content-item__text ">
                                <div class="decription">
                                    <div class="title">Video học tập phong phú</div>

                                    <ul class="feature-list">
                                        <li>Hơn <b>1000</b> video các môn học.</li>
                                        <li>Dễ hiểu, dễ tiếp thu.</li>
                                        <li>Tự chọn Video <span class="highlight">yêu thích</span>.</li>
                                        <li>Các Video <span class="highlight">quan trọng</span> được giáo viên chọn <span class="highlight">ngôi sao</span>.</li>
                                    </ul>
                                </div>
                            </div>

                            <div class="position-arrow --arrow-1">
                                <img src="/images/image_THCS/bg-arrow2.png" alt="Alternate Text" />
                            </div>
                        </div>

                        <div class="content-item wow bounceInDown">
                            <div class="position-arrow --arrow-2">
                                <img src="/images/image_THCS/bg-arrow3.png" alt="Alternate Text" />
                            </div>
                            <div class="content-item__text">
                                <div class="decription">
                                    <div class="title">Kiểm tra năng lực, đánh giá tiến bộ</div>
                                    <ul class="feature-list">
                                        <li class="non-icon">Hệ thống bài<span class="highlight"> kiểm tra đa dạng</span>, đề cao tính thực hành và vận dụng kiến thức.
                                <span class="highlight">Cập nhật liên tục </span>với đề mới, đảm bảo tính thách thức và phù hợp.</li>
                                    </ul>

                                </div>
                            </div>
                            <div class="content-item__img ">
                                <img class="shadow--3d" src="/images/image_THCS/bg-landingpage-thcs-kt.png" alt="Alternate Text" />
                            </div>



                        </div>
                        <div class="content-item wow bounceInDown">
                            <div class="content-item__img ">
                                <img src="/images/image_THCS/bg-landingpage-thcs-kq.png" alt="Alternate Text" />
                            </div>
                            <div class="content-item__text">
                                <div class="decription">
                                    <div class="title">Thúc đẩy tinh thần cạnh tranh lành mạnh</div>
                                    <ul class="feature-list">
                                        <li class="non-icon"><span class="highlight">Theo dõi kết quả học tập</span> và xếp hạng so với bạn cùng lớp, cùng trường.
                                <span class="highlight">Cập nhật liên tục</span>, giúp học sinh nắm bắt được sự tiến bộ của bản thân.
Khuyến khích học sinh<span class="highlight"> phấn đấu, nâng cao </span>thành tích.</li>
                                    </ul>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>--%>
            </section>
            <%--<section class="block-4">
                <div class="form-news">
                    <div class="header-main wow bounceIn">
                        <h2 class="">Tin tức</h2>
                    </div>
                    <div class="container wow bounceIn">
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="news-home --first">                                    
                                    <a href="/web_module/website/web_NewsDetail.aspx" class="item-news">
                                        <div class="news-img">
                                            <img src="https://photo.znews.vn/w1000/Uploaded/lce_jwqqc/2025_10_06/558782949_25868253509441857_5839296210323884524_n_1_.jpg" alt="Alternate Text" />
                                        </div>
                                        <div class="news-title">Mưa lớn suốt đêm, Hà Nội nhiều nơi tắc cứng vì ngập</div>
                                        <div class="news-summary">Do ảnh hưởng của hoàn lưu bão số 11, Hà Nội ghi nhận nhiều cơn mưa lớn từ đêm 6/10 đến sáng 7/10, khiến nhiều khu vực tái diễn tình trạng ngập úng.</div>
                                    </a>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="news-home">
                                   
                                     <a href="/web_module/website/web_NewsDetail.aspx" class="item-news">
                                        <div class="news-img">
                                            <img src="https://photo.znews.vn/w1000/Uploaded/lce_jwqqc/2025_10_06/558782949_25868253509441857_5839296210323884524_n_1_.jpg" alt="Alternate Text" />
                                        </div>
                                        <div class="news-title">Mưa lớn suốt đêm, Hà Nội nhiều nơi tắc cứng vì ngập</div>
                                        <div class="news-summary">Do ảnh hưởng của hoàn lưu bão số 11, Hà Nội ghi nhận nhiều cơn mưa lớn từ đêm 6/10 đến sáng 7/10, khiến nhiều khu vực tái diễn tình trạng ngập úng.</div>
                                    </a>
                                    <a href="/web_module/website/web_NewsDetail.aspx" class="item-news">
                                        <div class="news-img">
                                            <img src="https://photo.znews.vn/w1000/Uploaded/lce_jwqqc/2025_10_06/558782949_25868253509441857_5839296210323884524_n_1_.jpg" alt="Alternate Text" />
                                        </div>
                                        <div class="news-title">Mưa lớn suốt đêm, Hà Nội nhiều nơi tắc cứng vì ngập</div>
                                        <div class="news-summary">Do ảnh hưởng của hoàn lưu bão số 11, Hà Nội ghi nhận nhiều cơn mưa lớn từ đêm 6/10 đến sáng 7/10, khiến nhiều khu vực tái diễn tình trạng ngập úng.</div>
                                    </a>
                                    <a href="/web_module/website/web_NewsDetail.aspx" class="item-news">
                                        <div class="news-img">
                                            <img src="https://photo.znews.vn/w1000/Uploaded/lce_jwqqc/2025_10_06/558782949_25868253509441857_5839296210323884524_n_1_.jpg" alt="Alternate Text" />
                                        </div>
                                        <div class="news-title">Mưa lớn suốt đêm, Hà Nội nhiều nơi tắc cứng vì ngập</div>
                                        <div class="news-summary">Do ảnh hưởng của hoàn lưu bão số 11, Hà Nội ghi nhận nhiều cơn mưa lớn từ đêm 6/10 đến sáng 7/10, khiến nhiều khu vực tái diễn tình trạng ngập úng.</div>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>--%>
            <section class="block-footer wow bounceIn">
                <div class="form-register">
                    <div class="banner-register">
                        <img class="d-md-none" src="/images/image_THCS/bg-register-left-desktop.png" alt="Alternate Text" />
                        <img class="d-md-block d-none" src="/images/image_THCS/bg-register-left-desktop.png" alt="Alternate Text" />
                    </div>
                    <div class="container">
                        <div class="register-main">

                            <div class="row justify-content-end">

                                <div class="col-sm-8 col-md-7 col-lg-6">
                                    <div class="form-title">
                                        ĐĂNG KÍ TƯ VẤN

                                    </div>
                                    <div class="input-group-animate">
                                        <input name="register" type="text" id="txtSoDienThoaiLienHe" runat="server" class="form-input" autocomplete="off" />
                                        <label for="" class="lb-input">Nhập số điện thoại</label>
                                    </div>
                                    <div class="input-group-animate">
                                        <input name="register" type="text" id="txtHoTenLienHe" runat="server" class="form-input" autocomplete="off" />
                                        <label for="" class="lb-input">Nhập họ tên</label>
                                    </div>
                                    <div class="input-group-animate">
                                        <input name="register" type="text" id="txtNoiDungLienHe" runat="server" class="form-input" autocomplete="off" />
                                        <label for="" class="lb-input">Nội dung</label>
                                    </div>
                                    <div class="text-center">
                                        <a href="javascript:void(0)" class="btn-register hvr-" id="btnSubmitLienHe" runat="server" onclick="return checkNullLienHe()">
                                            <img src="/images/image_THCS/btn-register.png" alt="Alternate Text" /></a>
                                    </div>
                                </div>


                            </div>
                        </div>

                    </div>
                </div>
                <div class="contact-info">
                    <img src="/images/image_THCS/block-footer-top.png" class="bg-top" alt="Alternate Text" />
                    <div class=" container">
                        <div class="row">
                            <div class="col-sm-4 mb-4 mb-sm-0">
                                <div class="contact-main">
                                    <div class="title-info">Thông tin trụ sở</div>
                                    <p><i class="bi bi-house-fill "></i>&nbsp;<strong>ĐÀ NẴNG</strong></p>
                                    <p>----, Đà Nẵng </p>
                                    <p><i class="bi bi-telephone-fill"></i>&nbsp;<strong>Liên hệ hợp tác</strong></p>
                                    <p>0000 000 000</p>
                                </div>

                            </div>
                            <div class="col-sm-4 mb-4 mb-sm-0">
                                <div class="contact-main">
                                    <div class="title-info">Chăm sóc khách hàng</div>
                                    <p><i class="bi bi-envelope-fill "></i>&nbsp;<b>Email:</b></p>
                                    <p>koigolang@gmail.com</p>
                                    <p><i class="bi bi-telephone-fill "></i>&nbsp;<b>Hotline:</b></p>
                                    <p><a href="tel:0000 000 000">0000 000 000</a></p>
                                    <%--<p class="social">
                                        <a href="#" target="_blank" class="text-primary mr-3">
                                            <i class="bi bi-facebook fa-2x"></i>
                                        </a>
                                        <a href="#" target="_blank" class="text-info mr-3">
                                            <i class="bi bi-chat-dots fa-2x"></i>
                                        </a>
                                        <a href="#" target="_blank" class="text-danger">
                                            <i class="bi bi-youtube fa-2x"></i>
                                        </a>
                                    </p>--%>
                                </div>


                            </div>
                            <div class="col-sm-4">
                                <div class="contact-main">
                                    <div class="title-info">Chính sách bảo vệ thông tin</div>
                                    <p><a href="#">Điều khoản sử dụng</a></p>
                                    <p><a href="#">Chính sách bảo mật</a></p>
                                    <p><a href="#">Hướng dẫn sử dụng</a></p>
                                </div>

                            </div>
                        </div>

                    </div>
                    <%-- <div class="footer-image ">
                        <img src="/images/image_THCS/footer.png" width="100%" alt="Footer Image" />
                    </div>--%>
                </div>
            </section>
        </div>
        <script src="/js/wow.min.js"></script>
        <script>
            function funcShowVideo(id, url) {
                // Dừng tất cả video trước khi chạy video mới
                document.querySelectorAll('.-video .embed-responsive iframe').forEach(iframe => {
                    iframe.setAttribute("src", ""); // Reset để dừng video
                });

                // Ẩn tất cả ảnh thumbnail, nút play và video
                document.querySelectorAll('.-video .img-avatar').forEach(el => el.style.display = 'block');
                document.querySelectorAll('.-video__btn').forEach(el => el.style.display = 'block');
                document.querySelectorAll('.-video .embed-responsive').forEach(el => {
                    el.style.opacity = "0";
                    el.style.display = 'none';
                });

                // Hiển thị video của tab được chọn
                document.getElementById('img-avatar-' + id).style.display = 'none';
                document.getElementById('btnPlayVideo-' + id).style.display = 'none';

                let videoContainer = document.getElementById('video-' + id);
                let iframe = document.getElementById("iframe-video-" + id);
                videoContainer.style.display = 'block';

                // Thêm `autoplay=1` nếu chưa có
                if (!url.includes("autoplay=1")) {
                    url += (url.includes("?") ? "&" : "?") + "autoplay=1";
                }

                // Gán lại src để đảm bảo autoplay
                iframe.setAttribute("src", url);

                setTimeout(() => {
                    videoContainer.style.transition = "opacity 0.5s ease-in-out";
                    videoContainer.style.opacity = "1";
                }, 100);
            }
            function checkNullLienHe() {
                var name = document.getElementById('<%= txtHoTenLienHe.ClientID%>');
                var sodienthoai = document.getElementById('<%= txtSoDienThoaiLienHe.ClientID%>');
                var noidung = document.getElementById('<%= txtNoiDungLienHe.ClientID%>');

                if (sodienthoai.value.trim() == "") {
                    swal('Số điện thoại không được để trống!', '', 'warning').then(function () { sodienthoai.focus(); });
                    return false;
                }
                if (name.value.trim() == "") {
                    swal('Họ tên không được để trống!', '', 'warning').then(function () { name.focus(); });
                    return false;
                }

                if (noidung.value.trim() == "") {
                    swal('Vui lòng nhập nội dung cần liên hệ!', '', 'warning').then(function () { noidung.focus(); });
                    return false;
                }
                return true;
            }
            // Xử lý sự kiện khi chuyển tab
            document.querySelectorAll(".nav-link").forEach(tab => {
                tab.addEventListener("click", function () {
                    // Dừng tất cả video khi chuyển tab
                    document.querySelectorAll(".embed-responsive iframe").forEach(iframe => {
                        iframe.src = iframe.src; // Dừng video
                    });
                });
            });
        </script>

        <script>
            new WOW().init();
            //function funcShowVideo(id) {
            //    $('.-video .img-avatar').show();
            //    $('.-video__btn').show();
            //    $('.-video .embed-responsive').hide();
            //    $('#img-avatar-' + id).hide();
            //    $('#btnPlayVideo-' + id).hide();

            //    $('#video-' + id).fadeIn();
            //}

            $(document).ready(function () {
                $(".nav-link").on("click", function () {
                    let bgImage = "";

                    if ($(this).attr("id") === "pills-diamond-1") {
                        bgImage = "url('/images/image_THCS/bg-nav-1.png')";
                    } else if ($(this).attr("id") === "pills-diamond-2") {
                        bgImage = "url('/images/image_THCS/bg-nav-2.png')";
                    } else if ($(this).attr("id") === "pills-diamond-3") {
                        bgImage = "url('/images/image_THCS/bg-nav-3.png')";
                    }

                    $(".nav-diamond").css("background-image", bgImage);
                });
            });
        </script>
    </form>
</body>
</html>
