;(function($, window){
    'use strict';

    $('.art-edition--box-container').click(function() {
        var imageUrl = $(this).find('.art-edition--image').attr('data-lightbox-image');

        if (imageUrl) {
            $.lightbox.open(imageUrl);
        }
    });

})(jQuery, window);
