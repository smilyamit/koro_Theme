{extends file="parent:widgets/emotion/components/component_banner_slider.tpl"}

{block name="frontend_widgets_banner_slider_banner_picture"}
    {$srcSet = ''}
    {$itemSize = ''}
    
    {if $banner.thumbnails}
        {$baseSource = $banner.thumbnails[0].source}

        {foreach $element.viewports as $viewport}
            {$cols = ($viewport.endCol - $viewport.startCol) + 1}
            {$elementSize = $cols * $cellWidth}
            {$size = "{$elementSize}vw"}

            {if $breakpoints[$viewport.alias]}

                {if $viewport.alias === 'xl' && !$emotionFullscreen}
                    {$size = "calc({$elementSize / 100} * {$baseWidth}px)"}
                {/if}

                {$size = "(min-width: {$breakpoints[$viewport.alias]}) {$size}"}
            {/if}

            {$itemSize = "{$size}{if $itemSize}, {$itemSize}{/if}"}
        {/foreach}

        {foreach $banner.thumbnails as $image}
            {$srcSet = "{if $srcSet}{$srcSet}, {/if}{$image.source} {$image.maxWidth}w"}

            {if $image.retinaSource}
                {$srcSet = "{if $srcSet}{$srcSet}, {/if}{$image.retinaSource} {$image.maxWidth * 2}w"}
            {/if}
        {/foreach}
    {else}
        {$baseSource = $banner.source}
    {/if}

    <picture class="banner-slider--image lazy" data-loader="emzPicturePlaceholderLoader">
        <source sizes="{$itemSize}" data-srcset="{$srcSet}"/>
        <source sizes="{$itemSize}" srcset="{$banner.thumbnails[3].source}" data-srcset="{$srcSet}" />

        <img data-src="{$srcSet}" src="{$banner.thumbnails[3].source}" alt="{$desc|strip_tags|truncate:160}" class="emz--is-blury" />
    </picture>

    {* Integrate SwkweEmotionArticleBuy *}
    {if $banner.mapping && $banner.mapping != ''}
        <div class="banner--mapping {* $Data.bannerPosition *}">
            {foreach $banner.mapping as $mapping}
                {include file='frontend/_includes/banner_mapping_item.tpl'}
            {/foreach}
        </div>
    {/if}
{/block}