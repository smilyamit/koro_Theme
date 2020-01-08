;(function(jQuery, window){

    $.overridePlugin('swAjaxWishlist', {
        triggerRequest: function (event) {
            var $target = $(event.currentTarget),
                url = $target.attr('data-ajaxUrl');

            if (typeof url === 'undefined' || $target.hasClass(this.opts.savedCls)) {
                return;
            }

            event.preventDefault();
            
            this.animateElement($target);

            $.ajax({
                url: url,
                dataType: 'json',
                method: 'POST',
                success: $.proxy(this.responseHandler, this, $target)
            });

            $.publish('plugin/swAjaxWishlist/onTriggerRequest', [this, event, url]);
        },

        responseHandler: function ($target, response) {
            $.publish('plugin/swAjaxWishlist/onTriggerRequestLoaded', [this, $target, response]);

            if (!response.success) {
                return;
            }

            this.updateCounter(response.notesCount);

            $.publish('plugin/swAjaxWishlist/onTriggerRequestFinished', [this, $target, response]);
        },
    })

})($, window);