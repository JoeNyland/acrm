$(document).ready(function () {

    /* Back to top button */
    $('#back-to-top').css('display', 'none'); // Hide the Back to Top button, if JS enabled. Re-enabled below on scroll.
    $('#demo').css('display', 'none'); // Hide the Demo button, if JS enabled. Re-enabled below on scroll.
    var offset = 150;
    var duration = 500;
    $(window).scroll(function() {
        if ($(this).scrollTop() > offset) {
            $('#back-to-top').fadeIn(duration);
            $('#demo').fadeIn(duration);
        } else {
            $('#back-to-top').fadeOut(duration);
            // Don't fadeOut() the Demo button, leave stuck to the navbar.
        }
    });

    /* Avatar Hover Zoom */
    $( "#about-avatar" ).hover(function(){
        $(this).switchClass('avatar-md', 'avatar-xl');
    },
        function(){
            $(this).switchClass('avatar-xl', 'avatar-md');
        }
    );

    /* Activate ScrollSpy Menu */
    $('body').scrollspy({
        target: '#navbar-collapsible',
        offset: 50
    });

    /* Smooth Scrolling */
    $('a[href*=#]:not([href=#])').click(function () {
        if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') && location.hostname == this.hostname) {
            var target = $(this.hash);
            target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
            if (target.length) {
                $('html,body').animate({
                    scrollTop: target.offset().top - 48     // (50 - 2), to make sure the nav gets updated correctly.
                }, 1000);
                return false;
            }
        }
    });

});
