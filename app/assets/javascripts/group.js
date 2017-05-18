$(function(){

  $('#group_users').on('keyup',function(e){
    e.preventDefault();
    var input = $(this).val();
     $.ajax({
      url: '/groups/search',
      type: 'GET',
      data: ,
      processData: false,
      contentType: false,
      dataType: 'json'
  })
    .done(function(data){

   })
  });
});