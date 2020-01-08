<ul class="{$paymentclass}">

    <li class="img_logo paypal">
        <img  src="{link file='frontend/_public/src/img/svg/paypal.svg'}" alt="{$alt}" title="{$alt|truncate:160}" />
    </li>

    <!--li class="img_logo rate">
			<img style="height: 1.5rem; width: 5rem;" src="{link file='frontend/_public/src/img/svg/klarna_sofort.svg'}" alt="{$alt}" title="{$alt|truncate:160}" />
		</li>
		<li class="img_logo rate">
			<img style="height: 1.5rem; width: 5rem;" src="{link file='frontend/_public/src/img/svg/klarna_slice_it.svg'}" alt="{$alt}" title="{$alt|truncate:160}" />
		</li>

		<li class="img_logo rechnung">
			<img style="height: 1.5rem; width: 5rem;" src="{link file='frontend/_public/src/img/svg/klarna_paylater.svg'}" alt="{$alt}" title="{$alt|truncate:160}" />
		</li-->

    {if "{s name='footer-klarna'}footer-klarna{/s}" neq "" and "{s name='footer-klarna'}footer-klarna{/s}" neq " "}
      <li class="img_logo rechnung">
          <img style="height: 1.5rem; width: 3.5rem;" src="{link file='frontend/_public/src/img/svg/klarna.svg'}" alt="{$alt}" title="{$alt|truncate:160}" />
      </li>
    {/if}

    {if "{s name='footer-ideal'}{/s}" neq "" and "{s name='footer-ideal'}{/s}" neq " "}
      <li class="img_logo ideal">
          <img style="height: 1.5rem; width: 3.5rem;" src="{link file='frontend/_public/src/img/svg/ideal_logo.svg'}" alt="{$alt}" title="{$alt|truncate:160}" />
      </li>
    {/if}

    {if "{s name='footer-stripe'}footer-stripe{/s}" neq "" and "{s name='ffooter-stripe'}footer-stripe{/s}" neq " "}
      <li class="img_logo stripe">
          <img style="height: 1.5rem; width: 2.75rem;" src="{link file='frontend/_public/src/img/svg/stripe.svg'}" alt="{$alt}" title="{$alt|truncate:160}" />
      </li>
    {/if}

    <li class="img_logo vorkasse" style="height: auto; width: auto;">
        <div class="piran--footer-prepayment">{s name="FooterPrepaymentSign" namespace="frontend/index/footer"}Vorkasse{/s}</div>
    </li>

    <li class="img_logo visa_1">
        <img style="height: 1.5rem; width: 3rem;" src="{link file='frontend/_public/src/img/svg/visa.svg'}" alt="{$alt}" title="{$alt|truncate:160}" />
    </li>

    <li class="img_logo mastercard_1">
        <img style="height: 1.5rem; width: 2rem;" src="{link file='frontend/_public/src/img/svg/mastercard.svg'}" alt="{$alt}" title="{$alt|truncate:160}" />
    </li>

</ul>
