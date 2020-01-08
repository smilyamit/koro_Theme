{extends file="parent:frontend/index/topbar-navigation.tpl"}

{block name="frontend_index_top_bar_nav"}
  <div class="navigation--entry entry--trust-claim is--left" role="menuitem">
    {s namespace='frontend/index/checkout_actions' name='IndexConversionHeader1'}TrustClaim1{/s}
  </div>
  <div class="navigation--entry entry--trust-claim is--left" role="menuitem">
    {s namespace='frontend/index/checkout_actions' name='IndexConversionHeader2'}TrustClaim2{/s}
  </div>
  <div class="navigation--entry entry--trust-claim is--left" role="menuitem">
    {s namespace='frontend/index/checkout_actions' name='IndexConversionHeader3'}TrustClaim3{/s}
  </div>
  {$smarty.block.parent}
{/block}
