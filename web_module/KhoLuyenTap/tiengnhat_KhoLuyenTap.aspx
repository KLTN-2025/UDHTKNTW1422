<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageLandingPage.master" AutoEventWireup="false" %>

<%@ Register Src="~/web_usercontrol/global_LandingPage_Menu_1.ascx" TagPrefix="uc1" TagName="global_LandingPage_Menu_1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="Server">
    <link href="../../css/gameTieuHoc.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" xintegrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        /* Remove all decorative side panels and white stripes */
        html, body {
            background: #f5f5f5 !important;
            overflow-x: hidden !important;
        }
        html::before, html::after,
        body::before, body::after {
            display: none !important;
            content: none !important;
        }
        form {
            background: #f5f5f5 !important;
        }
        form::before, form::after {
            display: none !important;
        }
        *::before, *::after {
            background-image: none !important;
            background: transparent !important;
        }
        /* Fix logo to be above quiz container */
        .header-page {
            position: relative !important;
            z-index: 1000 !important;
        }
        .header-page.hidden {
            display: none !important;
        }
        .navbar {
            position: relative !important;
            z-index: 1000 !important;
        }
        .navbar-brand {
            position: relative !important;
            z-index: 1001 !important;
        }
        .home.page-view {
            min-height: 60vh;
            background: #f5f5f5 !important;

        }
        .home.page-view::before,
        .home.page-view::after {
            display: none !important;
            content: none !important;
        }
        .block-body {
            background: transparent !important;
        }
        .block-body::before,
        .block-body::after {
            display: none !important;
            content: none !important;
        }
        .block-body #section-class {
            padding: 8rem;
            display: flex;
            justify-content: center;
            gap: 2rem;
            flex-wrap: wrap;
            background: transparent !important;
        }
        .block-body #section-class::before,
        .block-body #section-class::after {
            display: none !important;
            content: none !important;
        }
        .block-body #section-class .class-item {
            width: calc(23% - 1rem);
            height: 16rem;
        }
        .locked {
            pointer-events: none;
            opacity: 0.4;
            filter: grayscale(70%);
        }
        .lock-icon {
            color: #ff3b3b;
            font-size: 20px;
            position: absolute;
            top: 8px;
            right: 10px;
            opacity: 0.9;
            text-shadow: 0 0 5px rgba(255,0,0,0.4);
        }
        .locked:hover .lock-icon {
            transform: scale(1.15);
            opacity: 1;
        }
        /* Hide decorative panels in quiz interface */
        #testInterface::before,
        #testInterface::after,
        #startScreen::before,
        #startScreen::after,
        .quiz-container::before,
        .quiz-container::after,
        .start-container::before,
        .start-container::after {
            display: none !important;
            content: none !important;
            background: none !important;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Menu" runat="Server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="TopWrapper" runat="Server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="Wrapper" runat="Server">
    <asp:ScriptManager runat="server" />
    <uc1:global_LandingPage_Menu_1 runat="server" ID="global_LandingPage_Menu_1" />
    <div class="home page-view">
        <div class="block-body">
            <div id="section-class">
                <a href="javascript:void(0)" onclick="startTest(6)" class="class-item color">
                    <img src="/images/test.png" alt="Alternate Text" />
                    <div class="class-item__name green-text">Lớp 6</div>
                </a>
                <a href="javascript:void(0)" class="class-item color locked">
                    <img src="/images/test.png" alt="Alternate Text" />
                    <div class="class-item__name green-text">Lớp 7</div>
                    <i class="fa fa-lock lock-icon" aria-hidden="true"></i>
                </a>
                <a href="javascript:void(0)" class="class-item color locked">
                    <img src="/images/test.png" alt="Alternate Text" />
                    <div class="class-item__name green-text">Lớp 8</div>
                    <i class="fa fa-lock lock-icon" aria-hidden="true"></i>
                </a>
                <a href="javascript:void(0)" class="class-item color locked">
                    <img src="/images/test.png" alt="Alternate Text" />
                    <div class="class-item__name green-text">Lớp 9</div>
                    <i class="fa fa-lock lock-icon" aria-hidden="true"></i>
                </a>
            </div>
        </div>
    </div>

    <!-- Start Screen (Shown first) -->
    <div id="startScreen" style="display: none;">
        <div class="start-container">
            <div class="start-content">
                <h1>Bài Kiểm Tra Lớp 6</h1>
                <div class="test-info">
                    <p><strong>Số câu hỏi:</strong> 30 câu</p>
                    <p><strong>Thời gian:</strong> 15 phút</p>
                    <p><strong>Hình thức:</strong> Trắc nghiệm</p>
                </div>
                <button type="button" class="btn-start" onclick="beginTest()">Bắt đầu làm bài</button>
            </div>
        </div>
    </div>

    <!-- Test Interface (Hidden by default) -->
    <div id="testInterface" style="display: none;">
        <div class="quiz-container">
            <div class="quiz-header">
                <div style="display: flex; align-items: center; gap: 15px;">
                    <button type="button" class="btn-back-quiz" onclick="backToStartScreen()">
                        <i class="bi bi-arrow-left"></i> Quay lại
                    </button>
                    <h2>Bài Kiểm Tra Lớp 6</h2>
                </div>
                <div class="timer-container">
                    <div class="timer-circle" id="timerDisplay">15:00</div>
                </div>
            </div>

            <div class="questions-list" id="questionsList">
                <!-- All 30 questions will be displayed here -->
            </div>

            <div class="submit-container" id="submitContainer">
                <button type="button" class="btn-submit" id="btnSubmit" onclick="confirmSubmit()">Nộp bài</button>
            </div>
        </div>
    </div>

    <!-- Confirm Submit Modal -->
    <div id="confirmModal" class="result-modal" style="display: none;">
        <div class="result-modal-content confirm-modal-content">
            <div class="confirm-modal-icon">
                <div class="warning-icon">!</div>
            </div>
            <div class="confirm-modal-body">
                <h4>Bạn có thực sự muốn nộp bài?</h4>
                <p>Nếu đồng ý, kết quả sẽ không được thay đổi.</p>
            </div>
            <div class="confirm-modal-footer">
                <button type="button" class="btn-cancel" onclick="closeConfirmModal()">Cancel</button>
                <button type="button" class="btn-ok" onclick="proceedSubmit()">OK</button>
            </div>
        </div>
    </div>

    <!-- Result Modal -->
    <div id="resultModal" class="result-modal" style="display: none;">
        <div class="result-modal-content">
            <div class="result-modal-header">
                <h3>Kết quả làm bài</h3>
                <span class="result-modal-close" onclick="closeResultModal()">&times;</span>
            </div>
            <div class="result-modal-body">
                <ul class="result-list">
                    <li>Tổng số câu: <span id="totalQuestions">30</span></li>
                    <li>Số câu đúng: <span id="correctAnswers">0</span></li>
                    <li>Số câu sai: <span id="wrongAnswers">0</span></li>
                    <li>Điểm: <span id="scoreDisplay">0</span>/<span id="maxScore">30</span></li>
                    <li>Thời gian: <span id="timeTaken">00:00</span></li>
                </ul>
            </div>
            <div class="result-modal-footer">
                <button type="button" class="btn-close-modal" onclick="closeResultModal()">Đóng</button>
            </div>
        </div>
    </div>

    <input type="hidden" id="timeLimit" value="900" />
    <input type="hidden" id="userAnswers" value="" />
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="BottomWrapper" Runat="Server">
</asp:Content>

<asp:Content ID="Content6" ContentPlaceHolderID="Footer" Runat="Server">
    <style>
        /* Remove all decorative side panels */
        html, body {
            background: #f5f5f5 !important;
            overflow-x: hidden !important;
        }
        html::before, html::after,
        body::before, body::after {
            display: none !important;
            content: none !important;
        }
        form::before, form::after {
            display: none !important;
        }
        #testInterface,
        #startScreen {
            background: #f5f5f5 !important;
        }
        #testInterface::before,
        #testInterface::after,
        #startScreen::before,
        #startScreen::after {
            display: none !important;
            content: none !important;
            background: none !important;
        }
        .quiz-container {
            background: #fff;
            min-height: 100vh;
            padding: 20px;
            max-width: 1400px;
            margin: 0 auto;
            position: relative;
            z-index: 1 !important;
        }
        .quiz-container::before,
        .quiz-container::after {
            display: none !important;
            content: none !important;
            background: none !important;
        }
        /* Ensure header and logo are above quiz container */
        #testInterface {
            position: relative;
            z-index: 1 !important;
        }
        #startScreen {
            position: relative;
            z-index: 1 !important;
        }
        .start-container {
            background: #f5f5f5 !important;
        }
        .start-container::before,
        .start-container::after {
            display: none !important;
            content: none !important;
            background: none !important;
        }
        .quiz-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px 40px;
            background: linear-gradient(135deg, #b51a1a 0%, #b51a1a 100%);
            color: white;
            border-radius: 10px;
            margin-bottom: 30px;
        }
        .quiz-header h2 {
            font-size: 28px;
            font-weight: 600;
            margin: 0;
        }
        .timer-container {
            display: flex;
            align-items: center;
            gap: 10px;
        }
        .timer-circle {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.2);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 22px;
            font-weight: bold;
            border: 3px solid white;
        }
        .questions-list {
            display: flex;
            flex-direction: column;
            gap: 25px;
            margin-bottom: 30px;
        }
        .question-item {
            background: #f8f9fa;
            border-radius: 10px;
            padding: 30px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        .question-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        .question-number {
            font-size: 18px;
            font-weight: 600;
            color: #b51a1a;
        }
        .question-content {
            font-size: 22px;
            color: #333;
            margin-bottom: 20px;
            font-weight: 500;
        }
        .answers-container {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 15px;
        }
        .answer-item {
            display: flex;
            align-items: center;
            padding: 15px 20px;
            background: white;
            border: 2px solid #e0e0e0;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.3s;
        }
        .answer-item:hover {
            border-color: #667eea;
            background: #f0f4ff;
        }
        .answer-item input[type="radio"] {
            width: 20px;
            height: 20px;
            margin-right: 15px;
            cursor: pointer;
        }
        .answer-item label {
            flex: 1;
            cursor: pointer;
            font-size: 18px;
            color: #333;
        }
        .answer-item.selected {
            border-color: #b51a1a;
            background: #e8edff;
        }
        .answer-item.correct {
            border-color: #28a745;
            background: #d4edda;
            color: #155724;
        }
        .answer-item.incorrect {
            border-color: #dc3545;
            background: #f8d7da;
            color: #721c24;
        }
        .answer-item.correct label,
        .answer-item.incorrect label {
            color: inherit;
            font-weight: 600;
        }
        .answer-item.correct::after {
            content: " ✓ Đáp án đúng";
            color: #155724;
            font-weight: bold;
            margin-left: 10px;
            font-size: 14px;
        }
        /* Nếu đáp án đúng nhưng không chọn (có cả 2 class correct và incorrect) thì vẫn hiển thị text đáp án đúng */
        .answer-item.correct.incorrect::after {
            content: " ✓ Đáp án đúng";
            color: #155724;
            font-weight: bold;
            margin-left: 10px;
            font-size: 14px;
            background: rgba(255, 255, 255, 0.8);
            padding: 2px 6px;
            border-radius: 4px;
        }
        .submit-container {
            text-align: center;
            padding: 30px 0;
        }
        .btn-submit {
            padding: 15px 60px;
            background: #28a745;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 20px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
        }
        .btn-submit:hover {
            background: #218838;
            transform: scale(1.05);
        }
        /* Start Screen Styles */
        .start-container {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            background: #f5f5f5;
            padding: 2rem;
        }
        .start-content {
            background: white;
            border-radius: 20px;
            padding: 3rem 4rem;
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.1);
            text-align: center;
            max-width: 600px;
            width: 100%;
        }
        .start-content h1 {
            font-size: 2.5rem;
            color: #b51a1a;
            margin-bottom: 2rem;
            font-weight: 700;
        }
        .test-info {
            background: #f8f9fa;
            border-radius: 10px;
            padding: 2rem;
            margin-bottom: 2.5rem;
            text-align: left;
        }
        .test-info p {
            font-size: 1.2rem;
            margin-bottom: 1rem;
            color: #333;
        }
        .test-info p:last-child {
            margin-bottom: 0;
        }
        .test-info strong {
            color: #b51a1a;
            font-weight: 600;
        }
        .btn-start {
            padding: 18px 60px;
            background: linear-gradient(135deg, #ffa500 0%, #ff8c00 100%);
            color: #000;
            border: none;
            border-radius: 12px;
            font-size: 1.5rem;
            font-weight: 700;
            cursor: pointer;
            transition: all 0.3s;
            box-shadow: 0 4px 15px rgba(255, 165, 0, 0.3);
        }
        .btn-start:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(255, 165, 0, 0.4);
            background: linear-gradient(135deg, #ffb733 0%, #ff9f1a 100%);
        }
        .btn-start:active {
            transform: translateY(0);
        }
        /* Result Modal Styles */
        .result-modal {
            display: none;
            position: fixed;
            z-index: 2000;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            align-items: center;
            justify-content: center;
        }
        .result-modal-content {
            background-color: #fff;
            border-radius: 10px;
            width: 90%;
            max-width: 500px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.3);
            overflow: hidden;
        }
        .result-modal-header {
            background-color: #17a2b8;
            color: white;
            padding: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .result-modal-header h3 {
            margin: 0;
            font-size: 1.5rem;
            font-weight: 600;
        }
        .result-modal-close {
            color: white;
            font-size: 28px;
            font-weight: bold;
            cursor: pointer;
            line-height: 1;
            transition: opacity 0.3s;
        }
        .result-modal-close:hover {
            opacity: 0.7;
        }
        .result-modal-body {
            padding: 30px 20px;
        }
        .result-list {
            list-style: none;
            padding: 0;
            margin: 0;
        }
        .result-list li {
            padding: 15px 0;
            font-size: 1.1rem;
            color: #333;
            border-bottom: 1px solid #e0e0e0;
        }
        .result-list li:last-child {
            border-bottom: none;
        }
        .result-list li span {
            font-weight: 600;
            color: #17a2b8;
        }
        .result-modal-footer {
            padding: 20px;
            text-align: right;
            background-color: #f8f9fa;
        }
        .btn-close-modal {
            background-color: #6c757d;
            color: white;
            border: none;
            padding: 10px 30px;
            border-radius: 5px;
            font-size: 1rem;
            font-weight: 500;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .btn-close-modal:hover {
            background-color: #5a6268;
        }
        .submit-container {
            display: flex;
            justify-content: center;
            gap: 15px;
        }
        .btn-retry {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 15px 60px;
            border-radius: 8px;
            font-size: 20px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
        }
        .btn-retry:hover {
            background-color: #218838;
            transform: scale(1.05);
        }
        .btn-exit {
            background-color: #6c757d;
            color: white;
            border: none;
            padding: 15px 60px;
            border-radius: 8px;
            font-size: 20px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
        }
        .btn-exit:hover {
            background-color: #5a6268;
            transform: scale(1.05);
        }
        /* Confirm Modal Styles */
        .confirm-modal-content {
            max-width: 400px;
            text-align: center;
        }
        .confirm-modal-icon {
            margin: 30px 0 20px;
            display: flex;
            justify-content: center;
        }
        .warning-icon {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            background-color: #ff9800;
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 36px;
            font-weight: bold;
            border: 3px solid #ff9800;
            box-shadow: 0 0 0 2px white, 0 0 0 4px #ff9800;
        }
        .confirm-modal-body {
            padding: 0 30px 30px;
        }
        .confirm-modal-body h4 {
            font-size: 1.3rem;
            font-weight: 600;
            color: #333;
            margin: 0 0 15px 0;
        }
        .confirm-modal-body p {
            font-size: 1rem;
            color: #666;
            margin: 0;
        }
        .confirm-modal-footer {
            padding: 20px;
            display: flex;
            justify-content: flex-end;
            gap: 10px;
            background-color: #f8f9fa;
        }
        .btn-cancel {
            background-color: #e0e0e0;
            color: #333;
            border: none;
            padding: 10px 25px;
            border-radius: 5px;
            font-size: 1rem;
            font-weight: 500;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .btn-cancel:hover {
            background-color: #d0d0d0;
        }
        .btn-ok {
            background-color: #2196F3;
            color: white;
            border: none;
            padding: 10px 25px;
            border-radius: 5px;
            font-size: 1rem;
            font-weight: 500;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .btn-ok:hover {
            background-color: #1976D2;
        }
        .btn-back-start {
            position: absolute;
            top: 20px;
            left: 20px;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            padding: 10px 20px;
            background: #6c757d;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s;
            z-index: 10;
        }
        .btn-back-start:hover {
            background: #5a6268;
            transform: translateX(-3px);
        }
        .btn-back-start i {
            font-size: 18px;
        }
        .start-content {
            position: relative;
        }
        .btn-back-quiz {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            padding: 10px 20px;
            background: rgba(255, 255, 255, 0.2);
            color: white;
            border: 2px solid white;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s;
        }
        .btn-back-quiz:hover {
            background: rgba(255, 255, 255, 0.3);
            transform: translateX(-3px);
        }
        .btn-back-quiz i {
            font-size: 18px;
        }
    </style>
    <script>
        // Hardcoded 30 questions for test
        let questions = [
            { id: 1, title: "Câu 1", content: "Hãy viết chữ Ocha", answers: [
                { id: 1, content: "おきゃ" },
                { id: 2, content: "こちゃ" },
                { id: 3, content: "おしゃ" },
                { id: 4, content: "おちゃ" }
            ], correctAnswer: 4 },
            { id: 2, title: "Câu 2", content: "Viết chữ Myu", answers: [
                { id: 1, content: "ひゅ" },
                { id: 2, content: "みゅ" },
                { id: 3, content: "しゅ" },
                { id: 4, content: "ちゅ" }
            ], correctAnswer: 2 },
            { id: 3, title: "Câu 3", content: "Sắp xếp theo thứ tự hàng biến âm sau: ぺ、ぱ、ぽ、ぴ、ぷ", answers: [
                { id: 1, content: "ぷ、ぱ、ぴ、ぺ、ぽ" },
                { id: 2, content: "ぱ、ぷ、ぺ、ぽっぴ" },
                { id: 3, content: "ぽ、ぺ、ぴ、ぷ、ぱ" },
                { id: 4, content: "ぱ、ぴ、ぷ、ぺ、ぽ" }
            ], correctAnswer: 4 },
            { id: 4, title: "Câu 4", content: "Chọn dãy chữ cái đúng: ぱ、ぴ、ぷ、ぺ、ぽ", answers: [
                { id: 1, content: "ぷ、ぱ、ぴ、ぺ、ぽ" },
                { id: 2, content: "ぱ、ぷ、ぺ、ぽっぴ" },
                { id: 3, content: "ぽ、ぺ、ぴ、ぷ、ぱ" },
                { id: 4, content: "ぱ、ぴ、ぷ、ぺ、ぽ" }
            ], correctAnswer: 4 },
            { id: 5, title: "Câu 5", content: "Chữ O viết thế nào?", answers: [
                { id: 1, content: "お" },
                { id: 2, content: "え" },
                { id: 3, content: "い" },
                { id: 4, content: "き" }
            ], correctAnswer: 1 },
            { id: 6, title: "Câu 6", content: "い được đọc là gì?", answers: [
                { id: 1, content: "i" },
                { id: 2, content: "a" },
                { id: 3, content: "o" },
                { id: 4, content: "u" }
            ], correctAnswer: 1 },
            { id: 7, title: "Câu 7", content: "Điền vào những từ còn thiếu: ざ、__、ず、__、ぞ", answers: [
                { id: 1, content: "ぢ、ぜ" },
                { id: 2, content: "じ、ぜ" },
                { id: 3, content: "ぎ、で" },
                { id: 4, content: "び、べ" }
            ], correctAnswer: 2 },
            { id: 8, title: "Câu 8", content: "まいにち được đọc là gì?", answers: [
                { id: 1, content: "mannaka" },
                { id: 2, content: "mainichi" },
                { id: 3, content: "maiban" },
                { id: 4, content: "maiasa" }
            ], correctAnswer: 2 },
            { id: 9, title: "Câu 9", content: "Chữ か được đọc là gì?", answers: [
                { id: 1, content: "ka" },
                { id: 2, content: "ga" },
                { id: 3, content: "ki" },
                { id: 4, content: "gi" }
            ], correctAnswer: 1 },
            { id: 10, title: "Câu 10", content: "Chữ さ được đọc là gì?", answers: [
                { id: 1, content: "sa" },
                { id: 2, content: "za" },
                { id: 3, content: "shi" },
                { id: 4, content: "ji" }
            ], correctAnswer: 1 },
            { id: 11, title: "Câu 11", content: "Chữ た được đọc là gì?", answers: [
                { id: 1, content: "ta" },
                { id: 2, content: "da" },
                { id: 3, content: "chi" },
                { id: 4, content: "tsu" }
            ], correctAnswer: 1 },
            { id: 12, title: "Câu 12", content: "Chữ な được đọc là gì?", answers: [
                { id: 1, content: "na" },
                { id: 2, content: "ma" },
                { id: 3, content: "ha" },
                { id: 4, content: "wa" }
            ], correctAnswer: 1 },
            { id: 13, title: "Câu 13", content: "Chữ は được đọc là gì?", answers: [
                { id: 1, content: "ha" },
                { id: 2, content: "wa" },
                { id: 3, content: "ba" },
                { id: 4, content: "pa" }
            ], correctAnswer: 1 },
            { id: 14, title: "Câu 14", content: "Chữ ま được đọc là gì?", answers: [
                { id: 1, content: "ma" },
                { id: 2, content: "na" },
                { id: 3, content: "ha" },
                { id: 4, content: "ya" }
            ], correctAnswer: 1 },
            { id: 15, title: "Câu 15", content: "Chữ や được đọc là gì?", answers: [
                { id: 1, content: "ya" },
                { id: 2, content: "yu" },
                { id: 3, content: "yo" },
                { id: 4, content: "wa" }
            ], correctAnswer: 1 },
            { id: 16, title: "Câu 16", content: "Chữ ら được đọc là gì?", answers: [
                { id: 1, content: "ra" },
                { id: 2, content: "wa" },
                { id: 3, content: "ya" },
                { id: 4, content: "ma" }
            ], correctAnswer: 1 },
            { id: 17, title: "Câu 17", content: "Chữ わ được đọc là gì?", answers: [
                { id: 1, content: "wa" },
                { id: 2, content: "ra" },
                { id: 3, content: "ya" },
                { id: 4, content: "ma" }
            ], correctAnswer: 1 },
            { id: 18, title: "Câu 18", content: "Chữ が được đọc là gì?", answers: [
                { id: 1, content: "ga" },
                { id: 2, content: "ka" },
                { id: 3, content: "za" },
                { id: 4, content: "da" }
            ], correctAnswer: 1 },
            { id: 19, title: "Câu 19", content: "Chữ ざ được đọc là gì?", answers: [
                { id: 1, content: "za" },
                { id: 2, content: "sa" },
                { id: 3, content: "ga" },
                { id: 4, content: "da" }
            ], correctAnswer: 1 },
            { id: 20, title: "Câu 20", content: "Chữ だ được đọc là gì?", answers: [
                { id: 1, content: "da" },
                { id: 2, content: "ta" },
                { id: 3, content: "za" },
                { id: 4, content: "ga" }
            ], correctAnswer: 1 },
            { id: 21, title: "Câu 21", content: "Chữ ば được đọc là gì?", answers: [
                { id: 1, content: "ba" },
                { id: 2, content: "ha" },
                { id: 3, content: "pa" },
                { id: 4, content: "wa" }
            ], correctAnswer: 1 },
            { id: 22, title: "Câu 22", content: "Chữ ぱ được đọc là gì?", answers: [
                { id: 1, content: "pa" },
                { id: 2, content: "ba" },
                { id: 3, content: "ha" },
                { id: 4, content: "wa" }
            ], correctAnswer: 1 },
            { id: 23, title: "Câu 23", content: "Chữ き được đọc là gì?", answers: [
                { id: 1, content: "ki" },
                { id: 2, content: "gi" },
                { id: 3, content: "shi" },
                { id: 4, content: "ji" }
            ], correctAnswer: 1 },
            { id: 24, title: "Câu 24", content: "Chữ し được đọc là gì?", answers: [
                { id: 1, content: "shi" },
                { id: 2, content: "ji" },
                { id: 3, content: "chi" },
                { id: 4, content: "tsu" }
            ], correctAnswer: 1 },
            { id: 25, title: "Câu 25", content: "Chữ ち được đọc là gì?", answers: [
                { id: 1, content: "chi" },
                { id: 2, content: "ji" },
                { id: 3, content: "tsu" },
                { id: 4, content: "zu" }
            ], correctAnswer: 1 },
            { id: 26, title: "Câu 26", content: "Chữ つ được đọc là gì?", answers: [
                { id: 1, content: "tsu" },
                { id: 2, content: "zu" },
                { id: 3, content: "chi" },
                { id: 4, content: "ji" }
            ], correctAnswer: 1 },
            { id: 27, title: "Câu 27", content: "Chữ に được đọc là gì?", answers: [
                { id: 1, content: "ni" },
                { id: 2, content: "na" },
                { id: 3, content: "nu" },
                { id: 4, content: "ne" }
            ], correctAnswer: 1 },
            { id: 28, title: "Câu 28", content: "Chữ ぬ được đọc là gì?", answers: [
                { id: 1, content: "nu" },
                { id: 2, content: "na" },
                { id: 3, content: "ni" },
                { id: 4, content: "ne" }
            ], correctAnswer: 1 },
            { id: 29, title: "Câu 29", content: "Chữ ね được đọc là gì?", answers: [
                { id: 1, content: "ne" },
                { id: 2, content: "na" },
                { id: 3, content: "ni" },
                { id: 4, content: "nu" }
            ], correctAnswer: 1 },
            { id: 30, title: "Câu 30", content: "Chữ の được đọc là gì?", answers: [
                { id: 1, content: "no" },
                { id: 2, content: "na" },
                { id: 3, content: "ni" },
                { id: 4, content: "nu" }
            ], correctAnswer: 1 }
        ];

        let timeRemaining = 900;
        let timerInterval;
        let userAnswers = {};
        let startTime = null;
        let elapsedTime = 0;

        function startTest(grade) {
            document.querySelector('.home.page-view').style.display = 'none';
            document.getElementById('startScreen').style.display = 'block';
            // Reset timer and answers
            timeRemaining = 900;
            userAnswers = {};
            updateTimerDisplay();
            // Lưu trạng thái vào sessionStorage
            sessionStorage.setItem('testScreen', 'start');
            sessionStorage.removeItem('testAnswers');
            sessionStorage.removeItem('testTimeRemaining');
            sessionStorage.removeItem('testStartTime');
        }

        function backToHome() {
            document.getElementById('startScreen').style.display = 'none';
            document.querySelector('.home.page-view').style.display = 'block';
        }

        function backToStartScreen() {
            clearInterval(timerInterval);
            document.getElementById('testInterface').style.display = 'none';
            document.getElementById('startScreen').style.display = 'block';
            // Show menu header again
            const headerPage = document.querySelector('.header-page');
            if (headerPage) {
                headerPage.style.display = 'block';
            }
            // Reset timer and answers
            timeRemaining = 900;
            userAnswers = {};
            updateTimerDisplay();
            // Lưu trạng thái vào sessionStorage
            sessionStorage.setItem('testScreen', 'start');
            sessionStorage.removeItem('testAnswers');
            sessionStorage.removeItem('testTimeRemaining');
            sessionStorage.removeItem('testStartTime');
        }

        function beginTest() {
            document.getElementById('startScreen').style.display = 'none';
            document.getElementById('testInterface').style.display = 'block';
            // Hide menu header
            const headerPage = document.querySelector('.header-page');
            if (headerPage) {
                headerPage.style.display = 'none';
            }
            displayAllQuestions();
            startTime = new Date();
            // Lưu trạng thái vào sessionStorage
            sessionStorage.setItem('testScreen', 'test');
            sessionStorage.setItem('testStartTime', startTime.getTime().toString());
            sessionStorage.setItem('testTimeRemaining', timeRemaining.toString());
            sessionStorage.setItem('testAnswers', JSON.stringify(userAnswers));
            startTimer();
        }

        function startTimer() {
            timerInterval = setInterval(function() {
                timeRemaining--;
                updateTimerDisplay();
                
                // Lưu thời gian còn lại vào sessionStorage mỗi 5 giây
                if (timeRemaining % 5 === 0 && sessionStorage.getItem('testScreen') === 'test') {
                    sessionStorage.setItem('testTimeRemaining', timeRemaining.toString());
                }
                
                if (timeRemaining <= 0) {
                    clearInterval(timerInterval);
                    submitTest();
                }
            }, 1000);
        }

        function updateTimerDisplay() {
            const minutes = Math.floor(timeRemaining / 60);
            const seconds = timeRemaining % 60;
            const display = `${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')}`;
            document.getElementById('timerDisplay').textContent = display;
        }

        function displayAllQuestions() {
            const questionsList = document.getElementById('questionsList');
            questionsList.innerHTML = '';
            
            questions.forEach((question, index) => {
                const questionDiv = document.createElement('div');
                questionDiv.className = 'question-item';
                
                let answersHTML = '';
                question.answers.forEach((answer) => {
                    const isSelected = userAnswers[question.id] == answer.id;
                    answersHTML += `
                        <div class="answer-item ${isSelected ? 'selected' : ''}" onclick="selectAnswer(${question.id}, ${answer.id}, this)">
                            <input type="radio" name="answer_${question.id}" id="answer_${question.id}_${answer.id}" value="${answer.id}" 
                                   ${isSelected ? 'checked' : ''} 
                                   onchange="selectAnswer(${question.id}, ${answer.id}, this.parentElement)">
                            <label for="answer_${question.id}_${answer.id}">${answer.content}</label>
                        </div>
                    `;
                });
                
                questionDiv.innerHTML = `
                    <div class="question-header">
                        <div class="question-number">${question.title}</div>
                    </div>
                    <div class="question-content">${question.content}</div>
                    <div class="answers-container">
                        ${answersHTML}
                    </div>
                `;
                
                questionsList.appendChild(questionDiv);
            });
        }

        // Biến flag để theo dõi trạng thái đã nộp bài
        let isTestSubmitted = false;

        function selectAnswer(questionId, answerId, element) {
            // Kiểm tra nếu đã nộp bài thì không cho chọn
            if (isTestSubmitted) {
                return;
            }

            userAnswers[questionId] = answerId;
            
            // Lưu vào sessionStorage
            if (sessionStorage.getItem('testScreen') === 'test') {
                sessionStorage.setItem('testAnswers', JSON.stringify(userAnswers));
            }
            
            // Update all answer items for this question
            const questionItem = element.closest('.question-item');
            const answerItems = questionItem.querySelectorAll('.answer-item');
            answerItems.forEach(item => {
                item.classList.remove('selected');
                const radio = item.querySelector('input[type="radio"]');
                if (radio && radio.value == answerId) {
                    item.classList.add('selected');
                    radio.checked = true;
                } else {
                    radio.checked = false;
                }
            });
        }

        function confirmSubmit() {
            document.getElementById('confirmModal').style.display = 'flex';
        }

        function closeConfirmModal() {
            document.getElementById('confirmModal').style.display = 'none';
        }

        function proceedSubmit() {
            closeConfirmModal();
            submitTest();
        }

        // Hàm chặn tất cả các câu trả lời
        function disableAllAnswers() {
            const answerItems = document.querySelectorAll('.answer-item');
            answerItems.forEach(item => {
                item.style.pointerEvents = 'none';
                item.style.cursor = 'not-allowed';
                item.style.opacity = '0.7';
            });
        }

        // Hàm mở lại tất cả các câu trả lời
        function enableAllAnswers() {
            const answerItems = document.querySelectorAll('.answer-item');
            answerItems.forEach(item => {
                item.style.pointerEvents = 'auto';
                item.style.cursor = 'pointer';
                item.style.opacity = '1';
            });
        }

        function submitTest() {
            clearInterval(timerInterval);
            
            // Đánh dấu đã nộp bài và chặn tất cả các câu trả lời
            isTestSubmitted = true;
            disableAllAnswers();
            
            // Calculate elapsed time
            if (startTime) {
                const endTime = new Date();
                elapsedTime = Math.floor((endTime - startTime) / 1000);
            }
            
            let score = 0;
            
            // Hiển thị màu sắc cho từng câu trả lời
            questions.forEach(q => {
                const userAnswerId = userAnswers[q.id];
                const correctAnswerId = q.correctAnswer;
                
                // Tìm tất cả các answer-item của câu hỏi này bằng cách tìm radio có name chứa question.id
                const answerRadios = document.querySelectorAll(`input[name="answer_${q.id}"]`);
                
                // Nếu học sinh đã chọn đáp án
                if (userAnswerId) {
                    answerRadios.forEach(radio => {
                        const answerId = parseInt(radio.value);
                        const answerItem = radio.closest('.answer-item');
                        
                        if (answerItem) {
                            // Đáp án đúng luôn có màu xanh
                            if (answerId === correctAnswerId) {
                                answerItem.classList.add('correct');
                            }
                            // Nếu học sinh chọn sai, đáp án sai sẽ có màu đỏ
                            else if (answerId === userAnswerId && answerId !== correctAnswerId) {
                                answerItem.classList.add('incorrect');
                            }
                        }
                    });
                }
                // Nếu học sinh không chọn đáp án nào - TẤT CẢ đều màu đỏ (không hiển thị đáp án đúng)
                else {
                    answerRadios.forEach(radio => {
                        const answerId = parseInt(radio.value);
                        const answerItem = radio.closest('.answer-item');
                        
                        if (answerItem) {
                            // Tất cả đáp án đều màu đỏ, không hiển thị đáp án đúng
                            answerItem.classList.add('incorrect');
                        }
                    });
                }
                
                // Tính điểm
                if (userAnswerId == correctAnswerId) {
                    score++;
                }
            });
            
            // Format time
            const minutes = Math.floor(elapsedTime / 60);
            const seconds = elapsedTime % 60;
            const timeStr = `${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')}`;
            
            // Calculate wrong answers
            const wrongAnswers = questions.length - score;
            
            // Calculate score (10 point scale)
            const scorePoint = (score / questions.length * 10).toFixed(1);
            
            // Display result modal
            document.getElementById('totalQuestions').textContent = questions.length;
            document.getElementById('correctAnswers').textContent = score;
            document.getElementById('wrongAnswers').textContent = wrongAnswers;
            document.getElementById('scoreDisplay').textContent = scorePoint;
            document.getElementById('maxScore').textContent = '10';
            document.getElementById('timeTaken').textContent = timeStr;
            document.getElementById('resultModal').style.display = 'flex';
            
            document.getElementById('userAnswers').value = JSON.stringify(userAnswers);
            
            // Save score to database
            saveTestResult(score, questions.length, scorePoint, elapsedTime, timeStr);
        }
        
        function saveTestResult(correctAnswers, totalQuestions, scorePoint, timeSeconds, timeStr) {
            $.ajax({
                type: "POST",
                url: "tiengnhat_KhoLuyenTap.aspx/SaveTestResult",
                data: JSON.stringify({ 
                    correctAnswers: correctAnswers,
                    totalQuestions: totalQuestions,
                    score: scorePoint,
                    timeSeconds: timeSeconds,
                    timeStr: timeStr,
                    answers: userAnswers
                }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    if (response.d === "OK") {
                        console.log("Điểm đã được lưu thành công!");
                    } else {
                        console.log("Lỗi lưu điểm: " + response.d);
                    }
                },
                error: function (xhr, status, error) {
                    console.log("Lỗi AJAX khi lưu điểm: " + error);
                }
            });
        }

        function closeResultModal() {
            document.getElementById('resultModal').style.display = 'none';
            // Replace submit button with retry and exit buttons
            const submitContainer = document.getElementById('submitContainer');
            submitContainer.innerHTML = `
                <button type="button" class="btn-retry" onclick="retryTest()">Làm lại</button>
                <button type="button" class="btn-exit" onclick="exitTest()">Thoát</button>
            `;
            // Sau khi nộp bài, không cần lưu state nữa (để khi F5 sẽ về trang chọn lớp)
            sessionStorage.removeItem('testScreen');
            sessionStorage.removeItem('testAnswers');
            sessionStorage.removeItem('testTimeRemaining');
            sessionStorage.removeItem('testStartTime');
        }

        function retryTest() {
            // Reset flag đã nộp bài
            isTestSubmitted = false;
            
            // Reset everything
            timeRemaining = 900;
            userAnswers = {};
            elapsedTime = 0;
            startTime = new Date();
            
            // Lưu trạng thái vào sessionStorage
            sessionStorage.setItem('testScreen', 'test');
            sessionStorage.setItem('testStartTime', startTime.getTime().toString());
            sessionStorage.setItem('testTimeRemaining', timeRemaining.toString());
            sessionStorage.setItem('testAnswers', JSON.stringify(userAnswers));
            
            // Mở lại tất cả các câu trả lời
            enableAllAnswers();
            
            // Clear all selected answers và các class màu sắc
            document.querySelectorAll('.answer-item').forEach(item => {
                item.classList.remove('selected', 'correct', 'incorrect');
                const radio = item.querySelector('input[type="radio"]');
                if (radio) {
                    radio.checked = false;
                }
            });
            
            // Reset submit button
            const submitContainer = document.getElementById('submitContainer');
            submitContainer.innerHTML = '<button type="button" class="btn-submit" id="btnSubmit" onclick="confirmSubmit()">Nộp bài</button>';
            
            // Restart timer
            clearInterval(timerInterval);
            updateTimerDisplay();
            startTimer();
            
            // Scroll to top
            window.scrollTo({ top: 0, behavior: 'smooth' });
        }

        function exitTest() {
            // Xóa sessionStorage
            sessionStorage.removeItem('testScreen');
            sessionStorage.removeItem('testAnswers');
            sessionStorage.removeItem('testTimeRemaining');
            sessionStorage.removeItem('testStartTime');
            // Redirect to home page
            window.location.href = '/app-thcs';
        }

        // Khôi phục trạng thái khi page load
        function restoreTestState() {
            const savedScreen = sessionStorage.getItem('testScreen');
            
            if (savedScreen === 'start') {
                // Khôi phục màn hình start
                document.querySelector('.home.page-view').style.display = 'none';
                document.getElementById('startScreen').style.display = 'block';
            } else if (savedScreen === 'test') {
                // Khôi phục màn hình test
                const savedAnswers = sessionStorage.getItem('testAnswers');
                const savedTimeRemaining = sessionStorage.getItem('testTimeRemaining');
                const savedStartTime = sessionStorage.getItem('testStartTime');
                
                if (savedAnswers) {
                    userAnswers = JSON.parse(savedAnswers);
                }
                if (savedTimeRemaining) {
                    timeRemaining = parseInt(savedTimeRemaining);
                }
                if (savedStartTime) {
                    const savedTime = parseInt(savedStartTime);
                    const now = new Date().getTime();
                    const elapsed = Math.floor((now - savedTime) / 1000);
                    // Tính lại thời gian còn lại dựa trên thời gian đã trôi qua
                    if (savedTimeRemaining) {
                        timeRemaining = Math.max(0, parseInt(savedTimeRemaining) - elapsed);
                    }
                    startTime = new Date(savedTime);
                }
                
                // Hiển thị màn hình test
                document.querySelector('.home.page-view').style.display = 'none';
                document.getElementById('startScreen').style.display = 'none';
                document.getElementById('testInterface').style.display = 'block';
                
                // Hide menu header
                const headerPage = document.querySelector('.header-page');
                if (headerPage) {
                    headerPage.style.display = 'none';
                }
                
                // Hiển thị câu hỏi và khôi phục đáp án đã chọn
                displayAllQuestions();
                
                // Cập nhật timer
                updateTimerDisplay();
                
                // Nếu còn thời gian thì tiếp tục đếm
                if (timeRemaining > 0) {
                    startTimer();
                } else {
                    // Hết thời gian thì tự động nộp bài
                    submitTest();
                }
            }
        }

        window.onload = function() {
            updateTimerDisplay();
            restoreTestState();
        };
    </script>
</asp:Content>
