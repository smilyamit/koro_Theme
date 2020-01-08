{namespace name="frontend/index/menu_footer"}

{* Footer Navigation3 KoRo Drogerie 06/2016 *}

{* Unsere Partner *}
{block name="frontend_index_footer_column_unserepartner_menu"}
<div class="footer--column block block-one">
	<div class="column--headline">{s name="footer_shipping"}Versand{/s}</div>
	<ul class="footer_logos">
		<li class="img_logo dhl1" style="height: auto; width: auto;">
			<img src="{link file='frontend/_public/src/img/svg/dhl.svg'}" alt="{$alt}" title="{$alt|truncate:160}" />
		</li>
	</ul>
</div>
{/block}

{* Zahlungsarten *}
{block name="frontend_index_footer_column_zahlungsarten_menu"}
<div class="footer--column block block-two">
	<div class="column--headline">{s name="footer-payment"}Zahlung{/s}</div>
	<div class="footer-logos-wrapper">
		{include file='frontend/index/reusable/payments.tpl' paymentclass='footer_logos koro_payments'}
	</div>
</div>
{/block}

{* Geprüfte Qualität *}
{block name="frontend_index_footer_column_geprueftequalitaet_menu"}
<div class="footer--column block block-three">
	<div class="column--headline">{s name="footer-quality"}Geprüfte Qualität{/s}</div>
	<!-- {*  {if {config name=TSID}} *}
	<a href="https://www.trustedshops.com/shop/certificate.php?shop_id=X74DF664FF8174D1844BF2A44F2A124F6" title="{s name='WidgetsTrustedLogo' namespace='frontend/plugins/trusted_shops/logo'}{/s}" target="_blank">
		<img src="{link file='/media/image/08/e8/ab/trusted-shops-logo577118630f486.png'}" alt="{s name='WidgetsTrustedLogo' namespace='frontend/plugins/trusted_shops/logo'}{/s}" style="max-width:65px!important; float: left; margin-right: 5px" class="img-responsive"/>
	</a>
	{* {/if} *} -->
	<ul class="footer_logos right_footer_logos">
		<li class="img_logo" style="height: 30px;">
			<img src="{link file='frontend/_public/src/img/footer_logo/trusted1-comp.png'}" alt="{$alt}" title="{$alt|truncate:160}" />
		</li>
		<li class="img_logo" style="height: 30px;">
			<a href="https://www.trustedshops.de/bewertung/info_X74DF664FF8174D1844BF2A44F2A124F6.html" target="_blank">
			<img src="{link file='frontend/_public/src/img/footer_logo/trusted2-comp.png'}" alt="{$alt}" title="{$alt|truncate:160}" />
		</a>
		</li>
		<li class="img_logo">
			<a href="https://www.korodrogerie.de/biozertifikat/biozertifikat.pdf" target="_blank">
			<img style="height: 30px;" src="{link file='frontend/_public/src/img/svg/bio-siegel.svg'}" alt="{$alt}" title="{$alt|truncate:160}" />
			</a>
		</li>
		<li class="img_logo">
			<a href="{link file='/media/pdf/db/18/a5/2019_Urkunde_Kompensation_KoRo-Handels-GmbH.pdf'}" target="_blank">
			<img style="height: 30px;" src="{link file='frontend/_public/src/img/svg/prima.svg'}" alt="{$alt}" title="{$alt|truncate:160}" />
			</a>
		</li>
	</ul>
	</div>
	{/block}

	{* Unsere Sozialen Medien *}
	{block name="frontend_index_footer_column_social_media"}
		<div class="footer--column block block-four">
			<div class="column--headline">{s name="footer_social"}Social Media{/s}</div>
			<ul class="footer_logos">
				{if "{s name='footer-facebook'}{/s}" neq "" and "{s name='footer-facebook'}{/s}" neq " "}
					<li class="img_logo footer-facebook">
						<a href="{s name="footer-facebook"}{/s}" target="_blank">
							<img src="{link file='frontend/_public/src/img/svg/facebook.svg'}" alt="Facebook" />
						</a>
					</li>
				{/if}
				{if "{s name='footer-instagram'}{/s}" neq "" and "{s name='footer-instagram'}{/s}" neq " "}
					<li class="img_logo footer-instagram">
						<a href="{s name="footer-instagram"}{/s}" target="_blank">
							<img src="{link file='frontend/_public/src/img/svg/instagram.svg'}" alt="Instagram" />
						</a>
					</li>
				{/if}
				{if "{s name='footer-youtube'}{/s}" neq "" and "{s name='footer-youtube'}{/s}" neq " "}
					<li class="img_logo footer-youtube">
						<a href="{s name="footer-youtube"}{/s}" target="_blank">
							<img src="{link file='frontend/_public/src/img/svg/youtube.svg'}" alt="Youtube" />
						</a>
					</li>
				{/if}
			</ul>
		</div>
	{/block}
