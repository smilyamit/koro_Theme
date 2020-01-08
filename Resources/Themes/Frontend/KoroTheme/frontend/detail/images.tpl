{extends file="parent:frontend/detail/images.tpl"}

{block name="frontend_detail_image_thumbs_images_img"}
    {if $image.thumbnails[0].emzProductVideo}
        <img srcset="{link file=$theme.mobileLogo}"
            alt="{s name="DetailThumbnailText" namespace="frontend/detail/index"}{/s}: {$alt}"
            title="{s name="DetailThumbnailText" namespace="frontend/detail/index"}{/s}: {$alt|truncate:160}"
            class="thumbnail--image" />
    {else}
        {$smarty.block.parent}
    {/if}
{/block}