{extends file="parent:frontend/search/category-filter.tpl"}

{* Fixes Search Category Filter Bug | Piran, 07.18 *}

{block name="frontend_search_category_filter_reset_link"}
    <a href="{$smarty.server.HTTP_HOST}{$smarty.server.REQUEST_URI}&c=reset&p=1" title="{"{s name='SearchFilterLinkDefault'}{/s}"|escape}" class="cat-filter--reset btn" data-action-link="true">
        {block name="frontend_search_category_filter_reset_link_icon"}
            <i class="icon--cross"></i>
        {/block}
        {s name="SearchFilterLinkDefault"}Alle Kategorien anzeigen{/s}
    </a>
{/block}

{block name="frontend_search_category_filter_sub_category_link"}
    <a href="{$smarty.server.HTTP_HOST}{$smarty.server.REQUEST_URI}&c={$subCategory->getId()}&p=1" title="{$subCategory->getLabel()|escape}" class="cat-filter--sub-cat" data-action-link="true">
        {block name="frontend_search_category_filter_sub_category_link_icon"}
            <span class="checkbox">
                <span class="checkbox--state"></span>
            </span>
        {/block}

        {block name="frontend_search_category_filter_sub_category_link_label"}
            {$subCategory->getLabel()}
        {/block}
    </a>
{/block}
