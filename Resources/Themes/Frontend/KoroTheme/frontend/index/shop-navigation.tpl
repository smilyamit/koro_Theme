{extends file="parent:frontend/index/shop-navigation.tpl"}

{* Menu (Off canvas right) trigger *}
{block name='frontend_index_offcanvas_left_trigger'}
    <li class="navigation--entry entry--menu-left" role="menuitem">
        <a class="entry--link entry--trigger btn is--icon-left" href="#offcanvas--right" data-direction="fromright" data-offcanvas="true" data-offCanvasSelector=".sidebar-main">
            <i class="icon--menu"></i> {s namespace='frontend/index/menu_left' name="IndexLinkMenu"}{/s}
        </a>
    </li>
{/block}
