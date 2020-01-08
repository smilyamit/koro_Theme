{extends file="parent:frontend/detail/tabs/description.tpl"}

{* Headline *}
{block name='frontend_detail_description_title'}
{/block}

{* Properties *}
{block name='frontend_detail_description_properties'}
{/block}

{* Product - Further links *}
{block name='frontend_detail_description_links'}
{/block}

{* Downloads *}
{block name='frontend_detail_description_downloads'}
{/block}

{* Comment - Item open text fields attr3 *}
{block name='frontend_detail_description_our_comment'}
{/block}

{* Product description *}
{block name='frontend_detail_description_text'}
    {* {block name="frontend_detail_piran_description"}

        <div class="piran--detail-wrapper copyright-koro">
            <div class="piran--detail-image-container emotion--fullwidth">
                <div class="piran--detail-image emotion--banner">
                    {include file="frontend/_includes/picture.tpl" media=$emz_description_banner_media}
                </div>
            </div>

            {block name='frontend_detail_piran_description_inner'}
                <div class="piran--detail-box-wrapper emotion--title">
                    <div class="piran--detail-box emotion--html">
                        <h3 class="piran--detail-title">{s name="DetailDescriptionHeaderHeadline"}Alles auf einen Blick{/s}</h3>
                            {* <p class="piran--detail-text">
                              <strong>
                                {s name="TextPriceFormation"}In dieser Sektion findest Du alle Änderungen betreffend Preis und Qualität sowie Neuerscheinungen und neue Ernten chronologisch dokumentiert.{/s}
                              </strong>
                            </p>
                            <strong>
                              <a href="#" target="_self" title="{s name=" HuebertCompareButtonToFullComparison"}Mehr →{/s}" class="piran--detail-link btn is--secondary">{s name="HuebertCompareButtonToFullComparison"}Mehr →{/s}</a>
                            </strong> *}
                    {* </div>
                </div>
            {/block}
        </div>
    {/block} *}
<div class="tab--description piran--tab-wrapper">
    <div class="piran--detail-content">
      <div class="piran--detail-pre-title panel--title is--underline pre-headline">{s name="DescriptionHeadline"}Beschreibung{/s}</div>
      <h3 class="piran--detail-title">{s name="DescriptionPreHeadline"}Alles auf einen Blick{/s}</h3>
        <div class="product--description" itemprop="description">
            <div class="description-container">

                <div class="product--ingredients">

                    <div class="product--description-text">
                        {if $sArticle.description_long}
                            {$sArticle.description_long}
                        {else}
                            {s name="NoDescriptionText"}Aktuell gibt es zu diesem Produkt keine Beschreibung. Hilf mir und melde dich via Mail an service@korodrogerie.de .{/s}
                        {/if}

                        {if $sArticle.attr6}
                            <div class="nutrition--label" itemprop="nutrition">{s name="tab_nutritonal"}Nährwerte{/s}</div>
                            {$sArticle.attr6}<br>
                        {/if}
                    </div>

                </div>

                <div class="piran-koro-bundle">

                    {* Zusatzinfos *}
                    {block name='frontend_detail_index_buy_container_base_info'}
                        <table class="base-info--table">

                            {* Product SKU *}
                            {block name='frontend_detail_data_ordernumber'}
                                <tr class="base-info--column">

                                    {* Product SKU - Label *}
                                    {block name='frontend_detail_data_ordernumber_label'}
                                        <td class="base-info--label piran--pre-title" style="border: none;">
                                            {s name="DetailDataId" namespace="frontend/detail/data"}{/s}
                                        </td>
                                    {/block}

                                    {* Product SKU - Content *}
                                    {block name='frontend_detail_data_ordernumber_content'}
                                        <meta itemprop="productID" content="{$sArticle.articleDetailsID}"/>
                                        <td class="base-info--content" style="border: none;" itemprop="sku">
                                            {$sArticle.ordernumber}
                                        </td>
                                    {/block}
                                </tr>
                            {/block}

                            {if $sArticle.attr5}
                                <tr class="base-info--column">
                                    <td class="base-info--label piran--pre-title">{s name="detail_origin"}Herkunft{/s}</td>
                                    <td class="base-info--content">{$sArticle.attr5}</td>
                                </tr>
                            {/if}

                            {* Hersteller *}
                            {if $sArticle.supplierName}
                              <tr class="base-info--column">
                              <td class="base-info--label piran--pre-title">{s name="supplierName"}Marke{/s}</td>
                                <td class="base-info--content">{$sArticle.supplierName|escape}</td>
                              </tr>
                            {/if}
                            {* EAN *}
                            {if $sArticle.ean}
                                <tr class="base-info--column">
                                    <td class="base-info--label piran--pre-title">{s name="DetailEAN"}EAN{/s}</td>
                                    <td class="base-info--content">{$sArticle.ean|escape}</td>
                                </tr>
                            {/if}
                            {* Rückstandsanalyse *}
                            {if $sArticle.attr11}
                                <tr class="base-info--column">
                                  <td class="base-info--label piran--pre-title">{s name="DetailAnalysis"}Rückstandsanalyse{/s}</td>
                                  <td class="base-info--content" style="text-decoration: underline;">{$sArticle.attr11}</td>
                                </tr>
                            {/if}
                            {* Zertifiziert *}
                            {if $sArticle.attr2}
                                <tr class="base-info--column">
                                    <td class="base-info--label piran--pre-title">{s name="detail_certificate"}Öko-Kontrollstelle{/s}</td>
                                    <td class="base-info--content">{$sArticle.attr2}</td>
                                </tr>
                            {/if}
                            {* Spurenhinweis *}
                            {if $sArticle.attr15}
                                <tr class="base-info--column">
                                  <td class="base-info--label piran--pre-title">{s name="detail_track"}Spuren{/s}</td>
                                  <td class="base-info--content" style="text-decoration: underline;">{$sArticle.attr15}</tr>
                                  <!-- {if $Locale=="de_DE"}{$sArticle.attr15}<br>{elseif $Locale=="en_GB"}{$sArticle.attr8}<br>{else}{$sArticle.attr37}<br>{/if} -->
                                </tr>
                            {/if}
                            {* Lieferung *}
                            {if $sArticle.attr23}
                                <tr class="base-info--column">
                                    <td class="base-info--label piran--pre-title">{s name="detail_lieferung"}Lieferung{/s}</td>
                                    <td class="base-info--content" style="text-decoration: underline;">{$sArticle.attr23}</td>
                                </tr>
                            {/if}

                            {if $sArticle.unternehmen}
                                <tr class="base-info--column">
                                    <td class="base-info--label piran--pre-title">{s name="detail_unternehmen"}Unternehmen{/s}</td>
                                    <td class="base-info--content">{$sArticle.unternehmen}</td>
                                </tr>
                            {/if}

                            {if $sArticle.lagerung}
                                <tr class="base-info--column">
                                    <td class="base-info--label piran--pre-title">{s name="detail_lagerung"}Lagerung{/s}</td>
                                    <td class="base-info--content">{$sArticle.lagerung}</td>
                                </tr>
                            {/if}

                            {if $sArticle.zutaten}
                                <tr class="base-info--column">
                                    <td class="base-info--label piran--pre-title">{s name="detail_zutaten"}Zutaten{/s}</td>
                                    <td class="base-info--content">{$sArticle.zutaten}</td>
                                </tr>
                            {/if}

                            {if $sArticle.allergene}
                                <tr class="base-info--column">
                                    <td class="base-info--label piran--pre-title">{s name="detail_allergene"}Allergene{/s}</td>
                                    <td class="base-info--content">{$sArticle.allergene}</td>
                                </tr>
                            {/if}

                            {if $sArticle.attr1}
                                <tr class="base-info--column">
                                    <td class="base-info--label piran--pre-title">{s name="detail_characteristicts"}Verkehrsbezeichnung{/s}</td>
                                    <td class="base-info--content">{if $Locale=="de_DE"}{$sArticle.attr1}<br>{elseif $Locale=="en_GB"}{$sArticle.attr12}<br>{else}{$sArticle.attr33}<br>{/if}</td>
                                </tr>
                            {/if}

                            {if $sArticle.sProperties.1}
                                <tr class="base-info--column">
                                    <td class="base-info--label piran--pre-title">{s name="detail_eigenschaften"}Eigenschaften{/s}</td>
                                    <td class="base-info--content">{$sArticle.sProperties.1.value|escape}</td>
                                </tr>
                            {/if}
                        </table>
                    {/block}
                </div>
            </div>
        </div>
    </div>
</div>
{/block}
