tests-rendering
testRenderingWithApplying

	| radioGroup html |

	radioGroup := RadioGroupWebView 
		renderingWith:  [ :element | element asUppercase ] 
		applyingToLabel: [ :group | group addClass disabledComponent ] 
		applyingToInput: [ :group | group addClass disabledComponent ].

	radioGroup allowAnyOf: #($a $b).
	html := self render: radioGroup.

	self
		assert: html
		equals:
			'<label for="radio-button-id2" class="willow-disabled-component"><input name="1" id="radio-button-id2" class="willow-disabled-component" value="1" type="radio"/>A</label><label for="radio-button-id3" class="willow-disabled-component"><input name="1" id="radio-button-id3" class="willow-disabled-component" value="2" type="radio"/>B</label>'