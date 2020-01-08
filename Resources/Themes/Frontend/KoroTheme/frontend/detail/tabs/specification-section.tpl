{* Offcanvas buttons *}
{block name='frontend_detail_specification_section_buttons_offcanvas'}
    <div class="buttons--off-canvas">
        {block name='frontend_detail_specification_section_buttons_offcanvas_inner'}
            <a href="#" title="{"{s name="OffcanvasCloseMenu" namespace="frontend/detail/description"}{/s}"|escape}" class="close--off-canvas">
                <i class="icon--arrow-left"></i>
                {s name="OffcanvasCloseMenu" namespace="frontend/detail/description"}{/s}
            </a>
        {/block}
    </div>
{/block}

<div class="tab--specification-section piran--tab-wrapper">
    <div class="piran--detail-content piran--no-padding">

        <div class="piran--detail-content">
          <div class="piran--detail-pre-title panel--title is--underline pre-headline">{s name="SpecificationSectionPreHeadline"}Markt{/s}</div>
          <h3 class="piran--detail-title">{s name="SpecificationSectionHeadline"}Für Experten und Wissbegierige{/s}</h3>
          {block name="frontend_detail_tabs_content_emz_specification_section"}{/block}
        </div>
    </div>
</div>
