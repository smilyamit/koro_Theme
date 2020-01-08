{extends file="parent:frontend/checkout/confirm.tpl"}
{* Adding Popup trigger for shop switch *}

{block name='frontend_checkout_confirm_information_addresses_equal_panel_billing_invalid_data'}
  {$smarty.block.parent}
  {if $invalidShippingCountry}
    <div class="body--revocation" data-modalbox="true" data-additionalClass="koro-delivery-modal" data-targetSelector="a" data-mode="ajax" data-height="400" data-width="550">
      <a id="language-popup" href="/custom/index/sCustom/185"></a>
    </div>
  {/if}
{/block}
