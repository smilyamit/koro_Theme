(function($, window) {
    window.StateManager
      .addPlugin('*[data-koro-sticky="true"]', 'koroSticky', ['s', 'm', 'l', 'xl'])
      // .removePlugin('.tab-menu--product', 'swTabMenu')
      // .addPlugin('.tab-menu--product', 'swTabMenu', ['s'])
      .addPlugin('*[data-tabName=description]', 'swScrollAnimate', {
            scrollTarget: '.tab--description'
        }, ['s', 'm', 'l', 'xl'])
      .addPlugin('*[data-tabName=price-history]', 'swScrollAnimate', {
            scrollTarget: '.tab--price-history'
        }, ['s', 'm', 'l', 'xl'])
      .addPlugin('*[data-tabName=comparison]', 'swScrollAnimate', {
            scrollTarget: '.tab--compare'
        }, ['s', 'm', 'l', 'xl'])
      .addPlugin('*[data-tabName=masonry]', 'swScrollAnimate', {
            scrollTarget: '.tab--masonry'
        }, ['s', 'm', 'l', 'xl'])
      .addPlugin('*[data-tabName=recipes]', 'swScrollAnimate', {
            scrollTarget: '.tab--recipes'
        }, ['s', 'm', 'l', 'xl'])
      .addPlugin('*[data-tabName=faq]', 'swScrollAnimate', {
            scrollTarget: '.tab--faq'
        }, ['s', 'm', 'l', 'xl'])
      .addPlugin('*[data-tabName=rating]', 'swScrollAnimate', {
            scrollTarget: '.tab--rating'
        }, ['s', 'm', 'l', 'xl']);

})(jQuery, window);
