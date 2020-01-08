{block name="frontend_detail_index_also_bought"}
    {if $boughtArticles}
        {block name="frontend_detail_index_also_bought_slider"}
        {assign "excludeBoughtAlsoButton" "1"}
            <div class="bought--content panel--body">
              <div class="panel--title is--underline also_bought product-slider--title pre-headline">
                {s namespace="frontend/detail/index" name='DetailRecommendationAlsoBoughtLabel'}Empfehlungen{/s}
              </div>
                <div class="panel--title is--underline also_bought product-slider--title headline">
                    {s namespace="frontend/detail/index" name='DetailRecommendationAlsoBoughtLabelHeadline'}Bei anderen beliebt{/s}
                    <a href="{s namespace="frontend/detail/index" name='DetailRecommendationsShowAllLink'}/ueberblick/{/s}" class="show-all--button">
                      {s namespace="frontend/detail/index" name='DetailRecommendationsShowAllName'}Überblick{/s} →
                    </a>
                </div>
                {include file="frontend/_includes/product_slider.tpl" articles=$boughtArticles sliderInitOnEvent="onShowContent-alsobought"}
            </div>
        {assign "excludeBoughtAlsoButton" "0"}
        {/block}
    {/if}
{/block}
