tests-rendering
testRenderContentOnWithElements

	| radioGroup html |

	radioGroup := RadioGroupWebView applyingToEachRadioButton: CompositeComponentCommand empty.
	radioGroup allowAnyOf: #('Buenos Aires' 'CABA').
	html := self render: radioGroup.

	self assert: html equals: '<input name="1" value="1" type="radio"/>Buenos Aires<input name="1" value="2" type="radio"/>CABA'