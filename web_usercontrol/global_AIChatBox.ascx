<%@ Control Language="C#" AutoEventWireup="true" CodeFile="global_AIChatBox.ascx.cs" Inherits="web_usercontrol_global_AIChatBox" %>

<div id="aiChatBox" class="ai-chatbox minimized">
    <div id="chatBoxHeader" class="chatbox-header">
        <div class="chatbox-header__info" onclick="toggleChatBox()">
            <i class="bi bi-messenger"></i>
            <span>AI Assistant</span>
        </div>
        <div class="chatbox-header__actions">
            <i class="bi bi-dash" id="minimizeIcon" style="display: none;" onclick="event.stopPropagation(); minimizeChatBox();"></i>
            <i class="bi bi-x" id="closeIcon" onclick="event.stopPropagation(); minimizeChatBox();"></i>
        </div>
    </div>
    <div id="chatBoxBody" class="chatbox-body">
        <div id="chatMessages" class="chat-messages">
            <div class="message bot-message">
                <div class="message-avatar">
                    <i class="bi bi-messenger"></i>
                </div>
                <div class="message-content">
                    <p>Xin chào! Tôi là AI Assistant của KoiGo. Bạn cần giúp gì?</p>
                    <div class="quick-reply-buttons">
                        <button class="quick-reply-btn" onclick="sendQuickReply('Học tiếng Nhật')">Học tiếng Nhật</button>
                        <button class="quick-reply-btn" onclick="sendQuickReply('Hướng dẫn sử dụng')">Hướng dẫn sử dụng</button>
                        <button class="quick-reply-btn" onclick="sendQuickReply('Xem tiến độ học tập')">Xem tiến độ học tập</button>
                        <button class="quick-reply-btn" onclick="sendQuickReply('Câu hỏi về bài học')">Câu hỏi về bài học</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="chatbox-input">
            <input type="text" id="chatInput" placeholder="Nhập câu hỏi của bạn..." autocomplete="off" onkeypress="if(event.key === 'Enter') { event.preventDefault(); sendMessage(); }" />
            <button type="button" id="sendBtn" onclick="event.preventDefault(); sendMessage();">
                <i class="bi bi-send-fill"></i>
            </button>
        </div>
    </div>
</div>

<style>
    .ai-chatbox {
        position: fixed;
        bottom: 20px;
        right: 20px;
        width: 380px;
        max-width: calc(100vw - 40px);
        height: 500px;
        background: #fff;
        border-radius: 16px;
        box-shadow: 0 8px 32px rgba(0, 0, 0, 0.15);
        display: flex;
        flex-direction: column;
        z-index: 9999;
        transition: all 0.3s ease;
        font-family: Calibri, 'Calibri', sans-serif;
    }

    .ai-chatbox.minimized {
        width: 60px;
        height: 60px;
        border-radius: 50%;
        padding: 0;
    }

    .ai-chatbox.minimized .chatbox-body {
        display: none;
    }

    .ai-chatbox.minimized .chatbox-header {
        width: 100%;
        height: 100%;
        border-radius: 50%;
        padding: 0;
        justify-content: center;
        align-items: center;
        background: linear-gradient(135deg, #b51a1a 0%, #b51a1a 100%);
    }

    .ai-chatbox.minimized .chatbox-header__info {
        justify-content: center;
        gap: 0;
    }

    .ai-chatbox.minimized .chatbox-header__info span {
        display: none;
    }

    .ai-chatbox.minimized .chatbox-header__info i {
        font-size: 28px;
        margin: 0;
    }

    .ai-chatbox.minimized .chatbox-header__actions {
        display: none;
    }

    .chatbox-header {
        background: linear-gradient(135deg, #b51a1a 0%, #b51a1a 100%);
        color: white;
        padding: 16px 20px;
        border-radius: 16px 16px 0 0;
        display: flex;
        justify-content: space-between;
        align-items: center;
        cursor: pointer;
        user-select: none;
    }

    .chatbox-header__info {
        display: flex;
        align-items: center;
        gap: 10px;
        font-weight: 600;
        font-size: 16px;
        font-family: Calibri, 'Calibri', sans-serif;
    }

    .chatbox-header__info i {
        font-size: 20px;
    }

    .chatbox-header__actions {
        display: flex;
        gap: 12px;
        font-size: 18px;
    }

    .chatbox-header__actions i {
        cursor: pointer;
        transition: transform 0.2s;
    }

    .chatbox-header__actions i:hover {
        transform: scale(1.2);
    }

    .chatbox-body {
        flex: 1;
        display: flex;
        flex-direction: column;
        overflow: hidden;
    }

    .chat-messages {
        flex: 1;
        overflow-y: auto;
        padding: 20px;
        background: #f8f9fa;
    }

    .chat-messages::-webkit-scrollbar {
        width: 6px;
    }

    .chat-messages::-webkit-scrollbar-track {
        background: #f1f1f1;
    }

    .chat-messages::-webkit-scrollbar-thumb {
        background: #888;
        border-radius: 3px;
    }

    .message {
        display: flex;
        gap: 12px;
        margin-bottom: 16px;
        animation: fadeIn 0.3s ease;
    }

    @keyframes fadeIn {
        from {
            opacity: 0;
            transform: translateY(10px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }

    .message-avatar {
        width: 36px;
        height: 36px;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        flex-shrink: 0;
        font-size: 18px;
    }

    .bot-message .message-avatar {
        background: linear-gradient(135deg, #b51a1a 0%, #b51a1a 100%);
        color: white;
    }

    .user-message {
        flex-direction: row-reverse;
    }

    .user-message .message-avatar {
        background: #e3f2fd;
        color: #1976d2;
    }

    .message-content {
        flex: 1;
        padding: 12px 16px;
        border-radius: 12px;
        max-width: 80%;
        word-wrap: break-word;
        font-family: Calibri, 'Calibri', sans-serif;
    }

    .bot-message .message-content {
        background: white;
        border: 1px solid #e0e0e0;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
    }

    .user-message .message-content {
        background: linear-gradient(135deg,#b51a1a 0%, #b51a1a 100%);
        color: white;
    }

    .message-content p {
        margin: 0 0 8px 0;
        line-height: 1.5;
    }

    .message-content ul {
        margin: 8px 0;
        padding-left: 20px;
    }

    .message-content li {
        margin-bottom: 4px;
    }

    .quick-reply-buttons {
        display: flex;
        flex-direction: column;
        gap: 8px;
        margin-top: 12px;
    }

    .quick-reply-btn {
        background: white;
        border: 1.5px solid #b51a1a;
        color: #b51a1a;
        padding: 10px 16px;
        border-radius: 20px;
        font-size: 14px;
        font-weight: 500;
        cursor: pointer;
        transition: all 0.2s ease;
        text-align: left;
        font-family: Calibri, 'Calibri', sans-serif;
    }

    .quick-reply-btn:hover {
        background: #b51a1a;
        color: white;
        transform: translateY(-1px);
        box-shadow: 0 2px 4px rgba(181, 26, 26, 0.2);
    }

    .quick-reply-btn:active {
        transform: translateY(0);
    }

    .chatbox-input {
        display: flex;
        gap: 8px;
        padding: 16px;
        background: white;
        border-top: 1px solid #e0e0e0;
    }

    .chatbox-input input {
        flex: 1;
        padding: 12px 16px;
        border: 1px solid #e0e0e0;
        border-radius: 24px;
        outline: none;
        font-size: 14px;
        transition: border-color 0.2s;
        font-family: Calibri, 'Calibri', sans-serif;
    }

    .chatbox-input input:focus {
        border-color: #667eea;
    }

    .chatbox-input button {
        width: 44px;
        height: 44px;
        border: none;
        background: linear-gradient(135deg,#b51a1a 0%, #b51a1a 100%);
        color: white;
        border-radius: 50%;
        cursor: pointer;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 18px;
        transition: transform 0.2s;
    }

    .chatbox-input button:hover {
        transform: scale(1.1);
    }

    .chatbox-input button:active {
        transform: scale(0.95);
    }

    .typing-indicator {
        display: flex;
        gap: 4px;
        padding: 12px 16px;
    }

    .typing-indicator span {
        width: 8px;
        height: 8px;
        border-radius: 50%;
        background: #667eea;
        animation: typing 1.4s infinite;
    }

    .typing-indicator span:nth-child(2) {
        animation-delay: 0.2s;
    }

    .typing-indicator span:nth-child(3) {
        animation-delay: 0.4s;
    }

    @keyframes typing {
        0%, 60%, 100% {
            transform: translateY(0);
        }
        30% {
            transform: translateY(-10px);
        }
    }

    @media (max-width: 768px) {
        .ai-chatbox {
            width: calc(100vw - 20px);
            right: 10px;
            bottom: 10px;
            height: calc(100vh - 100px);
            max-height: 600px;
        }
    }
</style>

<script>
    let isMinimized = true;

    // Initialize chat box as minimized on page load
    document.addEventListener('DOMContentLoaded', function() {
        const chatBox = document.getElementById('aiChatBox');
        const minimizeIcon = document.getElementById('minimizeIcon');
        const closeIcon = document.getElementById('closeIcon');
        
        if (chatBox && minimizeIcon && closeIcon) {
            chatBox.classList.add('minimized');
            minimizeIcon.style.display = 'none';
            closeIcon.style.display = 'block';
        }
    });

    function toggleChatBox() {
        // Chỉ mở chat box khi đang minimized, không đóng khi đang mở
        if (isMinimized) {
            const chatBox = document.getElementById('aiChatBox');
            const minimizeIcon = document.getElementById('minimizeIcon');
            const closeIcon = document.getElementById('closeIcon');
            
            isMinimized = false;
            chatBox.classList.remove('minimized');
            minimizeIcon.style.display = 'block';
            closeIcon.style.display = 'none';
        }
    }

    function minimizeChatBox() {
        // Chỉ thu nhỏ khi click vào icon minimize/close
        const chatBox = document.getElementById('aiChatBox');
        const minimizeIcon = document.getElementById('minimizeIcon');
        const closeIcon = document.getElementById('closeIcon');
        
        isMinimized = true;
        chatBox.classList.add('minimized');
        minimizeIcon.style.display = 'none';
        closeIcon.style.display = 'block';
    }

    function sendQuickReply(message) {
        // Remove quick reply buttons from the first message
        const firstMessage = document.querySelector('.bot-message .quick-reply-buttons');
        if (firstMessage) {
            firstMessage.remove();
        }
        
        // Send the quick reply message
        sendMessageWithText(message);
    }

    function sendMessageWithText(messageText) {
        // Đảm bảo chat box mở khi gửi message
        if (isMinimized) {
            toggleChatBox();
        }
        
        // Add user message
        addMessage(messageText, 'user');
        
        // Show typing indicator
        showTypingIndicator();
        
        // Send to server
        fetch('/Handler/AIChat.ashx', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: 'message=' + encodeURIComponent(messageText)
        })
        .then(response => {
            console.log('Response status:', response.status);
            if (!response.ok) {
                throw new Error('Network response was not ok: ' + response.status);
            }
            return response.text();
        })
        .then(data => {
            console.log('Response data:', data);
            hideTypingIndicator();
            if (data && data.trim() !== '') {
                addMessage(data, 'bot');
            } else {
                addMessage('Xin lỗi, không nhận được phản hồi từ server.', 'bot');
            }
        })
        .catch(error => {
            hideTypingIndicator();
            console.error('Error:', error);
            addMessage('Xin lỗi, có lỗi xảy ra: ' + error.message + '. Vui lòng thử lại sau.', 'bot');
        });
    }

    function sendMessage() {
        const input = document.getElementById('chatInput');
        const message = input.value.trim();
        
        if (!message) return;
        
        // Đảm bảo chat box mở khi gửi message
        if (isMinimized) {
            toggleChatBox();
        }
        
        input.value = '';
        sendMessageWithText(message);
    }

    function addMessage(text, type) {
        const messagesContainer = document.getElementById('chatMessages');
        const messageDiv = document.createElement('div');
        messageDiv.className = 'message ' + (type === 'user' ? 'user-message' : 'bot-message');
        
        const avatar = document.createElement('div');
        avatar.className = 'message-avatar';
        avatar.innerHTML = type === 'user' ? '<i class="bi bi-person-fill"></i>' : '<i class="bi bi-messenger"></i>';
        
        const content = document.createElement('div');
        content.className = 'message-content';
        
        // Convert newlines to <br> and preserve formatting
        const formattedText = text.replace(/\n/g, '<br>');
        content.innerHTML = '<p>' + formattedText + '</p>';
        
        messageDiv.appendChild(avatar);
        messageDiv.appendChild(content);
        messagesContainer.appendChild(messageDiv);
        
        // Scroll to bottom
        messagesContainer.scrollTop = messagesContainer.scrollHeight;
    }

    function showTypingIndicator() {
        const messagesContainer = document.getElementById('chatMessages');
        const typingDiv = document.createElement('div');
        typingDiv.className = 'message bot-message';
        typingDiv.id = 'typingIndicator';
        
        const avatar = document.createElement('div');
        avatar.className = 'message-avatar';
        avatar.innerHTML = '<i class="bi bi-messenger"></i>';
        
        const content = document.createElement('div');
        content.className = 'message-content typing-indicator';
        content.innerHTML = '<span></span><span></span><span></span>';
        
        typingDiv.appendChild(avatar);
        typingDiv.appendChild(content);
        messagesContainer.appendChild(typingDiv);
        
        messagesContainer.scrollTop = messagesContainer.scrollHeight;
    }

    function hideTypingIndicator() {
        const typingIndicator = document.getElementById('typingIndicator');
        if (typingIndicator) {
            typingIndicator.remove();
        }
    }

    // Allow Enter key to send message
    document.addEventListener('DOMContentLoaded', function() {
        const input = document.getElementById('chatInput');
        if (input) {
            input.addEventListener('keypress', function(e) {
                if (e.key === 'Enter') {
                    e.preventDefault(); // Ngăn form submit
                    sendMessage();
                }
            });
            
            // Ngăn form submit khi click button
            const sendBtn = document.getElementById('sendBtn');
            if (sendBtn) {
                sendBtn.addEventListener('click', function(e) {
                    e.preventDefault();
                    sendMessage();
                });
            }
        }
    });
</script>

