{extends file="parent:frontend/index/index.tpl"}
{* Anpassungen www.acutalize.de | 06/2016 *}
{* Shop header *}


{block name='frontend_index_content_main'}
{$smarty.block.parent}

{if $sTarget != "checkout" && $sTargetAction != "shippingPayment" &&  $sTargetAction != "confirm"}
<div class="nlsection" id="nlsection">
    <div class="container">
        <div class="nlleftbox">
          <span>
            <img class="newsletter-creative lazy" data-src="{link file='frontend/_public/src/img/Super-Mark.png'}">
          </span>
        </div>
        <div class="nlrightbox">
            <h4><span>{s name="nl-registry"}Jetzt für unseren Newsletter anmelden!{/s}</span></h4>
            <ul class="newsletter-list">
              <li class="newsletter-bulletpoint">{s name='NewsletterBulletpoint1'}Angenehme Süße{/s}</li>
              <li class="newsletter-bulletpoint">{s name='NewsletterBulletpoint2'}Top informiert{/s}</li>
              <li class="newsletter-bulletpoint">{s name='NewsletterBulletpoint3'}Aus 100 % Liebe{/s}</li>
            </ul>
            <form class="newsletter--form" action="{url controller='newsletter'}" method="post">
              <div class="newsletter-form--wrapper">
                <input type="hidden" value="1" name="subscribeToNewsletter" />
                {block name="frontend_index_footer_column_newsletter_form_field"}
                <input type="email" name="newsletter" class="newsletter--field" placeholder="{s name="IndexFooterNewsletterValue"}{/s}" />
                {/block}
                {block name="frontend_index_footer_column_newsletter_form_submit"}
                <button type="submit" class="newsletter--button btn">
                    <span class="button--text">
                        {s name='IndexFooterNewsletterSubmit'}{/s}
                    </span>
                </button>
              </div>
                {/block}
            </form>
            <p class="newsletterfooterhinweistext">{s name="nl-note"}* Keine Weitergabe von Daten an Dritte, jederzeit Abbestellung möglich.{/s}</p>
        </div>
    </div>
</div>
{/if}
{/block}

{*! FOOTER *}
{block name="frontend_index_footer"}
    <div id="MyCustomTrustbadge" style="width:160px;height:90px;z-index: 2500!important;position: fixed;bottom: 0px;"></div>
    {$smarty.block.parent}
{/block}
