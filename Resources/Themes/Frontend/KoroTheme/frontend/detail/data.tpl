{extends file="parent:frontend/detail/data.tpl"}

{* Price - Starting from *}
{block name='frontend_detail_data_price_configurator_starting_from_content'}
    <span class="price--content content--starting-from">
        {s name="DetailDataInfoFrom"}{/s} {$sArticle.priceStartingFrom|currencyansgar} {s name="Star" namespace="frontend/listing/box_article"}{/s}
    </span>
{/block}

{* Regular price *}
{block name='frontend_detail_data_price_default'}
    <span class="price--content content--default">
        <meta itemprop="price" content="{$sArticle.price|replace:',':'.'}">
        {if $sArticle.priceStartingFrom}{s name='ListingBoxArticleStartsAt' namespace="frontend/listing/box_article"}{/s} {/if}{$sArticle.price|currencyansgar} {s name="Star" namespace="frontend/listing/box_article"}{/s}
    </span>
{/block}

{* Uses Box Articles Built to Differentiate Colors | Piran, 09.18 *}
{block name='frontend_detail_data_price'}
    <div class='price-tax--wrapper'>
        <div class='product--price price--unit'>

            {* Unit price label *}
            {block name='frontend_detail_data_price_unit_label'}
                <span class="price--label label--purchase-unit">
                        {s name="DetailDataInfoContent"}{/s}
                </span>
            {/block}

            {* Unit price content *}
            {block name='frontend_detail_data_price_unit_content'}
                {$sArticle.purchaseunit} {$sArticle.sUnit.description}
            {/block}

            {* Unit price is based on a reference unit *}
            {if $sArticle.purchaseunit && $sArticle.purchaseunit != $sArticle.referenceunit}

                <span class="is--unit-price is--nowrap">
                    | {$sArticle.referenceprice|currency}
                      {s name="UnitPriceSeperator"}je{/s}{if $sArticle.referenceunit != 1} {$sArticle.referenceunit}{/if} {$sArticle.sUnit.description}
                </span>
            {/if}
        </div>
        <p class="product--tax" data-content="" data-modalbox="true" data-targetSelector="a" data-mode="ajax">
            {s name="DetailDataPriceInfo"}{/s}
        </p>
    </div>
{/block}

{block name='frontend_detail_data_pseudo_price_discount_icon'}
{/block}

{block name='frontend_detail_data_pseudo_price_discount_content_percentage'}
{/block}

{* Tax information *}
{block name='frontend_detail_data_tax'}
{/block}

{block name="frontend_detail_data_delivery"}
{/block}
