$(function() {
   function buildHTML(message) {
    var message_Image = '';
    if (message.image) {
      message_Image = `<img src="${message.image.url}" class="chat-main__body_chat-image">`;
    }
    var html = `
      <div class="chat__body_chat" data-message-id="${message.id}>" >
        <div class="chat-main__body_chat-name">${message.name}</div>
        <div class="chat-main__body_chat-date">${message.date}</div>
        <div class="chat-main__body_chat-message">${message.body}</div>
        ${message_Image}
      </div>
        `;
    return html;
  }

// スクロール機能
   function scrollMessage(){
     $('.chat-main__body').animate({ scrollTop: $('.chat-main__body')[0].scrollHeight}, 'slow', 'swing');
   }

// メッセージ更新機能
   function reloadIndex(){

     var lastId = $('chat__body_chat').last().data('message-id');

       $.ajax({
         type: 'GET',
         url: './messages',
         data: {
         id: lastId
          },
         dataType: 'json'
      })
      .done(function(data){
        var newChat = ('');
        data.messages.forEach(function(message) {
          newChat += buildHTML(message);
        });
        $('.chat-main__body').append(newChat);
      })
      .fail(function() {
        alert('自動更新に失敗しました');
    });
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

// 条件にマッチすれば２秒ごとに更新する
  if(window.location.href.match(/\/groups\/\d+\/messages/))
    {
    setInterval(reloadIndex,2000);
  }
});
