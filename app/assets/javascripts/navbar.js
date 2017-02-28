

var didScroll;
var lastScrollTop = 0;
var delta = 5;
var navbarHeight = $('.nav-head').outerHeight();
var navbarFix = $('.navbar-socialive-categories').outerHeight();
var searchFix = $('.search-container-two').outerHeight();

$(window).scroll(function(event){
    didScroll = true;
});

setInterval(function() {
    if (didScroll) {
        hasScrolled();
        didScroll = false;
    }
}, 250);

function hasScrolled() {
    var st = $(this).scrollTop();

    // Make sure they scroll more than delta
    if(Math.abs(lastScrollTop - st) <= delta)
        return;

    // If they scrolled down and are past the navbar, add class .nav-up.
    // This is necessary so you never see what is "behind" the navbar.
    if (st > lastScrollTop && st > navbarHeight){
        // Scroll Down
        $('.nav-head').removeClass('nav-down').addClass('nav-up');
        $('.navbar-socialive-categories').addClass('nav-up');
        $('.search-container-two').removeClass('hidden-md hidden-lg');
    } else {
        // Scroll Up
        if(st + $(window).height() < $(document).height()) {
            $('.nav-head').removeClass('nav-up').addClass('nav-down');
            $('.navbar-socialive-categories').removeClass('nav-up');
             $('.search-container-two').addClass('hidden-md hidden-lg');
        }
    }

    lastScrollTop = st;
}

