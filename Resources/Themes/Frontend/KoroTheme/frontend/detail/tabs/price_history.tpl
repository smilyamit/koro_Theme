{* Offcanvas buttons *}
{block name='frontend_detail_produktspezifikationen_buttons_offcanvas'}
    <div class="buttons--off-canvas">
        {block name='frontend_detail_produktspezifikationen_buttons_offcanvas_inner'}
            <a href="#" title="{"{s name="OffcanvasCloseMenu" namespace="frontend/detail/description"}{/s}"|escape}" class="close--off-canvas">
                <i class="icon--arrow-left"></i>
                {s name="OffcanvasCloseMenu" namespace="frontend/detail/description"}{/s}
            </a>
        {/block}
    </div>
{/block}

<div class="tab--price-history piran--tab-wrapper">

    <div class="piran--detail-content">

      {block name="frontend_detail_price_history"}
          <div class="piran--detail-pre-title panel--title is--underline pre-headline">{s name="PriceHistoryPreHeadline"}Preisentwicklung{/s}</div>
          <h3 class="piran--detail-title">{s name="PriceGrapPriceHistoryHeadlinehTitle"}Der KoRo Preisgraph{/s}</h3>
      {/block}

      <div class="piran--price-history-price-graph-block-outter">
        <div class="piran--price-history-price-graph-block-wrapper piran--big-shadow">
          {block name="frontend_detail_price_history_chart"}{/block}
        </div>
      </div>

      <button class="piran--pirce-history-show-more btn">{s name="ReviewShowMoreButton"}Mehr anzeigen{/s}</button>

      <div class="piran--pirce-history-more-content is--hidden">

        <div class="piran--price-history-inner-flex-wrapper">
          <div class="piran--price-history-text piran--price-history-first">
            <div class="piran--price-history-bulletpoints-wrapper">
              <ul class="piran--price-history-bulletpoints">
                <li class="piran--price-history-bulletpoint">
                  <div class="piran--price-history-image-container piran--price-history-image-1">
                    <img class="piran--price-history-image" src="{link file='frontend/_public/src/img/svg/price-graph-screen-icon-100x100.svg'}" alt="Price Graph Icon" />
                  </div>
                  <div class="piran--price-history-bulletpoint-text">
                      <h4 class="piran--price-history-bulletpoint-headline">{s name="PriceHistoryBulletpointHeadline_1"}Was ist der KoRo Preisgraph?{/s}</h4>
                      {s name="PriceHistoryBulletpoint_1"}In der Grafik kannst Du den Preis pro Grundeinheit (meist 100g) sehen. Zusätzlich erfährst Du via Klick auf die Infokreise den Grund für eine Preissenkung oder -steigerung.{/s}
                  </div>
                </li>
                <li class="piran--price-history-bulletpoint">
                  <div class="piran--price-history-image-container piran--price-history-image-2">
                    <img class="piran--price-history-image" src="{link file='frontend/_public/src/img/svg/price-change-icon-100x100.svg'}" alt="Price Change Icon" />
                  </div>
                  <div class="piran--price-history-bulletpoint-text">
                      <h4 class="piran--price-history-bulletpoint-headline">{s name="PriceHistoryBulletpointHeadline_2"}Wieso schwankt der Preis?{/s}</h4>
                      {s name="PriceHistoryBulletpoint_2"}Die meist jährlichen Rohstoffernten haben Einfluss auf das Verhältnis zwischen Angebot und Nachfrage am Markt. Bei schlechter Ernte müssen auch wir einen höheren Preis für Rohstoffe zahlen. Durch den starken Einfluss von externen Faktoren wie Wind & Wetter, Klima und Naturereignisse auf die Ernte, lehnen wir ernteübergreifende Langzeit-Kontrakte mit unseren Produzenten ab.{/s}
                  </div>
                </li>
                <li class="piran--price-history-bulletpoint">
                  <div class="piran--price-history-image-container piran--price-history-image-3">
                    <img class="piran--price-history-image" src="{link file='frontend/_public/src/img/svg/communication-icon-100x100.svg'}" alt="Communication Icon" />
                  </div>
                  <div class="piran--price-history-bulletpoint-text">
                      <h4 class="piran--price-history-bulletpoint-headline">{s name="PriceHistoryBulletpointHeadline_3"}Wieso kommuniziert KoRo Preisänderungen?{/s}</h4>
                      {s name="PriceHistoryBulletpoint_3"}Die offene Kommunikation ist uns bei KoRo besonders wichtig und deshalb auch Teil unserer Vision. Aus diesem Grund möchten wir Dich auf dem Laufenden halten, was die Entwicklung unserer Preise angeht. So ermöglicht der KoRo Preisgraph einen transparenten Einblick in die Produktpreisentwicklung über Zeit.{/s}
                  </div>
                </li>
              </ul>
            </div>
          </div>

          {block name='frontend_detail_price_history_inner'}
              <div class="piran--price-history-second">
                <div class="piran--price-history-newsletter-cta">
                    <div class="piran--price-history-pre-headline piran--price-history-bulletpoint-pre-headline">{s name="PriceHistoryNewsletterCTAPreHeadline"}Newsletter{/s}</div>                <h4>
                    {s name="PriceHistoryNewsletterCTAHeadline"}Der KoRo Preis-Letter{/s}
                  </h4>
                </div>
                <div class="piran--price-history-newsletter-cta-subline">
                  {s name="PriceHistoryNewsletterCTASubline"}Sei Up-to-Date: Lass Dir monatlich alle aktuellen Preisänderungen zukommen.{/s}
                </div>
                {* {$smarty.now|date_format} *}
                <form class="piran--newsletter-form" action="{url controller='newsletter'}" method="post">
                  <div class="piran--newsletter-form-wrapper piran--small-shadow">
                    <input type="hidden" value="1" name="subscribeToNewsletter" />
                    {block name="frontend_index_footer_column_newsletter_form_field"}
                    <input type="email" name="newsletter" class="piran--newsletter-field" placeholder="{s name="IndexFooterNewsletterValue"}{/s}" />
                    {/block}
                    {block name="frontend_index_footer_column_newsletter_form_submit"}
                    <button type="submit" class="piran--newsletter-button btn block">
                        <span class="piran--button-text">
                            {s name='IndexFooterNewsletterSubmit'}Anmelden{/s}
                        </span>
                    </button>
                  </div>
                    {/block}
                </form>
                <p class="piran--newsletter-disclaimer">
                  {s name="nl-note"}* Keine Weitergabe von Daten an Dritte, jederzeit Abbestellung möglich.{/s}
                </p>
                <img class="piran--price-history-newsletter-mockup lazy-section-image" data-src="{link file='frontend/_public/src/img/iphone-price-graph.gif'}" alt="Newsletter Mockup" />
              </div>
          {/block}

        </div>

      </div>
    </div>
</div>
