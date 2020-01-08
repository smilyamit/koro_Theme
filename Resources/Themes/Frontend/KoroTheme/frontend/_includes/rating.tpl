{extends file="parent:frontend/_includes/rating.tpl"}

{block name='frontend_rating_content_stars'}
    {if $points != 0}
        {for $value=1 to 5}
            {$cls = 'icon--star'}

            {if $value > $average}
                {$diff=$value - $average}

                {if $diff > 0 && $diff <= 0.5}
                    {$cls = 'icon--star-half'}
                {else}
                    {$cls = 'icon--star-empty'}
                {/if}
            {/if}

            <i class="{$cls}"></i>
        {/for}
    {/if}
{/block}
