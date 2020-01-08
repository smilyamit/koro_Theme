{extends file="parent:frontend/listing/box_article.tpl"}

{block name="frontend_listing_box_article_includes"}

    {if $productBoxLayout == 'minimal'}
        {include file="frontend/listing/product-box/box-emotion.tpl" productBoxLayout="minimal"}

    {elseif $productBoxLayout == 'image'}
        {include file="frontend/listing/product-box/box-emotion.tpl" productBoxLayout="minimal"}

    {elseif $productBoxLayout == 'slider'}
        {include file="frontend/listing/product-box/box-emotion-slider.tpl" productBoxLayout="minimal"}

    {elseif $productBoxLayout == 'emotion'}
        {include file="frontend/listing/product-box/box-emotion.tpl" productBoxLayout="minimal"}
    {elseif $productBoxLayout == 'list'}
        {include file="frontend/listing/product-box/box-emotion.tpl" productBoxLayout="minimal"}

    {else}
        {block name="frontend_listing_box_article_includes_additional"}
            {include file="frontend/listing/product-box/box-emotion.tpl" productBoxLayout="minimal"}
        {/block}
    {/if}
{/block}
