// $(document).ready(function(){
//   $(".btn-buy-ticket").click(function(){
//     $(".fa-for-js").removeClass('fa-ticket');
//     $(".fa-for-js").addClass("fa-spinner fa-spin");
//   });
// });



$(document).ready(function(){
  $(".btn-buy-ticket").click(function(){
    $(".fa-for-js").removeClass('fa-ticket');
    $(".fa-for-js").addClass("fa-spinner fa-spin");
    // $(this).attr('disabled', 'disabled');
    // $(this).parents('form').submit();
  });

  $('.new_ticket').submit(function(e){
    if( $(this).hasClass('form-submitted') ){
      e.preventDefault();
      return;
    }
    $(this).addClass('form-submitted');
    $(this).prop("disabled", true);
  });

});

