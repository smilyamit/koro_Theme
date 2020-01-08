{extends file="parent:frontend/blog/detail.tpl"}

{block name="frontend_index_body_classes"}{$smarty.block.parent} piran-blog{/block}

{block name='frontend_index_breadcrumb'}
{/block}

{block name='frontend_blog_detail_images'}
{/block}

{block name='frontend_index_content'}

<div class="piran--is-ctl-blog-custom blog--detail">

  <div class="piran--blog-detail-comparison-hero-container">

    {* Article picture *}
    {if $sArticle.preview.thumbnails[0]}
        <div class="blog--detail-image-container block">

            {* Main Image *}
            {block name='frontend_blog_images_main_image'}

                {$alt = $sArticle.title|escape}

                {if $sArticle.preview.description}
                    {$alt = $sArticle.preview.description|escape}
                {/if}

                <div class="blog--detail-images block copyright-koro">
                  <a href="{$sArticle.preview.source}"
                     data-lightbox="true"
                       title="{$alt}"
                       class="link--blog-image emotion--banner">

                        <img  srcset="{$sArticle.preview.thumbnails[3].sourceSet}"
                              src="{$sArticle.preview.thumbnails[3].source}"
                              class="blog--image panel has--border is--rounded"
                              alt="{$alt}"
                              title="{$alt|truncate:160}"/>
                    </a>

                </div>
            {/block}

        </div>
    {/if}

  </div>

  {if count($sBreadcrumb)}
      <nav class="content--breadcrumb block">
          {block name='frontend_index_breadcrumb_inner'}
              {include file='frontend/index/breadcrumb.tpl'}
          {/block}
      </nav>
  {/if}

  {$smarty.block.parent}

</div>

{/block}

{block name='frontend_blog_detail_title'}
  {if $sBreadcrumb.1.name}
    <div class="piran--blog-compare-topic piran--pre-headline-styling">{$sBreadcrumb.1.name}</div>
  {/if}
  {$smarty.block.parent}
{/block}


{block name='frontend_blog_detail_crossselling_headline'}
    <div class="panel--title is--underline pre-headline">{s name="BlogHeaderCrossSelling"}Passende Produkte{/s}</div>
    <div class="panel--title is--underline headline">{s name="BlogHeaderCrossSellingHeadline"}Probieren geht über Studieren{/s}</div>
{/block}


{block name='frontend_blog_detail_box_content'}

{* Thumbnails *}
{if $sArticle.media}
<div class="piran--comparison-mood-thumbnails-outter">
    <div class="piran--blog-compare-slide-show-container">
      {s name="PiranBlogCompareSlideShow" namespace="frontend/blog/detail"}Bildstrecke{/s}
    </div>
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
</div>
{/if}

{$smarty.block.parent}

{/block}
