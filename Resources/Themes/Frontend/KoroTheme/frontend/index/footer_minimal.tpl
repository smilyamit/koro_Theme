{extends file="parent:frontend/index/footer_minimal.tpl"}

{block name="frontend_index_minimal_footer"}
  <div class="container checkout--footer-styling footer--columns logo-columns block-group">
      {include file='frontend/index/footer-navigation3.tpl'}
  </div>
  {$smarty.block.parent}
{/block}
