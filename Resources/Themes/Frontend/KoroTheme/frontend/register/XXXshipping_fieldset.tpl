{extends file="parent:frontend/register/shipping_fieldset.tpl"}
        {* Street *}
        {block name='frontend_register_shipping_fieldset_input_street'}
            <div class="register--street">
                <input autocomplete="section-shipping shipping street-address"
                       name="register[shipping][street]"
                       type="text"
                       required="required"
                       aria-required="true"
                       placeholder="{s name='RegisterShippingPlaceholderStreet'}{/s}{s name="RequiredField" namespace="frontend/register/index"}{/s}"
                       id="street2"
                       value="{$form_data.street|escape}"
                       class="register--field register--field-street is--required{if isset($error_flags.street)} has--error{/if}" 
                       maxlength="30"/>
            </div>
        {/block}

        {* Additional Address Line 1 *}
        {block name='frontend_register_shipping_fieldset_input_addition_address_line1'}
            {if {config name=showAdditionAddressLine1}}
                <div class="register--additional-line1">
                    <input autocomplete="section-shipping shipping address-line2"
                           name="register[shipping][additionalAddressLine1]"
                           type="text"{if {config name=requireAdditionAddressLine2}} required="required" aria-required="true"{/if}
                           placeholder="{s name='RegisterLabelAdditionalAddressLine1'}{/s}{if {config name=requireAdditionAddressLine1}}{s name="RequiredField" namespace="frontend/register/index"}{/s}{/if}"
                           id="additionalAddressLine21"
                           value="{$form_data.additionalAddressLine1|escape}"
                           class="register--field{if {config name=requireAdditionAddressLine1}} is--required{/if}{if isset($error_flags.additionalAddressLine1) && {config name=requireAdditionAddressLine1}} has--error{/if}" 
                           maxlength="30"/>
                </div>
            {/if}
        {/block}

        {* Additional Address Line 2 *}
        {block name='frontend_register_shipping_fieldset_input_addition_address_line2'}
            {if {config name=showAdditionAddressLine2}}
                <div class="register--additional-line2">
                    <input autocomplete="section-shipping shipping address-line3"
                           name="register[shipping][additionalAddressLine2]"
                           type="text"{if {config name=requireAdditionAddressLine2}} required="required" aria-required="true"{/if}
                           placeholder="{s name='RegisterLabelAdditionalAddressLine2'}{/s}{if {config name=requireAdditionAddressLine2}}{s name="RequiredField" namespace="frontend/register/index"}{/s}{/if}"
                           id="additionalAddressLine22"
                           value="{$form_data.additionalAddressLine2|escape}"
                           class="register--field{if {config name=requireAdditionAddressLine2}} is--required{/if}{if isset($error_flags.additionalAddressLine2) && {config name=requireAdditionAddressLine2}} has--error{/if}" 
                           maxlength="30"/>
                </div>
            {/if}
        {/block}
