{if $PaypalShowButton}
    <div class="paypal-express">

        {* PayPal express delimiter *}
        <span class="paypal-express--delimiter">
            {s name='PaypalButtonDelimiter'}{/s}
        </span>

        {* PayPal express button *}
        <a href="{url controller=payment_paypal action=express forceSecure}"
           title="{s name='PaypalButtonLinkTitleText'}{/s}"
           class="paypal-express--btn btn">
           <div class="paypal--svg" ssb-image="" style="width: 70px;height: 19px;margin: .625rem auto;">
             <svg xmlns="http://www.w3.org/2000/svg" viewBox="310 74 705 188">
              <path fill="#ffffff" d="M698 125h-27l-6 3-36 54-16-52c-1-3-3-5-7-5h-26c-3 0-5 3-4 6l29 85-27 39c-2 3 0 7 3 7h27c2 0 5-1 6-3l88-127c2-3 0-7-4-7m-177 51c-2 15-14 25-29 25-8 0-14-2-18-7s-5-11-4-18c3-15 15-26 30-26 7 0 13 3 17 7s6 12 4 19m37-51h-26c-2 0-4 1-5 4l-1 7-2-3c-5-8-18-11-31-11-29 0-54 22-58 53-3 16 1 30 9 41 8 9 20 13 34 13 23 0 36-15 36-15l-1 7c-1 3 1 6 4 6h24c4 0 7-3 7-7l15-90c0-3-2-5-5-5m-158 0c-3 20-18 20-32 20h-8l5-37c1-2 3-4 5-4h4c10 0 19 0 24 6 3 4 4 9 2 15m-6-51h-55c-3 0-7 3-7 7l-22 140c-1 3 1 5 4 5h26c4 0 7-2 8-6l6-38c0-4 4-6 7-6h18c36 0 57-18 62-52 3-15 0-27-7-36-8-9-22-14-40-14">
              </path>
              <path fill="#ffffff" d="M980 78l-22 143c-1 3 1 5 4 5h23c4 0 7-2 7-6l23-141c0-2-2-5-5-5h-25c-2 0-4 2-5 4m-67 98c-3 15-15 25-30 25-8 0-14-2-18-7-3-5-5-11-4-18 3-15 15-26 30-26 7 0 13 3 17 7s6 12 5 19m36-51h-26c-2 0-4 1-4 4l-2 7-2-3c-5-8-18-11-30-11-29 0-54 22-59 53-3 16 1 30 10 41 8 9 19 13 33 13 23 0 36-15 36-15l-1 7c0 3 2 6 4 6h24c4 0 7-3 8-7l14-90c0-3-2-5-5-5m-157 0c-3 20-18 20-33 20h-8l6-37c0-2 2-4 4-4h4c10 0 19 0 24 6 3 4 4 9 3 15m-7-51h-54c-4 0-7 3-8 7l-22 140c-1 3 2 5 4 5h28c3 0 5-1 6-4l6-40c1-4 4-6 8-6h17c36 0 57-18 62-53 3-15 0-27-7-35-8-9-21-14-40-14">
              </path>
            </svg>
          </div>
        </a>
    </div>
{/if}
