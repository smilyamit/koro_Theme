{extends file='parent:widgets/emotion/components/component_blog.tpl'}

{block name="widget_emotion_component_blog"}
    <div class="emotion--blog">
        {if $Data}
            {block name="widget_emotion_component_blog_container"}
                <div class="blog--listing-container">
                    {foreach $Data.entries as $entry}
                        {$link = $entry.link}
                        {if !$link}
                            {$link = {url controller=blog action=detail sCategory=$entry.categoryId blogArticle=$entry.id}}
                        {/if}

                        <div class="blog--box panel has--border is--rounded">
                            {block name='frontend_blog_col_blog_entry'}

                                {* Blog Box *}
                                {block name='frontend_blog_col_box_content'}
                                    <div class="blog--box-content panel--body is--wide block">

                                      {* Article pictures *}
                                      {block name='frontend_blog_col_article_picture'}
                                          {if $entry}
                                              <div class="blog--box-picture">

                                                  <a href="{$link}"
                                                     class="blog--picture-main"
                                                     title="{$entry.title|escape}">
                                                      {if isset($entry.media.thumbnails)}
                                                      <img class="blog--image-detail lazy"
                                                            data-loader="emzPlaceholderLoader"
                                                            title="{$entry.title|escape|truncate:160}"
                                                            srcset="{$entry.media.thumbnails[5].sourceSet}"
                                                            data-srcset="{$entry.media.thumbnails[1].sourceSet}" />
                                                      {else}
                                                      <img class="blog--image-detail lazy"
                                                          title="{$entry.title|escape|truncate:160}"
                                                          data-src="url(/no-picture.jpg)" />
                                                      {/if}
                                                  </a>
                                              </div>
                                          {/if}
                                      {/block}

                                        {* Article name *}
                                        {block name='frontend_blog_col_article_name'}
                                        {if $entry.tags|@count >= 1}
                                          <div class=labels-wrapper>
                                            {foreach $entry.tags as $tag}
                                                <span class="piran--pre-title blog-listing--label">
                                                    <a href="{url controller=blog sCategory=$entry.categoryId sFilterTags=$tag}" title="{$tag|escape}">{$tag}</a>
                                                </span>
                                            {/foreach}
                                          </div>
                                        {/if}

                                            <h2 class="blog--box-headline panel--title">
                                                <a class="blog--box-link piran--blog-box-title" href="{$link}" title="{$entry.title|escape}">{$entry.title}</a>
                                            </h2>
                                        {/block}

                                        {block name='frontend_blog_col_article_short_description'}
                                            <p class="blog--box-short-description">
                                                <a class="blog--box-link piran--blog-box-short-description" href="{$link}" title="{$entry.title|escape}">
                                                {if $entry.shortDescription}
                                                    {$entry.shortDescription|truncate:235}
                                                {else}
                                                    {$entry.description|strip_tags|truncate:235}
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
            {/block}
        {/if}
    </div>
{/block}
