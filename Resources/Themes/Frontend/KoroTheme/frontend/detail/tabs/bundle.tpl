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
      <div class="piran--detail-pre-title panel--title is--underline pre-headline">{s name="BundlePreHeadline"}Inhalt{/s}</div>
      <h3 class="piran--detail-title">{s name="BundleHeadline"}Dieses Set enthält{/s}</h3>

      {* KoRo Bundle *}
      {block name='frontend_detail_index_koro_bundle'}{/block}

    </div>
</div>
