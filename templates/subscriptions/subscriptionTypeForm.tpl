{**
 * templates/subscriptions/subscriptionTypeForm.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Subscription type form under journal management.
 *
 *}
<script>
	$(function() {ldelim}
		// Attach the form handler.
		$('#subscriptionTypeForm').pkpHandler('$.pkp.controllers.form.AjaxFormHandler');
	{rdelim});
</script>

<form class="pkp_form" id="subscriptionTypeForm" method="post" action="{url op="updateSubscriptionType"}">
	{csrf}
	{if $typeId}
		<input type="hidden" name="typeId" value="{$typeId|escape}" />
	{/if}

	{include file="controllers/notification/inPlaceNotification.tpl" notificationId="subscriptionTypeNotification"}

	{fbvFormArea id="subscriptionTypeFormArea"}
		{fbvElement type="text" required=true name="name" id="typeName" value=$name label="manager.subscriptionTypes.form.typeName" size=$fbvStyles.size.MEDIUM multilingual=true}
		{fbvElement type="textarea" name="description" id="description" value=$description label="manager.subscriptionTypes.form.description" size=$fbvStyles.size.LARGE rich=true}

		{fbvFormSection}
			{fbvElement type="text" required=true name="cost" id="cost" value=$cost label="manager.subscriptionTypes.form.cost" description="manager.subscriptionTypes.form.costInstructions" size=$fbvStyles.size.MEDIUM inline=true}
			{fbvElement type="select" required=true name="currency" id="currency" value=$currency from=$validCurrencies label="manager.subscriptionTypes.form.currency" size=$fbvStyles.size.MEDIUM inline=true translate=false}
		{/fbvFormSection}

		{fbvFormSection}
			{fbvElement type="select" required=true name="format" id="format" value=$format from=$validFormats label="manager.subscriptionTypes.form.format" size=$fbvStyles.size.MEDIUM translate=false inline=true}
			{fbvElement type="text" name="duration" id="duration" value=$duration label="manager.subscriptionTypes.form.duration" size=$fbvStyles.size.MEDIUM label="manager.subscriptionTypes.form.durationInstructions" inline=true}
		{/fbvFormSection}
		{fbvFormSection title="manager.subscriptionTypes.form.subscriptions" list=true}
			{fbvElement type="radio" name="institutional" id="individual" checked=$institutional|compare:"0" label="manager.subscriptionTypes.form.individual" value="0" disabled=$typeId}
			{fbvElement type="radio" name="institutional" id="institutional" checked=$institutional|compare:"1" label="manager.subscriptionTypes.form.institutional" value="1" disabled=$typeId}
		{/fbvFormSection}

		{fbvFormSection title="manager.subscriptionTypes.form.options" list=true}
			{fbvElement type="checkbox" name="membership" id="membership" checked=$membership label="manager.subscriptionTypes.form.membership"}
			{fbvElement type="checkbox" name="disable_public_display" id="disable_public_display" checked=$disable_public_display label="manager.subscriptionTypes.form.public"}
		{/fbvFormSection}
	{/fbvFormArea}

	<span class="formRequired">{translate key="common.requiredField"}</span>

	{fbvFormButtons id="mastheadFormSubmit" submitText="common.save" hideCancel=true}
</form>

