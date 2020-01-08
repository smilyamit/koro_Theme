{extends file="parent:frontend/address/form.tpl"}

{* Country *}
{block name='frontend_address_form_input_country'}
    <div class="address--country field--select select-field">
        <select name="{$inputPrefix}[country]"
                data-address-type="address"
                id="country"
                required="required"
                aria-required="true"
                class="select--country is--required{if $error_flags.country} has--error{/if}">
            <option disabled="disabled" value="" selected="selected">{s name='RegisterBillingPlaceholderCountry' namespace="frontend/register/billing_fieldset"}{/s}{s name="RequiredField" namespace="frontend/register/index"}{/s}</option>
            {foreach $countryList as $country}
                {block name="frontend_address_form_input_country_option"}
                    {if $country.attributes}
                        {if $country.attributes.core->get('emz_hide_country')}
                            {continue}
                        {/if}
                    {/if}
                    {if $isShipping && $country.allowShipping || !$isShipping}
                        <option value="{$country.id}" {if $country.id eq $formData.country.id}selected="selected"{/if} {if $country.states}stateSelector="country_{$country.id}_states"{/if}>
                            {$country.countryname}
                        </option>
                    {/if}
                {/block}
            {/foreach}
        </select>
    </div>
{/block}