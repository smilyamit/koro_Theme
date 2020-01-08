{extends file="parent:frontend/index/header.tpl"} {* Meta-Tags *}

{* Set favicons and touch icons for all different sizes *}
{block name="frontend_index_header_favicons"}
    <link rel="apple-touch-icon{if $theme.setPrecomposed}-precomposed{/if}" href="{link file=$theme.appleTouchIcon}">
    <link rel="shortcut icon" href="{link file=$theme.favicon}">
{/block}
