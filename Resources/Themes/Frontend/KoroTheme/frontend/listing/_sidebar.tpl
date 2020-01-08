{extends file="frontend/index/sidebar.tpl"}

{block name='frontend_index_left_menu'}
{$smarty.block.parent}

{if $EmzListingBlogs}
<div class="blog-listing-sidebar--wrapper">

  <div class="listing--is-blog-box navigation--headline">
    {s namespace='frontend/listing/sidebar' name='StoryBehindHeadline'}Blogartikel{/s}
  </div>

  <p class="listing--blog-description">
    {s namespace='frontend/listing/sidebar' name='StoryBehindDescription'}
      Entdecke bewegende Hintergrundstories, spannende Experteninformationen und schmackhafte Rezepte rund um KoRos Produktportfolio.
    {/s}
  </p>

  {foreach $EmzListingBlogs as $sArticle}
  <div class="blog--box panel has--border is--rounded">
      {block name='frontend_blog_col_blog_entry'}

          {* Blog Box *}
          {block name='frontend_blog_col_box_content'}
              <div class="blog--box-content panel--body is--wide block">

                {* Article pictures *}
                {block name='frontend_blog_col_article_picture'}
                    {if $sArticle}
                        <div class="blog--box-picture">

                            <a href="{url controller=blog action=detail sCategory=$sArticle.categoryId blogArticle=$sArticle.id}"
                               class="blog--picture-main"
                               title="{$sArticle.title|escape}">
                                {if isset($sArticle.media.thumbnails)}
                                <img class="blog--image-detail lazy-section-image"
                                    title="{$sArticle.title|escape|truncate:160}"
                                    data-src="{$sArticle.media.thumbnails[1].sourceSet}" >
                                </img>
                                {else}
                                <img class="blog--image-detail lazy"
                                    title="{$sArticle.title|escape|truncate:160}"
                                    data-src="url(/no-picture.jpg)">
                                </img>
                                {/if}
                            </a>
                        </div>
                    {/if}
                {/block}

                {* Blogtitel *}

                  {* Article name *}
                  {block name='frontend_blog_col_article_name'}
                      <h2 class="blog--box-headline panel--title">
                          <a class="blog--box-link piran--blog-box-title" href="{url controller=blog action=detail sCategory=$sArticle.categoryId blogArticle=$sArticle.id}" title="{$sArticle.title|escape}">{$sArticle.title}</a>
                      </h2>
                  {/block}

                  {block name='frontend_blog_col_article_short_description'}
                      <p class="blog--box-short-description">
                          <a class="blog--box-link piran--blog-box-short-description" href="{url controller=blog action=detail sCategory=$blog.categoryId blogArticle=$blog.id}" title="{$blog.title|escape}">
                          {if $sArticle.shortDescription}
                              {$sArticle.shortDescription|truncate:235}
                          {else}
                              {$sArticle.description|strip_tags|truncate:235}
                          {/if}
                          </a>
                      </p>
                  {/block}

              </div>
          {/block}

      {/block}
  </div>
  {/foreach}

</div>
{/if}

{/block}
