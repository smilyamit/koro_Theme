{extends file="parent:frontend/register/billing_fieldset.tpl"}

{* Street *}
{block name='frontend_register_billing_fieldset_input_street'}
    <div class="register--street">
        <input autocomplete="section-billing billing street-address"
            name="register[billing][street]"
            type="text"
            required="required"
            aria-required="true"
            placeholder="{s name='RegisterBillingPlaceholderStreet'}{/s}{s name="RequiredField" namespace="frontend/register/index"}{/s}"
            id="street"
            value="{$form_data.street|escape}"
            class="register--field register--field-street is--required{if isset($error_flags.street)} has--error{/if}"
            maxlength="30"/>
    </div>
{/block}

{* Additional Address Line 1 *}
{block name='frontend_register_billing_fieldset_input_addition_address_line1'}
    {if {config name=showAdditionAddressLine1}}
        <div class="register--additional-line1">
            <input autocomplete="section-billing billing address-line2"
                name="register[billing][additionalAddressLine1]"
                type="text"{if {config name=requireAdditionAddressLine1}} required="required" aria-required="true"{/if}
                placeholder="{s name='RegisterLabelAdditionalAddressLine1'}{/s}{if {config name=requireAdditionAddressLine1}}{s name="RequiredField" namespace="frontend/register/index"}{/s}{/if}"
                id="additionalAddressLine1"
                value="{$form_data.additionalAddressLine1|escape}"
                class="register--field{if {config name=requireAdditionAddressLine1}} is--required{/if}{if isset($error_flags.additionalAddressLine1) && {config name=requireAdditionAddressLine1}} has--error{/if}"
                maxlength="30"/>
        </div>
    {/if}
{/block}

{* Additional Address Line 2 *}
{block name='frontend_register_billing_fieldset_input_addition_address_line2'}
    {if {config name=showAdditionAddressLine2}}
        <div class="register--additional-field2">
            <input autocomplete="section-billing billing address-line3"
                name="register[billing][additionalAddressLine2]"
                type="text"{if {config name=requireAdditionAddressLine2}} required="required" aria-required="true"{/if}
                placeholder="{s name='RegisterLabelAdditionalAddressLine2'}{/s}{if {config name=requireAdditionAddressLine2}}{s name="RequiredField" namespace="frontend/register/index"}{/s}{/if}"
                id="additionalAddressLine2"
                value="{$form_data.additionalAddressLine2|escape}"
                class="register--field{if {config name=requireAdditionAddressLine2}} is--required{/if}{if isset($error_flags.additionalAddressLine2) && {config name=requireAdditionAddressLine2}} has--error{/if}"
                maxlength="30"/>
        </div>
    {/if}
{/block}

{* Country *}
{block name="frontend_register_billing_fieldset_input_country"}
    <div class="register--country field--select select-field">
        <select name="register[billing][country]"
                data-address-type="billing"
                id="country"
                required="required"
                aria-required="true"
                class="select--country is--required{if isset($error_flags.country)} has--error{/if}">

            <option disabled="disabled"
                    value=""
                    selected="selected">
                {s name='RegisterBillingPlaceholderCountry' namespace="frontend/register/billing_fieldset"}{/s}
                {s name="RequiredField" namespace="frontend/register/index"}{/s}
            </option>

            {foreach $country_list as $country}
                {if $country.attributes}
                    {if $country.attributes.core->get('emz_hide_country')}
                        {continue}
                    {/if}
                {/if}
                <option value="{$country.id}" {if $country.id eq $form_data.country}selected="selected"{/if} {if $country.states}stateSelector="country_{$country.id}_states"{/if}>
                    {$country.countryname}
                </option>
            {/foreach}
        </select>
    </div>
{/block}