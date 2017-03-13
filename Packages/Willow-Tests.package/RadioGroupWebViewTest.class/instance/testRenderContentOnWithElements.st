tests-rendering
testRenderContentOnWithElements

	| radioGroup html |

	radioGroup := RadioGroupWebView applyingToEachRadioButton: CompositeComponentCommand empty.
	radioGroup allowAnyOf: #('Buenos Aires' 'CABA').
	html := self render: radioGroup.

	self
		assert: html
		equals:
			'<label for="radio-button-id2"><input name="1" id="radio-button-id2" value="1" type="radio"/>Buenos Aires</label><label for="radio-button-id3"><input name="1" id="radio-button-id3" value="2" type="radio"/>CABA</label>'