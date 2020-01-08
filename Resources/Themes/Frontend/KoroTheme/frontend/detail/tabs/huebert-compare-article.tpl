{* Offcanvas buttons *}
{block name='frontend_detail_huebert_comparison_buttons_offcanvas'}
    <div class="buttons--off-canvas">
        {block name='frontend_detail_produktspezifikationen_buttons_offcanvas_inner'}
            <a href="#" title="{"{s name="OffcanvasCloseMenu" namespace="frontend/detail/description"}{/s}"|escape}" class="close--off-canvas">
                <i class="icon--arrow-left"></i>
                {s name="OffcanvasCloseMenu" namespace="frontend/detail/description"}{/s}
            </a>
        {/block}
    </div>
{/block}

<div class="tab--compare piran--tab-wrapper">
  <div class="piran--detail-content piran--no-padding">
      <div class="huebert-comparison">
          <div class="huebert-comparison--inner">

                {$firstItem = $huebert_article_compare_items[0]}

                    <div class="piran--detail-wrapper copyright-koro">
                        <div class="piran--detail-image-container emotion--fullwidth">
                            <div class="piran--detail-image emotion--banner">

                                {if $firstItem}

                                    {if $firstItem.link_to_compare}
                                    <a href="{$firstItem.link_to_compare}" title="{s name="HuebertArticleCompareFullComparison"}Zum ausführlichen Vergleich{/s}">
                                    {/if}

                                        {* get correct for picture-tag *}
                                        {if $firstItem.mood_image_url.has_thumbnails === true && isset($firstItem.mood_image_url.media)}
                                            {$media = $firstItem.mood_image_url.media}
                                            {$thumbnails = $media->getThumbnails()}

                                            {$baseSource = $media->getFile()}

                                            {if $thumbnails && $thumbnails[0]}
                                                {$itemSize = "100vw"}
                                                {$srcSet = ""}
                                                {$retinaSrcSet = ""}

                                                {foreach $thumbnails as $thumbnail}
                                                    {if !$thumbnail@first}
                                                        {$srcSet = $srcSet|cat:", "}
                                                        {$retinaSrcSet = $retinaSrcSet|cat:", "}
                                                    {/if}

                                                    {$srcSet = $srcSet|cat:$thumbnail->getSource()}
                                                    {$srcSet = $srcSet|cat:" "}
                                                    {$srcSet = $srcSet|cat:$thumbnail->getMaxWidth()}
                                                    {$srcSet = $srcSet|cat:"w"}

                                                    {$retinaSrcSet = $retinaSrcSet|cat:$thumbnail->getRetinaSource()}
                                                    {$retinaSrcSet = $retinaSrcSet|cat:" "}
                                                    {$retinaSrcSet = $retinaSrcSet|cat:$thumbnail->getMaxWidth()}
                                                    {$retinaSrcSet = $retinaSrcSet|cat:"w"}
                                                {/foreach}
                                            {/if}
                                        {elseif isset($firstItem.mood_image_url.media)}
                                            {$baseSource = $firstItem.mood_image_url.media}
                                        {else}
                                            {$baseSource = $firstItem.mood_image_url}
                                        {/if}

                                        <picture class="lazy-section-image" data-loader="emzPictureLoader">
                                            <source sizes="{$itemSize}" data-srcset="{$retinaSrcSet}" media="(min-resolution: 192dpi), (-webkit-min-device-pixel-ratio: 2)">
                                            <source sizes="{$itemSize}" data-srcset="{$srcSet}">

                                            {* Fallback *}
                                            <img class="piran--detail-image-inner" title="{s name="HuebertArticleCompareFullComparisonMoodImage"}KoRo testet Produkte{/s}" data-src="{$baseSource}" alt="Artikelvergleich-Banner"></img>
                                        </picture>

                                    {if $firstItem.link_to_compare}
                                    </a>
                                    {/if}

                                {else}
                                    {include file="frontend/_includes/picture.tpl" media=$emz_compare_banner_media}
                                {/if}

                            </div>
                        </div>
                        <div class="piran--detail-box-wrapper emotion--title">
                            <div class="piran--detail-box emotion--html">
                                <div class="piran--detail-pre-title panel--title is--underline pre-headline">{s name="ComparePreHeadine"}Produktvergleich{/s}</div>
                                <h3 class="piran--detail-title">{s name="CompareHeadine"}KoRo auf dem Prüfstand{/s}</h3>

                                  <p class="piran--detail-text">
                                      {s name="HuebertCompareDetailExtendetReviewTeaserText"}Das KoRo Team prüft akribisch, wie wir uns im Vergleich mit anderen Produkten schlagen. Hier geht's zum ausführlichen Produkttest...{/s}
                                  </p>

                                  {if $firstItem.link_to_compare}
                                    <strong>
                                        <a href="{$firstItem.link_to_compare}" target="_self" title="{s name=" HuebertCompareButtonToFullComparison"}Zum Artikel{/s}" class="is--secondary">{s name="HuebertCompareButtonToFullComparison"}Zum ausführlichen Test{/s}</a>
                                    </strong>
                                  {/if}

                            </div>
                        </div>
                    </div>

                {if $huebert_article_compare_items}
                    {include file="huebert_compare/_includes/compare-wrapper.tpl" articles=$huebert_article_compare_items}
                {/if}

          </div>
      </div>
  </div>
</div>
