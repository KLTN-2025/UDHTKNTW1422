<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

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
    <title>Home</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="/css/themify-icons.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ" crossorigin="anonymous"></script>
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

    </script>
    <script src="/js/current-device.min.js"></script>
    <link href="/css/styleHome.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="form-homepage">
            <img class="clouds --item-1" src="/images/cloud-2.png" alt="Alternate Text" />
            <img class="clouds --item-2" src="/images/cloud-3.png" alt="Alternate Text" />
            <img class="clouds --item-3" src="/images/cloud-2.png" alt="Alternate Text" />
            <img class="clouds --item-4" src="/images/cloud-1.png" alt="Alternate Text" />
            <div class="island --item-1">
                <a href="/thpt-trang-chu">
                    <img class="title" src="/images/header-thpt.png" alt="Alternate Text" />
                    <img class="bg-island" src="/images/island-1.png" alt="Alternate Text" /></a>

            </div>
            <div class="island --item-2">
                <a href="/thcs-trang-chu">
                    <img class="title" src="/images/header-thcs.png" alt="Alternate Text" />
                    <img class="bg-island" src="/images/island-2.png" alt="Alternate Text" /></a>
            </div>
            <div class="island --item-3">
                <a href="/tieu-hoc-trang-chu">
                    <img class="title" src="/images/header-tieuhoc.png" alt="Alternate Text" />
                    <img class="bg-island" src="/images/island-4.png" alt="Alternate Text" /></a>
            </div>
            <div class="island --item-4">
                <a href="/mam-non-trang-chu">
                    <img class="title" src="/images/header-mamnon.png" alt="Alternate Text" />
                    <img class="bg-island" src="/images/island-5.png" alt="Alternate Text" /></a>
            </div>
        </div>
    </form>
</body>
</html>
