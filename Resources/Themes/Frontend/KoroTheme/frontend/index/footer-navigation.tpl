{namespace name="frontend/index/menu_footer"}

{* Footer Navigation KoRo Drogerie 06/2016 *}

{* KoRo Logo *}
{block name="frontend_index_footer_column_produktpalette_menu"}
    <div class="footer--column column--menu block logo--footer-block is--first">
				{block name='frontend_index_logo'}
					<div class="logo--shop block">
							{s name="IndexLinkDefault" namespace="frontend/index/index" assign="snippetIndexLinkDefault"}{/s}
							<a class="logo--link" href="{url controller='index'}" title="{"{config name=shopName}"|escapeHtml} - {$snippetIndexLinkDefault|escape}">
									<picture>
											<source srcset="{link file=$theme.desktopLogo}" media="(min-width: 78.75em)">
											<source srcset="{link file=$theme.tabletLandscapeLogo}" media="(min-width: 64em)">
											<source srcset="{link file=$theme.tabletLogo}" media="(min-width: 48em)">

											{s name="IndexLinkDefault" namespace="frontend/index/index" assign="snippetIndexLinkDefault"}{/s}
											<img srcset="{link file=$theme.mobileLogo}" alt="{"{config name=shopName}"|escapeHtml} - {$snippetIndexLinkDefault|escape}" />
									</picture>
							</a>
					</div>
				{/block}
    </div>
{/block}

{block name="frontend_index_footer_column_extendables"}
	<div class="piran--footer-extendables piran--big-shadow is--rounded">

		{* Kundenservice *}
		{block name="frontend_index_footer_column_kundenservice_menu"}
			<div class="footer--column column--menu block">
					<div class="column--headline">{s name="footer-kundenservice"}Service{/s}</div>

					<nav class="column--navigation column--content">
						<ul class="navigation--list" role="menu">
							{block name="frontend_index_footer_column_kundenservice_menu_before"}{/block}
							{foreach $sMenu.bottom as $item}

		                        {block name="frontend_index_footer_column_kundenservice_menu_entry"}
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

							{block name="frontend_index_footer_column_kundenservice_menu_after"}{/block}
						</ul>
					</nav>
			</div>
		{/block}

		{* Koro Drogerie *}
		{block name="frontend_index_footer_column_korodrogerie_menu"}
			<div class="footer--column column--menu block">
					<div class="column--headline">{s name="footer-koro"}KoRo{/s}</div>
					<nav class="column--navigation column--content">
						<ul class="navigation--list" role="menu">
							{block name="frontend_index_footer_column_korodrogerie_menu_before"}{/block}
							{foreach $sMenu.bottom2 as $item}

		                        {block name="frontend_index_footer_column_korodrogerie_menu_entry"}
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

							{block name="frontend_index_footer_column_korodrogerie_menu_after"}{/block}
						</ul>
					</nav>
			</div>
		{/block}

		{* Rechtliches *}
		{block name="frontend_index_footer_column_rechtliches_menu"}
			<div class="footer--column column--menu block">
					<div class="column--headline">{s name="footer-rechtliches"}Rechtliches{/s}</div>
					<nav class="column--navigation column--content">
						<ul class="navigation--list" role="menu">
							{block name="frontend_index_footer_column_rechtliches_menu_before"}{/block}
							{foreach $sMenu.gBottom3 as $item}

		                        {block name="frontend_index_footer_column_rechtliches_menu_entry"}
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

							{block name="frontend_index_footer_column_rechtliches_menu_after"}{/block}
						</ul>
					</nav>
			</div>
		{/block}

		{block name="frontend_index_footer_column_koro_internationa_menu"}
			<div class="footer--column column--menu is--last block">
					<div class="column--headline">{s name="KoRoInternational"}KoRo International{/s}</div>
					<nav class="column--navigation column--content">
						<ul class="navigation--list" role="menu">
							{block name="frontend_index_footer_column_koro_international_menu_before"}{/block}

		                        {block name="frontend_index_footer_column_koro_international_menu_entry"}
		                            <li class="navigation--entry" role="menuitem">
		                                <a class="navigation--link" href='{s name="KoRoInternationalGermanyLink"}https://www.korodrogerie.de{/s}'>
		                                  <div class="language--flag de_DE piran--margin-right"></div>{s name="KoRoInternationalGermany"}Deutschland{/s}
		                                </a>
		                            </li>
		                            <li class="navigation--entry" role="menuitem">
		                                <a class="navigation--link" href='{s name="KoRoInternationalAustriaLink"}https://www.koro-shop.at{/s}'>
		                                  <div class="language--flag de_AT piran--margin-right"></div>{s name="KoRoInternationalAustria"}Österreich{/s}
		                                </a>
		                            </li>
		                            <li class="navigation--entry" role="menuitem">
		                                <a class="navigation--link" href='{s name="KoRoInternationalSwitzerlandLink"}https://www.koro-shop.ch/{/s}'>
		                                  <div class="language--flag de_CH piran--margin-right"></div>{s name="KoRoInternationalSwitzerland"}Schweiz{/s}
		                                </a>
		                            </li>
		                            <li class="navigation--entry" role="menuitem">
		                                <a class="navigation--link" href='{s name="KoRoInternationalFranceLink"}https://www.koro-shop.fr/{/s}'>
		                                  <div class="language--flag fr_FR piran--margin-right"></div>{s name="KoRoInternationalFrance"}France{/s}
		                                </a>
		                            </li>
		                            <li class="navigation--entry" role="menuitem">
		                                <a class="navigation--link" href='{s name="KoRoInternationalNetherlandsLink"}https://www.koro-shop.nl/{/s}'>
		                                  <div class="language--flag nl_NL piran--margin-right"></div>{s name="KoRoInternationalNederland"}Nederland{/s}
		                                </a>
		                            </li>
		                            <li class="navigation--entry" role="menuitem">
		                                <a class="navigation--link" href='{s name="KoRoInternationalUKLink"}https://www.koro-shop.co.uk/{/s}'>
		                                  <div class="language--flag en_GB piran--margin-right"></div>{s name="KoRoInternationalUnitedKingdom"}United Kingdom{/s}
		                                </a>
		                            </li>
		                        {/block}

							{block name="frontend_index_footer_column_rechtliches_menu_after"}{/block}
						</ul>
					</nav>
			</div>
		{/block}

	</div>
{/block}
