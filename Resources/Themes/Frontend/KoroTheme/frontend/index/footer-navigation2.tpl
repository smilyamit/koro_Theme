{namespace name="frontend/index/menu_footer"}

{* Footer Navigation2 KoRo Drogerie 06/2016 *}

{* Produktspezifikationen *}
{block name="frontend_index_footer_column_produktspezifikationen_menu"}
	<div class="footer--column column--menu block">
			<div class="column--headline">{s name="footer-productspecs"}Produktspezifikationen{/s}</div>
			<nav class="column--navigation column--content">
				<ul class="navigation--list" role="menu">
					{block name="frontend_index_footer_column_produktspezifikationen_menu_before"}{/block}
					{foreach $sMenu.prodSpec as $item}

                        {block name="frontend_index_footer_column_produktspezifikationen_menu_entry"}
                            <li class="navigation--entry" role="menuitem">
                                <a class="navigation--link" href="{if $item.link}{$item.link}{else}{url controller='custom' sCustom=$item.id title=$item.description}{/if}" title="{$item.description|escape}"{if $item.target} target="{$item.target}"{/if}>
                                    {$item.description}
                                </a>

                                {* Sub categories *}
                                {if $item.childrenCount > 0}
                                    <ul class="navigation--list is--level1" role="menu">
                                        {foreach $item.subPages as $subItem}
                                            <li class="navigation--entry" role="menuitem">
                                                <a class="navigation--link" href="{if $subItem.link}{$subItem.link}{else}{url controller='custom' sCustom=$subItem.id title=$subItem.description}{/if}" title="{$subItem.description|escape}"{if $subItem.target} target="{$subItem.target}"{/if}>
                                                    {$subItem.description}
                                                </a>
                                            </li>
                                        {/foreach}
                                    </ul>
                                {/if}
                            </li>
                        {/block}
                    {/foreach}

					{block name="frontend_index_footer_column_produktspezifikationen_menu_after"}{/block}
				</ul>
			</nav>
	</div>
{/block}

{* Für Unternehmen *}
{block name="frontend_index_footer_column_fuerunternehmen_menu"}
	<div class="footer--column column--menu block">
			<div class="column--headline">{s name="footer-fuerunternehmen"}Für Unternehmen{/s}</div>
			<nav class="column--navigation column--content">
				<ul class="navigation--list" role="menu">
					{block name="frontend_index_footer_column_fuerunternehmen_menu_before"}{/block}
					{foreach $sMenu.fUnt as $item}

                        {block name="frontend_index_footer_column_fuerunternehmen_menu_entry"}
                            <li class="navigation--entry" role="menuitem">
                                <a class="navigation--link" href="{if $item.link}{$item.link}{else}{url controller='custom' sCustom=$item.id title=$item.description}{/if}" title="{$item.description|escape}"{if $item.target} target="{$item.target}"{/if}>
                                    {$item.description}
                                </a>

                                {* Sub categories *}
                                {if $item.childrenCount > 0}
                                    <ul class="navigation--list is--level1" role="menu">
                                        {foreach $item.subPages as $subItem}
                                            <li class="navigation--entry" role="menuitem">
                                                <a class="navigation--link" href="{if $subItem.link}{$subItem.link}{else}{url controller='custom' sCustom=$subItem.id title=$subItem.description}{/if}" title="{$subItem.description|escape}"{if $subItem.target} target="{$subItem.target}"{/if}>
                                                    {$subItem.description}
                                                </a>
                                            </li>
                                        {/foreach}
                                    </ul>
                                {/if}
                            </li>
                        {/block}
                    {/foreach}

					{block name="frontend_index_footer_column_fuerunternehmen_menu_after"}{/block}
				</ul>
			</nav>
	</div>
{/block}

{* KoRo Newsletter *}
<div class="footer--column column--newsletter block">
    <div class="column--headline">{s name="footer-koronewsletter"}KoRo Newsletter{/s}</div>
  {block name="frontend_index_footer_column_newsletter_content"}
    <div class="column--content">
        <p>{s name="footer-nlbenefit"}Sonderangebote, Rezepte, Tipps und mehr!{/s}</p>
      {block name="frontend_index_footer_column_newsletter_form"}
        <form class="newsletter--form" action="{url controller='newsletter'}" method="post">
          <input type="hidden" value="1" name="subscribeToNewsletter" />
          {block name="frontend_index_footer_column_newsletter_form_field"}
            <input type="email" name="newsletter" class="newsletter--field" placeholder="{s name="IndexFooterNewsletterValue"}{/s}" />
          {/block}
          {block name="frontend_index_footer_column_newsletter_form_submit"}
            <button type="submit" class="newsletter--button btn">
              <i class="icon--mail"></i> <span class="button--text">{s name='IndexFooterNewsletterSubmit'}{/s}</span>
            </button>
            <p class="newsletterfooterhinweistext">{s name="footer-nlNote"}* Keine Weitergabe von Daten an Dritte, jederzeit Abbestellung möglich.{/s}</p>
          {/block}
        </form>
      {/block}
    </div>
  {/block}
</div>

{* KoRO International *}
{block name="frontend_index_footer_column_korointernational_menu"}
	<div class="footer--column column--menu is--last block">
		<div class="column--headline">
		    Koro International
		</div>
        <nav class="column--navigation column--content">
        	    <ul class="navigation--list" role="menu">
                    <li class="navigation--entry" role="menuitem"><a class="navigation--link" href="https://www.korodrogerie.de/en">English</a></li>
                    <li class="navigation--entry" role="menuitem"><a class="navigation--link" href="https://www.korodrogerie.de">Deutsch</a></li>
                </ul>
        </nav>
	</div>
{/block}