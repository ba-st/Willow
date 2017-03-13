tests-rendering
testRenderContentOnWithCommands

	| radioGroup html |

	radioGroup := RadioGroupWebView applyingToEachRadioButton: (ComponentClassificationCommand toStyleWith: WillowCssStyles disabledComponent).
	radioGroup allowAnyOf: #($a $b).
	html := self render: radioGroup.

	self
		assert: html
		equals:
			 '<label for="radio-button-id2"><input name="1" id="radio-button-id2" class="willow-disabled-component" value="1" type="radio"/>a</label><label for="radio-button-id3"><input name="1" id="radio-button-id3" class="willow-disabled-component" value="2" type="radio"/>b</label>'