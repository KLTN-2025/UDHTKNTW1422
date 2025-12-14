<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageLandingPage.master" AutoEventWireup="true" CodeFile="module_ChungChi.aspx.cs" Inherits="web_module_module_ChungChi" %>

<%@ Register Src="~/web_usercontrol/global_LandingPage_Menu_1.ascx" TagPrefix="uc1" TagName="global_LandingPage_Menu_1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="Server">
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" xintegrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        .chungchi-container {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 60vh;
            padding: 40px 20px;
        }

        .chungchi-wrapper {
            text-align: center;
            max-width: 1200px;
            width: 100%;
        }

        .chungchi-title {
            font-size: 28px;
            font-weight: 600;
            color: #333;
            margin-bottom: 30px;
     font-family: 'Times New Roman', Times, serif;

        }

        .chungchi-image {
            max-width: 100%;
            height: auto;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
            transition: all 0.3s ease;
        }
        .chungchi-image.unlocked {
            animation: fadeInScale 0.8s ease-out;
        }
        .chungchi-image.locked {
            opacity: 0.3;
            filter: grayscale(100%) blur(3px);
            pointer-events: none;
        }
        @keyframes fadeInScale {
            from {
                opacity: 0;
                transform: scale(0.9);
            }
            to {
                opacity: 1;
                transform: scale(1);
            }
        }
        .certificate-status {
            margin-top: 30px;
            padding: 25px;
            border-radius: 12px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
        }
        .certificate-status.locked {
            background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
        }
        .status-icon {
            font-size: 48px;
            margin-bottom: 15px;
            animation: bounce 2s infinite;
        }
        @keyframes bounce {
            0%, 20%, 50%, 80%, 100% {
                transform: translateY(0);
            }
            40% {
                transform: translateY(-10px);
            }
            60% {
                transform: translateY(-5px);
            }
        }
        .status-title {
            font-size: 24px;
            font-weight: 600;
            margin-bottom: 10px;
        }
        .status-message {
            font-size: 16px;
            opacity: 0.95;
            line-height: 1.6;
        }
        .lock-overlay {
            position: relative;
            display: inline-block;
        }
        .lock-icon {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            font-size: 80px;
            color: rgba(255, 255, 255, 0.9);
            text-shadow: 0 2px 10px rgba(0, 0, 0, 0.5);
            z-index: 10;
        }
        .celebration {
            position: relative;
            overflow: hidden;
        }
        .celebration::before {
            content: '🎉';
            position: absolute;
            top: -20px;
            left: 10%;
            font-size: 40px;
            animation: fall 3s infinite;
        }
        .celebration::after {
            content: '✨';
            position: absolute;
            top: -20px;
            right: 10%;
            font-size: 40px;
            animation: fall 3s infinite 0.5s;
        }
        @keyframes fall {
            to {
                transform: translateY(100vh) rotate(360deg);
                opacity: 0;
            }
        }
        .certificate-section {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Menu" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="TopWrapper" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Wrapper" runat="Server">
    <uc1:global_LandingPage_Menu_1 runat="server" ID="global_LandingPage_Menu_1" />
    <div class="chungchi-container">
        <div class="chungchi-wrapper">
            <h2 class="chungchi-title">Chứng chỉ Khối 6</h2>
            
            <!-- Trạng thái: Chưa hoàn thành (Locked) -->
            <div id="certificateLocked" class="certificate-section">
                <div class="lock-overlay">
                    <img src="/images/chungchi.png" alt="Chứng chỉ" class="chungchi-image locked" />
                    <div class="lock-icon">
                        <i class="bi bi-lock-fill"></i>
                    </div>
                </div>
                <div class="certificate-status locked">
                    <div class="status-icon">
                        <i class="bi bi-lock-fill"></i>
                    </div>
                    <div class="status-title">Bạn cần hoàn thành tất cả bài tập của Khối 6 để nhận được chứng chỉ này.<br />
                        Hãy tiếp tục cố gắng nhé!</div>
                </div>
            </div>

            <!-- Trạng thái: Đã hoàn thành (Unlocked) - Ẩn mặc định -->
            <div id="certificateUnlocked" class="certificate-section" style="display: none;">
                <div class="celebration">
                    <img src="/images/chungchi.png" alt="Chứng chỉ" class="chungchi-image unlocked" />
                </div>
                <div class="certificate-status">
                    <div class="status-icon">
                        <i class="bi bi-trophy-fill"></i>
                    </div>
                    <div class="status-title">Chúc mừng!</div>
                    <div class="status-message">
                        Bạn đã hoàn thành tất cả bài tập của Khối 6.<br />
                        Chứng chỉ này là phần thưởng xứng đáng cho sự nỗ lực của bạn!
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        // Để demo: Bạn có thể thay đổi giá trị này để xem trạng thái unlocked
        // Khi tích hợp thật, sẽ kiểm tra từ server hoặc API
        const isCompleted = false; // Đổi thành true để xem trạng thái unlocked

        if (isCompleted) {
            document.getElementById('certificateLocked').style.display = 'none';
            document.getElementById('certificateUnlocked').style.display = 'block';
        } else {
            document.getElementById('certificateLocked').style.display = 'block';
            document.getElementById('certificateUnlocked').style.display = 'none';
        }
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="BottomWrapper" runat="Server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="Footer" runat="Server">
</asp:Content>

