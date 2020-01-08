{extends file="parent:frontend/checkout/finish.tpl"}
{* Zusätzliche Informationen auf der Bestellbestätigungsseite | www.actualize.de | 06/2016 *}

{* Zusätzlicher Hinweis für GMAIL Kunden *}
{block name='frontend_checkout_finish_teaser_print_notice'}
  {$smarty.block.parent}
<h2 class="panel--title teaser--title is--align-center">{s name="note-gmail"}Hinweis für Gmail Kunden:{/s}</h2>
  <p class="print--notice">{s name="gmail-printnote"}Sollten Sie keine Bestellbestätigung oder Rechnung erhalten, bitte schauen Sie in Ihren SPAM Ordner nach. Es kann leider vorkommen, dass die Mails nicht automatisch im Posteingang landen.{/s}</p>
{/block}

{* Zusätzlicher Hinweis für Vorkasse-Kunden *}
{block name='frontend_checkout_finish_table_footer'}
  {$smarty.block.parent}
{if $sUserData.additional.payment.description == "Vorkasse"}
  <p style="margin-top:40px; margin-bottom: 0;">{s name="vorkasse-note"}Die Bankdaten zur Überweisung des Kaufpreises erhalten Sie in Kürze mit der Rechnung als PDF.{/s}
  <br>{s name="vorkasse-zahlung"}Bitte geben Sie bei der Überweisung die dort aufgeführten Zahlungshinweise an.{/s}</p>
{/if}
{/block}
