{extends file="parent:frontend/search/ajax.tpl"}

{* Adds "Du suchst nach" Term to Ajax Search | Piran, 07.18 *}
{block name="search_ajax_inner"}
  <p class="result--search-term"><b>{s name="SearchForText"}du suchst nach{/s}:</b>{$sSearchResults.sTerm}</p>
  {$smarty.block.parent}
{/block}
