{extends file='parent:widgets/index/shop_menu.tpl'}
{* Language switcher *}

{block name="frontend_index_actions_active_shop_language_form_content"}
    <div class="field--select">
        {if $shop && $languages|count > 1}
            <div class="language--flag {if $shop->getLocale()->toString() == 'de_DE' && $shop->getName() == 'Österreich'}de_AT{elseif $shop->getLocale()->toString() == 'de_DE' && $shop->getName() == 'Schweiz'}de_CH{else}{$shop->getLocale()->toString()}{/if}">{$shop->getName()}</div>
        {/if}
        {block name="frontend_index_actions_active_shop_language_form_select"}
            <div class="select-field">
                <select name="__shop" class="language--select" data-auto-submit="true">
                    {foreach $languages as $language}
                        <option value="{$language->getId()}" {if $language->getId() === $shop->getId()}selected="selected"{/if}>
                            {$language->getName()}
                        </option>
                    {/foreach}
                </select>
            </div>
        {/block}
        <input type="hidden" name="__redirect" value="1">
        {block name="frontend_index_actions_active_shop_inline"}{/block}
    </div>
{/block}
