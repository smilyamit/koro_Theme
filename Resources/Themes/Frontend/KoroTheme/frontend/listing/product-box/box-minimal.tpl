{extends file="parent:frontend/listing/product-box/box-minimal.tpl"}

{namespace name="frontend/listing/box_article"}

{* Product description *}
{block name='frontend_listing_box_article_description'}

{/block}
{block name='frontend_listing_box_article_price_info' append}
    <div class="price--unit">
        <span>{s name="SternchenPreisVatHinweis"}{/s}</span>
    </div>
{/block}
