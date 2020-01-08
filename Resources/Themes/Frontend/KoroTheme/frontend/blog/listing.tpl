<div class="blog--listing block">

    {* Headline *}
    {block name="frontend_listing_text_headline"}
        {if $sCategoryContent.name}
            <h1 class="hero--headline panel--title piran--category-headline">{$sCategoryContent.name}</h1>
        {/if}
    {/block}

    {if $sCategoryContent.cmsheadline || $sCategoryContent.cmstext}
        {include file="frontend/listing/text.tpl"}
    {/if}

    {foreach $sCategories item=subcat}
      {if $subcat.flag == "true"}
      {assign var=blogCatId value=$subcat.id}
      {assign var=count value=0}
      {/if}
    {/foreach}

    {if $sCategories.{$blogCatId}.subcategories|@count > 0 }
      <div class="blog--subscribe has--border is--rounded filter--group block">
          <ul style="border:0;" class="blog--navigation-headlines is--rounded" >
            {foreach from=$sCategories.{$blogCatId}.subcategories item=category}
            {assign var=count value=$count+1}
              <li class="navigation--entry child-{$count}" >
                  <a href="{$category.link}" class="piran--big-shadow navigation--link {if $category.flag}is--active{/if}" title="{$category.description}">
                      {$category.description}
                  </a>
              </li>
            {/foreach}
          </ul>
      </div>
    {/if}

    {* Blog Filter Button *}
    {block name='frontend_blog_listing_filter_button'}
        {if !$sCategoryInfo.hideFilter}
            <div class="blog--filter-btn">
                {s namespace="frontend/listing/listing_actions" name="ListingFilterButton" assign="snippetListingFilterButton"}{/s}
                <a href="#"
                   title="{$snippetListingFilterButton|escape}"
                   class="filter--trigger btn is--icon-left"
                   data-collapseTarget=".blog--filter-options"
                   data-offcanvas="true"
                   data-offCanvasSelector=".blog--filter-options"
                   data-closeButtonSelector=".blog--filter-close-btn">
                    <i class="icon--filter"></i> {s namespace='frontend/listing/listing_actions' name='ListingFilterButton'}{/s}
                </a>
            </div>
        {/if}
    {/block}

    {if $sBlogArticles}
      <div class="blog--listing-container">
        {foreach from=$sBlogArticles item=sArticle key=key name="counter"}
            {include file="frontend/blog/box.tpl" sArticle=$sArticle key=$key}
        {/foreach}
      </div>

        {* Paging *}
        {block name="frontend_listing_bottom_paging"}
            {if $sNumberPages > 1}
                {include file='frontend/blog/listing_actions.tpl'}
            {/if}
        {/block}
    {/if}
</div>
