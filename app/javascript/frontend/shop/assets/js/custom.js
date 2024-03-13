import AOS from 'aos'
import 'slicknav/dist/jquery.slicknav.min'
import Swiper from 'swiper'
import 'jquery.countdown/jquery.countdown' // use method countDown
import jQueryBridget from 'jquery-bridget'
import Isotope from 'isotope-layout'
jQueryBridget('isotope', Isotope, $)
import 'slick-carousel/slick/slick.min'
import 'jquery-zoom/jquery.zoom.min'
import '@fancyapps/fancybox'

$(document).ready(function(){
// Background Image
    $('[data-bg-img]').each(function() {
        $(this).css('background-image', 'url(' + $(this).data("bg-img") + ')');
    });

// Off Canvas JS
    var canvasWrapper = $(".off-canvas-wrapper");
    $(".btn-menu").on('click', function() {
        canvasWrapper.addClass('active');
    });
    $(".close-action > .btn-close, .off-canvas-overlay").on('click', function() {
        canvasWrapper.removeClass('active');
    });

//Responsive Slicknav JS
    $('.main-menu').slicknav({
        appendTo: '.res-mobile-menu',
        closeOnClick: true,
        removeClasses: true,
        closedSymbol: '<i class="fa fa-angle-down"></i>',
        openedSymbol: '<i class="fa fa-angle-up"></i>'
    });

// Search Box JS
    var searchwrapper = $(".search-box-wrapper");
    $(".btn-search-menu").on('click', function() {
        searchwrapper.addClass('show');
        $("#search-input").focus();
    });
    $(".search-close").on('click', function() {
        searchwrapper.removeClass('show');
    });

// Product Quick View JS
    var quickViewModal = $(".product-quick-view-modal");
    $(".product-action .action-quick-view").on('click', function() {
        quickViewModal.addClass('active');
        $("body").addClass('fix');
    });
    $(".btn-close, .canvas-overlay").on('click', function() {
        quickViewModal.removeClass('active');
        $("body").removeClass('fix');
    });

// Sidebar Cart JS
    var sidebarCartModal = $(".sidebar-cart-modal");
    $(".cart-icon").on('click', function() {
        sidebarCartModal.addClass('sidebar-cart-active');
        $(".sidebar-cart-overlay").addClass('show');
    });
    $(".sidebar-cart-content .cart-close").on('click', function() {
        sidebarCartModal.removeClass('sidebar-cart-active');
        $(".sidebar-cart-overlay").removeClass('show');
    });

// Checkout Toggle Active
    $('.checkout-coupon-active').on('click', function(e) {
        e.preventDefault();
        $('.checkout-coupon-content').slideToggle(1000);
    });

// Swipper JS

// Home Two Slider
    var swiper = new Swiper('.home-slider-container', {
        slidesPerView: 1,
        loop: true,
        spaceBetween: 0,
        effect: 'fade',
        fadeEffect: {
            crossFade: true,
        },
    });

// Gallery Trends Slider
    var swiper = new Swiper('.product-category1-slider-container', {
        slidesPerView: 3,
        slidesPerGroup: 1,
        loop: true,
        spaceBetween : 30,
        breakpoints: {
            1500:{
                slidesPerView : 3
            },

            992:{
                slidesPerView : 3
            },

            768:{
                slidesPerView : 2
            },

            625:{
                slidesPerView : 2,
                spaceBetween : 15,
            },

            0:{
                slidesPerView : 1
            }
        }
    });

// Brand Slider
    var swiper = new Swiper('.brand-logo-slider-container', {
        slidesPerView : 6,
        loop: true,
        speed: 1000,
        spaceBetween : 0,
        autoplay: false,
        breakpoints: {
            1200:{
                slidesPerView : 6
            },

            992:{
                slidesPerView : 4,
                spaceBetween : 30
            },

            768:{
                slidesPerView : 3,
                spaceBetween : 30

            },

            576:{
                slidesPerView : 3,
                spaceBetween : 30
            },

            380:{
                slidesPerView : 2,
                spaceBetween : 30
            },

            0:{
                slidesPerView : 2,
                spaceBetween : 30
            }
        }
    });

// Swipper JS
    var swiper = new Swiper('.product4-slider-container', {
        slidesPerView: 4,
        loop: true,
        spaceBetween : 30,
        autoplay: {
            delay: 4000,
        },
        navigation: {
            nextEl: '.product4-slider-container .swiper-button-next',
            prevEl: '.product4-slider-container .swiper-button-prev',
        },
        breakpoints: {
            1200:{
                slidesPerView : 4
            },

            992:{
                slidesPerView : 3
            },

            768:{
                slidesPerView : 2

            },

            576:{
                slidesPerView : 2
            },

            0:{
                slidesPerView : 1
            }
        }
    });

// Gallery Trends Slider
    var swiper = new Swiper('.testimonial-slider-container', {
        slidesPerView: 3,
        slidesPerGroup: 1,
        loop: true,
        spaceBetween : 40,
        breakpoints: {
            1500:{
                slidesPerView : 3,
                spaceBetween : 40
            },

            992:{
                slidesPerView : 3,
                spaceBetween : 30
            },

            768:{
                slidesPerView : 2,
                spaceBetween : 30
            },

            620:{
                slidesPerView : 2,
                spaceBetween : 15,
            },

            0:{
                slidesPerView : 1
            }
        }
    });

    $('.product-tab1-slider').slick({
        dots: false,
        speed: 300,
        slidesToShow: 4,
        slidesToScroll: 1,
        arrows: true,
        responsive: [
            {
                breakpoint: 1024,
                settings: {
                    slidesToShow: 3,
                    slidesToScroll: 3,
                    infinite: true,
                    dots: true
                }
            },
            {
                breakpoint: 768,
                settings: {
                    slidesToShow: 2,
                    slidesToScroll: 2
                }
            },
            {
                breakpoint: 520,
                settings: {
                    slidesToShow: 1,
                    slidesToScroll: 1
                }
            }
        ]
    });

    $('.testimonial-slider').slick({
        dots: false,
        infinite: true,
        speed: 300,
        slidesToShow: 3,
        slidesToScroll: 1,
        arrows: false,
        responsive: [
            {
                breakpoint: 992,
                settings: {
                    slidesToShow: 2,
                    slidesToScroll: 2,
                    infinite: true
                }
            },
            {
                breakpoint: 576,
                settings: {
                    slidesToShow: 1,
                    slidesToScroll: 1
                }
            }
        ]
    });

// Fancybox Js
    $('.lightbox-image').fancybox();
// Isotope and data filter
    function isotopePortfolio() {
        var $grid = $('.masonry-grid').isotope({
            itemSelector: '.masonry-item',
            masonry: {
                columnWidth: 1
            }
        })
        // Isotope Masonry
        var $gridMasonry = $('.masonry-style').isotope({
            itemSelector: '.masonry-item'
        })
        // Isotope filter Menu
        $('.portfolio-filter-menu').on( 'click', 'button', function() {
            var filterValue = $(this).attr('data-filter');
            $grid.isotope({ filter: filterValue });
            $gridMasonry.isotope({ filter: filterValue });
            var filterMenuactive = $(".portfolio-filter-menu button");
            filterMenuactive.removeClass('active');
            $(this).addClass('active');
        });
    }

// Images Zoom
    $('.zoom-hover').zoom();

// Countdown JS
    var now = new Date();
    var day = now.getDate();
    var month = now.getMonth() + 1;
    var year = now.getFullYear() + 1;
    var nextyear = month + '/' + day + '/' + year + ' 07:07:07';

    $('.countdown-timer').countDown({
        date: '1/2/2022 23:59:59',
        offset: +2, //
        day: 'Day',
        days: 'Days',
        hideOnComplete: true
    }, function (container) {
        alert('Done!');
    });

//Shop review btn
    $(".review-write-btn").on('click', function() {
        $(".product-review-form").toggle('active');
    });

// Product Qty
//     var proQty = $(".pro-qty");
//     proQty.append('<a href="#" class="inc qty-btn"><i class="fa fa-plus"></i></a>');
//     proQty.append('<a href="#" class= "dec qty-btn"><i class="fa fa-minus"></i></a>');
//     $('.qty-btn').on('click', function(e) {
//         e.preventDefault();
//         var $button = $(this);
//         var oldValue = $button.parent().find('input').val();
//         if ($button.hasClass('inc')) {
//             var newVal = parseFloat(oldValue) + 1;
//         } else {
//             // Don't allow decrementing below zero
//             if (oldValue > 1) {
//                 var newVal = parseFloat(oldValue) - 1;
//             } else {
//                 newVal = 1;
//             }
//         }
//         $button.parent().find('input').val(newVal);
//     });

// Product Qty
//     var proQty2 = $(".pro-qty-style2");
//     proQty2.append('<a href="#" class="inc qty-btn"><i class="fa fa-plus"></i></a>');
//     proQty2.append('<a href="#" class= "dec qty-btn"><i class="fa fa-window-minimize"></i></a>');
//     $('.qty-btn').on('click', function(e) {
//         e.preventDefault();
//         var $button2 = $(this);
//         var oldValue2 = $button2.parent().find('input').val();
//         if ($button2.hasClass('inc')) {
//             var newVal2 = parseFloat(oldValue2) + 1;
//         } else {
//             // Don't allow decrementing below zero
//             if (oldValue2 > 1) {
//                 var newVal2 = parseFloat(oldValue2) - 1;
//             } else {
//                 newVal2 = 1;
//             }
//         }
//         $button2.parent().find('input').val(newVal2);
//     });

//Checkout Page Checkbox Accordion
    $("#create_pwd").on("change", function() {
        $(".account-create").slideToggle("100");
    });

    $("#ship_to_different").on("change", function() {
        $(".ship-to-different").slideToggle("100");
    });

    $('.checkout-toggle').on('click', function() {
        $('.open-toggle').slideToggle(1000);
    });

    var checked = $( '.sin-payment input:checked' )
    if(checked){
        $(checked).siblings( '.payment-box' ).slideDown(900);
    };
    $( '.sin-payment input' ).on('change', function() {
        $( '.payment-box' ).slideUp(900);
        $(this).siblings( '.payment-box' ).slideToggle(900);
    });

// Scroll Top Hide Show
    var varWindow = $(window);
    varWindow.on('scroll', function(){
        if ($(this).scrollTop() > 250) {
            $('.scroll-to-top').fadeIn();
        } else {
            $('.scroll-to-top').fadeOut();
        }

        // Sticky Header
        if($('.sticky-header').length){
            var windowpos = $(this).scrollTop();
            if (windowpos >= 80) {
                $('.sticky-header').addClass('sticky');
            } else {
                $('.sticky-header').removeClass('sticky');
            }
        }
    });

//Scroll To Top
    $('.scroll-to-top').on('click', function(){
        $('html, body').animate({scrollTop : 0},800);
        return false;
    });

// Reveal Footer JS
    let revealId = $(".reveal-footer"),
        footerHeight = revealId.outerHeight(),
        windowWidth = $(window).width(),
        windowHeight = $(window).outerHeight(),
        leftFixedHeader = $("header.fixed-left"),
        leftFixedHeaderWidth = leftFixedHeader.innerWidth();

    if (windowWidth > 991 && windowHeight > footerHeight) {
        $(".site-wrapper-reveal").css({
            'margin-bottom': footerHeight + 'px'
        });
    }

    /* ==========================================================================
       When document is loading, do
       ========================================================================== */

    varWindow.on('load', function() {
        isotopePortfolio();
        AOS.init({
            once: true,
        });
    });
});

