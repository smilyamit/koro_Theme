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

<div class="tab--masonry piran--tab-wrapper">

    <div class="piran--detail-content">

        <div class="piran--detail-pre-title panel--title is--underline pre-headline">{s name="MasonryPreHeadline"}Hinter den Kulissen{/s}</div>
        <h3 class="piran--detail-title">{s name="MasonryHeadline"}Einblicke in KoRos Sortimentsentwicklung{/s}</h3>

      {if !$emzMasonryImages}
          <div class="piran--detail-image-container">
              <div class="piran--detail-image emotion--banner">
                  {include file="frontend/_includes/picture.tpl" media=$emz_masonry_banner_media}
              </div>
          </div>
      {/if}
      {block name="frontend_detail_tabs_content_emz_masonry"}{/block}

    </div>
</div>
