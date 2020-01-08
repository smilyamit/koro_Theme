{extends file="parent:frontend/listing/product-box/product-price-unit.tpl"}

{namespace name="frontend/listing/box_article"}

{* Arrange Reference Price with Pipe Sign | Piran 09.18 *}
{block name='frontend_listing_box_article_unit_reference_content'}
    <span class="is--unit-price is--nowrap">
        | {$sArticle.referenceprice|currency}
        {s name="Star"}{/s} {s name="UnitPriceSeperator"}je{/s}{if $sArticle.referenceunit != 1} {$sArticle.referenceunit}{/if} {$sArticle.sUnit.description}
    </span>
{/block}
