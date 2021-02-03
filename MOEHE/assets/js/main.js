(function($) {
    "use strict";
    $('.sponsors-carousel').owlCarousel({
        loop: true,
        margin: 30,
        nav: false,
        smartSpeed: 500,
        autoplay: true,
        navText: ['<span class="fa fa-angle-left"></span>', '<span class="fa fa-angle-right"></span>'],
        responsive: {
            0: {
                items: 1
            },
            480: {
                items: 2
            },
            600: {
                items: 3
            },
            768: {
                items: 4
            },
            1024: {
                items: 5
            }
        }
    });
    /*===============================
    =         Wow Active            =
    ================================*/

    new WOW().init();

    /*=============================================
    =       Menu sticky & Scroll to top          =
    =============================================*/
    var windows = $(window);
    var screenSize = windows.width();
    var sticky = $('.header-sticky');
    var $html = $('html');
    var $body = $('body');

    windows.on('scroll', function() {
        var scroll = windows.scrollTop();
        var headerHeight = sticky.height();

        if (screenSize >= 320) {
            if (scroll < headerHeight) {
                sticky.removeClass('is-sticky');
            } else {
                sticky.addClass('is-sticky');
            }
        }

    });
    /*----------  Scroll to top  ----------*/
    function scrollToTop() {
        var $scrollUp = $('#scroll-top'),
            $lastScrollTop = 0,
            $window = $(window);

        $window.on('scroll', function() {
            var st = $(this).scrollTop();
            if (st > $lastScrollTop) {
                $scrollUp.removeClass('show');
            } else {
                if ($window.scrollTop() > 200) {
                    $scrollUp.addClass('show');
                } else {
                    $scrollUp.removeClass('show');
                }
            }
            $lastScrollTop = st;
        });

        $scrollUp.on('click', function(evt) {
            $('html, body').animate({ scrollTop: 0 }, 600);
            evt.preventDefault();
        });
    }
    scrollToTop();


    var linnkme = "sss";

    $('.monochrome').click(function() {
        if (linnkme != "blind") {
            $("<link/>", {
                rel: "stylesheet",
                type: "text/css",
                id: "blind",
                href: "../assets/css/blind.css"
            }).appendTo("head");
            linnkme = "blind";
        } else {
            $('#blind').remove();
            linnkme = "sss";
        }
    });

    var fontSize;

    $("#insize").click(function() {
        fontSize = parseInt($("p").css('font-size'));
        fontSize = fontSize + 1 + "px";
        $("p").css({ 'font-size': fontSize });
    });
    $("#desize").click(function() {
        fontSize = parseInt($("p").css('font-size'));
        fontSize = fontSize - 1 + "px";
        $("p").css({ 'font-size': fontSize });
    });
    // optional
    $('#blogCarousel').carousel({
        interval: 4000
    });

    $("#btnSendOtp").click(function() {

        if (ValidatorOnSubmit()) {
            $('#divLoader').css({ display: "" });
        }
    });

})(jQuery);


function toggleLanguage() {
    var culture = document.cookie.indexOf('Culture=ar') >= 0 ? 'en' : 'ar-QA';

    setLanguage(culture);

    window.location.reload();
}

function setLanguage(culture) {
    var today = new Date();
    today.setMonth(today.getMonth() + 12);

    var cookieValue = culture + ";expires=" + today.toUTCString() + ";domain=.edu.gov.qa;path=/";

    document.cookie = "Culture=" + cookieValue;
    document.cookie = "UICulture=" + cookieValue;
    document.cookie = "CacheKey=" + Math.floor(Math.random() * 10000).toString();
}