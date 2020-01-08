{extends file='parent:frontend/checkout/items/product.tpl'}
{* Frischeversand Hinweis anzeigen | www.actualize.de 06-2018 *}
{* Product delivery information *}
{block name='frontend_checkout_cart_item_delete_article'}

    {$smarty.block.parent}
    {if $sBasketItem.additional_details.frischeversand == 1}
        <div class="block alert is--info is--rounded">
            {* Icon column *}
            {block name="frontend_global_messages_icon"}
                <div class="alert--icon">
                    <i class="icon--element icon--info"></i>
                </div>
            {/block}
            {* Content column *}
            {block name="frontend_global_messages_content"}
                <div class="alert--content">
                    {s name="FrischeVersandHinweis" namespace="frontend/detail"}{/s}
                </div>
            {/block}
        </div>

    {/if}
{/block}