{* Footer menu *}
{block name='frontend_index_footer_menu'}
    <div class="footer--columns menu-column block-group">
        {include file='frontend/index/footer-navigation.tpl'}
    </div>
    {* Erweitertes Footer-Menü | www.actualize.de | 06/2016 *}
    {* Footer menu *}
    <div class="footer--columns logo-columns block-group">
        {include file='frontend/index/footer-navigation3.tpl'}
    </div>
{/block}

{* Copyright in the footer *}
{block name='frontend_index_footer_copyright'}
    <div class="footer--bottom">

        {* Vat info *}
        {block name='frontend_index_footer_vatinfo'}
            <div class="footer--vat-info">
                <span class="vat-info--text">
                    {if $sOutputNet}
                        {s name='FooterInfoExcludeVat' namespace="frontend/index/footer"}{/s}
                    {else}
                        {s name='FooterInfoIncludeVat' namespace="frontend/index/footer"}{/s}
                    {/if}
                </span>
            </div>
        {/block}

        {* Shopware footer *}
        {block name="frontend_index_shopware_footer"}

            {* Copyright *}
            {block name="frontend_index_shopware_footer_copyright"}
                <div class="footer--copyright">
                    <span>&nbsp;|&nbsp;</span>{s name="IndexCopyright"}{/s}
                </div>
            {/block}

            {* Logo *}
            {block name="frontend_index_shopware_footer_logo"}
              <div class="footer--made-with-love">
                {s name="FooterMadeWithLove"}| Made with <i class="icon--heart animation-pulse"></i> in Berlin{/s}
              </div>
            {/block}
        {/block}
    </div>

{/block}
