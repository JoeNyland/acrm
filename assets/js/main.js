$(document).ready(function(){
    /* Activate ScrollSpy Menu */
    $('body').scrollspy({
        target: '#navbar-collapsible',
        offset: 50
    });

    /* Smooth Scrolling */
    $('a[href*=#]:not([href=#])').click(function() {
        if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
            var target = $(this.hash);
            target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
            if (target.length) {
                $('html,body').animate({
                    scrollTop: target.offset().top - 48     // (50 - 2), to make sure the nav gets updated correctly.
                }, 1000);
                return false;
            }
        }
    });
});

