{extends file="parent:frontend/newsletter/index.tpl"}

{* Newsletter tab headline *}
{block name="frontend_index_content"}
        <div class="piran--hero-custom-outter copyright-koro">
          <div class="piran--hero-custom-inner emotion--banner">
              <img class="piran--hero-custom-image" title="Notepad Image" src="{link file='frontend/_public/src/img/koro-newsletter.jpg'}" alt="A Wall full of KoRo Products"/>
          </div>
        </div>

        {$smarty.block.parent}

{/block}

{* Remove Error messages *}
{block name="frontend_newsletter_error_messages"}{/block}

{* Custom page tab headline *}
{block name="frontend_newsletter_headline_title"}
  <h1 class="newsletter--title piran--custom-image-title">{s name="NewsletterRegisterHeadline"}{/s}</h1>

  {* Error messages *}
  {if $sStatus.code != 0}
      <div class="newsletter--error-messages">

          {$file = 'frontend/_includes/messages.tpl'}

          {if $sStatus.code === 7}
              {$type = 'error'}
              {$content = "{s namespace="widgets/captcha/custom_captcha" name="invalidCaptchaMessage"}{/s}"}
          {elseif $sStatus.code == 3}
              {$type = 'success'}
              {$content = $sStatus.message}
          {elseif $sStatus.code == 5}
              {$type = 'error'}
              {$content = $sStatus.message}
          {elseif $sStatus.code == 2}
              {$type = 'warning'}
              {$content = $sStatus.message}
          {elseif $sStatus.code != 0}
              {$type = 'error'}
              {$content = $sStatus.message}
          {/if}

          {include file=$file type=$type content=$content}
      </div>
  {/if}

{/block}
