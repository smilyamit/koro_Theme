{* get correct for picture-tag *}
{if $media}
    {$mediaName = $media->getName()}
    {$thumbnails = $media->getThumbnails()}
    {$baseSource = $media->getFile()}

    {if $thumbnails && $thumbnails[0]}
        {$itemSize = "100vw"}
        {$srcSet = ""}
        {$retinaSrcSet = ""}

        {foreach $thumbnails as $thumbnail}
            {if !$thumbnail@first}
                {$srcSet = $srcSet|cat:", "}

                {if $thumbnail->getRetinaSource()}
                    {$retinaSrcSet = $retinaSrcSet|cat:", "}
                {/if}
            {/if}

            {$srcSet = $srcSet|cat:$thumbnail->getSource()}
            {$srcSet = $srcSet|cat:" "}
            {$srcSet = $srcSet|cat:$thumbnail->getMaxWidth()}
            {$srcSet = $srcSet|cat:"w"}

            {if $thumbnail->getRetinaSource()}
                {$retinaSrcSet = $retinaSrcSet|cat:$thumbnail->getRetinaSource()}
                {$retinaSrcSet = $retinaSrcSet|cat:" "}
                {$retinaSrcSet = $retinaSrcSet|cat:$thumbnail->getMaxWidth()}
                {$retinaSrcSet = $retinaSrcSet|cat:"w"}
            {/if}
        {/foreach}
    {/if}
{/if}

<picture class="lazy-section-image lazy" data-loader="emzPicturePlaceholderLoader">
    <source sizes="{$itemSize}" srcset="{$thumbnails[3]->getSource()}" data-srcset="{$retinaSrcSet}" media="(min-resolution: 192dpi), (-webkit-min-device-pixel-ratio: 2)">
    <source sizes="{$itemSize}" srcset="{$thumbnails[3]->getSource()}" data-srcset="{$srcSet}">

    {* Fallback *}
    <img title="{$mediaName}" src="{$thumbnails[3]->getSource()}" data-src="{$baseSource}" alt="{$mediaName}" class="emz--is-blury" />
</picture>
