{* Delivery informations *}
{* Zusätzlicher Lieferstatus für frische Produkte | www.actualize.de | 06/2016 *}
{block name='frontend_widgets_delivery_infos'}
	<div class="product--delivery">
	{if $sArticle.attr12 && $sArticle.attr13}
	<p class="delivery--information">
		<span class="delivery--text delivery--text-available">
			Jetzt vorbestellen bis {$sArticle.attr13}, Versand erfolgt am {$sArticle.attr12}
		</span>
	</p>
	{elseif $sBasketItem.additional_details.attr12 && $sBasketItem.additional_details.attr12}
	<p class="delivery--information">
		<span class="delivery--text delivery--text-available">
			Sie haben einen frischen Artikel im Warenkorb, der am {$sBasketItem.additional_details.attr13} erscheinen wird. Die Lieferung erfolgt gemeinsam am {$sBasketItem.additional_details.attr12} mit den restlichen Artikeln des Warenkorbs.
		</span>
	</p>
	{else}
		{if $sArticle.shippingfree}
			<p class="delivery--information">
                <span class="delivery--text delivery--text-shipping-free">
                    <i class="delivery--status-icon delivery--status-shipping-free"></i>
                    {s name="DetailDataInfoShippingfree"}{/s}
                </span>
			</p>
		{/if}
		{if isset($sArticle.active) && !$sArticle.active}
            <link itemprop="availability" href="http://schema.org/LimitedAvailability" />
			<p class="delivery--information">
				<span class="delivery--text  delivery--text-not-available">
                    <i class="delivery--status-icon delivery--status-not-available"></i>
					{s name="DetailDataInfoNotAvailable"}{/s}
				</span>
			</p>
		{elseif $sArticle.sReleaseDate && $sArticle.sReleaseDate|date_format:"%Y%m%d" > $smarty.now|date_format:"%Y%m%d"}
            <link itemprop="availability" href="http://schema.org/PreOrder" />
			<p class="delivery--information">
				<span class="delivery--text delivery--text-more-is-coming">
                    <i class="delivery--status-icon delivery--status-more-is-coming"></i>
					{s name="DetailDataInfoShipping"}{/s} {$sArticle.sReleaseDate|date:'date_long'}
				</span>
			</p>
		{elseif $sArticle.esd}
            <link itemprop="availability" href="http://schema.org/InStock" />
			<p class="delivery--information">
				<span class="delivery--text delivery--text-available">
                    <i class="delivery--status-icon delivery--status-available"></i>
					{s name="DetailDataInfoInstantDownload"}{/s}
				</span>
			</p>
		{elseif {config name="instockinfo"} && $sArticle.modus == 0 && $sArticle.instock > 0 && $sArticle.quantity > $sArticle.instock}
			<link itemprop="availability" href="http://schema.org/LimitedAvailability" />
			<p class="delivery--information">
				<span class="delivery--text delivery--text-more-is-coming">
                    <i class="delivery--status-icon delivery--status-more-is-coming"></i>
					{s name="DetailDataInfoPartialStock"}{/s}
				</span>
			</p>

		{elseif $sArticle.instock >= $sArticle.minpurchase}
		{if $sArticle.additional_details.weight < 0.009 && $sArticle.weight < 0.009}
		<link itemprop="availability" href="http://schema.org/LimitedAvailability" />
		<p class="delivery--information">
			<span class="delivery--text delivery--text-more-is-coming">
									<i class="delivery--status-icon delivery--status-more-is-coming"></i>
			{s name="DetailDataShippingEmailVersand"}{/s}
			</span>
		</p>

		{else}
            <link itemprop="availability" href="http://schema.org/InStock" />
			<p class="delivery--information">
				<span class="delivery--text delivery--text-available">
                    <i class="delivery--status-icon delivery--status-available"></i>
					{s name="DetailDataInfoInstock"}{/s}
				</span>
			</p>
							{/if}
		{elseif $sArticle.shippingtime}
            <link itemprop="availability" href="http://schema.org/LimitedAvailability" />
			<p class="delivery--information">
				<span class="delivery--text delivery--text-more-is-coming">
                    <i class="delivery--status-icon delivery--status-more-is-coming"></i>
					{s name="DetailDataShippingtime"}{/s} {$sArticle.shippingtime} {s name="DetailDataShippingDays"}{/s}
				</span>
			</p>
		{else}
            <link itemprop="availability" href="http://schema.org/LimitedAvailability" />
			<p class="delivery--information">
				<span class="delivery--text delivery--text-not-available">
                    <i class="delivery--status-icon delivery--status-not-available"></i>
					{s name="DetailDataNotAvailable"}{config name=notavailable}{/s}
				</span>
			</p>
		{/if}
	{/if}
	</div>
{/block}
