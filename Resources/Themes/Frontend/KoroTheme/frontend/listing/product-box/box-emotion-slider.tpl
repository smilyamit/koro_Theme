{extends file="frontend/listing/product-box/box-emotion.tpl"}

{block name='frontend_listing_box_article_image_picture'}
    {if {controllerName} == 'detail' && {controllerAction} == 'index'}
        {if $sArticle.image.thumbnails}
            {$baseSource = $sArticle.image.thumbnails[1].sourceSet}
        {else}
            {$baseSource = "{link file='frontend/_public/src/img/no-picture.jpg'}"}
        {/if}

        {$desc = $sArticle.articleName|escape}

        {if $sArticle.image.description}
            {$desc = $sArticle.image.description|escape}
        {/if}

        <img class="lazy emz--is-blury" data-loader="emzPlaceholderLoader" alt="{$desc}" src="{$sArticle.image.thumbnails[3].source}" title="{$desc|truncate:160}" data-srcset="{$baseSource}" />
    {else}
        {$smarty.block.parent}
    {/if}
{/block}
