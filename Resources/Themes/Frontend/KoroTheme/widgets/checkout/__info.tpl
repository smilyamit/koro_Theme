{{extends file="parent:widgets/checkout/info.tpl"}

{* Notepad entry *}
{block name="frontend_index_checkout_actions_notepad"}
    <li class="navigation--entry entry--notepad" role="menuitem">
        {s namespace="frontend/index/checkout_actions" name="IndexLinkNotepad" assign="snippetIndexLinkNotepad"}{/s}
        <a href="{url controller='note'}" title="{$snippetIndexLinkNotepad|escape}" class="btn">
            <i class="icon--heart"></i>
            {if $sNotesQuantity > 0}
                <span class="badge notes--quantity">
                    {$sNotesQuantity}
                </span>
            {/if}
        </a>
    </li>
{/block}

{* My account entry *}
{block name="frontend_index_checkout_actions_my_options"}
    <li class="navigation--entry entry--account" role="menuitem">
        {block name="frontend_index_checkout_actions_account"}
            <a href="{url controller='account'}" title="{"{s namespace='frontend/index/checkout_actions' name='IndexLinkAccount'}{/s}"|escape}" class="btn is--icon-left entry--link account--link">
                <img class="icon_img" src="{link file='frontend/_public/src/img/icon/user.svg'}" alt="{$alt}" title="{$alt|truncate:160}" />
                <span class="account--display">
                    {s namespace='frontend/index/checkout_actions' name='IndexLinkAccount'}{/s}
                </span>
            </a>
        {/block}
    </li>
{/block}

{* Cart entry *}
{block name="frontend_index_checkout_actions_cart"}
    <li class="navigation--entry entry--cart" role="menuitem">
        <a class="btn is--icon-left cart--link" href="{url controller='checkout' action='cart'}" title="{"{s namespace='frontend/index/checkout_actions' name='IndexLinkCart'}{/s}"|escape}">
            <span class="cart--display">
                {if $sUserLoggedIn}
                    {s name='IndexLinkCheckout' namespace='frontend/index/checkout_actions'}{/s}
                {else}
                    {s namespace='frontend/index/checkout_actions' name='IndexLinkCart'}{/s}
                {/if}
            </span>

            <span class="badge is--primary is--minimal cart--quantity{if $sBasketQuantity < 1} is--hidden{/if}">{$sBasketQuantity}</span>

            <img class="icon_img" src="{link file='frontend/_public/src/img/icon/basket.svg'}" alt="{$alt}" title="{$alt|truncate:160}" />

            <span class="cart--amount">
                {* {s namespace='frontend/index/checkout_actions' name='IndexLinkCart'}{/s} *}
                {* Currency and amount variables *}
                {$sBasketAmount|currency}
                {s name="Star" namespace="frontend/listing/box_article"}{/s}
            </span>
        </a>
        <div class="ajax-loader">&nbsp;</div>
        <div class="cart-progress" style="display: none;">
            <div class="cart-progress-value" style="width: {$sBasketAmount}%;"></div>
        </div>
    </li>

    <li class="navigation--entry cart-info" style="visibility: hidden;">
    {if $sBasketAmount < 100}
        <div class="infobalken">
            <span>{s namespace='frontend/index/checkout_actions' name="shipping-text-before-amount"}{/s} <span id="shipping-free-left">{$sBasketAmount}</span> {s namespace='frontend/index/checkout_actions' name="shipping-text-after-amount"}{/s}</span>
        </div>
    {else}
        {s namespace='frontend/index/checkout_actions' name="free-shipping-text"}{/s}
    {/if}
</li>
{/block}

{block name="frontend_index_checkout_actions_inner"}{/block}
