{* Offcanvas buttons *}
{block name='frontend_detail_emzfaqentries_buttons_offcanvas'}
    <div class="buttons--off-canvas">
        {block name='frontend_detail_emzfaqentries_buttons_offcanvas_inner'}
            <a href="#" title="{"{s name="OffcanvasCloseMenu" namespace="frontend/detail/description"}{/s}"|escape}" class="close--off-canvas">
                <i class="icon--arrow-left"></i>
                {s name="OffcanvasCloseMenu" namespace="frontend/detail/description"}{/s}
            </a>
        {/block}
    </div>
{/block}

<div class="tab--faq piran--tab-wrapper">
    <div class="piran--detail-content">
      <div class="piran--detail-pre-title panel--title is--underline pre-headline">{s name="FaqPreHeadline"}FAQs{/s}</div>
      <h3 class="piran--detail-title">{s name="FaqHeadline"}Fragen über Fragen{/s}</h3>
        <div class="emz-faq-container">
            <div class="content--emz-faq">
                {foreach from=$emzFaqEntries item=emzFaq}
                    <div class="emz-faq-box piran--big-shadow is--hover">
                        <div id="piran-faq-question-{$emzFaq@iteration}" data-animationSpeed="300" data-collapse-panel="true" data-collapseTarget="#piran-faq-answer-{$emzFaq@iteration}" class="piran-faq-trigger">
                          <h3>{$emzFaq.question}</h3>
                          <i class="icon--plus3"></i>
                        </div>
                        <div id="piran-faq-answer-{$emzFaq@iteration}" class="panel">
                          <p>{$emzFaq.answer}</p>
                        </div>
                    </div>
                {/foreach}
            </div>
        </div>
    </div>
</div>
