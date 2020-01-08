{extends file="parent:frontend/listing/index.tpl"}

{* Shows category text for categories in shopping worlds | Biggy, 06.18 *}

{* Kategorientext *}
{block name="frontend_listing_index_text"}{/block}

{* Tagcloud *}
{block name="frontend_listing_index_tagcloud"}
    {if {config name=show namespace=TagCloud }}
        {action module=widgets controller=listing action=tag_cloud sController=listing sCategory=$sCategoryContent.id}
    {/if}
{include file='frontend/listing/text.tpl'}
{/block}

{block name='frontend_index_content_left'}
    <div class="content--emotions">

        {foreach $emotions as $emotion}
            {if $emotion.fullscreen == 1}
                {$fullscreen = true}
            {/if}

            <div class="emotion--wrapper"
                 data-controllerUrl="{url module=widgets controller=emotion action=index emotionId=$emotion.id controllerName=$Controller}"
                 data-availableDevices="{$emotion.devices}">
            </div>
        {/foreach}

        {$showListingCls = "emotion--show-listing"}

        {foreach $showListingDevices as $device}
            {$showListingCls = "{$showListingCls} hidden--{$emotionViewports[$device]}"}
        {/foreach}
    </div>
    {$smarty.block.parent}
{/block}

{* Breadcrumb *}
{block name='frontend_index_breadcrumb'}{/block}
