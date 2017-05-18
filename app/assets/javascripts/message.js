$(function() {
   function buildHTML(message) {
    var html = `
        <div class="chat-main__body_name">${message.name}</div>
        <div class="chat-main__body_date">${message.date}</div>
        <div class="chat-main__body_message">${message.body}</div>`;
    return html;
  }

  $('#new_message').on('submit', function(e) {
    e.preventDefault();
    var textField = $('#message_body');
    var message = textField.val();
    $.ajax({
      type: 'POST',
      url: './messages',
      data: {
        message: {
          body: message
        }
      },
      dataType: 'json'
    })
    .done(function(data) {
      var chat = buildHTML(data);
       $('.chat-main__body').append(chat);
      $('#message_body').val('');
      $(".input").prop("disabled", false)
      $('.chat-main__body').animate({
          scrollTop: $('.chat-main__body')[0].scrollHeight
      }, 'slow', 'swing');
    })
    .fail(function() {
      $(".input").prop("disabled", false)
      alert('メッセージを送信できませんでした');
    });

  });
});
