$(document).on('turbolinks:load', function() {

  var preWord;

// ユーザー検索結果とユーザーに付随する追加ボタンを作成
  function appendList(user) {
    var html =
      `<div class="chat-group-user clearfix">
      <p class="chat-group-user__name">
      ${user.name}</p>
      <a class = "user-search-add chat-group-user__btn chat-group-user__btn--add" data-user-id = "${user.id}" data-user-name = "${user.name}">追加</a>
      </div>`;
     $('#user-search-result').append(html)
  }

//追加したユーザーと削除ボタンの作成

  function buildMember(id, name){
    var html =
      `<div class = "chat-group-user clearfix" id = "chat-group-user-${id}">
      <input name = "group[user_ids][]" type = "hidden" value = "${id}">
      <p class = "chat-group-user__name">${name}</p>
      <a class = "user-search-remove chat-group-user__btn chat-group-user__btn--remove" data-user-id = "${id}">削除</a>
      </div>`;
     return html
  }



  $('#group_users').on('keyup',function(e){
    e.preventDefault();
    var input = $.trim($(this).val());
    if (input != preWord){
      $('#user-search-result').find('.chat-group-user').remove();
      if (input.length !== 0){
       $.ajax({
        url: '/groups/search',
        type: 'GET',
        data: ('keyword=' + input),
        processData: false,
        contentType: false,
        dataType: 'json'
       })

        .done(function(data){
          if(data.length !== 0){
            $(data).each(function(i, user){
              appendList(user)
            });
          }
        })
      }
    }
    preWord = input;
  });

// ユーザーを追加する
  $('#user-search-result').on('click', '.user-search-add', function(e) {
    e.preventDefault();
    var id      =  $(this).data('user-id');
    var name    =  $(this).data('user-name');
    var member  =  buildMember(id, name);
    $('#chat-group-users').append(member);
    $(this).parent().remove();
  });

// ユーザーを取り除く
  $('#chat-group-users').on('click','.user-search-remove', function(){
    $(this).parent().remove();
  });
});
