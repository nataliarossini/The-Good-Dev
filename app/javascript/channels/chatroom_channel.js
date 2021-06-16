import consumer from "./consumer";

const initChatroomCable = () => {
  const messagesContainer = document.getElementById('messages');
  if (messagesContainer) {
    const id = messagesContainer.dataset.chatroomId;

    consumer.subscriptions.create({ channel: "ChatroomChannel", id: id }, {
      received(data) {
        console.log(data); // called when data is broadcast in the cable
        messagesContainer.insertAdjacentHTML('beforeend', data);
        location.reload();
      },
    });
  }
}

const initScrollMessage = () => {
  const chatContainer = document.querySelector(".chat-container")
  if (chatContainer) {
    chatContainer.scrollTo(0,document.querySelector(".chat-container").scrollHeight);
  }
}
export { initChatroomCable, initScrollMessage };
