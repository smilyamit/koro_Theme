{block name='frontend_listing_box_article_actions'}
    <div class="instant--warenkorb">
        {if $sArticle.sConfigurator != 1 && (($sArticle.instock < 1 && $sArticle.laststock != 1) || $sArticle.instock > 0)}
            <form name="sAddToBasket" method="post" action="{url controller=checkout action=addArticle}" class="buybox--form" data-add-article="true" data-eventName="submit"{if $theme.offcanvasCart} data-showModal="false" data-addArticleUrl="{url controller=checkout action=ajaxAddArticleCart}"{/if}>
                <input type="hidden" name="csrf_token" value="8gi8u3b4878iuyb3id87hd87o" >
                <input type="hidden" name="isAjaxOvip" value="{$isAjaxRequest}">
                <input type="hidden" name="sActionIdentifier" value="{$sUniqueRand}"/>
                <input type="hidden" name="sAddAccessories" id="sAddAccessories" value=""/>
                <input type="hidden" name="sAdd" value="{$sArticle.ordernumber}"/>
                <input type="hidden" name="sQuantity" value="1"/>
                <button class="buybox--button block btn is--primary is--icon-right is--large" aria-disabled="true" name="{s name="DetailBuyActionAdd"}In den Warenkorb{/s}">
                    <i class="icon--basket"></i>
                </button>
            </form>
        {else}
          <a href="{$sArticle.linkDetails}" title="{$sArticle.articleName|escape}">
            <button class="no--buybox-button block btn is--primary is--large is--icon-right" name="{s name="ListingBoxLinkDetails" namespace="frontend/listing/box_article"}Zum Produkt{/s}">
                <i class="icon--info"></i>
                <i class="icon--arrow-right"></i>
            </button>
          </a>
          <br>
        {/if}
    </div>
{/block}
