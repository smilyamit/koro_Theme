{extends file="parent:frontend/plugins/index/delivery_informations.tpl"}

{* Delivery informations *}
{block name='frontend_widgets_delivery_infos'}
    <div class="product--delivery">
        {if $sArticle.shippingfree || ($sArticle.additional_details.attributes.core && $sArticle.additional_details.attributes.core->get('attr16'))}
            <p class="delivery--information">
                <span class="delivery--text delivery--text-shipping-free">
                    <i class="delivery--status-icon delivery--status-shipping-free"></i>
                    {s name="DetailDataInfoShippingfree"}{/s}
                </span>
            </p>
        {/if}
        {if $sArticle.ordernumber != "BOX_001" && $sArticle.ordernumber != "BOX_002" && $sArticle.ordernumber != "BOX_003"}
            {if isset($sArticle.active) && !$sArticle.active}
                <link itemprop="availability" href="http://schema.org/LimitedAvailability" />
                <p class="delivery--information">
                <span class="delivery--text  delivery--text-not-available">
                    <i class="delivery--status-icon delivery--status-not-available"></i>
                    {s name="DetailDataInfoNotAvailable"}{/s}
                </span>
                </p>
            {elseif $sArticle.sReleaseDate && $sArticle.sReleaseDate|date_format:"%Y%m%d" > $smarty.now|date_format:"%Y%m%d"}
                <link itemprop="availability" href="http://schema.org/PreOrder" />
                <p class="delivery--information">
                <span class="delivery--text delivery--text-more-is-coming">
                    <i class="delivery--status-icon delivery--status-more-is-coming"></i>
                    {s name="DetailDataInfoShipping"}{/s} {$sArticle.sReleaseDate|date:'date_long'}
                </span>
                </p>
            {elseif $sArticle.esd}
                <link itemprop="availability" href="http://schema.org/InStock" />
                <p class="delivery--information">
                <span class="delivery--text delivery--text-available">
                    <i class="delivery--status-icon icon--download"></i>
                    {s name="DetailDataInfoInstantDownload"}{/s}
                </span>
                </p>
            {elseif {config name="instockinfo"} && $sArticle.modus == 0 && $sArticle.instock > 0 && $sArticle.quantity > $sArticle.instock}
                <link itemprop="availability" href="http://schema.org/LimitedAvailability" />
                <p class="delivery--information">
                <span class="delivery--text delivery--text-more-is-coming">
                    <i class="delivery--status-icon delivery--status-more-is-coming"></i>
                    {s name="DetailDataInfoPartialStock"}{/s}
                </span>
                </p>
            {elseif $sArticle.instock >= $sArticle.minpurchase}
                <link itemprop="availability" href="http://schema.org/InStock" />
                <p class="delivery--information">
                <p class="delivery--text delivery--text-available">
                  <i class="icon--truck piran--delivery-icon"></i>
                    {block name="frontend_widgets_delivery_infos_instock"}
                        {s name="DetailDataInfoInstock"}{/s}
                    {/block}
                </p>
                </p>
            {elseif $sArticle.shippingtime}
                {if $sArticle.shippingtime != "XXX"}
                    <link itemprop="availability" href="http://schema.org/LimitedAvailability" />
                    <p class="delivery--information">
                      <span class="delivery--text delivery--text-more-is-coming">
                    <i class="delivery--status-icon delivery--status-more-is-coming"></i>
                    {s name="DetailDataShippingtime"}{/s} {$sArticle.shippingtime} {s name="DetailDataShippingDays"}{/s}
                </span>
                    </p>
                {/if}
            {else}
                {* Bei bestimmten Produkten soll nicht "Zur Zeit leider nicht verfügbar" nicht angezeigt werden | Anforderung v. Kosta 18.06.2019 *}
                {if $sArticle.ordernumber != "KOKOS_003" && $sArticle.ordernumber != "MEDJO_005" && $sArticle.ordernumber != "GESCHENK_050" && $sArticle.ordernumber != "GESCHENK_100" && $sArticle.ordernumber != "GESCHENK_030" && $sArticle.ordernumber != "GESCHENK_015"  && $sArticle.ordernumber != "ADVENT_025"}
                    <link itemprop="availability" href="http://schema.org/LimitedAvailability" />
                    <p class="delivery--information">
                    <p class="delivery--text delivery--text-not-available" data-content="" data-modalbox="true" data-targetselector="a" data-mode="ajax">
                        {s name="DetailDataNotAvailable"}{config name=notavailable}{/s}
                    </p>
                    </p>
                {/if}
            {/if}
        {/if}
    </div>
{/block}
