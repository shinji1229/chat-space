$(function() {
  // function buildHTML(message) {
  //   var html = {};
  //   html['user'] = $('.chat-main__body_name').html(message.user.name);
  //   html['date'] = $('chat-main__body_date').html(message.created_at);
  //   html['body'] = $('.chat-main__body_message').html(message.body);
  //   return html;
  // }

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
      // var html = buildHTML(data);
      // $.each(html,function(i,val){
      //   $('.chat-main__body').append(val);
      // });
      // textField.val('');
    })
    .fail(function() {

      // alert('メッセージを送信できませんでした');
    });
  });
});