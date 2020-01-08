{* Offcanvas buttons *}
{block name='frontend_detail_produktspezifikationen_buttons_offcanvas'}
    <div class="buttons--off-canvas">
        {block name='frontend_detail_produktspezifikationen_buttons_offcanvas_inner'}
            <a href="#" title="{"{s name="OffcanvasCloseMenu" namespace="frontend/detail/description"}{/s}"|escape}" class="close--off-canvas">
                <i class="icon--arrow-left"></i>
                {s name="OffcanvasCloseMenu" namespace="frontend/detail/description"}{/s}
            </a>
        {/block}
    </div>
{/block}

<div class="tab--recipes piran--tab-wrapper">
    <div class="piran--detail-content">
      <div class="piran--detail-pre-title panel--title is--underline pre-headline">{s name="RecipesPreHeadline"}Food Journal{/s}</div>
      <h3 class="piran--detail-title">{s name="RecipesHeadline"}Lass dich inspirieren!{/s}</h3>
        <div class="blog--listing">
            <div class="blog--listing-container">
                {foreach from=$emzBlogs item=blog key=key}

                <div class="blog--box panel has--border is--rounded">
                    {block name='frontend_blog_col_blog_entry'}

                        {* Blog Box *}
                        {block name='frontend_blog_col_box_content'}
                            <div class="blog--box-content panel--body is--wide block">

                              {* Article pictures *}
                              {block name='frontend_blog_col_article_picture'}
                                  {if $blog}
                                      <div class="blog--box-picture">

                                          <a href="{url controller=blog action=detail sCategory=$blog.categoryId blogArticle=$blog.id}"
                                             class="blog--picture-main"
                                             title="{$blog.title|escape}">
                                              {if isset($blog.media.thumbnails)}
                                              <img class="blog--image-detail lazy emz--is-blury"
                                                    src="{$blog.media.thumbnails[5].source}"
                                                    title="{$blog.title|escape|truncate:160}"
                                                    data-srcset="{$blog.media.thumbnails[3].sourceSet}"
                                                    data-loader="emzPlaceholderLoader"/>
                                              {else}
                                              <img class="blog--image-detail"
                                                  title="{$blog.title|escape|truncate:160}"
                                                  data-src="url(/no-picture.jpg)" />
                                              {/if}
                                          </a>
                                      </div>
                                  {/if}
                              {/block}

                              {* Blogtitel *}

                              <div class="labels-wrapper">

                              {block name='frontend_blog_col_tags'}
                                {if $blog.tags|@count > 1}
                                    {foreach $blog.tags as $tag}
                                        <span class="piran--pre-title blog-listing--label">
                                            <a href="{url controller=blog sCategory=$blog.categoryId sFilterTags=$tag.name}" title="{$tag.name|escape}">{$tag.name}</a>
                                        </span>
                                    {/foreach}
                                {/if}
                              {/block}

                              </div>

                                {* Article name *}
                                {block name='frontend_blog_col_article_name'}
                                    <h2 class="blog--box-headline panel--title">
                                        <a class="blog--box-link piran--blog-box-title" href="{url controller=blog action=detail sCategory=$blog.categoryId blogArticle=$blog.id}" title="{$blog.title|escape}">{$blog.title}</a>
                                    </h2>
                                {/block}

                                {block name='frontend_blog_col_article_short_description'}
                                    <p class="blog--box-short-description">
                                        <a class="blog--box-link piran--blog-box-short-description" href="{url controller=blog action=detail sCategory=$blog.categoryId blogArticle=$blog.id}" title="{$blog.title|escape}">
                                        {if $blog.shortDescription}
                                            {$blog.shortDescription|truncate:235}
                                        {else}
                                            {$blog.description|strip_tags|truncate:235}
                                        {/if}
                                        </a>
                                    </p>
                                {/block}

                            </div>
                        {/block}

                    {/block}
                </div>

                {/foreach}

                {if $showLoadMore}
                    <div class="blog--box box-more panel has--border is--rounded">
                        <div class="blog--box-header">
                            <div class="blog--box-content panel--body is--wide block">
                                <div class="blog--box-picture">
                                    <a class="blog--picture-main">
                                        <div class="blog--image-detail">
                                            <button class="emz-load-more btn" data-fetch-url='{url controller=EmzBlog action=blogs}' data-articleID='{$sArticle.articleID}'>{s name="EmzLoadMore"}Mehr anzeigen{/s}</button>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                {/if}
            </div>
        </div>
    </div>
</div>
