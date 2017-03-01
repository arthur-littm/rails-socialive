$(function(){

  $(".tab").on("click", function(e){
    // Change active tab
    $(".active").removeClass('active');
    $(this).addClass('active');
    // HΩide all tab-content (use class="hidden")
    $(".tab-content").addClass('hidden');
    // Show target tab-content (use class="hidden")
    $($(this).data('target')).removeClass('hidden');
  });
});
