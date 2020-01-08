{extends file="parent:frontend/listing/product-box/box-emotion.tpl"}

{namespace name="frontend/listing/box_article"}

{block name="frontend_listing_box_article"}

    <div class="product--box box--emotion {if $productBoxLayout == 'minimal' || $productBoxLayout == 'basic'}box--minimal{/if}" data-ordernumber="{$sArticle.ordernumber}">

        {block name="frontend_listing_box_article_content"}
            <div class="box--content">

                {block name='frontend_listing_box_article_actions_save'}
                  <div class="piran--wishlist-container">
                      <form action="{url controller='note' action='add' ordernumber=$sArticle.ordernumber _seo=false}" method="post">
                          {s name="DetailLinkNotepad" namespace="frontend/detail/actions" assign="snippetDetailLinkNotepad"}{/s}
                          <button type="submit"
                             title="{$snippetDetailLinkNotepad|escape}"
                             class="product--action action--note"
                             data-ajaxUrl="{url controller='note' action='ajaxAdd' ordernumber=$sArticle.ordernumber _seo=false}"
                             data-text="{s name="DetailNotepadMarked"}{/s}">
                              <i class="icon--heart"></i>
                          </button>
                      </form>
                  </div>
                {/block}

                {if !$imageOnly}
                    {include file="frontend/listing/product-box/product-badges.tpl"}
                {/if}

                {block name='frontend_listing_box_article_info_container'}
                    <div class="product--info">

                        {* Product image *}
                        {block name='frontend_listing_box_article_picture'}
                            <a href="{$sArticle.linkDetails}"
                               title="{$sArticle.articleName|escapeHtml}"
                               class="product--image{if $imageOnly} is--large{/if}">

                                {block name='frontend_listing_box_article_image_element'}

                                    {* <span class="image--element"> *}

                                        {block name='frontend_listing_box_article_image_media'}
                                            <span class="image--media">

                                                {block name='frontend_listing_box_article_image_picture'}

                                                    {if $imageOnly && $sArticle.hover_image.src.0}

                                                        {$baseSource = $sArticle.hover_image.src.0}
                                                        {$retBaseSource = $sArticle.hover_image.src.3}

                                                        {if $itemCols && $emotion.grid.cols && !$fixedImageSize}
                                                            {$colSize = 100 / $emotion.grid.cols}
                                                            {$itemSize = "{$itemCols * $colSize}vw"}
                                                        {else}
                                                            {$itemSize = "300px"}
                                                        {/if}

                                                        {$desc = $sArticle.articleName|escape}

                                                        {if $sArticle.image.description}
                                                            {$desc = $sArticle.image.description|escape}
                                                        {/if}

                                                        <picture>
                                                            <source sizes="(max-width: 30em) {$itemSize}, 100vw" srcset="{$baseSource}" media="(-webkit-max-device-pixel-ratio: 1.9),(max-resolution: 191dpi)" />
                                                            <source sizes="(max-width: 30em) {$itemSize}, 100vw" srcset="{$retBaseSource}" media="(-webkit-min-device-pixel-ratio: 2),(min-resolution: 192dpi)" />
                                                            <img alt="{$desc}" title="{$desc|truncate:160}" />
                                                        </picture>

                                                    {else}

                                                        {if $sArticle.image.thumbnails}

                                                            {$baseSource = $sArticle.image.thumbnails[0].source}
                                                            {$retBaseSource = $sArticle.image.thumbnails[0].retinaSource}

                                                            {$itemSize = "300px"}

                                                            {foreach $sArticle.image.thumbnails as $key => $image}
                                                                {$srcSet = "{if $image@index !== 0}{$srcSet}, {/if}{$image.source} {$image.maxWidth}w"}

                                                                {if $image.retinaSource}
                                                                    {$srcSetRetina = "{if $image@index !== 0}{$srcSetRetina}, {/if}{$image.retinaSource} {$image.maxWidth}w"}
                                                                {/if}
                                                            {/foreach}
                                                        {elseif $sArticle.image.source}
                                                            {$baseSource = $sArticle.image.source}
                                                            {$retBaseSource = $sArticle.image.source}
                                                        {else}
                                                            {$baseSource = "{link file='frontend/_public/src/img/no-picture.jpg'}"}
                                                            {$retBaseSource = "{link file='frontend/_public/src/img/no-picture.jpg'}"}
                                                        {/if}

                                                        {$desc = $sArticle.articleName|escape}

                                                        {if $sArticle.image.description}
                                                            {$desc = $sArticle.image.description|escape}
                                                        {/if}

                                                        {if $sArticle.image.thumbnails}
                                                            <picture>
                                                                {if $srcSet}<source sizes="{$itemSize}" srcset="{$srcSet}" media="(-webkit-max-device-pixel-ratio: 1.9),(max-resolution: 191dpi)" />{/if}
                                                                {if $srcSetRetina}<source sizes="{$itemSize}" srcset="{$srcSetRetina}" media="(-webkit-min-device-pixel-ratio: 2),(min-resolution: 192dpi)" />{/if}
                                                                <img alt="{$desc}" title="{$desc|truncate:160}" />
                                                            </picture>
                                                        {else}
                                                            <picture>
                                                                <source sizes="{$itemSize}" srcset="{$baseSource}" media="(-webkit-max-device-pixel-ratio: 1.9),(max-resolution: 191dpi)" />
                                                                <source sizes="{$itemSize}" srcset="{$retBaseSource}" media="(-webkit-min-device-pixel-ratio: 2),(min-resolution: 192dpi)" />
                                                                <img alt="{$desc}" title="{$desc|truncate:160}" />
                                                            </picture>
                                                        {/if}

                                                    {/if}

                                                {/block}
                                            </span>
                                        {/block}
                                    {* </span> *}
                                {/block}
                            </a>
                        {/block}

                        {if !$imageOnly}
                            <div class="product--details">

                                {* Product name *}
                                {block name='frontend_listing_box_article_name'}
                                    {* Customer rating for the product *}
                                    {block name='frontend_listing_box_article_rating'}
                                        {if $sArticle.sVoteAverage.average}
                                        <div class="product--rating-container">
                                            <a href="{$sArticle.linkDetails}#detail--product-reviews">
                                                {if $sArticle.sVoteAverage.average}
                                                    {include file='frontend/_includes/rating.tpl' points=$sArticle.sVoteAverage.average type="aggregated" label=false microData=false}
                                                {/if}
                                                {if $sArticle.sVoteAverage.count}
                                                    {block name="frontend_detail_tabs_rating_title_count"}
                                                        <span class="product--rating-count">({$sArticle.sVoteAverage.count})</span>
                                                    {/block}
                                                {/if}
                                            </a>
                                        </div>
                                        {/if}
                                    {/block}

                                    <a href="{$sArticle.linkDetails}"
                                       class="product--title"
                                       title="{$sArticle.articleName|escapeHtml}">
                                        {$sArticle.articleName|piran_rtrim:'|'|truncate:50|escapeHtml}
                                    </a>
                                {/block}


                                {block name='frontend_listing_box_article_price_info'}
                                    <div class="price-container">
                                        <div class="product--price-info">
                                            {* Product price - Default and discount price *}

                                            {* Product price - Default and discount price *}
                                            {block name='frontend_listing_box_article_price'}
                                                {include file="frontend/listing/product-box/product-price.tpl"}
                                            {/block}
                                        </div>

                                            {block name='frontend_listing_box_article_price'}
                                                {include file="frontend/plugins/instant_warenkorb/instant_warenkorb.tpl"}
                                            {/block}
                                    </div>

                                    {block name='frontend_listing_box_article_unit_label'}
                                    {/block}

                                        <div class="product--unit-price-info">
                                            {* Product price - Unit price *}
                                            {block name='frontend_listing_box_article_unit'}
                                                {include file="frontend/listing/product-box/product-price-unit.tpl"}
                                            {/block}
                                        </div>

                                    <span class="product-price-tax" data-content="" data-modalbox="true" data-targetSelector="a" data-mode="ajax">
                                        <p class="tax-info">{s name="SternchenPreisVatHinweis"}{/s}</p>
                                    </span>

                                {/block}
                            </div>
                        {/if}
                    </div>
                {/block}
            </div>
        {/block}
    </div>
{/block}

{* Product name *}
