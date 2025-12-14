<%@ Page Title="" Language="C#" MasterPageFile="~/Home_MasterPage.master" AutoEventWireup="true" CodeFile="BaiKiemTra_ChiTiet.aspx.cs" Inherits="web_module_KhoLuyenTap_BaiKiemTra_ChiTiet" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Header" Runat="Server">
    <style>
        .quiz-container {
            background: #fff;
            min-height: 100vh;
            padding: 20px;
        }
        .quiz-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 30px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border-radius: 10px;
            margin-bottom: 20px;
        }
        .timer-container {
            display: flex;
            align-items: center;
            gap: 10px;
        }
        .timer-circle {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.2);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 18px;
            font-weight: bold;
            border: 3px solid white;
        }
        .question-container {
            background: #f8f9fa;
            border-radius: 10px;
            padding: 30px;
            margin-bottom: 20px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        .question-title {
            font-size: 20px;
            font-weight: bold;
            color: #333;
            margin-bottom: 20px;
        }
        .question-content {
            font-size: 24px;
            color: #555;
            margin-bottom: 25px;
            text-align: center;
        }
        .answers-container {
            display: flex;
            flex-direction: column;
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
        .navigation-buttons {
            display: flex;
            justify-content: space-between;
            margin-top: 30px;
        }
        .btn-nav {
            padding: 12px 30px;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
            transition: all 0.3s;
        }
        .btn-prev {
            background: #6c757d;
            color: white;
        }
        .btn-prev:hover {
            background: #5a6268;
        }
        .btn-next {
            background: #667eea;
            color: white;
        }
        .btn-next:hover {
            background: #5568d3;
        }
        .btn-submit {
            background: #28a745;
            color: white;
        }
        .btn-submit:hover {
            background: #218838;
        }
        .question-number {
            font-size: 14px;
            color: #666;
            margin-bottom: 10px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Menu" Runat="Server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="TopWrapper" Runat="Server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="Wrapper" Runat="Server">
    <div class="quiz-container">
        <div class="quiz-header">
            <div>
                <h2 id="testTitle" runat="server">Bài Kiểm Tra</h2>
            </div>
            <div class="timer-container">
                <div class="timer-circle" id="timerDisplay">15:00</div>
            </div>
        </div>

        <div class="question-container">
            <div class="question-number" id="questionNumber">Câu 1 / 10</div>
            <div class="question-title" id="questionTitle" runat="server">Câu hỏi</div>
            <div class="question-content" id="questionContent" runat="server"></div>
            
            <div class="answers-container" id="answersContainer" runat="server">
                <!-- Answers will be generated here -->
            </div>

            <div class="navigation-buttons">
                <button type="button" class="btn-nav btn-prev" id="btnPrev" onclick="previousQuestion()" style="display:none;">Câu trước</button>
                <button type="button" class="btn-nav btn-next" id="btnNext" onclick="nextQuestion()">Câu sau</button>
                <button type="button" class="btn-nav btn-submit" id="btnSubmit" onclick="submitTest()" style="display:none;">Nộp bài</button>
            </div>
        </div>
    </div>

    <input type="hidden" id="currentQuestionIndex" value="0" />
    <input type="hidden" id="totalQuestions" runat="server" value="0" />
    <input type="hidden" id="timeLimit" runat="server" value="900" />
    <input type="hidden" id="testIdHidden" runat="server" value="0" />
    <input type="hidden" id="userAnswers" value="" />
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="BottomWrapper" Runat="Server">
</asp:Content>

<asp:Content ID="Content6" ContentPlaceHolderID="Footer" Runat="Server">
    <script>
        let timeRemaining = parseInt(document.getElementById('<%=timeLimit.ClientID%>').value) || 900; // 15 minutes default
        let timerInterval;
        let userAnswers = {}; // Store answers: {questionId: answerId}
        let questions = []; // Will be populated from server
        let currentIndex = 0;

        // Initialize timer
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

        // Load questions from server (will be populated by code-behind)
        function loadQuestions(questionsData) {
            questions = questionsData;
            currentIndex = 0;
            displayQuestion(0);
            updateNavigationButtons();
            startTimer();
        }

        function displayQuestion(index) {
            if (index < 0 || index >= questions.length) return;
            
            currentIndex = index;
            const question = questions[index];
            
            // Update question number
            document.getElementById('questionNumber').textContent = `Câu ${index + 1} / ${questions.length}`;
            
            // Update question content
            document.getElementById('<%=questionContent.ClientID%>').innerHTML = question.content;
            document.getElementById('<%=questionTitle.ClientID%>').textContent = question.title || 'Câu hỏi';
            
            // Clear and populate answers
            const answersContainer = document.getElementById('<%=answersContainer.ClientID%>');
            answersContainer.innerHTML = '';
            
            question.answers.forEach((answer, idx) => {
                const answerDiv = document.createElement('div');
                answerDiv.className = 'answer-item';
                if (userAnswers[question.id] == answer.id) {
                    answerDiv.classList.add('selected');
                }
                
                answerDiv.innerHTML = `
                    <input type="radio" name="answer_${question.id}" id="answer_${answer.id}" value="${answer.id}" 
                           ${userAnswers[question.id] == answer.id ? 'checked' : ''} 
                           onchange="selectAnswer(${question.id}, ${answer.id})">
                    <label for="answer_${answer.id}">${answer.content}</label>
                `;
                
                answerDiv.onclick = function() {
                    document.getElementById(`answer_${answer.id}`).checked = true;
                    selectAnswer(question.id, answer.id);
                };
                
                answersContainer.appendChild(answerDiv);
            });
            
            document.getElementById('currentQuestionIndex').value = index;
        }

        function selectAnswer(questionId, answerId) {
            userAnswers[questionId] = answerId;
            
            // Update visual selection
            const answerItems = document.querySelectorAll('.answer-item');
            answerItems.forEach(item => {
                item.classList.remove('selected');
                const radio = item.querySelector('input[type="radio"]');
                if (radio && radio.value == answerId) {
                    item.classList.add('selected');
                }
            });
        }

        function previousQuestion() {
            if (currentIndex > 0) {
                displayQuestion(currentIndex - 1);
                updateNavigationButtons();
            }
        }

        function nextQuestion() {
            if (currentIndex < questions.length - 1) {
                displayQuestion(currentIndex + 1);
                updateNavigationButtons();
            }
        }

        function updateNavigationButtons() {
            const btnPrev = document.getElementById('btnPrev');
            const btnNext = document.getElementById('btnNext');
            const btnSubmit = document.getElementById('btnSubmit');
            
            btnPrev.style.display = currentIndex > 0 ? 'block' : 'none';
            
            if (currentIndex === questions.length - 1) {
                btnNext.style.display = 'none';
                btnSubmit.style.display = 'block';
            } else {
                btnNext.style.display = 'block';
                btnSubmit.style.display = 'none';
            }
        }

        function submitTest() {
            clearInterval(timerInterval);
            
            // Prepare data to send to server
            const submitData = {
                testId: document.getElementById('<%=testIdHidden.ClientID%>').value,
                answers: userAnswers,
                timeSpent: parseInt(document.getElementById('<%=timeLimit.ClientID%>').value) - timeRemaining
            };
            
            // Store answers in hidden field
            document.getElementById('userAnswers').value = JSON.stringify(userAnswers);
            
            // Send to server via hidden button or AJAX
            document.getElementById('<%=btnSubmitTest.ClientID%>').click();
        }

        // Initialize on page load
        window.onload = function() {
            updateTimerDisplay();
        };
    </script>
    
    <asp:Button ID="btnSubmitTest" runat="server" OnClick="btnSubmitTest_Click" Style="display:none;" />
</asp:Content>

