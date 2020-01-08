{block name="frontend_plugins_advanced_menu_list"}
	{$categoriesCount = 0}
	{foreach $categories as $category name='categories'}
		{if $category.hideTop}
			{continue}
		{/if}

		{if $CbaxAdvancedMenuModified.maxCategories !== 0 && $categoriesCount >= $CbaxAdvancedMenuModified.maxCategories && $level !== 0}
			{continue}
		{/if}

		{$categoriesCount = $categoriesCount + 1}
		<li class="menu--list-item item--level-{$level}"{if $level === 0} style="width: 100%"{/if}>
			{block name="frontend_plugins_advanced_menu_list_item"}

				{if $category.media}
					{$category.img = $category.media.source}
				{/if}

				{if $category.cmsHeadline}
					{$category.cmsHeadline = $category.cmsHeadline|strip_tags|strip|truncate:$CbaxAdvancedMenuModified.maxCharacterTeaserHeadline:"..."|replace:"\"":""}
				{/if}

				{if $category.cmsText}
					{$category.cmsText = $category.cmsText|strip_tags|strip|truncate:$CbaxAdvancedMenuModified.maxCharacterTeaserText:"..."|replace:"\"":""}
				{/if}
				<a href="{$category.link}" class="menu--list-item-link"
				   {if $CbaxAdvancedMenuModified.activeHover}data-cms-headline="{$category.cmsHeadline}" data-cms-text="{$category.cmsText|strip_tags|strip}" data-img="{$category.img}"{/if}
				   title="{$category.name}"
                   {if $category.external && $category.externalTarget} target="{$category.externalTarget}"{/if}>
					{$category.name}
				</a>
				{if $category.sub}
					{call name=categories_top categories=$category.sub level=$level+1 previousCategory=$category columnAmount=$columnAmount}
				{/if}
			{/block}
		</li>
	{/foreach}

	{if $categories|@count > $categoriesCount && $CbaxAdvancedMenuModified.showMoreCategories}
		<li class="menu--list-item item--level-{$level}"{if $level === 0} style="width: 100%"{/if}>
			<a href="{$previousCategory.link}" class="menu--list-item-link more"
			   {if $CbaxAdvancedMenuModified.activeHover}data-cms-headline="{$previousCategory.cmsHeadline}" data-cms-text="{$previousCategory.cmsText|strip_tags|strip}" data-img="{$previousCategory.img}"{/if}
			   title="{$previousCategory.name|escapeHtml}">
				{s name="moreCategoriesLink" namespace="frontend/plugins/advanced_menu/advanced_menu"}mehr ...{/s}
			</a>
		</li>
	{/if}
{/block}

{block name="frontend_plugins_advanced_menu_main_container"}
{if $mainCategory.activeCategories > 0}
	<div class="button-container {$columnAmount}">
		{block name="frontend_plugins_advanced_menu_button_category"}
			<a href="{$mainCategory.link}" class="button--category"
			   title="{s name="toCategoryBtn" namespace="frontend/plugins/advanced_menu/advanced_menu"}{/s}{$mainCategory.name|escape:'html'}">
				<i class="icon--arrow-right"></i>
				{s name="toCategoryBtn" namespace="frontend/plugins/advanced_menu/advanced_menu"}{/s}{$mainCategory.name}
			</a>
		{/block}

		{block name="frontend_plugins_advanced_menu_button_close"}
			<span class="button--close">
                <i class="icon--cross"></i>
            </span>
		{/block}
	</div>
	{foreach $sMainCategories as $mainCat}
		{if $mainCat.id == $mainCategory.id}
			{$columnAmount = $mainCat.attribute.cbax_advanced_menu_column_amount}
			{break}
		{/if}
	{/foreach}

	{if empty($columnAmount)}
		{$columnAmount = $CbaxAdvancedMenuModified.columnAmount}
	{/if}

	{$hasCategories = $mainCategory.activeCategories > 0  && $columnAmount < 4}
	{$hasTeaser = (!empty($mainCategory.media) || !empty($mainCategory.cmsHeadline) || !empty($mainCategory.cmsText)) && $columnAmount > 0}

	{if $hasCategories || $hasTeaser}
		<div class="content--wrapper{if $hasCategories} has--content{/if}{if $hasTeaser} has--teaser{/if}{if $CbaxAdvancedMenuModified.activeHover} advanced-menu-active-hover{/if}" data-active-hover="{$CbaxAdvancedMenuModified.activeHover}">
			{if $hasCategories}
				{block name="frontend_plugins_advanced_menu_sub_categories"}
					{call name="categories_top" categories=$mainCategory.sub columnAmount=$columnAmount}
				{/block}
			{/if}

			{if $hasTeaser}
				{if $hasCategories}
					<div class="menu--delimiter" style="right: {$columnAmount * 25}%;"></div>
				{/if}
				<div class="menu--teaser"{if $hasCategories} style="width: {$columnAmount * 25}%;"{else} style="width: 100%;"{/if}>

					<div class="teaser--content"{if $hasCategories || $hasTeaser && $CbaxAdvancedMenuModified.minHeightTeaser} style="min-height:{$CbaxAdvancedMenuModified.minHeightTeaser}px; overflow:hidden;"{/if}>

						<div class="advanced-menu-teaser--container-main">

							{if !empty($mainCategory.media)}
								<a class="advanced-menu-teaser--image-link-main" href="{$mainCategory.link}"
								   title="{s name="toCategoryBtn" namespace="frontend/plugins/advanced_menu/advanced_menu"}{/s}">
									<img class="advanced-menu-teaser--image-main" src="{$mainCategory.media.path}"
										 alt="{s name='toCategoryImg' namespace='frontend/plugins/advanced_menu/advanced_menu'}Zur Kategorie{/s}"/>
								</a>
							{/if}

							{if $CbaxAdvancedMenuModified.showTeaserTeadline && !empty($mainCategory.cmsHeadline)}
								<div class="advanced-menu-teaser--headline-main">{$mainCategory.cmsHeadline|strip_tags|strip|truncate:$CbaxAdvancedMenuModified.maxCharacterTeaserHeadline:"..."|replace:"\"":""}</div>
							{/if}

							{if $CbaxAdvancedMenuModified.showTeaserText && !empty($mainCategory.cmsText)}
								<div class="advanced-menu-teaser--text-main">{$mainCategory.cmsText|strip_tags|strip|truncate:$CbaxAdvancedMenuModified.maxCharacterTeaserText:"..."|replace:"\"":""}</div>
							{/if}

							{if $CbaxAdvancedMenuModified.showMoreRead && !empty($mainCategory.cmsText)}
								<a class="advanced-menu-teaser--text-link-main" href="{$mainCategory.link}"
								   title="{s name="learnMoreLink" namespace="frontend/plugins/advanced_menu/advanced_menu"}mehr erfahren{/s}">
									{s name="learnMoreLink" namespace="frontend/plugins/advanced_menu/advanced_menu"}mehr erfahren{/s}
								</a>
							{/if}

						</div>

						<div class="advanced-menu-teaser--container-sub">

							<a class="advanced-menu-teaser--image-link-sub" href=""
							   title="{s name="toCategoryBtn" namespace="frontend/plugins/advanced_menu/advanced_menu"}{/s}">
								<img class="advanced-menu-teaser--image-sub"
									 src="{link file='custom/plugins/CbaxAdvancedMenuModifiedSw5/Resources/views/frontend/_public/src/img/empty.png'}"
									 alt="{s name='toCategoryImg' namespace='frontend/plugins/advanced_menu/advanced_menu'}Zur Kategorie{/s}"/>
							</a>

							{if $CbaxAdvancedMenuModified.showTeaserTeadline}
								<div class="advanced-menu-teaser--headline-sub"></div>
							{/if}

							{if $CbaxAdvancedMenuModified.showTeaserText}
								<div class="advanced-menu-teaser--text-sub"></div>
							{/if}

							{if $CbaxAdvancedMenuModified.showMoreRead}
								<a class="advanced-menu-teaser--text-link-sub" href=""
								   title="{s name="learnMoreLink" namespace="frontend/plugins/advanced_menu/advanced_menu"}mehr erfahren{/s}">
									{s name="learnMoreLink" namespace="frontend/plugins/advanced_menu/advanced_menu"}mehr erfahren{/s}
								</a>
							{/if}

						</div>

					</div>

				</div>
			{/if}

		</div>
	{/if}
{/if}
{/block}
