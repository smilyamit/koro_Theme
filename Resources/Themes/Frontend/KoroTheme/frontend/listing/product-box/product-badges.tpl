{extends file="parent:frontend/listing/product-box/product-badges.tpl"}

{block name="frontend_listing_box_article_discount"}

    {* Shipping Free Badge *}
    {if $sArticle.shippingfree && !($sArticle.taxID == 5)}
      <div class="product--badge badge--shipping-free">
          {s name="FreeShippingBadge"}Gratis Versand{/s}
      </div>
    {/if}

    {$smarty.block.parent}

    {* Bio Siegel*}
    {if $article.attributes.core && $article.attributes.core->get('attr2')}
      <div class="badge--organic-logo">
        <img src="{link file='frontend/_public/src/img/svg/organic-logo.svg'}" class="organic-logo-de-box piran--big-shadow">
      </div>
    {/if}

{/block}
