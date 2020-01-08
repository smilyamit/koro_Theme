{* Formular wird bei erfolgreichem Anmelden immer ausgeblendet | www.actualize.de | 07/2016 *}

{extends file="parent:frontend/newsletter/index.tpl"}

{* Newsletter content *}
{block name="frontend_newsletter_content"}
{if $sStatus.code !=3}
	{if $voteConfirmed == false || $sStatus.code == 0}
		{$smarty.block.parent}
	{/if}
{/if}
{/block}
