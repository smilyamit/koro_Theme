{block name="frontend_detail_index_similar_viewed"}
    {if $viewedArticles}
        {block name="frontend_detail_index_similar_viewed_slider"}
            <div class="viewed--content">
                <div class="panel--title is--underline also_bought product-slider--title pre-headline">
                    {s namespace="frontend/detail/index" name='DetailRecommendationAlsoSeenLabel'}Zuletzt angesehen{/s}
                </div>
                <div class="panel--title is--underline also_bought product-slider--title headline">
                    {s namespace="frontend/detail/index" name='DetailRecommendationAlsoSeenLabelHeadline'}Was Dir gefallen könnte{/s}
                    <a href="{s namespace="frontend/detail/index" name='DetailRecommendationsShowAllLink'}/ueberblick/{/s}" class="show-all--button">
                      {s namespace="frontend/detail/index" name='DetailRecommendationsShowAllName'}Überblick{/s} →
                    </a>
                </div>
                {include file="frontend/_includes/product_slider.tpl" articles=$viewedArticles sliderInitOnEvent="onShowContent-alsoviewed"}
            </div>
        {/block}
    {/if}
{/block}
