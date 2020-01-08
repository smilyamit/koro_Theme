{extends file='parent:frontend/checkout/ajax_cart_item.tpl'}
{* Template ajax_cart_item.tpl | www.actualize.de | 08/2016 *}

{block name='frontend_checkout_ajax_cart_articlename' append}
{if $sBasketItem.additional_details.attr12 && $sBasketItem.additional_details.attr12}
<p class="delivery--information">
  <span class="delivery--text delivery--text-available">
    Sie haben einen frischen Artikel im Warenkorb, der am {$sBasketItem.additional_details.attr13} erscheinen wird. Die Lieferung erfolgt gemeinsam am {$sBasketItem.additional_details.attr12} mit den restlichen Artikeln des Warenkorbs.
  </span>
</p>
{/if}
{/block}
