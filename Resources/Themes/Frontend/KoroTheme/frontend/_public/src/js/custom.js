$(".bought--content .product-slider--container").find('.product-slider--item:first').addClass("first");
$(".bought--content .product-slider--container").find('.product-slider--item:last').addClass("last");
$(".viewed--content .product-slider--container").find('.product-slider--item:first').addClass("first");
$(".viewed--content .product-slider--container").find('.product-slider--item:last').addClass("last");

function check_count() {
    var count_bought = $(".bought--content .product-slider--container").find('.product-slider--item').length;
    var count_viewed = $(".viewed--content .product-slider--container").find('.product-slider--item').length;
    if (count_bought > 4) {
        $('.bought--content .custom_nav button').show();
    } else {
        $('.bought--content .custom_nav button').hide();
    }

    if ((count_viewed / 2) > 4) {
        $('.viewed--content .custom_nav button').show();
    } else {
        $('.viewed--content .custom_nav button').hide();
    }
}

function openCity(evt, cityName) {
    // Declare all variables
    var i, tabcontent, tablinks;

    // Get all elements with class="tabcontent" and hide them
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }

    // Get all elements with class="tablinks" and remove the class "active"
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }

    // Show the current tab, and add an "active" class to the button that opened the tab
    document.getElementById(cityName).style.display = "block";
    evt.currentTarget.className += " active";
}

$(document).ready(function() {
    if ($('#shipping-free-left').length > 0) {
        var a = $('#shipping-free-left').text();
        var shipping = (100 - parseFloat(a)).toFixed(2);
        $('#shipping-free-left').text(shipping.replace(".", ","));
    }
})

function openCity(evt, index) {
    var i, tabcontent, tablinks;
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }
    evt.currentTarget.className += " active";
    document.getElementsByClassName("dot--link")[index].click();
}

$(document).on('click', '.tablinks', function() {
    var tabid = parseInt($(this).attr('class').replace("tablinks ", "")) + 1;
    var slider = $('.image-slider--dots').parent().find(".banner-slider--slide .emotion--digital-publishing:nth-child("+tabid+")" );
    var slider_link = slider.find('.dig-pub--button a').attr('href');
    if (typeof slider_link != 'undefined' && slider_link){
        window.location.href = slider_link;
    }
});

//<![CDATA[
(function($) {
    "use strict";
    /**
     * Helpers methods
     */

    $.subscribe('plugin/swImageSlider/onSlide', function(event, me, index) {
        // document.getElementsByClassName(index)[0].click();
        var els = document.getElementsByClassName(index);
        // console.log("ddddddd1");
        // console.log($(".tablinks"));
        // console.log("ddddddd2");
        $('.tablinks').each(function(obj, value) {
            $(this).removeClass('active');
        });
        // console.log(index);
        if ($(window).width() >= 1024) {
            $("." + index).addClass('active');

            $("." + index + "-l").addClass('active');
        } else {
            $("." + index + "-p").addClass('active');
        }
    });

    function supportCSS3(prop) {
        var prefix = ["-webkit-", "-moz-", ""];
        var root = document.documentElement;

        function camelCase(str) {
            return str.replace(/\-([a-z])/gi, function(match, $1) {
                return $1.toUpperCase();
            });
        }
        for (var i = prefix.length - 1; i >= 0; i--) {
            var css3prop = camelCase(prefix[i] + prop);
            if (css3prop in root.style) {
                return css3prop;
            }
        }
        return false;
    }

    function transitionEnd() {
        var transitions = {
            transition: "transitionend",
            WebkitTransition: "webkitTransitionEnd",
            MozTransition: "mozTransitionEnd"
        };
        var root = document.documentElement;
        for (var name in transitions) {
            if (root.style[name] !== undefined) {
                return transitions[name];
            }
        }
        return false;
    }

    function support3d() {
        if (!window.getComputedStyle) {
            return false;
        }
        var el = document.createElement("div"),
            has3d,
            transform = supportCSS3("transform");

        document.body.insertBefore(el, null);

        el.style[transform] = "translate3d(1px,1px,1px)";
        has3d = getComputedStyle(el)[transform];

        document.body.removeChild(el);

        return has3d !== undefined && has3d.length > 0 && has3d !== "none";
    }

    var Touch = {
        hasTouch: !!(
            "ontouchstart" in window ||
            (window.DocumentTouch && document instanceof DocumentTouch)
        ),
        event: function() {
            return {
                start: this.hasTouch ? "touchstart" : "mousedown",
                move: this.hasTouch ? "touchmove" : "mousemove",
                end: this.hasTouch ? "touchend" : "mouseup",
                leave: this.hasTouch ? "touchleave" : "mouseout"
            };
        }
    };

    function throttle(func, wait, options) {
        var context, args, result;
        var timeout = null;
        var previous = 0;
        if (!options) options = {};
        var later = function() {
            previous = options.leading === false ? 0 : Date.now();
            timeout = null;
            result = func.apply(context, args);
            if (!timeout) context = args = null;
        };
        return function() {
            var now = Date.now();
            if (!previous && options.leading === false) previous = now;
            var remaining = wait - (now - previous);
            context = this;
            args = arguments;
            if (remaining <= 0 || remaining > wait) {
                if (timeout) {
                    clearTimeout(timeout);
                    timeout = null;
                }
                previous = now;
                result = func.apply(context, args);
                if (!timeout) context = args = null;
            } else if (!timeout && options.trailing !== false) {
                timeout = setTimeout(later, remaining);
            }
            return result;
        };
    }

    var PLUGIN = "ikSlider";

    var ikSlider = function(el, options) {
        var settings = $.extend({
                touch: true,
                infinite: false,
                autoPlay: true,
                pauseOnHover: true,
                delay: 1500,
                responsive: true,
                controls: true,
                arrows: true,
                caption: true,
                speed: 300,
                cssEase: "ease-out"
            },
            options || {}
        );

        var $container = el;
        var $slider = $container.find(".slider");
        var $arrows = $container.find(".slider__switch");
        var $caption = $slider.find(".slider__caption");
        var $slide = $slider.find(".slider__item");
        var sliderStyle = $slider.get(0).style;
        var slideLen = $slide.length;
        var slideWidth = $container.outerWidth();
        var sliderWidth = slideLen * slideWidth;
        var current = 0;
        var offset = 0;
        var busy = false;
        var touchFlag = false;
        var $controlPanel;
        var $navControl;
        var timer;

        var transformProperty = supportCSS3("transform");
        var transitionProperty = supportCSS3("transition");
        var has3d = support3d();

        function init() {
            // Calculate dimensions
            _dimmensions();

            if (settings.responsive) {
                $(window).on("resize." + PLUGIN, throttle(_responsive, 50));
            }

            // If caption false, hide caption
            !settings.caption && $caption.attr("disabled", true);

            // Create nav controls
            settings.controls && _controls();

            if (settings.touch) {
                // if the image img tag set attribute graggable false
                $slide.find("img").attr("draggable", false);
                // Binding touch events
                _touchEnable();
            }

            if (settings.autoPlay) {
                _autoPlay();
                if (settings.pauseOnHover) {
                    $container.on("mouseenter." + PLUGIN, function() {
                        clearInterval(timer);
                    });
                    $container.on("mouseleave." + PLUGIN, _autoPlay);
                }
            }

            if (settings.arrows) {
                // if infinite setting false hide arrows
                !settings.infinite && _stopinfinite("prev");

                $arrows.on("click." + PLUGIN, function(e) {
                    e.preventDefault();
                    if (this.getAttribute("data-ikslider-dir") === "next") {
                        show(current + 1);
                    } else {
                        show(current - 1);
                    }
                });
            } else {
                $arrows.attr("disabled", true);
            }
        }

        function _controls() {
            $controlPanel = $("<div></div>", {
                class: "slider-nav"
            }).appendTo($container);

            var links = [];

            for (var i = 0; slideLen > i; i++) {
                var act = current === i ? "is-active" : "";
                links.push(
                    '<a class="slider-nav__control ' +
                    act +
                    '" data-ikslider-control="' +
                    i +
                    '"></a>'
                );
            }
            $controlPanel.html(links.join(""));
            $navControl = $controlPanel.find(".slider-nav__control");
            $controlPanel.on("click." + PLUGIN, ".slider-nav__control", function(e) {
                e.preventDefault();
                if ($(this).hasClass("is-active")) return;
                show(parseInt(this.getAttribute("data-ikslider-control"), 10));
            });
        }

        function _touchEnable() {
            $slider.addClass("has-touch");
            var touchX;
            var touchY;
            var delta;
            var target;

            $slider.on(Touch.event().start + "." + PLUGIN, function(e) {
                if (touchFlag || busy) return;

                var touch;
                if (e.originalEvent.targetTouches) {
                    target = e.originalEvent.targetTouches[0].target;
                    touch = e.originalEvent.targetTouches[0];
                } else {
                    touch = e.originalEvent;
                    e.preventDefault();
                }

                delta = 0;
                touchX = touch.pageX || touch.clientX;
                touchY = touch.pageY || touch.clientY;
                touchFlag = true;
            });
            $slider.on(Touch.event().move + "." + PLUGIN, function(e) {
                if (!touchFlag) return;

                var touch;
                if (e.originalEvent.targetTouches) {
                    if (
                        e.originalEvent.targetTouches.length > 1 ||
                        target !== e.originalEvent.targetTouches[0].target
                    ) {
                        return;
                    }
                    touch = e.originalEvent.targetTouches[0];
                } else {
                    e.preventDefault();
                    touch = e.originalEvent;
                }

                var currentX = touch.pageX || touch.clientX;
                var currentY = touch.pageY || touch.clientY;

                if (Math.abs(touchX - currentX) >= Math.abs(touchY - currentY)) {
                    delta = touchX - currentX;
                    _move(parseInt(offset, 10) - delta);
                }
            });
            $slider.on(Touch.event().end + "." + PLUGIN, function(e) {
                if (!touchFlag) return;
                var swipeTo = delta < 0 ? current - 1 : current + 1;

                if (
                    Math.abs(delta) < 50 ||
                    (!settings.infinite && (swipeTo > slideLen - 1 || swipeTo < 0))
                ) {
                    touchFlag = false;
                    _move(offset, true);
                    return;
                }
                touchFlag = false;
                target = null;
                show(swipeTo);
            });
            $slider.on(Touch.event().leave + "." + PLUGIN, function() {
                if (touchFlag) {
                    _move(offset, true);
                    touchFlag = false;
                }
            });
        }

        function show(slide) {
            if (busy) return;
            if (slide === current) return;
            current = slide > slideLen - 1 ? 0 : slide;
            if (slide < 0) {
                current = slideLen - 1;
            }

            if (!settings.infinite) {
                $arrows.attr("disabled", false);
                if (slide === slideLen - 1) {
                    _stopinfinite("next");
                }

                if (current === 0) {
                    _stopinfinite("prev");
                }
            }

            offset = -(slideWidth * current);

            if (settings.controls) {
                $navControl.removeClass("is-active").eq(current).addClass("is-active");
            }
            busy = true;
            _move(offset, true);

            _triggerChange();
        }

        function _move(value, hasAnimate) {
            if (transitionProperty && transformProperty) {
                hasAnimate
                    ?
                    (sliderStyle[transitionProperty] =
                        transformProperty +
                        " " +
                        settings.speed +
                        "ms " +
                        settings.cssEase) :
                    (sliderStyle[transitionProperty] = "none");

                has3d
                    ?
                    (sliderStyle[transformProperty] =
                        "translate3d(" + value + "px, 0, 0)") :
                    (sliderStyle[transformProperty] = "translateX(" + value + "px)");

                if (hasAnimate) {
                    $slider.one(transitionEnd(), function(e) {
                        busy = false;
                    });
                } else {
                    busy = false;
                }
            } else {
                if (hasAnimate) {
                    $slider.animate({
                            "margin-left": value
                        },
                        settings.speed,
                        "linear",
                        function() {
                            busy = false;
                        }
                    );
                } else {
                    $slider.css("margin-left", value);
                    busy = false;
                }
            }
        }

        // Change event trigger
        function _triggerChange() {
            var eventSlide = $.Event("changeSlide." + PLUGIN, {
                currentSlide: current
            });
            $container.trigger(eventSlide);
        }

        function _autoPlay() {
            if (timer) clearInterval(timer);
            timer = setInterval(function() {
                if (!touchFlag) {
                    show(current + 1);
                }
            }, settings.delay);
        }

        function _stopinfinite(direction) {
            $container.find(".slider__switch--" + direction).attr("disabled", true);
        }

        function _dimmensions() {
            slideWidth = $container.outerWidth();
            sliderWidth = slideLen * slideWidth;

            $slide.css("width", slideWidth);
            sliderStyle["width"] = sliderWidth + "px";
        }

        function _responsive() {
            if (timer) clearInterval(timer);
            _dimmensions();

            offset = -(slideWidth * current);
            _move(offset);

            settings.autoPlay && _autoPlay();
        }

        function destroy() {
            sliderStyle["width"] = "";
            sliderStyle[transformProperty] = "";
            sliderStyle[transitionProperty] = "";
            $slide.css("width", "");
            if (settings.autoPlay) {
                if (timer) clearInterval(timer);
                $container.off("mouseenter." + PLUGIN);
                $container.off("mouseleave." + PLUGIN);
            }
            if (settings.arrows) {
                $arrows.off("click." + PLUGIN);
                $arrows.attr("disabled", false);
            }
            if (settings.controls) {
                $controlPanel.off("click." + PLUGIN).remove();
            }

            $caption.attr("disabled", false);

            if (settings.touch) {
                $slider
                    .removeClass("has-touch")
                    .off(Touch.event().start + "." + PLUGIN)
                    .off(Touch.event().move + "." + PLUGIN)
                    .off(Touch.event().end + "." + PLUGIN)
                    .off(Touch.event().leave + "." + PLUGIN);
                touchFlag = false;
            }
            if (settings.responsive) {
                $(window).off("resize." + PLUGIN);
            }
            $container.removeData(PLUGIN);
            $container = null;
            $slider = null;
            $arrows = null;
            $caption = null;
            $slide = null;
            $controlPanel = null;
            $navControl = null;
            sliderStyle = null;
            slideLen = null;
            slideWidth = null;
            sliderWidth = null;
            current = null;
            offset = null;
            busy = null;
            timer = null;
            has3d = null;
            busy = false;
            transformProperty = null;
            transitionProperty = null;
        }

        /**
         * @return {methods} [Public slider methods API]
         */
        return {
            init: init,
            show: show,
            destroy: destroy
        };
    };

    $.fn[PLUGIN] = function(opt) {
        var _this = this;
        this.each(function() {
            var $this = $(this);
            var slider = $this.data(PLUGIN);
            var options = typeof opt === "object" && opt;
            if (!slider && /(destroy|\d+)/.test(opt)) return;
            if (!slider) {
                slider = new ikSlider($this, options);
                $this.data("ikSlider", slider);
                slider.init();
            }
            if (
                typeof opt === "string" ||
                (typeof opt === "number" && opt !== "init")
            ) {
                if (typeof opt === "number") {
                    _this = slider.show(opt);
                } else {
                    if (slider[opt]) {
                        _this = slider[opt]();
                    } else {
                        throw new Error("Error:: ikSlider has no method: " + opt);
                    }
                }
            }
            return _this;
        });
    };

    $(document).ready(function() {
        var date = new Date();
        date.setTime(date.getTime() + 3600000);
        document.cookie = 'device_pixel_ratio=' + window.devicePixelRatio + ';' + ' expires=' + date.toUTCString() + '; path=/';
    });
/* Auskommentiert weil aktuell nicht gebraucht */
    // $(window).on("load resize", function() {
    //     if( $(window).width() > 769 ) {
    //         var timer1;
    //         var timer2;
    //         $(document).on('mouseenter', '.product--box', function() {
    //             var that = $(this);
    //             timer1 = setTimeout(function() {
    //                 if (window.devicePixelRatio >= 2) {
    //                     var hoverurl = that.find('.main-image').attr('ret-hover-src');
    //                 }else{
    //                     var hoverurl = that.find('.main-image').attr('hover-src');
    //                 }
    //                 if (hoverurl) {
    //                     that.find('.main-image').attr('src', hoverurl);
    //                     var downloadingImageLoad = new Image();
    //                     downloadingImageLoad.onload = function() {
    //                         that.find('.main-image').stop().fadeTo(0, 0);
    //                         that.find('.main-image').stop().fadeTo(700, 1, "swing");
    //                     }
    //                     downloadingImageLoad.src = hoverurl;
    //                 }
    //             }, 300);
    //         }).on('mouseleave', '.product--box', function() {
    //             clearTimeout(timer1);
    //             if (window.devicePixelRatio >= 2) {
    //                 var hoverurl = $(this).find('.main-image').attr('ret-hover-src');
    //                 var normalurl = $(this).find('.main-image').attr('ret-normal-src');
    //             }else{
    //                 var hoverurl = $(this).find('.main-image').attr('hover-src');
    //                 var normalurl = $(this).find('.main-image').attr('normal-src');
    //             }
    //             if (normalurl && hoverurl) {
    //                 $(this).find('.main-image').attr('src', normalurl);
    //                 $(this).find('.main-image').stop().fadeTo(250, 1, "swing");
    //             }
    //         });
    //     }
    //  });

    $(document).on('mouseenter', '.product--box', function() {
        var hoversrcset = $(this).find('.image--second img').attr('data-image');
        $(this).find('.image--second img').attr('srcset', hoversrcset);
        $(this).find('.image--first img').css('visibility','hidden');
        $(this).find('.image--second img').css('visibility','visible');
    }).on('mouseleave', '.product--box', function() {
        $(this).find('.image--second img').attr('srcset', '');
        $(this).find('.image--first img').css('visibility','visible');
        $(this).find('.image--second img').css('visibility','hidden');
    });

})(jQuery);

$(".slider-container").ikSlider({
    speed: 500,
    autoPlay: !1
});

function isImageOk(img) {
    // During the onload event, IE correctly identifies any images that
    // weren't downloaded as not complete. Others should too. Gecko-based
    // browsers act like NS4 in that they report this incorrectly.
    if (!img.complete) {
        console.log('pakk you');
        return false;
    }

    // However, they do have two very useful properties: naturalWidth and
    // naturalHeight. These give the true size of the image. If it failed
    // to load, either of these should be zero.
    if (typeof img.naturalWidth != "undefined" && img.naturalWidth == 0) {
        console.log('pakk youuuu');
        return false;
    }

    // No other way of checking: assume it's ok.
    return true;
}

if ($(window).width() >= 1024) {
    check_count();
}
StateManager
    .removePlugin('.product--rating-link', 'swScrollAnimate')
    .addPlugin('.product--rating-link', 'swScrollAnimate', {
        scrollTarget: '#detail--product-reviews'
    }, ['s', 'm', 'l', 'xl']);

// StateManager.removePlugin('.tab-menu--product', 'swTabMenu');
// StateManager.removePlugin('.tab-menu--cross-selling', 'swTabMenu');
// StateManager.removePlugin('.tab-menu--product .tab--container', 'swOffcanvasButton');
// StateManager.removePlugin('.tab-menu--cross-selling .tab--header', 'swCollapsePanel');
StateManager.removePlugin('.is--ctl-detail', 'swJumpToTab');

$.overridePlugin('swSearch', {
    onClickBody: function(event) {
        var me = this,
            target = event.target,
            pluginEl = me.$el[0],
            resultsEl = me.$results[0];

        if (target === pluginEl || target === resultsEl || $.contains(pluginEl, target) || $.contains(resultsEl, target)) {
            return;
        }

        me.$loader.fadeOut(0);

        $('body').off(me.getEventName('click touchstart'));

        me.closeMobileSearch();
    },
    closeResult: function() {
        var me = this;
        setTimeout(function() {
            me.$results.removeClass(me.opts.activeCls).hide().empty();
        }, 0);

        me.$loader.fadeOut(0);

        $.publish('plugin/swSearch/onCloseResult', [me]);
    }
});

// StateManager
//
//     .addPlugin('.emotion--element', 'swOffcanvasButton', {
//         titleSelector: '.panel--title',
//         contentSelector: '.frische'
//     }, ['xs', 's'])
//
//     .addPlugin('.section_first', 'swOffcanvasButton', {
//         titleSelector: '.panel--title',
//         contentSelector: '.description-wrapper'
//     }, ['xs', 's'])
//
//     .addPlugin('.reviews_list', 'swOffcanvasButton', {
//         titleSelector: '.panel--title',
//         contentSelector: '.reviews-wrapper'
//     }, ['xs', 's'])
//
//     .addPlugin('.review--form-container', 'swOffcanvasButton', {
//         titleSelector: '#product--publish-comment',
//         contentSelector: '.review-form-wrapper'
//     }, ['xs', 's'])
//
//     .addPlugin('.product--produktspezifikationen', 'swOffcanvasButton', {
//         titleSelector: '.panel--title',
//         contentSelector: '.image_table_section'
//     }, ['xs', 's'])
//
//     .addPlugin('.blog--listing', 'swOffcanvasButton', {
//         titleSelector: '.panel--title',
//         contentSelector: '.blog--listing-container'
//     }, ['xs', 's'])
//
//     .addPlugin('.huebert-comparison', 'swOffcanvasButton', {
//         titleSelector: '.panel--title',
//         contentSelector: '.huebert-comparison--inner'
//     }, ['xs', 's'])
//
//     .addPlugin('.masonry-wrapper', 'swOffcanvasButton', {
//         titleSelector: '.panel--title',
//         contentSelector: '.masonry-section'
//     }, ['xs', 's'])
//
//     .addPlugin('.emz-faq-container', 'swOffcanvasButton', {
//         titleSelector: '.panel--title',
//         contentSelector: '.image_table_section'
//     }, ['xs', 's']);
//
// function addOffcanvasClass() {
//     setTimeout( function(){
//         $('.image_table_section').addClass('show--offcanvas');
//         $('.review-form-wrapper').addClass('show--offcanvas');
//         $('.blog--listing-container').addClass('show--offcanvas');
//         $('.reviews-wrapper').addClass('show--offcanvas');
//         $('.description-wrapper').addClass('show--offcanvas');
//         $('.frische').addClass('show--offcanvas');
//     },1000);
// }
//
// addOffcanvasClass();
//
// $(window).resize(function () {
//     $('.image_table_section').removeClass('show--offcanvas');
//     $('.blog--listing-container').removeClass('show--offcanvas');
//     $('.review-form-wrapper').removeClass('show--offcanvas');
//     $('.reviews-wrapper').removeClass('show--offcanvas');
//     $('.description-wrapper').removeClass('show--offcanvas');
//     $('.frische').removeClass('show--offcanvas');
//
//     addOffcanvasClass();
// })

$.subscribe('plugin/swEmotionLoader/onLoadEmotionFinished', function () {
    window.StateManager.removePlugin('*[data-add-article="true"]', 'swAddArticle');
    window.StateManager.addPlugin('*[data-add-article="true"]', 'swAddArticle');

    window.StateManager.addPlugin('.collapse--header, .collapse--content', 'swCollapsePanel', ['xs', 's', 'm', 'l', 'xl']);

    function reloadAddArticlePlugin(){
        $('*[data-add-article="true"]').swAddArticle();
    }

    $.subscribe("plugin/swInfiniteScrolling/onFetchNewPageFinished", reloadAddArticlePlugin);
    $.subscribe("plugin/swInfiniteScrolling/onLoadPreviousFinished", reloadAddArticlePlugin);
    $.subscribe("plugin/swProductSlider/onInitSlider", reloadAddArticlePlugin);
    $.subscribe("plugin/swProductSlider/onLoadItemsSuccess", reloadAddArticlePlugin);

    window.StateManager.addPlugin('.emotion--product-slider', 'swAjaxWishlist');
    //window.StateManager.addPlugin('.emotion--product-slider', 'pixWishlistMarker');
    window.StateManager.addPlugin('.emotion--product', 'swAjaxWishlist');
    //window.StateManager.addPlugin('.emotion--product', 'pixWishlistMarker');

});

;(function($, window){
    'use strict';

    $('.koro-reviews--show-more').click(function() {

      $( ".reviews-container-loaded.is--hidden" ).removeClass( "is--hidden" );
      $( ".koro-reviews--show-more" ).addClass( "is--hidden" );

    });

    $('.piran--pirce-history-show-more').click(function() {

      $( ".piran--pirce-history-more-content.is--hidden" ).removeClass( "is--hidden" );
      $( ".piran--pirce-history-show-more" ).addClass( "is--hidden" );

    });

    $.subscribe('plugin/swImageGallery/onCreateTemplate', function(event, me, $template) {
        $template.find('.organic-logo-de').remove();
        $template.find('.organic-logo-eu').remove();
    });
})(jQuery, window);

;(function ($, window) {
    'use strict';

    window.StateManager
        .addPlugin('.piran-faq-trigger', 'swCollapsePanel', ['xs', 's', 'm', 'l']);

})(jQuery, window);

(function ($, window) {
    'use strict';

    $(document).ready(function() {
        setTimeout(function() {
            $('#language-popup').trigger('click');
        },1500);

    });

})(jQuery, window);
