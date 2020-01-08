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
                              <img class="blog--image-detail lazy emz--is-blury"
                                  title="{$sArticle.title|escape|truncate:160}"
                                  src="{$sArticle.media.thumbnails[5].source}"
                                  data-srcset="{$sArticle.media.thumbnails[3].source}" 
                                  data-loader="emzPlaceholderLoader" />
                              {else}
                              <img class="blog--image-detail lazy"
                                  title="{$sArticle.title|escape|truncate:160}"
                                  data-src="url(/no-picture.jpg)" />
                              {/if}
                          </a>
                      </div>
                  {/if}
              {/block}

              {* Blogtitel *}

              <div class="labels-wrapper">

              {block name='frontend_blog_col_tags'}
                {if $sArticle.tags|@count > 1}
                    {foreach $sArticle.tags as $tag}
                        <span class="piran--pre-title blog-listing--label">
                            <a href="{$tag.link}" title="{$tag.name|escape}">{$tag.name}</a>
                        </span>
                    {/foreach}
                {/if}
              {/block}

              </div>

                {* Article name *}
                {block name='frontend_blog_col_article_name'}
                    <h2 class="blog--box-headline panel--title">
                        <a class="blog--box-link piran--blog-box-title" href="{url controller=blog action=detail sCategory=$sArticle.categoryId blogArticle=$sArticle.id}" title="{$sArticle.title|escape}">{$sArticle.title}</a>
                    </h2>
                {/block}

                {block name='frontend_blog_col_article_short_description'}
                    <p class="blog--box-short-description">
                        <a class="blog--box-link piran--blog-box-short-description" href="{url controller=blog action=detail sCategory=$sArticle.categoryId blogArticle=$sArticle.id}" title="{$blog.title|escape}">
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
