{extends file='parent:frontend/detail/actions.tpl'}

{block name='frontend_detail_actions_compare'}
    {* Delivery informations *}
    {if ($sArticle.sConfiguratorSettings.type != 1 && $sArticle.sConfiguratorSettings.type != 2) || $activeConfiguratorSelection == true}
        {include file="frontend/plugins/index/delivery_informations.tpl" sArticle=$sArticle}
    {/if}
{/block}
{block name='frontend_detail_actions_review'}{/block}
