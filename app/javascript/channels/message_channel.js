import consumer from "./consumer"

consumer.subscriptions.create("MessageChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
  
    const html = `<p>${data.comment.comment}</p>
                    `;
    const comments = document.getElementById('items-comment');
    const newcomment = document.getElementById('comment_comment');
    comments.insertAdjacentHTML('afterbegin', html);
    newcomment.value='';
    let inputElement = document.getElementById("comment-btn");
    console.log(inputElement)
    inputElement.disabled = false;
  }
});
