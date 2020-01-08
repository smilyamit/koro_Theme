{extends file='parent:frontend/detail/image.tpl'}

{block name='frontend_detail_image_default_image_slider_item'}
    {* Bio Siegel*}
    {if $sArticle.attr2}
        {* {if $Locale=="en_GB" || $Locale=="fr_FR" || $Locale=="nl_NL"} *}
          <img src="{link file='frontend/_public/src/img/svg/organic-logo.svg'}" class="organic-logo-eu piran--big-shadow">
        {* {else}
          <img src="{link file='frontend/_public/src/img/svg/bio-siegel.svg'}" class="organic-logo-de">
        {/if} *}
    {/if}

    {$smarty.block.parent}
{/block}

{block name="frontend_detail_images_image_media"}
  {if $image.thumbnails[0].emzProductVideo}
    <span class="image--media">
    
      <video width="100%" autoplay loop muted class="lazy-video lazy-{$image@iteration} emz--slide-video">
        <source data-src="{$image.thumbnails[0].sourceSet}">
      </video>   
      <img style="display:none;">
    </span>
  {else}
    {$smarty.block.parent}
  {/if}
{/block}

{block name='frontend_detail_image_thumbs'}
{/block}

{block name='frontend_detail_image_box_dots'}
  {include file="frontend/detail/images.tpl"}
{/block}

