;(function ($, StateManager, window) {
    'use strict';

    $.plugin('koroSticky', {
        init: function () {
            var me = this;

            me.applyDataAttributes();

            me.$el.sticky({topSpacing:0, zIndex: 800, bottomSpacing:1572});
        },

        destroy: function () {
            var me = this;

            me.$el.unstick();

            me._destroy();
        }
    });
})(jQuery, StateManager, window);
