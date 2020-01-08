
{namespace name="frontend/detail/comment"}

{* Offcanvas buttons *}
<div class="buttons--off-canvas">
    <a href="#" title="{"{s name="OffcanvasCloseMenu" namespace="frontend/detail/description"}{/s}"|escape}" class="close--off-canvas">
        <i class="icon--arrow-left"></i>
        {s name="OffcanvasCloseMenu" namespace="frontend/detail/description"}{/s}
    </a>
</div>

<div class="tab--rating piran--tab-wrapper">
      <div class="piran--detail-content">

        <div class="piran--detail-pre-title panel--title is--underline pre-headline">{s name='CommentPreHeadline'}Bewertungen{/s}</div>
        <h3 class="piran--detail-title">{s name="CommentHeadline"}Was sagen andere?{/s}</h3>

          <div class="content--product-reviews" id="detail--product-reviews">

              {* Response save comment *}
              {if $sAction == "ratingAction"}
                  {block name='frontend_detail_comment_error_messages'}
                      {if $sErrorFlag}
                          {include file="frontend/_includes/messages.tpl" type="error" content="{s name='DetailCommentInfoFillOutFields'}{/s}"}
                      {else}
                          {if {config name="OptinVote"} && !{$smarty.get.sConfirmation} && !{$userLoggedIn}}
                              {include file="frontend/_includes/messages.tpl" type="success" content="{s name='DetailCommentInfoSuccessOptin'}{/s}"}
                          {else}
                              {include file="frontend/_includes/messages.tpl" type="success" content="{s name='DetailCommentInfoSuccess'}{/s}"}
                          {/if}
                      {/if}
                  {/block}
              {/if}

              <div class="reviews_list">
                  <div class='reviews-wrapper'>

                      {* Display review *}
                      {if $sArticle.sVoteComments}

                          <div class='reviews-container'>
                              <div class='reviews-container-init'>

                                {if $tanmarProductReviewsDesign.active && !{config name=VoteDisable}}
                                    {block name="frontend_detail_tabs_rating_tanmar_overview"}
                                        <div class="tanmar-rating-overview">

                                        {if !$sArticle.sVoteComments}
                                          {if $tanmarProductReviewsDesign.postCommentActive}
                                            <span class="tanmar-no-reviews">{s name="TanmarProductReviewsNoReviews" namespace="frontend/product_reviews/index"}Dieses Produkt hat noch keine Bewertungen. Möchten Sie die erste Bewertung erstellen?{/s}</span>
                                          {else}
                                            <span class="tanmar-no-reviews">{s name="TanmarProductReviewsNoReviewsNoButton" namespace="frontend/product_reviews/index"}Dieses Produkt hat noch keine Bewertungen.{/s}</span>
                                          {/if}
                                        {/if}

                                            {block name='frontend_detail_tabs_rating_tanmar_overview_left'}
                                                {if $sArticle.sVoteAverage.count > 0}
                                                    {$average = $tanmarProductReviewsDesign.average}
                                                    <div class="tanmar-rating-overview-left">
                                                        {block name='frontend_detail_tabs_rating_tanmar_overview_rating_count'}
                                                            <div class="tanmar-rating-count">
                                                                {block name='frontend_detail_tabs_rating_tanmar_overview_rating_outof'}
                                                                    <div class="tanmar-rating-outof">
                                                                        <span class="tanmar-rating-average">{$average|string_format:"%.1f"}</span>
                                                                        <span class="tanmar-rating-base">/{$tanmarProductReviewsDesign.base}</span>
                                                                    </div>
                                                                {/block}
                                                                {block name='frontend_detail_tabs_rating_tanmar_overview_rating_stars'}
                                                                    <div class="tanmar-rating-stars">
                                                                        {for $value=1 to {$tanmarProductReviewsDesign.base}}
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
                                                                        <br/>
                                                                        {$sArticle.sVoteAverage.count} {s name="TanmarReviews" namespace="frontend/detail/comment"}Bewertungen{/s}
                                                                    </div>
                                                                {/block}
                                                            </div>
                                                        {/block}
                                                        {block name='frontend_detail_tabs_rating_tanmar_overview_filter'}
                                                            <div class="tanmar-rating-filter">
                                                                {foreach key=stars item=sum from=$tanmarProductReviewsDesign.filter}
                                                                    <div {if $sum <= 0}class="tanmar-no-comment"{/if} data-tanmar-rating-filter="{$stars}">
                                                                        <span class="tanmar-rating-filter-label">{$stars} {if $stars == 1}{s name="TanmarStar" namespace="frontend/detail/comment"}Stern{/s}{else}{s name="TanmarStars" namespace="frontend/detail/comment"}Sterne{/s}{/if}</span>
                                                                        <span class="tanmar-rating-filter-bar"><span class="tanmar-rating-filter-bar-inner" style="width:{$sum / $sArticle.sVoteAverage.count * 100}%;"></span></span>
                                                                        <span class="tanmar-rating-filter-sum">{$sum}</span>
                                                                    </div>
                                                                {/foreach}
                                                            </div>
                                                            <div class="tanmar-rating-filter-reset btn is--icon-left"><i class="icon--cross"></i> {s name="TanmarFilterReset" namespace="frontend/detail/comment"}Auswahl zurücksetzen{/s}</div>
                                                        {/block}

                                                        {if $tanmarProductReviewsDesign.postCommentActive}
                                                            <span class="tanmar-write-review btn is--large"><i class="icon--pencil"></i>{s name="TanmarWriteReview" namespace="frontend/detail/comment"}Bewertung schreiben{/s}</span>
                                                        {/if}

                                                        {* Publish product review *}
                                                        {block name='frontend_detail_comment_post'}
                                                            {if $tanmarProductReviewsDesign.postCommentActive}
                                                                <div class="review--form-container piran--big-shadow">
                                                                    {include file="frontend/detail/comment/form.tpl"}
                                                                </div>
                                                            {else}
                                                                <div class="review--form-container piran--big-shadow">
                                                                    {include file="frontend/detail/comment/form.tpl"}
                                                                </div>
                                                            {/if}
                                                        {/block}

                                                    </div>
                                                {/if}

                                            {/block}

                                            {block name='frontend_detail_tabs_rating_tanmar_overview_right'}
                                                <div class="tanmar-rating-overview-right{if !$sArticle.sVoteComments} tanmar-rating-overview-right_no{/if}">

                                                {block name='frontend_detail_comment_best_vs_worst_tanmar'}
                                                    {if $tanmarProductReviewsDesign.goodVsBadActive && $tanmarProductReviewsDesign.bestReview}
                                                        <div class="tanmar-best-vs-worst-review">
                                                            {if $tanmarProductReviewsDesign.bestReview}
                                                                <div class="tanmar-best-review">
                                                                    <h4 class="piran--pre-title">{s name="TanmarBestReviewHeadline" namespace="frontend/detail/comment"}Ein zufriedener Kunde sagt{/s}</h4>
                                                                    {include file='frontend/detail/comment/entry.tpl' vote=$tanmarProductReviewsDesign.bestReview}
                                                                </div>
                                                                <div class="vs_badge">{s name="TanmarWorstReviewVS" namespace="frontend/detail/comment"}vs.{/s}</div>
                                                            {/if}
                                                            {if $tanmarProductReviewsDesign.worstReview}
                                                                <div class="tanmar-worst-review">
                                                                    <h4 class="piran--pre-title">{s name="TanmarWorstReviewHeadline" namespace="frontend/detail/comment"}Ein kritischer Kunde sagt{/s}</h4>
                                                                    {include file='frontend/detail/comment/entry.tpl' vote=$tanmarProductReviewsDesign.worstReview}
                                                                </div>
                                                            {/if}
                                                        </div>
                                                    {/if}
                                                {/block}

                                                {foreach $sArticle.sVoteComments as $vote}

                                                        {* Review entry *}
                                                        {block name="frontend_detail_comment_block" }
                                                            {if $tanmarProductReviewsDesign.active}
                                                                <div class="tanmar-all-reviews">
                                                                    <div class="review--entry-outer review--entry-more-{if $vote@iteration > $tanmarProductReviewsDesign.readMoreCounter}c{else}more{/if} review--entry-{{$vote.points}|string_format:"%d"}">
                                                                      {include file="frontend/detail/comment/entry.tpl" isLast=$vote@last}
                                                                    </div>

                                                                    {if $vote@last && $vote@iteration > $tanmarProductReviewsDesign.readMoreCounter}
                                                                        <div class="review-read-more-counter">
                                                                            <div class="gradient"></div>
                                                                            <div class="piran--review-show-more btn">
                                                                              {s name="TanmarProductReviewsReadMore" namespace="frontend/product_reviews/index"}{$vote@iteration - $tanmarProductReviewsDesign.readMoreCounter} weitere anzeigen{/s}
                                                                            </div>
                                                                        </div>
                                                                    {/if}
                                                                </div>
                                                            {else}
                                                                <div class="tanmar-all-reviews">
                                                                  {include file="frontend/detail/comment/entry.tpl" isLast=$vote@last}
                                                                </div>
                                                            {/if}
                                                        {/block}

                                                        {* Review answer *}
                                                        {block name="frontend_detail_answer_block" }
                                                            {if $tanmarProductReviewsDesign.active && $vote.answer}
                                                                <div class="review--entry-outer review--entry-more-{if $vote@iteration > $tanmarProductReviewsDesign.readMoreCounter}c{else}more{/if} review--entry-{{$vote.points}|string_format:"%d"}">
                                                                  {include file="frontend/detail/comment/answer.tpl" isLast=$vote@last}
                                                                </div>
                                                            {else}
                                                                {if $vote.answer}
                                                                    {include file="frontend/detail/comment/answer.tpl" isLast=$vote@last}
                                                                {/if}
                                                            {/if}
                                                        {/block}

                                                {/foreach}

                                              </div>

                                            {/block}

                                        </div>
                                    {/block}
                                {else}

                                    {if $sArticle.sVoteAverage.average}
                                      <h5 class="piran--rating-stars">
                                          {include file='frontend/_includes/rating.tpl' points=$sArticle.sVoteAverage.average type="aggregated" label=false microData=false}
                                      </h5>

                                      {if $sArticle.sVoteAverage.average}
                                          <h5 class="piran--average-rating">
                                              {math equation="x / y" x=$sArticle.sVoteAverage.average y=2 format="%.2f"}
                                          </h5>
                                      {/if}

                                      {if $sArticle.sVoteAverage.count}
                                          <div class="piran--rating-count-wrapper piran--detail-text">

                                              {block name="frontend_detail_tabs_rating_title_count"}
                                                  <span>{$sArticle.sVoteAverage.count}</span>

                                                  {if $sArticle.sVoteAverage.count == 1}
                                                      <span class="just-one">{s name="DetailRatingJustOne"}Bewertung{/s}</span>
                                                  {else}
                                                      <span class="more-than-one">{s name="DetailRatings"}Bewertungen{/s}</span>
                                                  {/if}
                                              {/block}

                                          </div>
                                      {/if}
                                    {/if}

                                    {foreach $sArticle.sVoteComments as $vote}

                                            {* Review entry *}
                                            {block name="frontend_detail_comment_block" }
                                                {if $tanmarProductReviewsDesign.active}
                                                    <div class="review--entry-outer review--entry-more-{if $vote@iteration > $tanmarProductReviewsDesign.readMoreCounter}c{else}more{/if} review--entry-{{$vote.points}|string_format:"%d"}">
                                                      {include file="frontend/detail/comment/entry.tpl" isLast=$vote@last}
                                                    </div>

                                                    {if $vote@last && $vote@iteration > $tanmarProductReviewsDesign.readMoreCounter}
                                                        <div class="review-read-more-counter">
                                                            <div class="gradient"></div>
                                                            <div class="piran--review-show-more btn">
                                                              {s name="TanmarProductReviewsReadMore" namespace="frontend/product_reviews/index"}{$vote@iteration - $tanmarProductReviewsDesign.readMoreCounter} weitere anzeigen{/s}
                                                            </div>
                                                        </div>
                                                    {/if}

                                                {else}
                                                    {include file="frontend/detail/comment/entry.tpl" isLast=$vote@last}
                                                {/if}
                                            {/block}

                                            {* Review answer *}
                                            {block name="frontend_detail_answer_block" }
                                                {if $tanmarProductReviewsDesign.active && $vote.answer}
                                                    <div class="review--entry-outer review--entry-more-{if $vote@iteration > $tanmarProductReviewsDesign.readMoreCounter}c{else}more{/if} review--entry-{{$vote.points}|string_format:"%d"}">
                                                      {include file="frontend/detail/comment/answer.tpl" isLast=$vote@last}
                                                    </div>
                                                {else}
                                                    {if $vote.answer}
                                                        {include file="frontend/detail/comment/answer.tpl" isLast=$vote@last}
                                                    {/if}
                                                {/if}
                                            {/block}

                                    {/foreach}

                                {* Publish product review *}
                                {block name='frontend_detail_comment_post'}
                                    {if $tanmarProductReviewsDesign.postCommentActive}
                                        <div class="review--form-container piran--big-shadow">
                                            {include file="frontend/detail/comment/form.tpl"}
                                        </div>
                                    {else}
                                        <div class="review--form-container piran--big-shadow">
                                            {include file="frontend/detail/comment/form.tpl"}
                                        </div>
                                    {/if}
                                {/block}

                                {/if}

                              </div>

                          </div>

                      {else}
                          <div class="review--empty alert is--info">

                              <div class="alert--icon">
                                  <i class="icon--element icon--info"></i>
                              </div>

                              <div class="alert--content">
                                {s name="DetailEmptyReview"}Keine Bewertungen hinzugefügt, schreibe den ersten Kommentar{/s}
                              </div>

                          </div>

                          {* Publish product review *}
                          {block name='frontend_detail_comment_post'}
                              {if $tanmarProductReviewsDesign.postCommentActive}
                                  <div class="has-tanmar-reviews piran--reviews-is-empty">
                                      <div class="tanmar-rating-overview">

                                              <div class="tanmar-rating-overview-left">

                                                <div class="tanmar-write-review btn is--large">
                                                  <i class="icon--pencil"></i>{s name="TanmarWriteReview" namespace="frontend/detail/comment"}Bewertung schreiben{/s}
                                                </div>

                                                  <div class="review--form-container piran--big-shadow">
                                                      {include file="frontend/detail/comment/form.tpl"}
                                                  </div>
                                              </div>

                                      </div>
                                  </div>

                              {else}

                                  <div class="has-tanmar-reviews piran--reviews-is-empty">
                                      <div class="tanmar-rating-overview">

                                              <div class="tanmar-rating-overview-left">
                                                  <div class="review--form-container piran--big-shadow">
                                                      {include file="frontend/detail/comment/form.tpl"}
                                                  </div>
                                              </div>

                                      </div>
                                  </div>

                              {/if}
                          {/block}

                      {/if}

                  </div>
              </div>

          </div>
      </div>
</div>
