{extends file='parent:frontend/listing/listing.tpl'}

{block name="frontend_listing_list_promotion"}

  {* Headline *}
  {block name="frontend_listing_text_headline"}
      {if $sCategoryContent.name}
          <h1 class="hero--headline panel--title piran--category-headline">{$sCategoryContent.name}</h1>
      {/if}
  {/block}

  {if count($sBreadcrumb)}
      <nav class="content--breadcrumb block">
          {block name='frontend_index_breadcrumb_inner'}
              {include file='frontend/index/breadcrumb.tpl'}
          {/block}
      </nav>
  {/if}

{/block}
