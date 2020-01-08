{extends file="parent:frontend/_includes/cookie_permission_note.tpl"}

{block name="cookie_permission_content"}
  <img class="piran--cookie-permission-image" src="{link file='frontend/_public/src/img/svg/cookieconsent_cookie.svg'}" alt="Cookieconsent Image" />
{$smarty.block.parent}
{/block}
