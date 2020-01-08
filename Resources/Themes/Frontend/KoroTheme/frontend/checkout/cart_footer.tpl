{extends file="parent:frontend/checkout/cart_footer.tpl"}

{*Cart Sum & Vat Removal | Piran, 06.18}

{block name='frontend_checkout_cart_footer_field_labels_sum'}
  {if $sDispatch.customergroupID != "1"}
    {$smarty.block.parent}
  {else}
  {/if}
{/block}

{block name='frontend_checkout_cart_footer_field_labels_taxes'}
{if $sDispatch.customergroupID != "1"}
  {$smarty.block.parent}
{else}
{/if}
{/block}

{block name='frontend_checkout_cart_footer_field_labels_totalnet'}
{if $sDispatch.customergroupID != "1"}
  {$smarty.block.parent}
{else}
{/if}
{/block}

{block name='frontend_checkout_cart_footer_field_labels_total_value'}
{if $sDispatch.customergroupID != "1"}
{$smarty.block.parent}
{else}
{$smarty.block.parent}
<div class="reduced-cart--info">
  {s name="inklusive" namespace="frontend/chekcout/cart_footer"}inkl. MwSt.{/s}
</div>
{/if}
{/block}
