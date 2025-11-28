<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BaiHoc.aspx.cs" Inherits="web_module_GameCacKhoi_Khoi_6_BaiHoc" %>

<%@ Register Src="~/web_usercontrol/global_Popup.ascx" TagPrefix="uc1" TagName="global_Popup" %>


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
    <script src="https://unpkg.com/wanakana@5.0.0/umd/wanakana.min.js"></script>
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
        <uc1:global_Popup runat="server" ID="global_Popup" />
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
                    <style>
                        @import url(https://fonts.googleapis.com/css?family=Poppins:100,100italic,200,200italic,300,300italic,regular,italic,500,500italic,600,600italic,700,700italic,800,800italic,900,900italic);

                        .mic-container {
                            text-align: center;
                            margin-top: 10px;
                        }

                        .btn-mic {
                            background: #f0f0f0;
                            color: #333;
                            border: 1px solid #ccc;
                            border-radius: 50%;
                            width: 40px;
                            height: 40px;
                            cursor: pointer;
                            font-size: 18px;
                            transition: all 0.3s;
                        }

                            .btn-mic:hover {
                                background-color: #ddd;
                            }

                            /* Class này sẽ được JS add vào khi đang thu âm */
                            .btn-mic.recording {
                                background-color: #ff4d4d; /* Màu đỏ báo hiệu đang thu */
                                color: white;
                                animation: pulse-red 1s infinite;
                            }

                        @keyframes pulse-red {
                            0% {
                                box-shadow: 0 0 0 0 rgba(255, 71, 87, 0.7);
                            }

                            70% {
                                box-shadow: 0 0 0 10px rgba(255, 71, 87, 0);
                            }

                            100% {
                                box-shadow: 0 0 0 0 rgba(255, 71, 87, 0);
                            }
                        }

                        /* Đúng: Viền xanh, đổ bóng xanh */
                        .card-correct {
                            border: 3px solid #2ecc71 !important; /* !important để đè lên style cũ */
                            box-shadow: 0 0 15px rgba(46, 204, 113, 0.6) !important;
                            transition: all 0.3s ease;
                        }

                        /* Sai: Viền đỏ, hiệu ứng rung lắc */
                        .card-incorrect {
                            border: 3px solid #e74c3c !important;
                            box-shadow: 0 0 15px rgba(231, 76, 60, 0.6) !important;
                            animation: shake 0.5s;
                        }

                        /* Giữ nguyên hiệu ứng rung lắc cũ */
                        @keyframes shake {
                            0% {
                                transform: translateX(0);
                            }

                            25% {
                                transform: translateX(-5px);
                            }

                            50% {
                                transform: translateX(5px);
                            }

                            75% {
                                transform: translateX(-5px);
                            }

                            100% {
                                transform: translateX(0);
                            }
                        }
                    </style>
                    <div class="list-vocabulary --item-<%= itemchucai %>">
                        <asp:Repeater runat="server" ID="rpVocabulary">
                            <ItemTemplate>
                                <div class="item-vocabulary-wrapper">
                                    <div class="item-vocabulary hvr-pulse" id="card-vocabulary-<%#Eval("nhanbiet_id") %>" onclick="playSound(this.getAttribute('data-url'))" data-url="<%#Eval("nhanbiet_mp3") %>">
                                        <div class="item-vocabulary__img">
                                            <img src="<%#Eval("nhanbiet_image") %>" />
                                        </div>
                                        <div class="item-vocabulary__txt"><%#Eval("nhanbiet_title") %></div>
                                    </div>
                                    <div class="mic-container">
                                        <button type="button" class="btn-mic" id="btn-mic-<%#Eval("nhanbiet_id") %>" onclick="toggleRecording(this, '<%#Eval("nhanbiet_id") %>')">
                                            <i class="fa fa-microphone"></i>
                                        </button>
                                        <%--<audio id="audio-playback-<%#Eval("nhanbiet_id") %>" controls style="display: none; width: 100%; margin-top: 5px;"></audio>--%>
                                        <input type="text" id="input-result-<%#Eval("nhanbiet_id") %>" class="input-result form-control" data-answer='<%#Eval("nhanbiet_nhom") %>' data-checked='false' readonly placeholder="Nhấn Mic để bắt đầu nói..."  />
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                    <%--<div class="list-vocabulary --item-<%= itemchucai %>">
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
                    </div>--%>
                    <script>
                        function normalizeAndConvertText(id, text) {
                            // 1. Chuẩn hóa cơ bản: trim và xóa dấu chấm câu tiếng Nhật
                            let cleanedText = text.trim().replace(/[。、]/g, "");

                            // 2. Chuyển ID về số để so sánh
                            const numericId = parseInt(id, 10);

                            // 3. Thực hiện chuyển đổi
                            if (numericId >= 47) {
                                // Nếu ID >= 47 (Katakana): Ép kết quả về Katakana
                                // Sau đó chuyển hết về chữ thường (lowercase) để so sánh nếu có Romaji
                                return wanakana.toKatakana(cleanedText).toLowerCase();
                            } else {
                                // Nếu ID < 47 (Hiragana): Ép kết quả về Hiragana
                                return wanakana.toHiragana(cleanedText).toLowerCase();
                            }
                        }

                        window.itemRecognitions = {};
                        const audioCorrect = new Audio('/mp3/audio_right.mp3');
                        const audioWrong = new Audio('/mp3/audio_false.mp3');

                        const SpeechRecognition = window.SpeechRecognition || window.webkitSpeechRecognition;

                        async function startRecognition(btn, id, icon) {
                            if (!SpeechRecognition) {
                                alert("Trình duyệt không hỗ trợ. Hãy dùng Chrome/Edge.");
                                return;
                            }

                            try {
                                const recognition = new SpeechRecognition();

                                recognition.lang = 'ja-JP';
                                recognition.interimResults = true;
                                recognition.continuous = false;

                                window.itemRecognitions[id] = recognition;

                                // 1. Tìm Input (để lấy đáp án và giá trị text)
                                const resultInput = document.getElementById('input-result-' + id);

                                // 2. Tìm cái Card (để đổi màu border) -> TARGET MỚI CỦA MÀY ĐÂY
                                const targetCard = document.getElementById('card-vocabulary-' + id);

                                // Reset trạng thái cũ
                                if (targetCard) {
                                    targetCard.classList.remove('card-correct', 'card-incorrect');
                                }
                                if (resultInput) resultInput.value = '';

                                //recognition.onresult = (event) => {
                                //    let finalTranscript = '';

                                //    for (let i = event.resultIndex; i < event.results.length; ++i) {
                                //        if (event.results[i].isFinal) {
                                //            finalTranscript += event.results[i][0].transcript;
                                //        }
                                //    }

                                //    // Khi có kết quả cuối cùng
                                //    if (finalTranscript && resultInput && targetCard) {
                                //        // Gán giá trị vào input ẩn (để debug hoặc lưu sau này nếu cần)
                                //        resultInput.value = finalTranscript;

                                //        // Lấy đáp án từ input ẩn
                                //        let correctAnswer = resultInput.getAttribute('data-answer');

                                //        // Chuẩn hóa chuỗi
                                //        let userText = finalTranscript.trim().toLowerCase().replace(/[。、]/g, "");
                                //        let dbText = correctAnswer.trim().toLowerCase().replace(/[。、]/g, "");

                                //        console.log(`User: ${userText} | DB: ${dbText}`);

                                //        // --- SO SÁNH VÀ ĐỔI MÀU CARD ---
                                //        if (userText === dbText) {
                                //            // ĐÚNG
                                //            targetCard.classList.add('card-correct');
                                //            targetCard.classList.remove('card-incorrect');

                                //            audioCorrect.currentTime = 0;
                                //            audioCorrect.play().catch(e => { });
                                //        } else {
                                //            // SAI
                                //            targetCard.classList.add('card-incorrect');
                                //            targetCard.classList.remove('card-correct');

                                //            audioWrong.currentTime = 0;
                                //            audioWrong.play().catch(e => { });
                                //        }
                                //    }
                                //};

                                recognition.onresult = (event) => {
                                    let finalTranscript = '';
                                    let interimTranscript = '';

                                    for (let i = event.resultIndex; i < event.results.length; ++i) {
                                        const transcript = event.results[i][0].transcript;
                                        if (event.results[i].isFinal) {
                                            finalTranscript += transcript;
                                        } else {
                                            interimTranscript += transcript;
                                        }
                                    }

                                    // Gán kết quả tạm thời
                                    if (resultInput) {
                                        resultInput.value = finalTranscript || interimTranscript;
                                    }

                                    // Khi có kết quả cuối cùng
                                    if (finalTranscript && resultInput && targetCard) {
                                        // 1. Lấy và chuẩn hóa đáp án người dùng (bao gồm logic Katakana/Hiragana)
                                        const convertedUserText = normalizeAndConvertText(id, finalTranscript);

                                        // 2. Lấy và chuẩn hóa đáp án DB
                                        let correctAnswer = resultInput.getAttribute('data-answer');
                                        const dbText = normalizeAndConvertText(id, correctAnswer);

                                        // 3. So sánh
                                        let isCorrect = (convertedUserText === dbText);

                                        console.log(`User (converted): ${convertedUserText} | DB (normalized): ${dbText}`);

                                        // --- LOGIC ĐỔI MÀU & AUDIO ---
                                        if (isCorrect) {
                                            targetCard.classList.add('card-correct');
                                            targetCard.classList.remove('card-incorrect');
                                            audioCorrect.currentTime = 0;
                                            audioCorrect.play().catch(e => { });
                                        } else {
                                            targetCard.classList.add('card-incorrect');
                                            targetCard.classList.remove('card-correct');
                                            audioWrong.currentTime = 0;
                                            audioWrong.play().catch(e => { });
                                        }

                                        // --- LOGIC TÍNH ĐIỂM (Bắt buộc phải nằm trong onresult/onend) ---
                                        //const isQuestionChecked = targetCard.getAttribute('data-checked');

                                        //if (isQuestionChecked === 'false') {
                                        //    // Tính tổng câu (chỉ tính lần đầu tiên)
                                        //    window.totalPronunciationQuestions++;

                                        //    // Tính câu đúng
                                        //    if (isCorrect) {
                                        //        window.correctPronunciationAnswers++;
                                        //    }

                                        //    // Đánh dấu đã tính điểm câu này
                                        //    targetCard.setAttribute('data-checked', 'true');
                                        //}
                                    }
                                };

                                recognition.onend = () => {
                                    stopRecognition(btn, id, icon);
                                };

                                recognition.onerror = (event) => {
                                    console.error("Lỗi:", event.error);
                                    stopRecognition(btn, id, icon);
                                };

                                recognition.start();

                                // UI Updates cho nút Mic
                                btn.classList.add('recording');
                                if (icon) {
                                    icon.classList.remove('fa-microphone');
                                    icon.classList.add('fa-stop');
                                }

                            } catch (err) {
                                console.error("Lỗi Start:", err);
                            }
                        }

                        // Hàm dừng nhận dạng
                        function stopRecognition(btn, id, icon) {
                            const recognition = window.itemRecognitions[id];

                            if (recognition) {
                                // 1. Dừng nhận dạng
                                recognition.stop();

                                // 2. Xóa đối tượng recognition khỏi bộ nhớ toàn cục
                                delete window.itemRecognitions[id];
                                console.log(`Recognition Stopped and Cleaned up for ID: ${id}`);
                            } else {
                                console.warn(`Attempted to stop non-existent recognition for ID: ${id}`);
                            }

                            // Luôn reset giao diện về trạng thái ban đầu
                            btn.classList.remove('recording');
                            if (icon) {
                                icon.classList.remove('fa-stop');
                                icon.classList.add('fa-microphone');
                            }
                        }

                        async function toggleRecording(btn, id) {
                            const uniqueId = String(id).trim();

                            if (!uniqueId || uniqueId === '0') {
                                console.error("ID không hợp lệ:", id);
                                return;
                            }

                            let icon = btn.querySelector('i');

                            if (btn.classList.contains('recording')) {
                                // Lần 2: Dừng
                                stopRecognition(btn, uniqueId, icon);
                            } else {
                                // Lần 1: Bắt đầu
                                startRecognition(btn, uniqueId, icon);
                            }
                        }
                    </script>
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
        <%--game nói--%>
        <%--        <style>
            @import url(https://fonts.googleapis.com/css?family=Poppins:100,100italic,200,200italic,300,300italic,regular,italic,500,500italic,600,600italic,700,700italic,800,800italic,900,900italic);

            :root {
                --primary-color: #356aff;
                --bg-color: #fff;
                --text-color: #000;
                --light-text-color: #a5a5a5;
                --body-bg-color: #f5f5f5;
            }




            .speech-to-text {
                background-color: var(--bg-color);
            }

                .speech-to-text .heading {
                    font-size: 25px;
                    font-weight: 500;
                    margin-bottom: 10px;
                }

                .speech-to-text .options select {
                    width: 100%;
                    padding: 10px;
                    border: 1px solid var(--light-text-color);
                    border-radius: 5px;
                    outline: none;
                }

                .speech-to-text .options div:not(:last-child) select {
                    margin-bottom: 20px;
                }

                .speech-to-text .options p {
                    font-size: 14px;
                    font-weight: 600;
                    margin-bottom: 5px;
                    color: var(--light-text-color);
                }

                .speech-to-text .line {
                    position: relative;
                    width: 100%;
                    height: 1px;
                    background-color: var(--light-text-color);
                    opacity: 0.5;
                    margin: 30px 0;
                }

                .speech-to-text .btn {
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    gap: 10px;
                    margin-bottom: 20px;
                    height: 60px;
                    padding: 20px;
                    width: 100%;
                    outline: none;
                    border: none;
                    border-radius: 5px;
                    font-size: 20px;
                    font-weight: 500;
                    cursor: pointer;
                    color: #fff;
                    background-color: var(--primary-color);
                }

                    .speech-to-text .btn ion-icon {
                        font-size: 30px;
                    }

                    .speech-to-text .btn:disabled {
                        background-color: var(--light-text-color);
                        cursor: not-allowed;
                    }

                .speech-to-text .record img {
                    width: 30px;
                    height: 30px;
                    display: none;
                }

                .speech-to-text .record.recording img {
                    display: block;
                }

                .speech-to-text .record.recording ion-icon {
                    display: none;
                }

                .speech-to-text .result {
                    width: 100%;
                    min-height: 200px;
                    padding: 10px;
                    border: 1px solid var(--light-text-color);
                    border-radius: 5px;
                    font-size: 18px;
                    font-weight: 500;
                    margin-bottom: 20px;
                    color: var(--text-color);
                }

                    .speech-to-text .result p {
                        display: inline;
                        margin-left: 3px;
                        color: var(--light-text-color);
                    }

                .speech-to-text .buttons {
                    display: flex;
                    gap: 20px;
                }
        </style>
        <div class="frame-game --math">
            <div class="container">
                <div class="frame-game-new --style-1">
                    <div class="title-page --style-3 _mt-34">
                        <span class="title-page__text">3/Nói</span>
                    </div>
                    <div class="speech-to-text">
                        <p class="heading">Chuyển âm thanh thành chữ</p>
                        <div class="row">
                            <div class="col-4">
                                <div class="options">
                                    <div class="anguage">
                                        <p>Chọn ngôn ngữ</p>
                                        <select name="input-language" id="language"></select>
                                    </div>
                                </div>
                                <div class="line"></div>
                                <button type="button" class="btn record">
                                    <div class="icon">
                                        <ion-icon name="mic-outline"></ion-icon>
                                        <img src="bars.svg" alt="" />
                                    </div>
                                    <p>Bắt đầu ghi âm</p>
                                </button>
                            </div>
                            <div class="col-8">
                                <p class="heading">Kết quả :</p>
                                <div
                                    class="result"
                                    spellcheck="false"
                                    placeholder="Text will be shown here">
                                    <p class="interim"></p>
                                </div>
                                <div class="buttons">
                                    <button type="button" class="btn clear">
                                        <ion-icon name="trash-outline"></ion-icon>
                                        <p>Clear</p>
                                    </button>
                                    <button class="btn download" disabled>
                                        <ion-icon name="cloud-download-outline"></ion-icon>
                                        <p>Download</p>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- IONICONS -->
            <script
                type="module"
                src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
            <script
                nomodule
                src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>

            <!-- LANGUAGES -->
            <script type="text/javascript">
                const languages = [
                    {
                        no: "16",
                        name: "English",
                        native: "English",
                        code: "en",
                    },
                    {
                        no: "33",
                        name: "Japanese",
                        native: "日本語",
                        code: "ja",
                    },
                    {
                        no: "56",
                        name: "Vietnamese",
                        native: "Tiếng Việt",
                        code: "vi",
                    },
                ];
            </script>

            <!-- SCRIPT -->
            <script type="text/javascript">
                const recordBtn = document.querySelector(".record"),
                    result = document.querySelector(".result"),
                    downloadBtn = document.querySelector(".download"),
                    inputLanguage = document.querySelector("#language"),
                    clearBtn = document.querySelector(".clear");

                let SpeechRecognition =
                    window.SpeechRecognition || window.webkitSpeechRecognition,
                    recognition,
                    recording = false;

                function populateLanguages() {
                    languages.forEach((lang) => {
                        const option = document.createElement("option");
                        option.value = lang.code;
                        option.innerHTML = lang.name;
                        inputLanguage.appendChild(option);
                    });
                }

                populateLanguages();

                function speechToText() {
                    try {
                        recognition = new SpeechRecognition();
                        recognition.lang = inputLanguage.value;
                        recognition.interimResults = true;
                        recordBtn.classList.add("recording");
                        recordBtn.querySelector("p").innerHTML = "Listening...";
                        recognition.start();
                        recognition.onresult = (event) => {
                            const speechResult = event.results[0][0].transcript;
                            //detect when intrim results
                            if (event.results[0].isFinal) {
                                result.innerHTML += " " + speechResult;
                                result.querySelector("p").remove();
                            } else {
                                //creative p with class interim if not already there
                                if (!document.querySelector(".interim")) {
                                    const interim = document.createElement("p");
                                    interim.classList.add("interim");
                                    result.appendChild(interim);
                                }
                                //update the interim p with the speech result
                                document.querySelector(".interim").innerHTML = " " + speechResult;
                            }
                            downloadBtn.disabled = false;
                        };
                        recognition.onspeechend = () => {
                            speechToText();
                        };
                        recognition.onerror = (event) => {
                            stopRecording();
                            if (event.error === "no-speech") {
                                alert("No speech was detected. Stopping...");
                            } else if (event.error === "audio-capture") {
                                alert(
                                    "No microphone was found. Ensure that a microphone is installed."
                                );
                            } else if (event.error === "not-allowed") {
                                alert("Permission to use microphone is blocked.");
                            } else if (event.error === "aborted") {
                                alert("Listening Stopped.");
                            } else {
                                alert("Error occurred in recognition: " + event.error);
                            }
                        };
                    } catch (error) {
                        recording = false;

                        console.log(error);
                    }
                }

                recordBtn.addEventListener("click", () => {
                    if (!recording) {
                        speechToText();
                        recording = true;
                    } else {
                        stopRecording();
                    }
                });

                function stopRecording() {
                    recognition.stop();
                    recordBtn.querySelector("p").innerHTML = "Start Listening";
                    recordBtn.classList.remove("recording");
                    recording = false;
                }

                function download() {
                    const text = result.innerText;
                    const filename = "speech.txt";

                    const element = document.createElement("a");
                    element.setAttribute(
                        "href",
                        "data:text/plain;charset=utf-8," + encodeURIComponent(text)
                    );
                    element.setAttribute("download", filename);
                    element.style.display = "none";
                    document.body.appendChild(element);
                    element.click();
                    document.body.removeChild(element);
                }

                downloadBtn.addEventListener("click", download);

                clearBtn.addEventListener("click", () => {
                    result.innerHTML = "";
                    downloadBtn.disabled = true;
                });
            </script>
        </div>
        --%>
        <%--game trắc nghiệm--%>
        <div class="frame-game --math">
            <div class="container">
                <div class="frame-game-new --style-1">
                    <div class="title-page --style-3 _mt-34">
                        <%--<asp:Repeater ID="rpnoidungtracnghiem" runat="server">
                            <ItemTemplate>
                                <%#Eval("cauhoi_content") %>
                            </ItemTemplate>
                        </asp:Repeater>--%>
                        <span class="title-page__text">4/Trắc nghiệm</span>
                    </div>
                    <div class="">
                        <div class="form-mutichoise ">
                            <asp:Repeater ID="rpCauTraLoi" runat="server" OnItemDataBound="rpCauTraLoi_ItemDataBound">
                                <ItemTemplate>                                    
                                    <div class="game-header">
                                        <div class="game-header__title text-center">
                                            <%#Eval("cauhoi_titlecauhoi") %>
                                            <%--Nghe âm thanh để tìm chữ thích hợp ?--%>
                                            <a class="btn-sound-question" href="javascript:void(0)" onclick="playSound(this.getAttribute('data-url'))" data-url="<%#Eval("cauhoi_mp3") %>">
                                                <img src="/images/btn-game-sound.png" alt="Alternate Text" />
                                            </a>
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
    <%--var caudungtracnghiem = 0, tongtracnghiem = 0;
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
                    caudungtracnghiem++;
                } else {
                    icSai.style.display = 'block';
                    icCheck.style.display = "none";
                }
            }

        });
    }--%>
    //var caudungnoi = 0, tongnoi = 4;
    //function btnSubmitNoi(id, finalTranscript) {
    //    // 1. Tìm các phần tử cần thiết
    //    const resultInput = document.getElementById('input-result-' + id);
    //    const targetCard = document.getElementById('card-vocabulary-' + id);

    //    // Đảm bảo không bị lỗi nếu phần tử không tồn tại
    //    if (!resultInput || !targetCard || !finalTranscript) return;

    //    // 2. Lấy đáp án và chuẩn hóa chuỗi
    //    let correctAnswer = resultInput.getAttribute('data-answer');

    //    // Chuẩn hóa chuỗi (Bỏ dấu chấm câu, chuyển về chữ thường)
    //    let userText = finalTranscript.trim().toLowerCase().replace(/[。、]/g, "");
    //    let dbText = correctAnswer.trim().toLowerCase().replace(/[。、]/g, "");

    //    // Khai báo biến đếm
    //    let isCorrect = (userText === dbText);

    //    // 3. Xử lý logic ĐÚNG/SAI
    //    if (isCorrect) {
    //        // ĐÚNG
    //        targetCard.classList.add('card-correct');
    //        targetCard.classList.remove('card-incorrect');

    //        audioCorrect.currentTime = 0;
    //        audioCorrect.play().catch(e => { });

    //    } else {
    //        // SAI
    //        targetCard.classList.add('card-incorrect');
    //        targetCard.classList.remove('card-correct');

    //        audioWrong.currentTime = 0;
    //        audioWrong.play().catch(e => { });
    //    }

    //    // 4. Cập nhật Điểm số TOÀN CỤC

    //    // *QUAN TRỌNG NHẤT*: Dùng thuộc tính data-checked để đảm bảo mỗi câu chỉ được tính điểm MỘT LẦN
    //    const isQuestionChecked = targetCard.getAttribute('data-checked');

    //    if (isQuestionChecked === 'false') {
    //        // Tính câu đúng
    //        if (isCorrect) {
    //            caudungnoi++;
    //        }

    //        // Đánh dấu đã tính điểm câu này
    //        targetCard.setAttribute('data-checked', 'true');
    //    }
    //}
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
                sao = '3';
            }
            else if (diem > 5) {
                sao = '2';
                document.getElementById("btnNextLesson").style.pointerEvents = "auto";
                document.getElementById("btnNextLesson").style.opacity = "1";
            }
            else {
                sao = '1';
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
