{extends file='parent:frontend/detail/index.tpl'}
{* Template detail.tpl | www.actualize.de | 07/2017 *}

{block name='frontend_index_breadcrumb_inner'}{/block}

{block name='frontend_index_content'}
    <div class="content product--details single_product" itemscope itemtype="http://schema.org/Product"{if !{config name=disableArticleNavigation}} data-product-navigation="{url module="widgets" controller="listing" action="productNavigation"}" data-category-id="{$sArticle.categoryID}" data-main-ordernumber="{$sArticle.mainVariantNumber}"{/if} data-ajax-wishlist="true" data-compare-ajax="true"{if $theme.ajaxVariantSwitch} data-ajax-variants-container="true"{/if}>
        {* The configurator selection is checked at this early point
           to use it in different included files in the detail template. *}
        {block name='frontend_detail_index_configurator_settings'}

            {* Variable for tracking active user variant selection *}
            {$activeConfiguratorSelection = true}

            {if $sArticle.sConfigurator && ($sArticle.sConfiguratorSettings.type == 1 || $sArticle.sConfiguratorSettings.type == 2)}
                {* If user has no selection in this group set it to false *}
                {foreach $sArticle.sConfigurator as $configuratorGroup}
                    {if !$configuratorGroup.selected_value}
                        {$activeConfiguratorSelection = false}
                    {/if}
                {/foreach}
            {/if}
        {/block}

        <div class="product--detail-upper--outter">
	        <div class="product--detail-upper block-group">

	            {* Product image *}
	            {block name='frontend_detail_index_image_container'}
	                <div class="product--image-container image-slider{if $sArticle.image && {config name=sUSEZOOMPLUS}} product--image-zoom{/if}"
	                    {if $sArticle.image}
	                     data-image-slider="true"
	                     data-image-gallery="true"
	                     data-maxZoom="{$theme.lightboxZoomFactor}"
	                     data-thumbnails=".image--thumbnails"
	                    {/if}>
	                    {include file="frontend/detail/image.tpl"}
	                </div>
	            {/block}

	            {* "Buy now" box container *}
	            {block name='frontend_detail_index_buy_container'}
	                <div class="product--buybox block{if $sArticle.sConfigurator && $sArticle.sConfiguratorSettings.type==2} is--wide{/if}">
	                    {block name='frontend_detail_index_header_inner'}
	                        <div class="product--info">
	                            {block name='frontend_detail_index_product_info'}

															<nav class="content--breadcrumb">
																{$sBreadcrumb[] = ["id"=>"{$sArticle.articleID}", "name"=>"{$sArticle.articleName}", "link" => "{$sArticle.linkDetails}"]}
																{include file='frontend/index/breadcrumb.tpl'}
															</nav>

	                                {* Product name *}
	                                {block name='frontend_detail_index_name'}
	                                    <h1 class="product--title" itemprop="name">
	                                        <!-- {$sArticle.articleName} | {$sArticle.purchaseunit} {$sArticle.sUnit.unit} -->
	                                        {$sArticle.articleName}
	                                    </h1>
	                                {/block}

	                                {* Product - Supplier information *}
	                                {block name='frontend_detail_supplier_info'}
	                                    {if $sArticle.supplierImg}
	                                        <div class="product--supplier">
	                                            <a href="{url controller='listing' action='manufacturer' sSupplier=$sArticle.supplierID}"
	                                               title="{"{s name="DetailDescriptionLinkInformation" namespace="frontend/detail/description"}{/s}"|escape}"
	                                               class="product--supplier-link">
	                                                <img src="{$sArticle.supplierImg}" alt="{$sArticle.supplierName|escape}">
	                                            </a>
	                                        </div>
	                                    {/if}
	                                {/block}

	                                {* Product rating *}
	                                {block name="frontend_detail_comments_overview"}
	                                    {if !{config name=VoteDisable}}
	                                        <div class="product--rating-container">
                                              <a href="#detail--product-reviews" class="product--rating-link" rel="nofollow" title="{"{s namespace="frontend/detail/actions" name='DetailLinkReview'}{/s}"|escape}">
                                                  {include file='frontend/_includes/rating.tpl' points=$sArticle.sVoteAverage.average type="aggregated" count=$sArticle.sVoteAverage.count}
                                              </a>
	                                        </div>
	                                    {/if}
	                                {/block}
	                                {* Short Description *}
	                                {if $sArticle.description}
		                                <p class="product--short-desc">
		                                	{$sArticle.description}
		                                </p>
	                                {/if}
	                            {/block}
															{* Reordering MillenworldBulletpointPlugin | Piran, 06.18 *}
															{if $millArticleAdvantagesShowTop}
															{include file="frontend/common/advantages.tpl"}
															{/if}
	                        </div>
											{/block}
	                    {block name="frontend_detail_rich_snippets_brand"}
	                        <meta itemprop="brand" content="{$sArticle.supplierName|escape}"/>
	                    {/block}

	                    {block name="frontend_detail_rich_snippets_weight"}
	                        {if $sArticle.weight}
	                            <meta itemprop="weight" content="{$sArticle.weight} kg"/>
	                        {/if}
	                    {/block}

	                    {block name="frontend_detail_rich_snippets_height"}
	                        {if $sArticle.height}
	                            <meta itemprop="height" content="{$sArticle.height} cm"/>
	                        {/if}
	                    {/block}

	                    {block name="frontend_detail_rich_snippets_width"}
	                        {if $sArticle.width}
	                            <meta itemprop="width" content="{$sArticle.width} cm"/>
	                        {/if}
	                    {/block}

	                    {block name="frontend_detail_rich_snippets_depth"}
	                        {if $sArticle.length}
	                            <meta itemprop="depth" content="{$sArticle.length} cm"/>
	                        {/if}
	                    {/block}

	                    {block name="frontend_detail_rich_snippets_release_date"}
	                        {if $sArticle.sReleasedate}
	                            <meta itemprop="releaseDate" content="{$sArticle.sReleasedate}"/>
	                        {/if}
	                    {/block}

	                    {block name='frontend_detail_buy_laststock'}
	                        {if !$sArticle.isAvailable && ($sArticle.isSelectionSpecified || !$sArticle.sConfigurator) && (!$sArticle.notification && $sArticle.laststock != 1)}
	                            {include file="frontend/_includes/messages.tpl" type="error" content="{s name='DetailBuyInfoNotAvailable' namespace='frontend/detail/buy'}{/s}"}
	                        {/if}
	                    {/block}

	                    {* Product email notification bei Abverkaufsartikeln nicht anzeigen | Änderungen 2017-05-15 | www.actualize.de *}
	                    {block name="frontend_detail_index_notification"}
	                      {if $sArticle.notification && $sArticle.instock <= 0 && $ShowNotification && $sArticle.laststock == 1}
	                          {include file="frontend/plugins/notification/index.tpl"}
	                      {/if}
	                    {/block}


	                    {* Product data *}
	                    {block name='frontend_detail_index_buy_container_inner'}
	                        <div itemprop="offers" itemscope itemtype="{if $sArticle.sBlockPrices}http://schema.org/AggregateOffer{else}http://schema.org/Offer{/if}" class="buybox--inner single_product_buybox">

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
	                                {include file="frontend/detail/data.tpl" sArticle=$sArticle sView=1}
	                            {/block}

	                            {block name='frontend_detail_index_after_data'}{/block}

	                            {* Configurator drop down menu's *}
	                            {block name="frontend_detail_index_configurator"}
	                                <div class="product--configurator">
	                                    {if $sArticle.sConfigurator}
	                                        {if $sArticle.sConfiguratorSettings.type == 1}
	                                            {include file="frontend/detail/config_step.tpl"}
	                                        {elseif $sArticle.sConfiguratorSettings.type == 2}
	                                            {include file="frontend/detail/config_variant.tpl"}
	                                        {else}
	                                            {include file="frontend/detail/config_upprice.tpl"}
	                                        {/if}
	                                    {/if}
	                                </div>
	                            {/block}

	                            {* Include buy button and quantity box *}
	                            {block name="frontend_detail_index_buybox"}
	                                {include file="frontend/detail/buy.tpl"}
	                            {/block}

															{block name="frontend_detail_data_delivery"}
																	{* Delivery informations *}
																	{if ($sArticle.sConfiguratorSettings.type != 1 && $sArticle.sConfiguratorSettings.type != 2) || $activeConfiguratorSelection == true}
																			{include file="frontend/plugins/index/delivery_informations.tpl" sArticle=$sArticle}
																	{/if}
															{/block}

                              {block name='frontend_detail_actions_notepad'}
                                <div class="piran--wishlist-container">
                                  <form action="{url controller='note' action='add' ordernumber=$sArticle.ordernumber}" method="post" class="action--form">
                                      {s name="DetailLinkNotepad" assign="snippetDetailLinkNotepad"}{/s}
                                      <button type="submit"
                                         class="action--link link--notepad"
                                         title="{$snippetDetailLinkNotepad|escape}"
                                         data-ajaxUrl="{url controller='note' action='ajaxAdd' ordernumber=$sArticle.ordernumber}"
                                         data-text="{s name="DetailNotepadMarked"}{/s}">
                                          <i class="icon--heart"></i> <span class="action--text">{s name="DetailLinkNotepadShort"}{/s}</span>
                                      </button>
                                  </form>
                                </div>
                              {/block}

	                        </div>
	                    {/block}
	                </div>
	            {/block}
	        </div>
        </div>

        {* Product bundle hook point *}
        {block name="frontend_detail_index_bundle"}{/block}

        {block name="frontend_detail_index_detail"}

            {* Tab navigation *}
            {block name="frontend_detail_index_tabs"}

                {include file="frontend/detail/tabs.tpl"}

            {/block}
        {/block}


        {* Crossselling tab panel *}
        {block name="frontend_detail_index_tabs_cross_selling"}

            {$showAlsoViewed = {config name=similarViewedShow}}
            {$showAlsoBought = {config name=alsoBoughtShow}}

            <div class="tab-menu--cross-selling"{if $sArticle.relatedProductStreams} data-scrollable="true"{/if}>
                {* "Customers bought also" slider *}
                {if $showAlsoBought}
                    {block name="frontend_detail_index_tabs_also_bought"}
                        <div class="tab--container be_visible" data-tab-id="alsobought" style="display: block;">
                            {block name="frontend_detail_index_tabs_also_bought_inner"}
                            <div class="tab--content content--also-bought">
            					{action module=widgets controller=recommendation action=bought articleId=$sArticle.articleID}
            				</div>
                            {/block}
                        </div>
                    {/block}
                {/if}
            </div>
            <div class="tab-menu--cross-selling viewed_also"{if $sArticle.relatedProductStreams} data-scrollable="true"{/if}>
                {* "Customers similar viewed" slider *}
                {if $showAlsoViewed}
                    {block name="frontend_detail_index_tabs_also_viewed"}
                        <div class="tab--container be_visible" data-tab-id="alsoviewed">
                            {block name="frontend_detail_index_tabs_also_viewed_inner"}
                            <div class="tab--content content--also-viewed">
                				{action module=widgets controller=recommendation action=viewed articleId=$sArticle.articleID}
            				</div>
                            {/block}
                        </div>
                    {/block}
                {/if}
                {* Tab navigation *}
                {block name="frontend_detail_index_tabs_navigation"}
                    <div class="tab--navigation" style="display: none;">
                        {block name="frontend_detail_index_tabs_navigation_inner"}
                            {block name="frontend_detail_index_related_similiar_tabs"}

                                {* Tab navigation - Accessory products *}
                                {block name="frontend_detail_tabs_entry_related"}
                                    {if $sArticle.sRelatedArticles && !$sArticle.crossbundlelook}
                                        <a href="#content--related-products" title="{s namespace="frontend/detail/tabs" name='DetailTabsAccessories'}{/s}" class="tab--link">
                                            {s namespace="frontend/detail/tabs" name='DetailTabsAccessories'}{/s}
                                            <span class="product--rating-count-wrapper">
                                                <span class="product--rating-count">{$sArticle.sRelatedArticles|@count}</span>
                                            </span>
                                        </a>
                                    {/if}
                                {/block}

                                {* Similar products *}
                                {block name="frontend_detail_index_recommendation_tabs_entry_similar_products"}
                                    {if count($sArticle.sSimilarArticles) > 0}
                                        <a href="#content--similar-products" title="{s name="DetailRecommendationSimilarLabel"}{/s}" class="tab--link">{s name="DetailRecommendationSimilarLabel"}{/s}</a>
                                    {/if}
                                {/block}
                            {/block}

                            {* Customer also bought *}
                            {block name="frontend_detail_index_tabs_entry_also_bought"}
                                {if $showAlsoBought}
                                    <a href="#content--also-bought" title="{s name="DetailRecommendationAlsoBoughtLabel"}{/s}" class="tab--link">{s name="DetailRecommendationAlsoBoughtLabel"}{/s}</a>
                                {/if}
                            {/block}

                            {* Customer also viewed *}
                            {block name="frontend_detail_index_tabs_entry_also_viewed"}
                                {if $showAlsoViewed}
                                    <a href="#content--customer-viewed" title="{s name="DetailRecommendationAlsoViewedLabel"}{/s}" class="tab--link">{s name="DetailRecommendationAlsoViewedLabel"}{/s}</a>
                                {/if}
                            {/block}

                            {* Related product streams *}
                            {block name="frontend_detail_index_tabs_entry_related_product_streams"}
                                {foreach $sArticle.relatedProductStreams as $key => $relatedProductStream}
                                    <a href="#content--related-product-streams-{$key}" title="{$relatedProductStream.name}" class="tab--link">{$relatedProductStream.name}</a>
                                {/foreach}
                            {/block}
                        {/block}
                    </div>
                {/block}

                {* Tab content container *}
                {block name="frontend_detail_index_outer_tabs"}
                    <div class="tab--container-list">
                        {block name="frontend_detail_index_inner_tabs"}
                            {block name='frontend_detail_index_before_tabs'}{/block}

                            {* Accessory articles *}
                            {block name="frontend_detail_index_tabs_related"}
                                {if $sArticle.sRelatedArticles && !$sArticle.crossbundlelook}
                                    <div class="tab--container" data-tab-id="related">
                                        {block name="frontend_detail_index_tabs_related_inner"}
                                            <div class="tab--header">
                                                <a href="#" class="tab--title" title="{s namespace="frontend/detail/tabs" name='DetailTabsAccessories'}{/s}">
                                                    {s namespace="frontend/detail/tabs" name='DetailTabsAccessories'}{/s}
                                                    <span class="product--rating-count-wrapper">
                                                        <span class="product--rating-count">{$sArticle.sRelatedArticles|@count}</span>
                                                    </span>
                                                </a>
                                            </div>
                                            <div class="tab--content content--related">{include file="frontend/detail/tabs/related.tpl"}</div>
                                        {/block}
                                    </div>
                                {/if}
                            {/block}

                            {* Similar products slider *}
                            {if $sArticle.sSimilarArticles}
                                {block name="frontend_detail_index_tabs_similar"}
                                    <div class="tab--container" data-tab-id="similar">
                                        {block name="frontend_detail_index_tabs_similar_inner"}
                                            <div class="tab--header">
                                                <a href="#" class="tab--title" title="{s name="DetailRecommendationSimilarLabel"}{/s}">{s name="DetailRecommendationSimilarLabel"}{/s}</a>
                                            </div>
                                            <div class="tab--content content--similar">{include file='frontend/detail/tabs/similar.tpl'}</div>
                                        {/block}
                                    </div>
                                {/block}
                            {/if}

                            {* Related product streams *}
                            {foreach $sArticle.relatedProductStreams as $key => $relatedProductStream}
                                {block name="frontend_detail_index_tabs_related_product_streams"}
                                    <div class="tab--container" data-tab-id="productStreamSliderId-{$relatedProductStream.id}">
                                        {block name="frontend_detail_index_tabs_related_product_streams_inner"}
                                            <div class="tab--header">
                                                <a href="#" class="tab--title" title="{$relatedProductStream.name}">{$relatedProductStream.name}</a>
                                            </div>
                                            <div class="tab--content content--related-product-streams-{$key}">
                                                {include file='frontend/detail/tabs/product_streams.tpl'}
                                            </div>
                                        {/block}
                                    </div>
                                {/block}
                            {/foreach}

                            {block name='frontend_detail_index_after_tabs'}{/block}
                        {/block}
                    </div>
                {/block}
            </div>
        {/block}
    </div>
{/block}

{* Deletes Top/Bottom Appendix for Millenworld Plugin | Piran, 06.18 *}
{block name='frontend_detail_mill_article_advantages_wrapper_top'}
{/block}

{block name='frontend_detail_mill_article_advantages_wrapper_bottom'}
{/block}
