{* Tab navigation for the product detail page *}
{block name="frontend_detail_tabs"}
    <div class="tab-menu--product">
        {block name="frontend_detail_tabs_inner"}

            {* Tab navigation *}
            {block name="frontend_detail_tabs_navigation"}
                <div class="tab--navigation" data-koro-sticky="true">
                  <div class="tab-navigation--inner">
                    <div class="container piran--content-main--inner">
                    {block name="frontend_detail_tabs_navigation_inner"}

                        {* Description Tab *}
                        <a href="#" class="tab--link" title="{s name='DetailTabsDescription'}{/s}" data-tabName="description">{s name='DetailTabsDescription'}{/s}</a>

                        {* Bundle Tab *}
                        {if $bundleArray}
                        <a href="#" class="tab--link" title="{s name='BundleTabsDescription'}{/s}" data-tabName="bundle">{s name='BundleTabsDescription'}Inhalt{/s}</a>
                        {/if}

                        {* Specification Section *}
                        {if $emzSpecificationData.productQualityData || $emzSpecificationData.globalProductionData.data || $emzSpecificationData.globalProductionData.text}
                        <a href="#" class="tab--link" title="{s name="SpecificationSectionTitle"}Spezifikation{/s}" data-tabName="specification-section">{s name="SpecificationSectionTitle"}Spezifikation{/s}</a>
                        {/if}

                        {* Price History Tab *}
                        {if $priceHistoryData}
                        <a href="#" class="tab--link" title="{s name='PriceGraphTitle'}Preisentwicklung{/s}" data-tabName="price-history">{s name="PriceGraphTitle"}Preisentwicklung{/s}</a>
                        {/if}

                        {* Product Comparison Tab *}
                        {if $huebert_article_compare_items}
                        <a href="#" class="tab--link" title="{s name='HuebertComparisonPreheadline'}Vergleich{/s}" data-tabName="comparison">{s name="HuebertComparisonPreheadline"}Vergleich{/s}</a>
                        {/if}

                        {* Masonry Section *}
                        {if $emzMasonryImages}
                        <a href="#" class="tab--link" title="{s name="MasonryTitle"}Masonry-Sektion{/s}" data-tabName="masonry">{s name="MasonryTitle"}Masonry-Sektion{/s}</a>
                        {/if}

                        {* Recipes Tab *}
                        {if $emzBlogs}
                        <a href="#" class="tab--link" title="{s name='RecipeSectionDetail'}Food Journal{/s}" data-tabName="recipes">{s name="RecipeSectionDetail"}Food Journal{/s}</a>
                        {/if}

                        {* FAQ Tab *}
                        {if $emzFaqEntries}
                        <a href="#" class="tab--link" title="{s name='FaqTitle'}FAQ{/s}" data-tabName="faq">{s name="FaqTitle"}FAQ{/s}</a>
                        {/if}

                        {* Rating Tab *}
                        {block name="frontend_detail_tabs_rating"}
                            {if !{config name=VoteDisable}}
                                <a href="#" class="tab--link" title="{s name='DetailTabsRating'}{/s}" data-tabName="rating">
                                    {s name='DetailTabsRating'}{/s}
                                    {block name="frontend_detail_tabs_navigation_rating_count"}
                                        <span class="product--rating-count">({$sArticle.sVoteAverage.count})</span>
                                    {/block}
                                </a>
                            {/if}
                        {/block}

                    {/block}
                    </div>
                  </div>
                </div>
            {/block}

            {* Content list *}
            {block name="frontend_detail_tabs_content"}
                <div class="tab--container-list">
                    {block name="frontend_detail_tabs_content_inner"}

                        {* Description container *}
                        {block name="frontend_detail_tabs_content_description"}
                            <div class="tab--container">
                                {block name="frontend_detail_tabs_content_description_inner"}

                                    {* Description title *}
                                    {block name="frontend_detail_tabs_content_description_title"}
                                        <div class="tab--header">
                                            {block name="frontend_detail_tabs_content_description_title_inner"}
                                                <a href="#" class="tab--title" title="{s name='DetailDescriptionHeader'}Details{/s}">{s name="DetailDescriptionHeader"}Details{/s} 🔍</a>
                                            {/block}
                                        </div>
                                    {/block}

                                    {* Description content *}
                                    {block name="frontend_detail_tabs_content_description_description"}
                                        <div class="tab--content piran--is-description">
                                            {block name="frontend_detail_tabs_content_description_description_inner"}
                                                {include file="frontend/detail/tabs/description.tpl"}
                                            {/block}
                                        </div>
                                    {/block}

                                {/block}
                            </div>
                        {/block}

                        {* Bundle container *}
                        {if $bundleArray}
                        {block name="frontend_detail_tabs_content_bundle"}
                            <div class="tab--container">
                                {block name="frontend_detail_tabs_content_bundle_inner"}

                                    {* Bundle title *}
                                    {block name="frontend_detail_tabs_content_bundle_title"}
                                        <div class="tab--header">
                                            {block name="frontend_detail_tabs_content_bundle_title_inner"}
                                                <a href="#" class="tab--title" title="{s name='DetailBundleHeader'}Inhalt{/s}">{s name="DetailBundleHeader"}Inhalt{/s} 🎁</a>
                                            {/block}
                                        </div>
                                    {/block}

                                    {* Bundle Content *}
                                    {block name="frontend_detail_tabs_content_bundle_description"}
                                        <div class="tab--content piran--is-bundle">

                                          {block name="frontend_detail_tabs_content_bundle_intern_description_inner"}
                                              {include file="frontend/detail/tabs/bundle.tpl"}
                                          {/block}

                                        </div>
                                    {/block}

                                {/block}
                            </div>
                        {/block}
                        {/if}

                        {* Specification Section *}
                        {if $emzSpecificationData.productQualityData || $emzSpecificationData.globalProductionData.data || $emzSpecificationData.globalProductionData.text}
                            {block name="frontend_detail_tabs_content_specification_section"}
                                <div class="tab--container">
                                    {block name="frontend_detail_tabs_content_specification_section_inner"}

                                        {* Specification Title *}
                                        {block name="frontend_detail_tabs_content_specification_section_title"}
                                            <div class="tab--header">
                                                {block name="frontend_detail_tabs_content_specification_section_title_inner"}
                                                    <a href="#" class="tab--title" title="{s name="SpecificationSectionTitle"}Spezifikation{/s}">{s name="SpecificationSectionTitle"}Spezifikation{/s}</a>
                                                {/block}
                                            </div>
                                        {/block}

                                        {* Specification Content *}
                                        {block name="frontend_detail_tabs_content_specification_section_description"}
                                            <div class="tab--content piran--is-specification-section">
                                                {block name="frontend_detail_tabs_content_specification_section_description_inner"}
                                                    {include file="frontend/detail/tabs/specification-section.tpl"}
                                                {/block}
                                            </div>
                                        {/block}

                                    {/block}
                                </div>
                            {/block}
                        {/if}

                        {* Price History Container *}
                        {if $priceHistoryData}
                        {block name="frontend_detail_tabs_content_price_history"}
                            <div class="tab--container">
                                {block name="frontend_detail_tabs_content_price_history_inner"}

                                    {* Price History Title *}
                                    {block name="frontend_detail_tabs_content_price_history_title"}
                                        <div class="tab--header">
                                            {block name="frontend_detail_tabs_content_price_history_title_inner"}
                                                <a href="#" class="tab--title" title="{s name="PriceGraphTitle"}Preisentwicklung{/s}">{s name="PriceGraphTitle"}Preisentwicklung{/s} 📉</a>
                                            {/block}
                                        </div>
                                    {/block}

                                    {* Price History Content *}
                                    {block name="frontend_detail_tabs_content_price_history_description"}
                                        <div class="tab--content piran--is-price-history">
                                            {block name="frontend_detail_tabs_content_price_history_description_inner"}
                                                {include file="frontend/detail/tabs/price_history.tpl"}
                                            {/block}
                                        </div>
                                    {/block}

                                {/block}
                            </div>
                        {/block}
                        {/if}

                        {if $huebert_article_compare_items}
                        {* Product Comparison Container *}
                        {block name="frontend_detail_tabs_content_huebert_compare_article"}
                            <div class="tab--container">
                                {block name="frontend_detail_tabs_content_huebert_compare_article_inner"}

                                    {* Product Comparison Title *}
                                    {block name="frontend_detail_tabs_content_huebert_compare_article_title"}
                                        <div class="tab--header">
                                            {block name="frontend_detail_tabs_content_huebert_compare_article_title_inner"}
                                              <a href="#" class="tab--title" title="{s name='HuebertComparisonPreheadline'}Vergleich{/s}">{s name="HuebertComparisonPreheadline"}Vergleich{/s} 🍏🍎</a>
                                            {/block}
                                        </div>
                                    {/block}

                                    {* Product Comparison Content *}
                                    {block name="frontend_detail_tabs_content_huebert_compare_article_description"}
                                        <div class="tab--content piran--is-compare">
                                            {block name="frontend_detail_tabs_content_huebert_compare_article_description_inner"}
                                                {include file="frontend/detail/tabs/huebert-compare-article.tpl"}
                                            {/block}
                                        </div>
                                    {/block}

                                {/block}
                            </div>
                        {/block}
                        {/if}

                        {* Masonry Section Container *}
                        {if $emzMasonryImages}
                        {block name="frontend_detail_tabs_content_emz_masonry_section"}
                            <div class="tab--container">
                                {block name="frontend_detail_tabs_content_emz_masonry_section_inner"}

                                    {* Masonry Section Title *}
                                    {block name="frontend_detail_tabs_content_emz_masonry_section_title"}
                                        <div class="tab--header">
                                            {block name="frontend_detail_tabs_content_emz_masonry_section_title_inner"}
                                              <a href="#" class="tab--title" title="{s name='MasonryTitle'}Masonry-Sektion{/s}" data-tabName="comparison">{s name="MasonryTitle"}Masonry-Sektion{/s} 📷</a>
                                            {/block}
                                        </div>
                                    {/block}

                                    {* Masonry Section Content *}
                                    {block name="frontend_detail_tabs_content_emz_masonry_section_description"}
                                        <div class="tab--content piran--is-masonry">
                                            {block name="frontend_detail_tabs_content_emz_masonry_section_inner"}
                                                {include file="frontend/detail/tabs/emz-masonry-section.tpl"}
                                            {/block}
                                        </div>
                                    {/block}

                                {/block}
                            </div>
                        {/block}
                        {/if}

                        {if $emzBlogs}
                        {* Recipes Container *}
                        {block name="frontend_detail_tabs_content_related_blog_articles"}
                            <div class="tab--container">
                                {block name="frontend_detail_tabs_content_related_blog_articles_inner"}

                                    {* Recipes Title *}
                                    {block name="frontend_detail_tabs_content_related_blog_articles_title"}
                                        <div class="tab--header">
                                            {block name="frontend_detail_tabs_content_related_blog_articles_title_inner"}
                                              <a href="#" class="tab--title" title="{s name='RecipeSectionDetail'}Food Journal{/s}" data-tabName="description">{s name="RecipeSectionDetail"}Food Journal{/s} 🌈<a>
                                            {/block}
                                        </div>
                                    {/block}

                                    {* Recipes Content *}
                                    {block name="frontend_detail_tabs_content_related_blog_articles_description"}
                                        <div class="tab--content piran--is-recipes">
                                            {block name="frontend_detail_tabs_content_related_blog_articles_inner"}
                                                {include file="frontend/detail/tabs/related-blog-articles.tpl"}
                                            {/block}
                                        </div>
                                    {/block}

                                {/block}
                            </div>
                        {/block}
                        {/if}

                        {* FAQ Container *}
                        {if $emzFaqEntries}
                        {block name="frontend_detail_tabs_content_emz_faq_entries"}
                            <div class="tab--container">
                                {block name="frontend_detail_tabs_content_emz_faq_entries_inner"}

                                    {* FAQ Title *}
                                    {block name="frontend_detail_tabs_content_emz_faq_entries_title"}
                                        <div class="tab--header">
                                            {block name="frontend_detail_tabs_content_emz_faq_entries_title_inner"}
                                              <a href="#" class="tab--title" title="{s name='FaqTitle'}FAQ{/s}">{s name="FaqTitle"}FAQ{/s} 💭</a>
                                            {/block}
                                        </div>
                                    {/block}

                                    {* FAQ Content *}
                                    {block name="frontend_detail_tabs_content_emz_faq_entries_description"}
                                        <div class="tab--content piran--is-faq">
                                            {block name="frontend_detail_tabs_content_emz_faq_entries_description_inner"}
                                                {include file="frontend/detail/tabs/emz-faq-entries.tpl"}
                                            {/block}
                                        </div>
                                    {/block}

                                {/block}
                            </div>
                        {/block}
                        {/if}


                        {* Rating container *}
                        {block name="frontend_detail_tabs_content_rating"}
                            {if !{config name=VoteDisable}}
                                <div class="tab--container">
                                    {block name="frontend_detail_tabs_content_rating_inner"}

                                        {* Rating title *}
                                        {block name="frontend_detail_tabs_rating_title"}
                                            <div class="tab--header">
                                                {block name="frontend_detail_tabs_rating_title_inner"}
                                                    <a href="#" class="tab--title" title="{s name='DetailTabsRating'}{/s}">{s name='DetailTabsRating'}{/s} 🌟</a>
                                                    {block name="frontend_detail_tabs_rating_title_count"}
                                                        <span class="product--rating-count">({$sArticle.sVoteAverage.count})</span>
                                                    {/block}
                                                {/block}
                                            </div>
                                        {/block}

                                        {* Rating content *}
                                        {block name="frontend_detail_tabs_rating_content"}
                                            <div id="tab--product-comment" class="tab--content piran--is-rating">
                                                {block name="frontend_detail_tabs_rating_content_inner"}
                                                    {include file="frontend/detail/tabs/comment.tpl"}
                                                {/block}
                                            </div>
                                        {/block}

                                    {/block}
                                </div>
                            {/if}
                        {/block}

                    {/block}
                </div>
            {/block}

        {/block}
      </div>

{/block}
