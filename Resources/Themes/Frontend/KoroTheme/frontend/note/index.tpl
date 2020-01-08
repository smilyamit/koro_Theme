{extends file="parent:frontend/note/index.tpl"}

{* Newsletter tab headline *}
{block name="frontend_index_content"}
        <div class="piran--hero-custom-outter copyright-koro">
          <div class="piran--hero-custom-inner emotion--banner">
              <img class="piran--hero-custom-image" title="" src="{link file='frontend/_public/src/img/koro-notepad.jpg'}" alt=""/>
          </div>
        </div>

        {$smarty.block.parent}

{/block}

{block name="frontend_note_index_welcome_headline"}
    <h1 class="piran--notepad-title panel--title piran--custom-image-title">{s name="NoteHeadline"}{/s}</h1>
{/block}
