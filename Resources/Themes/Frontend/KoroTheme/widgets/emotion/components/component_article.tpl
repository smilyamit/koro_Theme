{extends file='parent:widgets/emotion/components/component_article.tpl'}

{block name="widget_emotion_component_product_panel"}
    {if $Data}
        <div class="emotion--product">
            {include file="frontend/listing/box_article.tpl" sArticle=$Data productBoxLayout="emotion" imageOnly=$Data.productImageOnly}
        </div>
    {/if}
{/block}

{block name='frontend_listing_box_article_image_picture'}
    {* Generate srcset for placeholder-images *}
    {$placeholderSrc = {link file='frontend/_public/src/img/placeholder/200.jpg'}}
    {$placeholderSrc = $placeholderSrc|cat:" 200w,"}

    {$placeholderSrc = $placeholderSrc|cat:{link file='frontend/_public/src/img/placeholder/300.jpg'}}
    {$placeholderSrc = $placeholderSrc|cat:" 300w,"}

    {$placeholderSrc = $placeholderSrc|cat:{link file='frontend/_public/src/img/placeholder/600.jpg'}}
    {$placeholderSrc = $placeholderSrc|cat:" 600w,"}

    {$placeholderSrc = $placeholderSrc|cat:{link file='frontend/_public/src/img/placeholder/1280.jpg'}}
    {$placeholderSrc = $placeholderSrc|cat:" 1280w,"}

    {if $imageOnly && $sArticle.hover_image.src.0}

        {$baseSource = $sArticle.hover_image.src.0}
        {$retBaseSource = $sArticle.hover_image.src.3}

        {if $itemCols && $emotion.grid.cols && !$fixedImageSize}
            {$colSize = 100 / $emotion.grid.cols}
            {$itemSize = "{$itemCols * $colSize}vw"}
        {else}
            {$itemSize = "100wv"}
        {/if}

        {$desc = $sArticle.articleName|escape}

        {if $sArticle.image.description}
            {$desc = $sArticle.image.description|escape}
        {/if}

        <picture class="lazy" data-loader="emzPictureLoader">
            <source sizes="100vw" srcset="{$placeholderSrc}" data-srcset="{$baseSource}" media="(-webkit-max-device-pixel-ratio: 1.9),(max-resolution: 191dpi)" />
            <source sizes="100vw" data-srcset="{$retBaseSource}" media="(-webkit-min-device-pixel-ratio: 2),(min-resolution: 192dpi)" />
            <img alt="{$desc}" title="{$desc|truncate:160}" />
        </picture>

    {else}
        {if $sArticle.image.thumbnails}
            {$baseSource = $sArticle.image.thumbnails[0].source}
            {$retBaseSource = $sArticle.image.thumbnails[0].retinaSource}

            {if $itemCols && $emotion.grid.cols && !$fixedImageSize}
                {$colSize = 100 / $emotion.grid.cols}
                {$itemSize = "{$itemCols * $colSize}vw"}
            {else}
                {$itemSize = "300px"}
            {/if}

            {foreach $sArticle.image.thumbnails as $key => $image}
                {$srcSet = "{if $image@index !== 0}{$srcSet}, {/if}{$image.source} {$image.maxWidth}w"}

                {if $image.retinaSource}
                    {$srcSetRetina = "{if $image@index !== 0}{$srcSetRetina}, {/if}{$image.retinaSource} {$image.maxWidth}w"}
                {/if}
            {/foreach}

        {elseif $sArticle.image.source}
            {$baseSource = $sArticle.image.source}
            {$retBaseSource = $sArticle.image.source}
        {else}
            {$baseSource = "{link file='frontend/_public/src/img/no-picture.jpg'}"}
            {$retBaseSource = "{link file='frontend/_public/src/img/no-picture.jpg'}"}
        {/if}

        {$desc = $sArticle.articleName|escape}

        {if $sArticle.image.description}
            {$desc = $sArticle.image.description|escape}
        {/if}

        {if $sArticle.image.thumbnails}
            <picture class="lazy" data-loader="emzPicturePlaceholderLoader">

                {if $srcSet}
                    <source sizes="100vw" srcset="{$sArticle.image.thumbnails[3].sourceSet}" data-srcset="{$srcSet}" media="(-webkit-max-device-pixel-ratio: 1.9),(max-resolution: 191dpi)" />
                {/if}

                {if $srcSetRetina}
                    <source sizes="100vw" srcset="{$sArticle.image.thumbnails[3].sourceSet}" data-srcset="{$srcSetRetina}" media="(-webkit-min-device-pixel-ratio: 2),(min-resolution: 192dpi)" />
                {/if}

                <img alt="{$desc}" title="{$desc|truncate:160}" data-srcset="{$srcSet}" srcset="{$sArticle.image.thumbnails[3].sourceSet}" class="emz--is-blury" />
            </picture>

        {else}

            <picture class="lazy" data-loader="emzPictureLoader">
                <source sizes="100vw" srcset="{$placeholderSrc}" data-srcset="{$baseSource}" media="(-webkit-max-device-pixel-ratio: 1.9),(max-resolution: 191dpi)" />
                <source sizes="100vw" data-srcset="{$retBaseSource}" media="(-webkit-min-device-pixel-ratio: 2),(min-resolution: 192dpi)" />
                <img alt="{$desc}" title="{$desc|truncate:160}" />
            </picture>
        {/if}
    {/if}
{/block}
