$(document).ready(function(){
  $(".radio-select").click(function(){
    $(".radio-select").removeClass('active');
    $(this).toggleClass("active");
  });

  $(".radio-label-free").click(function(){
    // $(".radio-select").removeClass('active');
    $(".radio-select-free").addClass("active");
    $(".radio-select-paid").removeClass("active");
  });

  $(".radio-label-paid").click(function(){
    // $(".radio-select").removeClass('active');
    $(".radio-select-paid").addClass("active");
    $(".radio-select-free").removeClass("active");
  });

  // $(".radio-ticket-price").click(function(){
  //   // $(".radio-select").removeClass('active');
  //   $(".radio-select-paid").addClass("active");
  //   $(".radio-select-free").removeClass("active");
  // });

  $('.radio-label-free').click(function(){
        $(".radio-ticket-price").val('');
    });

});
