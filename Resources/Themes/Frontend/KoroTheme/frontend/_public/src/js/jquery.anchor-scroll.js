;(function($, window){
    'use strict';

    $('a[href^="#"]').on('click', function(event) {
        if ($(this).attr('href').length > 1) {
            var target = $($(this).attr('href'));
            if (target.length) {
                event.preventDefault();
                $('html, body').animate({
                    scrollTop: target.offset().top
                }, 2000);
            }
        }
    });

    $.subscribe('plugin/swEmotionLoader/onLoadEmotionFinished', function(event, me) {
        $('.emz-price-history-anchor').on('click', function(e) {
            if ($(this).attr('href').length > 1) {
                var target = $($(this).attr('href'));
                if (target.length) {
                    event.preventDefault();
                    $('html, body').animate({
                        scrollTop: target.offset().top
                    });
                }
            }
        });
    });

})(jQuery, window);
