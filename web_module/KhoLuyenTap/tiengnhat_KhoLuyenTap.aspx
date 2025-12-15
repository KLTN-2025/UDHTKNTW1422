<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageLandingPage.master" AutoEventWireup="false" %>

<%@ Register Src="~/web_usercontrol/global_LandingPage_Menu_1.ascx" TagPrefix="uc1" TagName="global_LandingPage_Menu_1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="Server">
    <link href="../../css/gameTieuHoc.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" xintegrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        * {
            box-sizing: border-box;
        }
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
        .home.page-view {
            min-height: 60vh;
            background: #f5f5f5 !important;
            position: relative;
        }
        .home.page-view::before,
        .home.page-view::after {
            display: none !important;
            content: none !important;
        }
        .block-body {
            background: transparent !important;
            position: relative;
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
            position: relative;
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
        /* Hide any decorative side panels or patterns */
        [class*="decorative"],
        [class*="side-panel"],
        [class*="pattern"],
        [id*="decorative"],
        [id*="side-panel"],
        [id*="pattern"] {
            display: none !important;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Menu" runat="Server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="TopWrapper" runat="Server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="Wrapper" runat="Server">
    <uc1:global_LandingPage_Menu_1 runat="server" ID="global_LandingPage_Menu_1" />
    <div class="home page-view">
        <div class="block-body">
            <div id="section-class">
                <a href="javascript:void(0)" onclick="startTest(6)" class="class-item color">
                    <img src="/images/images-nhatban.png" alt="Alternate Text" />
                    <div class="class-item__name green-text">Lớp 6</div>
                </a>
                <a href="javascript:void(0)" class="class-item color locked">
                    <img src="/images/images-nhatban.png" alt="Alternate Text" />
                    <div class="class-item__name green-text">Lớp 7</div>
                    <i class="fa fa-lock lock-icon" aria-hidden="true"></i>
                </a>
                <a href="javascript:void(0)" class="class-item color locked">
                    <img src="/images/images-nhatban.png" alt="Alternate Text" />
                    <div class="class-item__name green-text">Lớp 8</div>
                    <i class="fa fa-lock lock-icon" aria-hidden="true"></i>
                </a>
                <a href="javascript:void(0)" class="class-item color locked">
                    <img src="/images/images-nhatban.png" alt="Alternate Text" />
                    <div class="class-item__name green-text">Lớp 9</div>
                    <i class="fa fa-lock lock-icon" aria-hidden="true"></i>
                </a>
            </div>
        </div>
    </div>

    <!-- Test Interface (Hidden by default) -->
    <div id="testInterface" style="display: none;">
        <div class="quiz-container">
            <div class="quiz-header">
                <div>
                    <h2>Kho Luyện Tập - Bài Kiểm Tra Lớp 6</h2>
                </div>
                <div class="timer-container">
                    <div class="timer-circle" id="timerDisplay">15:00</div>
                </div>
            </div>

            <div class="questions-list" id="questionsList">
                <!-- All 30 questions will be displayed here -->
            </div>

            <div class="submit-container">
                <button type="button" class="btn-submit" id="btnSubmit" onclick="submitTest()">Nộp bài</button>
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
        body #testInterface {
            background: #f5f5f5 !important;
        }
        body #testInterface::before,
        body #testInterface::after {
            display: none !important;
        }
        .quiz-container {
            background: #fff;
            min-height: 100vh;
            padding: 20px;
            max-width: 1400px;
            margin: 0 auto;
            position: relative;
        }
        .quiz-container::before,
        .quiz-container::after {
            display: none !important;
        }
        .quiz-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px 40px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
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
            color: #667eea;
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
            border-color: #667eea;
            background: #e8edff;
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

        function startTest(grade) {
            document.querySelector('.home.page-view').style.display = 'none';
            document.getElementById('testInterface').style.display = 'block';
            displayAllQuestions();
            startTimer();
        }

        function startTimer() {
            timerInterval = setInterval(function() {
                timeRemaining--;
                updateTimerDisplay();
                
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

        function selectAnswer(questionId, answerId, element) {
            userAnswers[questionId] = answerId;
            
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

        function submitTest() {
            clearInterval(timerInterval);
            
            let score = 0;
            questions.forEach(q => {
                if (userAnswers[q.id] == q.correctAnswer) {
                    score++;
                }
            });
            
            alert(`Bạn đã hoàn thành bài kiểm tra!\nSố câu đúng: ${score}/${questions.length}\nĐiểm số: ${(score / questions.length * 10).toFixed(1)}/10`);
            
            document.getElementById('userAnswers').value = JSON.stringify(userAnswers);
        }

        window.onload = function() {
            updateTimerDisplay();
        };
    </script>
</asp:Content>
