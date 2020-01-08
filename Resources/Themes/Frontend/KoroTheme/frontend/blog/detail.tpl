{extends file="parent:frontend/blog/detail.tpl"}
{* Ausgabe der Kurzbeschreibung im Blogartikel & Entfernen des Thumbnails | PIRAN| 05/2018 *}

{block name='frontend_blog_detail_title'}
{$smarty.block.parent}

<div class="blog--box-description-short--detail-preview">
    {if $sArticle.shortDescription}{$sArticle.shortDescription|nl2br}{else}{$sArticle.shortDescription}{/if}
</div>
{/block}

{block name='frontend_blog_detail_title'}
  {if $sArticle.attribute.attribute1 || $sArticle.attribute.attribute3}
    <div class="blog--labels-wrapper">

      {if $sArticle.attribute.attribute1}
      <div class="recipe-duration">
        {$sArticle.attribute.attribute1}
      </div>
      {/if}

      {if $sArticle.attribute.attribute3}
      <div class="cal-count">
        {$sArticle.attribute.attribute3}
      </div>
      {/if}

    </div>
  {/if}
  {$smarty.block.parent}
{/block}

{block name='frontend_blog_detail_crossselling_headline'}
    <div class="panel--title is--underline pre-headline">{s name="BlogHeaderCrossSelling"}{/s}</div>
    <div class="panel--title is--underline headline">{s name="BlogHeaderCrossSellingHeadline"}Probieren geht über Studieren{/s}</div>
{/block}

{* Listing *}
{block name='frontend_blog_detail_crossselling_listing'}
    <div data-ajax-wishlist="true">
        {$smarty.block.parent}
    </div>
{/block}