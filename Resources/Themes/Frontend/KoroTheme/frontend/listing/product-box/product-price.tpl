{extends file="parent:frontend/listing/product-box/product-price.tpl"}

{* Default price *}
{block name='frontend_listing_box_article_price_default'}
    <span class="price--default is--nowrap{if $sArticle.has_pseudoprice} is--discount{/if}">
        {if $sArticle.priceStartingFrom}{s name='ListingBoxArticleStartsAt'}{/s} {/if}
        {$sArticle.price|currencyansgar}
        {s name="Star"}{/s}
    </span>
{/block}