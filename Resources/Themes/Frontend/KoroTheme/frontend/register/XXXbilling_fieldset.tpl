{extends file='parent:frontend/register/billing_fieldset.tpl'}

{* Hinweistext das kein Versand an Packstationen möglich ist | www.actualize.de | 06/2016 *}
{block name='frontend_register_billing_fieldset_input_street' prepend}
	<div class="packstationhinweis"><p><b>{s name="merchRegistryNoteTitel"}Hinweis:{/s}</b><br>{s name="merchRegistryNote"}Im Falle einer Versendung an eine Packstation oder Postfiliale, einen Haken bei "Die Lieferadresse weicht von der Rechnungsadresse ab" setzen.{/s}</p></div>
{/block}
