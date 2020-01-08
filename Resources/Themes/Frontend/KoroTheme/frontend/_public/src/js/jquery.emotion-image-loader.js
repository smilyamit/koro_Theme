;(function($, window){
    'use strict';

    $.subscribe('plugin/swEmotionLoader/onInitEmotion', function(event, me) {
        var browserHeight = $(window).height();

        var $rows = me.$el.find('.emotion--row');

        var $visibleElements = [];
        var shouldContinue = true;

        $rows.each(function() {
            if (!shouldContinue) {
                return false;
            }

            var rowHeight = $(this).outerHeight();

            $visibleElements.push($(this));

            if (rowHeight < browserHeight) {
                browserHeight -= rowHeight;
            }else {
                shouldContinue = false;
            }
        });

        if (!$visibleElements) {
            $visibleElements.push(me.$el.find('.emotion--row').first());
        }

        $.each($visibleElements, function(index, value) {
            var $lazyElements = value.find('.lazy');

            $lazyElements.each(function() {
                var element = $(this);

                if (element.attr('data-loader') == "emzPictureLoader") {
                    var $elementsSrcSet = element.find('[data-srcset]');
                    $elementsSrcSet.each(function() {
                        $(this).attr('srcset', $(this).attr('data-srcset'));
                        $(this).removeAttr('data-srcset');
                    });

                    var $elementsSrc = element.find('[data-src]');
                    $elementsSrc.each(function() {
                        $(this).attr('src', $(this).attr('data-src'));
                        $(this).removeAttr('data-src');
                    });
                }else {
                    if (element.attr('data-srcset')) {
                        element.attr('srcset', element.attr('data-srcset'));
                        element.removeAttr('data-srcset');
                    }

                    if (element.attr('data-src')) {
                        element.attr('src', element.attr('data-src'));
                        element.removeAttr('data-src');
                    }
                }
            });
        });
    });

})(jQuery, window);
