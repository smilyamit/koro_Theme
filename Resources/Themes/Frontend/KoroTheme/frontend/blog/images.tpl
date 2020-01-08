{extends file="parent:frontend/blog/images.tpl"}


{* Main Image *}
{block name='frontend_blog_images_main_image'}

    {$alt = $sArticle.title|escape}

    {if $sArticle.preview.description}
        {$alt = $sArticle.preview.description|escape}
    {/if}

    <div class="blog--detail-images block copyright-koro">
      <a href="{$sArticle.preview.thumbnails[3].source}"
        {*data-lightbox="true"*}
        data-imagelightbox="f"
           title="{$alt}"
           class="link--blog-image emotion--banner">

            <img srcset="{$sArticle.preview.thumbnails[2].sourceSet}"
                  data-src="{$sArticle.preview.thumbnails[2].source}"
                  class="lazy blog--image panel has--border is--rounded"
                  alt="{$alt}"
                  title="{$alt|truncate:160}"/>
        </a>
    </div>
{/block}

{block name='frontend_blog_images_thumbnails'}
    <div class="blog--detail-thumbnails block">
        {foreach $sArticle.media as $sArticleMedia}

            {$alt = $sArticle.title|escape}

            {if $sArticleMedia.description}
                {$alt = $sArticleMedia.description}
            {/if}

            {if !$sArticleMedia.preview}
            <a href="{$sArticleMedia.thumbnails[3].source}"
                {*data-lightbox="true"*}
                data-imagelightbox="f"
                   class="blog--thumbnail panel has--border is--rounded block"
                   title="{s name="BlogThumbnailText" namespace="frontend/blog/detail"}{/s}: {$alt}">

                   <img srcset="{$sArticleMedia.thumbnails[0].sourceSet}"
                         class="blog--thumbnail-image"
                         alt="{s name="BlogThumbnailText" namespace="frontend/blog/detail"}{/s}: {$alt}"
                         title="{s name="BlogThumbnailText" namespace="frontend/blog/detail"}{/s}: {$alt|truncate:160}" />
                </a>
            {/if}
        {/foreach}
    </div>
{/block}
