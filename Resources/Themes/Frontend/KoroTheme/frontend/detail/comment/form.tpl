{extends file="parent:frontend/detail/comment/form.tpl"}
{namespace name="frontend/detail/comment"}


{* Review Rating *}
{block name='frontend_detail_comment_input_rating'}
    {if $tanmarProductReviewsDesign.active}
        <strong class="captcha--notice piran--rating-star-headline">
            {s name="DetailRating"}{/s}
        </strong>
        <div class="starsdesign">
            <span data-v="2" class="star"></span>
            <span data-v="4" class="star"></span>
            <span data-v="6" class="star"></span>
            <span data-v="8" class="star"></span>
            <span data-v="10" class="star"></span>
            <span class="star-legend">{s name="TanmarBewertungenStarDefault"}bitte Sterne vergeben{/s}</span>
            <div class="radiorating">
                <input type="radio" name="sVoteStars" value="2" required="">
                <input type="radio" name="sVoteStars" value="4">
                <input type="radio" name="sVoteStars" value="6">
                <input type="radio" name="sVoteStars" value="8">
                <input type="radio" name="sVoteStars" value="10">
            </div>
        </div>
    {else}
        {$smarty.block.parent}
    {/if}
{/block}
