const ws = new WebSocket('ws://localhost:8080/ws'); // Connect to Dart WebSocket server

const chatDiv = document.getElementById('chat');
const messageInput = document.getElementById('message');
const sendButton = document.getElementById('send');

// Handle incoming messages
ws.onmessage = (event) => {
  const message = document.createElement('div');
  message.textContent = event.data;
  chatDiv.appendChild(message);
  chatDiv.scrollTop = chatDiv.scrollHeight; // Auto-scroll to latest message
};

// Handle WebSocket connection open
ws.onopen = () => {
  console.log('Connected to WebSocket server');
};

// Handle WebSocket errors
ws.onerror = (error) => {
  console.error('WebSocket error:', error);
};

// Handle WebSocket closure
ws.onclose = () => {
  console.log('WebSocket connection closed');
};

// Send a message when the send button is clicked
sendButton.addEventListener('click', () => {
  const message = messageInput.value;
  if (message.trim()) {
    ws.send(message);
    messageInput.value = ''; // Clear the input field
  }
});

// Send message on "Enter" key press
messageInput.addEventListener('keypress', (event) => {
  if (event.key === 'Enter') {
    sendButton.click();
  }
});
