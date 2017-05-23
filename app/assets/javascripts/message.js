$(function() {
   function buildHTML(message) {
    var message_Image = '';
    if (message.image) {
      message_Image = `<img src="${message.image.url}" class="chat-main__body_chat-image">`;
    }
    var html = `
        <div class="chat-main__body_chat-name">${message.name}</div>
        <div class="chat-main__body_chat-date">${message.date}</div>
        <div class="chat-main__body_chat-message">${message.body}</div>
        ${message_Image}
        `;
    return html;
  }

   function scrollMessage(){
     $('.chat-main__body').animate({ scrollTop: $('.chat-main__body')[0].scrollHeight}, 'slow', 'swing');
   }

  $('#new_message').on('submit', function(e) {
    e.preventDefault();
    var textField = $('#message_body');
    var message = new FormData($(this).get(0));
    $.ajax({
      type: 'POST',
      url: './messages',
      data: message,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data) {
      var chat = buildHTML(data);
      $('.chat-main__body').append(chat);
      textField.val('');
      $(".input").prop("disabled", false)
      scrollMessage();
    })
    .fail(function() {
      $(".input").prop("disabled", false)
      alert('メッセージを送信できませんでした');
    });

  });
});
