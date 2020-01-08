{extends file="parent:frontend/listing/product-box/box-product-slider.tpl"}


{block name='frontend_listing_box_article_image_picture_element'}
    <img class="lazy emz--is-blury" 
        src="{$sArticle.image.thumbnails[3].source}"
        data-srcset="{$sArticle.image.thumbnails[0].sourceSet}"
        data-loader="emzPlaceholderLoader"
        alt="{$desc}"
        data-extension="{$sArticle.image.extension}"
        title="{$desc|truncate:160}" />
{/block}