{extends file="parent:frontend/checkout/ajax_cart_item.tpl"}

{block name='frontend_checkout_ajax_cart_articlename'}
    {$useAnchor = ($basketItem.modus != 4 && $basketItem.modus != 2)}
    {if $useAnchor}
        <a class="item--link" href="{$detailLink}" title="{$basketItem.articlename|escapeHtml}">
    {else}
        <div class="item--link">
    {/if}
        {block name="frontend_checkout_ajax_cart_articlename_name"}
            <span class="item--name">
                {if $basketItem.modus == 10}
                    {s name='AjaxCartInfoBundle'}{/s}
                {else}
                    {if $theme.offcanvasCart}
                        {$basketItem.articlename|escapeHtml}
                    {else}
                        {$basketItem.articlename|truncate:28:"...":true|escapeHtml}
                    {/if}
                {/if}
            </span>
        {/block}
        <div class="piran-ajax-item-container">
        {block name="frontend_checkout_ajax_cart_articlename_quantity"}
            <span class="item--quantity">{$basketItem.quantity}x</span>
        {/block}
        {block name="frontend_checkout_ajax_cart_articlename_price"}
            <span class="item--price">{if $basketItem.amount}{$basketItem.amount|currency}{else}{s name="AjaxCartInfoFree"}{/s}{/if}{s name="Star"}{/s}</span>
        {/block}
        </div>
    {if $useAnchor}
        </a>
    {else}
        </div>
    {/if}
{/block}
