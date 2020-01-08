{extends file="parent:frontend/detail/emotion-buy-modal.tpl"}

{block name='frontend_detail_index_data'}
    {if $sArticle.sBlockPrices}
        {$lowestPrice=false}
        {$highestPrice=false}
        {foreach $sArticle.sBlockPrices as $blockPrice}
            {if $lowestPrice === false || $blockPrice.price < $lowestPrice}
                {$lowestPrice=$blockPrice.price}
            {/if}
            {if $highestPrice === false || $blockPrice.price > $highestPrice}
                {$highestPrice=$blockPrice.price}
            {/if}
        {/foreach}

        <meta itemprop="lowPrice" content="{$lowestPrice}" />
        <meta itemprop="highPrice" content="{$highestPrice}" />
        <meta itemprop="offerCount" content="{$sArticle.sBlockPrices|count}" />
    {else}
        <meta itemprop="priceCurrency" content="{$Shop->getCurrency()->getCurrency()}"/>
    {/if}
{/block}

{* Product description *}
{block name='frontend_listing_box_article_description'}
    {if {config name='swkweEmotionArticleBuyModalDisplayDescription'}}
        <p class="product--short-desc">
            {$sArticle.description|strip_tags|truncate:240}
        </p>
        {if $millArticleAdvantagesShowTop}
          {include file="frontend/common/advantages.tpl"}
        {/if}
    {/if}
    {include file="frontend/detail/data.tpl" sArticle=$sArticle sView=1}
{/block}

{* Include buy button and quantity box *}
{block name="frontend_detail_index_buybox"}
    {include file="frontend/detail/buy.tpl"}
    <nav class="product--actions">
        {include file="frontend/detail/actions-modal.tpl"}
    </nav>
{/block}

{* Product actions *}
{block name="frontend_detail_index_actions"}{/block}
